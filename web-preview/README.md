# Web Preview

브라우저에서 먼저 앱 흐름과 문장 구성을 확인하기 위한 미리보기입니다.

## 포함 기능

- 홈 화면 스타일 미리보기
- 카테고리별 문장 탐색
- 한국어/베트남어 검색
- 즐겨찾기 저장
- 문장 크게 보기
- 브라우저 음성 재생

## 실행 방법

1. 데이터 내보내기

```powershell
python tools\export_web_preview_data.py
```

2. 웹 서버 실행

```powershell
python -m http.server 4173
```

3. 브라우저에서 열기

`http://localhost:4173/web-preview/`

모바일 앱형 프리뷰:

`http://localhost:4173/web-preview/mobile.html`

## 참고

- 즐겨찾기는 브라우저 `localStorage`에 저장됩니다.
- 음성 재생은 브라우저의 `speechSynthesis` 기능을 사용하므로 환경에 따라 발음 품질 차이가 있을 수 있습니다.
