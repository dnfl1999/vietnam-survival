const response = await fetch("./data/phrases.json");
const data = await response.json();

const colorMap = {
  blue: "#2f6df6",
  green: "#18a06e",
  orange: "#d97822",
  teal: "#0f9a90",
  red: "#d54f4f",
  indigo: "#5a66da",
  cyan: "#1d9db5",
  mint: "#2e9f83",
  pink: "#d4638d",
  brown: "#8a6138",
  purple: "#7856d8",
};

const featuredCategoryIds = ["policeLostItem", "simInternet", "restroomLaundry"];

const categoryMap = new Map(data.categories.map((category) => [category.id, category]));

const state = {
  activeTab: "home",
  selectedCategory: "all",
  searchQuery: "",
  favorites: loadFavorites(),
};

const categoryGrid = document.querySelector("#categoryGrid");
const featuredCategoryGrid = document.querySelector("#featuredCategoryGrid");
const categoryFilter = document.querySelector("#categoryFilter");
const searchInput = document.querySelector("#searchInput");
const searchResults = document.querySelector("#searchResults");
const searchSummary = document.querySelector("#searchSummary");
const favoritesList = document.querySelector("#favoritesList");
const favoritesSummary = document.querySelector("#favoritesSummary");
const dialog = document.querySelector("#phraseDialog");
const dialogContent = document.querySelector("#dialogContent");

init();

function init() {
  bindNav();
  bindHomeActions();
  bindSearchControls();
  bindDialog();
  populateStats();
  populateCategoryFilter();
  renderHome();
  renderSearch();
  renderFavorites();
}

function bindNav() {
  document.querySelectorAll(".nav-button").forEach((button) => {
    button.addEventListener("click", () => setActiveTab(button.dataset.tab));
  });
}

function bindHomeActions() {
  document.querySelector("#showAllPhrasesButton").addEventListener("click", () => {
    state.selectedCategory = "all";
    categoryFilter.value = "all";
    setActiveTab("search");
    renderSearch();
  });

  document.querySelector("#refreshHomeButton").addEventListener("click", () => {
    populateStats();
    renderHome();
    window.alert(`최신 콘텐츠를 다시 불러왔습니다. 현재 ${data.categories.length}개 카테고리, ${data.phrases.length}개 문장입니다.`);
  });

  document.querySelector("#showUpdatesButton").addEventListener("click", () => {
    openUpdatesDialog();
  });

  document.querySelectorAll("[data-jump-tab]").forEach((button) => {
    button.addEventListener("click", () => setActiveTab(button.dataset.jumpTab));
  });
}

function bindSearchControls() {
  searchInput.addEventListener("input", (event) => {
    state.searchQuery = event.target.value.trim().toLowerCase();
    renderSearch();
  });

  categoryFilter.addEventListener("change", (event) => {
    state.selectedCategory = event.target.value;
    renderSearch();
  });
}

function bindDialog() {
  document.querySelector("#closeDialogButton").addEventListener("click", () => dialog.close());
  dialog.addEventListener("click", (event) => {
    const rect = dialog.getBoundingClientRect();
    const isInDialog =
      rect.top <= event.clientY &&
      event.clientY <= rect.top + rect.height &&
      rect.left <= event.clientX &&
      event.clientX <= rect.left + rect.width;

    if (!isInDialog) {
      dialog.close();
    }
  });
}

function setActiveTab(tab) {
  state.activeTab = tab;

  document.querySelectorAll(".nav-button").forEach((button) => {
    button.classList.toggle("is-active", button.dataset.tab === tab);
  });

  document.querySelectorAll(".page").forEach((page) => {
    page.classList.toggle("is-active", page.dataset.page === tab);
  });

  if (tab === "favorites") {
    renderFavorites();
  }
}

function populateStats() {
  document.querySelector("#categoryCount").textContent = String(data.categories.length);
  document.querySelector("#phraseCount").textContent = String(data.phrases.length);
  document.querySelector("#updateCategoryCount").textContent = String(data.categories.length);
  document.querySelector("#updatePhraseCount").textContent = String(data.phrases.length);
  document.querySelector("#emergencyCount").textContent = String(
    data.phrases.filter((phrase) => phrase.isEmergency).length
  );
}

