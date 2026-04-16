import json
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CATEGORY_FILE = ROOT / "VietnamSurvivalForKoreans_v2" / "Models" / "PhraseCategory.swift"
PHRASE_FILE = ROOT / "VietnamSurvivalForKoreans_v2" / "Data" / "SamplePhrases.swift"
OUTPUT_FILE = ROOT / "web-preview" / "data" / "phrases.json"


def parse_cases(text: str) -> list[str]:
    return re.findall(r"case\s+([A-Za-z0-9_]+)", text)


def parse_switch_map(text: str, property_name: str) -> dict[str, str]:
    pattern = rf"var\s+{re.escape(property_name)}:[^{{]+\{{\s*switch self \{{(.*?)\n\s*\}}\s*\}}"
    match = re.search(pattern, text, re.S)
    if not match:
        raise ValueError(f"Could not parse switch for {property_name}")

    block = match.group(1)
    entries = re.findall(r'case \.([A-Za-z0-9_]+): return "([^"]*)"', block)
    return {case: value for case, value in entries}


def parse_color_map(text: str) -> dict[str, str]:
    pattern = r"var\s+accentColor:[^{]+\{\s*switch self \{(.*?)\n\s*\}\s*\}"
    match = re.search(pattern, text, re.S)
    if not match:
        raise ValueError("Could not parse accentColor switch")

    block = match.group(1)
    entries = re.findall(r"case \.([A-Za-z0-9_]+): return \.([A-Za-z0-9_]+)", block)
    return {case: value for case, value in entries}


def parse_categories(text: str) -> list[dict[str, str]]:
    cases = parse_cases(text)
    titles = parse_switch_map(text, "title")
    icons = parse_switch_map(text, "systemImage")
    descriptions = parse_switch_map(text, "shortDescription")
    colors = parse_color_map(text)

    return [
        {
            "id": case,
            "title": titles[case],
            "systemImage": icons[case],
            "shortDescription": descriptions[case],
            "accentColor": colors[case],
        }
        for case in cases
    ]


def parse_phrases(text: str) -> list[dict[str, object]]:
    pattern = re.compile(
        r'Phrase\('
        r'id: "([^"]+)",\s*'
        r'category: \.([A-Za-z0-9_]+),\s*'
        r'korean: "((?:[^"\\]|\\.)*)",\s*'
        r'vietnamese: "((?:[^"\\]|\\.)*)",\s*'
        r'vietnamesePlain: "((?:[^"\\]|\\.)*)",\s*'
        r'isEmergency: (true|false)\s*'
        r"\)",
        re.S,
    )

    def unescape(value: str) -> str:
        return value.replace(r"\"", '"').replace(r"\\", "\\")

    phrases = []
    for match in pattern.finditer(text):
        phrases.append(
            {
                "id": match.group(1),
                "category": match.group(2),
                "korean": unescape(match.group(3)),
                "vietnamese": unescape(match.group(4)),
                "vietnamesePlain": unescape(match.group(5)),
                "isEmergency": match.group(6) == "true",
            }
        )
    return phrases


def main() -> None:
    categories_text = CATEGORY_FILE.read_text(encoding="utf-8")
    phrases_text = PHRASE_FILE.read_text(encoding="utf-8")

    payload = {
        "app": {
            "name": "Vietnam Survival",
            "tagline": "상황별 문장을 빠르게 찾고 크게 보여주는 베트남 생존 표현집",
        },
        "categories": parse_categories(categories_text),
        "phrases": parse_phrases(phrases_text),
    }

    OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT_FILE.write_text(
        json.dumps(payload, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )

    print(f"Exported {len(payload['phrases'])} phrases to {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
