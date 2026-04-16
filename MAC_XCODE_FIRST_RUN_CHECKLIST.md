# Mac/Xcode 첫 실행 체크리스트

작성일: 2026-04-10

기준 소스 폴더: `VietnamSurvivalForKoreans_v2`

## 목표

Mac을 사용할 수 있게 되었을 때 Xcode에서 새 iOS 프로젝트를 만들고, 현재 SwiftUI 소스를 넣어 첫 빌드와 첫 실행까지 확인한다.

## 1. 프로젝트 생성

- Xcode 실행
- `Create New Project...` 선택
- `iOS > App` 선택
- Product Name: `VietnamSurvivalForKoreans`
- Interface: `SwiftUI`
- Language: `Swift`
- Minimum Deployment: `iOS 17.0` 이상
- 저장 위치는 원하는 곳으로 선택

## 2. 기본 파일 정리

- Xcode가 자동 생성한 `ContentView.swift`는 타깃에서 제거하거나 삭제
- Xcode가 자동 생성한 기본 App 파일이 있다면 현재 소스의 `VietnamSurvivalForKoreansApp.swift`와 중복되지 않게 정리
- 앱의 `@main` 진입점은 아래 파일 하나만 남긴다
  - `VietnamSurvivalForKoreans_v2/App/VietnamSurvivalForKoreansApp.swift`

## 3. v2 Swift 파일 추가

아래 폴더 안의 `.swift` 파일을 모두 Xcode 프로젝트에 추가한다.

- `VietnamSurvivalForKoreans_v2/App`
- `VietnamSurvivalForKoreans_v2/Data`
- `VietnamSurvivalForKoreans_v2/Managers`
- `VietnamSurvivalForKoreans_v2/Models`
- `VietnamSurvivalForKoreans_v2/ViewModels`
- `VietnamSurvivalForKoreans_v2/Views`
- `VietnamSurvivalForKoreans_v2/Views/Components`

추가할 때 확인할 것:

- `Copy items if needed`는 프로젝트 위치에 따라 선택
- `Add to targets`에서 앱 타깃이 체크되어 있는지 확인
- 폴더 레퍼런스 파란 폴더가 아니라 일반 그룹으로 들어가도 괜찮음

## 4. 첫 빌드

- Scheme에서 앱 타깃 선택
- Simulator는 먼저 최신 iPhone 기본 모델 선택
- `Command + B`로 빌드
- 빌드 오류가 나면 우선 아래 항목부터 확인
  - Swift 파일이 타깃에 포함되어 있는지
  - `@main` App 파일이 2개 이상 있지 않은지
  - `ContentView.swift` 참조가 남아 있지 않은지
  - `AVFoundation`, `SwiftUI`, `UIKit` import 오류가 없는지

## 5. 첫 실행 체크

- `Command + R`로 실행
- 홈 화면이 뜨는지 확인
- 하단 탭 4개 확인
  - 홈
  - 검색
  - 즐겨찾기
  - 프리미엄
- 홈의 카테고리 6개 확인
  - 병원/약국
  - 택시/그랩
  - 음식 주문
  - 가격 흥정
  - 위험 상황
  - 자주 쓰는 말

## 6. 기능 체크

- 카테고리별 문장 목록이 열리는지 확인
- 문장 카드에서 `크게 보기`가 열리는지 확인
- 전체 화면 모드에서 닫기가 되는지 확인
- 음성 재생 버튼을 눌렀을 때 베트남어 TTS가 나오는지 확인
- 즐겨찾기 버튼을 누른 뒤 즐겨찾기 탭에 반영되는지 확인
- 앱을 종료 후 다시 실행해도 즐겨찾기가 유지되는지 확인
- 검색 탭에서 한국어 검색이 되는지 확인
- 검색 탭에서 베트남어 성조 포함/무성조 검색이 되는지 확인
- 프리미엄 탭이 placeholder 화면으로 열리는지 확인

## 7. 작은 화면 체크

아래 시뮬레이터에서 최소 1번씩 확인한다.

- iPhone SE 계열
- 최신 일반 iPhone
- 큰 화면 iPhone Pro Max 계열

확인할 것:

- 홈 빠른 진입 버튼 3개가 좁은 화면에서 답답하지 않은지
- 문장 카드 하단 버튼이 겹치지 않는지
- 전체 화면 모드에서 긴 베트남어 문장이 잘리지 않는지
- 검색 결과가 많을 때 스크롤이 자연스러운지

## 8. 첫 실행 후 바로 볼 개선 후보

- 홈에서 `SearchView`, `FavoritesView`, `PremiumPlaceholderView`로 이동할 때 NavigationStack이 중첩되어 보이는지 확인
- 베트남어 TTS가 성조 포함 문장을 자연스럽게 읽는지 확인
- 응급 문장은 실제 사용자에게 보여주기 전 베트남어 가능자 또는 전문 번역 검수를 받기
- 문장 수가 늘었으므로 검색 결과 정렬이 충분히 편한지 확인

## 현재 데이터 상태

- 전체 문장: 120개
- 카테고리별 문장: 20개씩
- `vietnamese`: 성조 포함 베트남어
- `vietnamesePlain`: 사용자가 급할 때 따라 읽기 쉬운 무성조 표기