function populateCategoryFilter() {
  data.categories.forEach((category) => {
    const option = document.createElement("option");
    option.value = category.id;
    option.textContent = category.title;
    categoryFilter.append(option);
  });
}

function renderHome() {
  categoryGrid.innerHTML = "";
  featuredCategoryGrid.innerHTML = "";

  const featuredCategories = data.categories.filter((category) => featuredCategoryIds.includes(category.id));
  const regularCategories = data.categories.filter((category) => !featuredCategoryIds.includes(category.id));

  featuredCategories.forEach((category) => {
    featuredCategoryGrid.append(buildCategoryCard(category, true));
  });

  regularCategories.forEach((category) => {
    categoryGrid.append(buildCategoryCard(category, false));
  });
}

function buildCategoryCard(category, featured) {
    const count = data.phrases.filter((phrase) => phrase.category === category.id).length;
    const button = document.createElement("button");
    button.className = `category-card ${featured ? "featured" : ""}`;
    button.innerHTML = `
      <p class="eyebrow">${category.systemImage}</p>
      <h4>${category.title}</h4>
      <p>${category.shortDescription}</p>
      ${featured ? '<span class="category-badge">NEW</span>' : ""}
      <div class="category-meta">
        <span>${count}개 문장</span>
        <span style="color:${colorMap[category.accentColor]}">열기</span>
      </div>
    `;
    button.addEventListener("click", () => {
      state.selectedCategory = category.id;
      categoryFilter.value = category.id;
      setActiveTab("search");
      renderSearch();
    });
    return button;
}

function renderSearch() {
  const results = getFilteredPhrases();
  searchSummary.textContent =
    results.length === 0
      ? "검색 결과가 없습니다. 한국어 또는 베트남어로 다시 검색해보세요."
      : `${results.length}개의 문장을 찾았습니다.`;

  renderPhraseList(searchResults, results, "검색 결과가 없습니다.");
}

function renderFavorites() {
  const favorites = data.phrases.filter((phrase) => state.favorites.includes(phrase.id));
  favoritesSummary.textContent =
    favorites.length === 0
      ? "아직 저장한 문장이 없습니다. 검색 결과에서 별 버튼을 눌러보세요."
      : `${favorites.length}개의 즐겨찾기 문장이 저장되어 있습니다.`;

  renderPhraseList(favoritesList, favorites, "즐겨찾기가 비어 있습니다.");
}

function getFilteredPhrases() {
  return data.phrases.filter((phrase) => {
    const matchesCategory = state.selectedCategory === "all" || phrase.category === state.selectedCategory;
    const haystack = `${phrase.korean} ${phrase.vietnamese} ${phrase.vietnamesePlain}`.toLowerCase();
    const matchesQuery = state.searchQuery === "" || haystack.includes(state.searchQuery);
    return matchesCategory && matchesQuery;
  });
}

function renderPhraseList(container, phrases, emptyMessage) {
  container.innerHTML = "";

  if (phrases.length === 0) {
    const empty = document.createElement("article");
    empty.className = "empty-card";
    empty.innerHTML = `<h4>${emptyMessage}</h4><p>필터를 바꾸거나 다른 문장을 찾아보세요.</p>`;
    container.append(empty);
    return;
  }

  phrases.forEach((phrase) => {
    container.append(buildPhraseCard(phrase));
  });
}

function buildPhraseCard(phrase) {
  const category = categoryMap.get(phrase.category);
  const article = document.createElement("article");
  article.className = `phrase-card ${phrase.isEmergency ? "emergency" : ""}`;
  article.innerHTML = `
    <div class="phrase-top">
      <div class="chip ${phrase.isEmergency ? "emergency" : ""}">${phrase.isEmergency ? "긴급" : "일반"}</div>
      <div class="chip">${category.title}</div>
    </div>
    <p class="phrase-korean">${phrase.korean}</p>
    <h4 class="phrase-vietnamese">${phrase.vietnamese}</h4>
    <p class="phrase-plain">${phrase.vietnamesePlain}</p>
    <div class="phrase-actions"></div>
  `;

  const actions = article.querySelector(".phrase-actions");
  actions.append(
    createActionButton(state.favorites.includes(phrase.id) ? "★ 저장됨" : "☆ 즐겨찾기", () => toggleFavorite(phrase.id)),
    createActionButton("크게 보기", () => openDialog(phrase), true, colorMap[category.accentColor]),
    createActionButton("음성 재생", () => speakPhrase(phrase.vietnamese)),
    createActionButton("복사", async () => copyPhrase(phrase.vietnamese))
  );

  return article;
}

