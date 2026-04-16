# Mac 이전 패키지 안내

작성일: 2026-04-10

## Mac으로 가져갈 핵심 파일

필수:

- `VietnamSurvivalForKoreans_v2/`
- `MAC_XCODE_FIRST_RUN_CHECKLIST.md`
- `CONTENT_REVIEW_GUIDE.md`
- `PRODUCT_BACKLOG.md`
- `STORE_LAUNCH_DRAFT.md`
- `review/phrases_review_2026-04-10.csv`

참고용:

- `HANDOFF_2026-04-08.md`
- `CHECKLIST_2026-04-09.md`
- `README.md`
- `VietnamSurvivalForKoreans/`

## 기준 소스

앞으로 개발 기준은 `VietnamSurvivalForKoreans_v2`로 고정한다.

`VietnamSurvivalForKoreans`는 초기 MVP 참고용으로만 둔다.

## Mac에서 작업 시작 순서

1. `MAC_XCODE_FIRST_RUN_CHECKLIST.md`를 연다.
2. Xcode에서 새 iOS App 프로젝트를 만든다.
3. `VietnamSurvivalForKoreans_v2` 안의 Swift 파일을 모두 추가한다.
4. 첫 빌드를 확인한다.
5. 첫 실행 후 `PRODUCT_BACKLOG.md`의 P0 항목을 체크한다.
6. 문장 검수는 `review/phrases_review_2026-04-10.csv` 기준으로 진행한다.

## 주의사항

- Xcode 프로젝트 생성 전까지 `.xcodeproj`가 없는 것이 정상이다.
- `@main` 앱 진입점은 1개만 있어야 한다.
- 기본 생성된 `ContentView.swift`가 남아 있으면 현재 앱 흐름과 맞지 않을 수 있다.
- Swift 파일을 추가할 때 앱 타깃 체크 여부를 꼭 확인한다.
- 베트남어 검수 전까지 응급/병원 문장은 최종본으로 보지 않는다.

## 현재 준비 상태

- 문장 데이터: 120개
- 검수용 CSV: 생성됨
- Mac 첫 실행 체크리스트: 생성됨
- 제품 백로그: 생성됨
- 스토어/출시 초안: 생성됨
- 실제 iOS 빌드: Mac/Xcode 필요
