import shutil
from pathlib import Path

from export_web_preview_data import main as export_web_preview_data


ROOT = Path(__file__).resolve().parents[1]
WEB_PREVIEW_DIR = ROOT / "web-preview"
DOCS_DIR = ROOT / "docs"


def reset_docs_dir() -> None:
    if DOCS_DIR.exists():
        shutil.rmtree(DOCS_DIR)
    DOCS_DIR.mkdir(parents=True, exist_ok=True)


def copy_file(source: Path, destination: Path) -> None:
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source, destination)


def build() -> None:
    export_web_preview_data()
    reset_docs_dir()

    # GitHub Pages root opens the mobile app-style preview by default.
    copy_file(WEB_PREVIEW_DIR / "mobile.html", DOCS_DIR / "index.html")
    copy_file(WEB_PREVIEW_DIR / "mobile.html", DOCS_DIR / "mobile.html")
    copy_file(WEB_PREVIEW_DIR / "mobile.css", DOCS_DIR / "mobile.css")
    copy_file(WEB_PREVIEW_DIR / "mobile.js", DOCS_DIR / "mobile.js")

    # Keep the earlier wide web preview as an optional secondary page.
    copy_file(WEB_PREVIEW_DIR / "index.html", DOCS_DIR / "classic.html")
    copy_file(WEB_PREVIEW_DIR / "styles.css", DOCS_DIR / "styles.css")
    copy_file(WEB_PREVIEW_DIR / "app.js", DOCS_DIR / "app.js")

    copy_file(WEB_PREVIEW_DIR / "data" / "phrases.json", DOCS_DIR / "data" / "phrases.json")

    readme = DOCS_DIR / "README.txt"
    readme.write_text(
        "GitHub Pages deploy folder for Vietnam Survival web preview.\n"
        "Open index.html for the mobile app-style preview.\n",
        encoding="utf-8",
    )

    print(f"Built GitHub Pages files in {DOCS_DIR}")


if __name__ == "__main__":
    build()
