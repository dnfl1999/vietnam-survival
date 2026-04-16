# Mac 없이 진행하는 작업 정리

작성일: 2026-04-15

## 현재 결론

지금 PC가 Windows 환경이므로 iPhone 앱을 직접 빌드하거나 아이폰에 설치할 수는 없습니다.
다만 Mac이 생기면 바로 Xcode에서 빌드/실행할 수 있도록 준비 작업은 계속 진행할 수 있습니다.

기준 소스 폴더:

- `VietnamSurvivalForKoreans_v2`

## 지금까지 확인된 상태

- SwiftUI 기반 iOS 앱 구조 존재
- 앱 진입 파일 존재: `App/VietnamSurvivalForKoreansApp.swift`
- 모델, 뷰, 매니저, 뷰모델 파일 구성 완료
- 샘플 문장 데이터 120개 확인
- 문장 ID 중복 0건 확인
- Mac 이전용 문서 이미 존재
  - `MAC_TRANSFER_PACKAGE.md`
  - `MAC_XCODE_FIRST_RUN_CHECKLIST.md`

## Mac 없이 지금 할 수 있는 일

1. 앱 문구와 번역 문장 검수
2. 카테고리 구성과 우선순위 정리
3. 아이콘, 스토어 문구, 설명문 초안 준비
4. Mac 이전 패키지 정리
5. Xcode에서 바로 옮길 기준 폴더를 `v2`로 고정

## Mac이 생기면 바로 할 일

1. Xcode에서 새 iOS App 프로젝트 생성
2. `VietnamSurvivalForKoreans_v2`의 `.swift` 파일 전체 추가
3. 기본 생성된 `ContentView.swift` 제거 또는 타깃 제외
4. `@main` 진입점이 `VietnamSurvivalForKoreansApp.swift` 하나만 남도록 정리
5. Simulator 빌드 확인
6. 실제 iPhone 연결 후 실행
7. 필요하면 TestFlight 업로드 준비

## 추천 진행 방식

당분간은 Windows에서 아래 순서로 진행하는 것이 가장 효율적입니다.

1. `VietnamSurvivalForKoreans_v2`만 기준 버전으로 사용
2. 문장/카테고리/UX 문구를 계속 다듬기
3. 아이콘과 앱 설명문 초안까지 준비
4. Mac이 생기면 빌드와 설치 검증 진행

## 참고 문서

- `MAC_TRANSFER_PACKAGE.md`
- `MAC_XCODE_FIRST_RUN_CHECKLIST.md`
- `CONTENT_REVIEW_GUIDE.md`
- `PRODUCT_BACKLOG.md`
- `STORE_LAUNCH_DRAFT.md`
