# GitHub Pages 배포 안내

작성일: 2026-04-15

## 목적

이 문서는 `Vietnam Survival` 웹 프리뷰를 GitHub Pages로 배포해서
휴대폰이 다른 와이파이이거나 LTE/5G일 때도 접속할 수 있게 만드는 절차입니다.

## 현재 기준

- 배포용 산출물 폴더: `docs/`
- 기본 진입 페이지: `docs/index.html`
- 기본 디자인: 아이폰 앱형 프리뷰

## 1. 배포용 파일 만들기

프로젝트 루트에서 아래 명령 실행:

```powershell
python tools\build_github_pages.py
```

실행 후 생성되는 폴더:

- `docs/`

## 2. GitHub 저장소에 올리기

아직 이 폴더는 Git 저장소가 아니므로, 보통 아래 순서로 진행합니다.

1. GitHub에서 새 저장소 생성
2. 이 프로젝트 파일을 그 저장소에 업로드
3. `docs/` 폴더가 저장소 안에 포함되었는지 확인

## 3. GitHub Pages 켜기

GitHub 저장소에서:

1. `Settings`
2. `Pages`
3. `Build and deployment`
4. `Source`를 `Deploy from a branch`로 선택
5. Branch는 `main`
6. Folder는 `/docs`
7. `Save`

## 4. 접속 주소

보통 아래 형식으로 열립니다.

```text
https://<github-username>.github.io/<repository-name>/
```

이 주소의 첫 화면은 모바일 앱형 프리뷰입니다.

## 5. 포함되는 페이지

- `/` : 모바일 앱형 프리뷰
- `/mobile.html` : 모바일 앱형 프리뷰
- `/classic.html` : 기존 넓은 웹 프리뷰

## 6. 수정 후 다시 배포하는 방법

문장이나 프리뷰 UI를 바꾼 뒤 다시 아래 명령만 실행하면 됩니다.

```powershell
python tools\build_github_pages.py
```

그 다음 변경된 `docs/` 폴더를 GitHub에 다시 올리면 Pages가 갱신됩니다.

## 7. 추천

처음 공개할 때는 `mobile.html` 기준 화면만 확인해도 충분합니다.
실제 앱 흐름과 가장 비슷하게 맞춰둔 버전입니다.