function createActionButton(label, onClick, primary = false, background = "#1d1f23") {
  const button = document.createElement("button");
  button.className = `phrase-button ${primary ? "primary" : ""}`;
  button.textContent = label;
  if (primary) {
    button.style.background = background;
  }
  button.addEventListener("click", onClick);
  return button;
}

function toggleFavorite(id) {
  if (state.favorites.includes(id)) {
    state.favorites = state.favorites.filter((value) => value !== id);
  } else {
    state.favorites = [...state.favorites, id];
  }

  localStorage.setItem("vietnam-survival-favorites", JSON.stringify(state.favorites));
  renderSearch();
  renderFavorites();
}

function loadFavorites() {
  try {
    return JSON.parse(localStorage.getItem("vietnam-survival-favorites") ?? "[]");
  } catch {
    return [];
  }
}

function openDialog(phrase) {
  const category = categoryMap.get(phrase.category);
  dialogContent.innerHTML = `
    <div class="dialog-header">
      <div>
        <p class="eyebrow">${category.title}</p>
        <h3>${phrase.korean}</h3>
      </div>
      <div class="chip ${phrase.isEmergency ? "emergency" : ""}">${phrase.isEmergency ? "긴급 문장" : "일반 문장"}</div>
    </div>
    <div class="dialog-display">
      <div class="vietnamese">${phrase.vietnamese}</div>
      <div class="plain">${phrase.vietnamesePlain}</div>
      <div class="korean">${phrase.korean}</div>
    </div>
    <div class="dialog-actions"></div>
  `;

  const actions = dialogContent.querySelector(".dialog-actions");
  actions.append(
    createActionButton("음성 크게 재생", () => speakPhrase(phrase.vietnamese), true, colorMap[category.accentColor]),
    createActionButton("복사", async () => copyPhrase(phrase.vietnamese))
  );

  dialog.showModal();
}

function openUpdatesDialog() {
  const newest = data.categories.filter((category) => featuredCategoryIds.includes(category.id));
  dialogContent.innerHTML = `
    <div class="dialog-header">
      <div>
        <p class="eyebrow">Latest Update</p>
        <h3>최신 홈 화면 안내</h3>
      </div>
      <div class="chip">총 ${data.categories.length}개 카테고리</div>
    </div>
    <div class="dialog-display">
      <div class="vietnamese">${data.phrases.length}개 문장 반영</div>
      <div class="plain">새 카테고리: ${newest.map((category) => category.title).join(", ")}</div>
      <div class="korean">이 프리뷰는 최신 앱 홈 구조를 기준으로 갱신됐습니다.</div>
    </div>
    <div class="dialog-actions"></div>
  `;

  const actions = dialogContent.querySelector(".dialog-actions");
  actions.append(
    createActionButton("전체 문장 보기", () => {
      dialog.close();
      state.selectedCategory = "all";
      categoryFilter.value = "all";
      setActiveTab("search");
      renderSearch();
    }, true, colorMap.teal)
  );

  dialog.showModal();
}

function speakPhrase(text) {
  if (!("speechSynthesis" in window)) {
    window.alert("이 브라우저에서는 음성 재생을 지원하지 않습니다.");
    return;
  }

  window.speechSynthesis.cancel();
  const utterance = new SpeechSynthesisUtterance(text);
  utterance.lang = "vi-VN";
  utterance.rate = 0.9;
  window.speechSynthesis.speak(utterance);
}

async function copyPhrase(text) {
  try {
    await navigator.clipboard.writeText(text);
    window.alert("베트남어 문장을 복사했습니다.");
  } catch {
    window.alert("복사에 실패했습니다.");
  }
}
