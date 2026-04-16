# 내일 첫 작업용 체크리스트

날짜: 2026-04-09

기준 소스:
- `VietnamSurvivalForKoreans_v2`

## 시작 전

- `HANDOFF_2026-04-08.md` 먼저 열기
- `VietnamSurvivalForKoreans_v2` 폴더 기준으로 작업하기
- Mac + Xcode 사용 가능한지 확인하기

## 1. 프로젝트 만들기

- Xcode 실행
- `Create New Project...` 클릭
- `iOS > App` 선택
- Product Name: `VietnamSurvivalForKoreans`
- Interface: `SwiftUI`
- Language: `Swift`
- iOS Deployment Target: `17.0+`

## 2. 파일 넣기

- 기본 생성 파일 확인
- 기본 `ContentView.swift` 제거
- `VietnamSurvivalForKoreans_v2` 폴더 안 Swift 파일들 모두 추가
- 타깃 체크박스 포함 여부 확인

## 3. 첫 빌드

- iPhone 시뮬레이터 선택
- `Run` 버튼 클릭
- 첫 컴파일 에러 있으면 바로 정리

## 4. 반드시 확인할 화면

- 홈 화면
- 카테고리 화면
- 문장 상세 화면
- 전체 화면 보여주기 모드
- 검색 화면
- 즐겨찾기 화면
- 프리미엄 화면

## 5. 기능 체크

- 홈 상단 소개 문구 보이는지
- 빠른 진입 버튼 3개 동작하는지
- 위험 상황 카드가 눈에 띄는지
- 베트남어 문장이 크게 보이는지
- 음성 재생 버튼 눌렀을 때 TTS 나오는지
- 즐겨찾기 저장/해제 되는지
- 검색이 실시간으로 반응하는지
- 전체 화면 모드에서 문장 순서가 맞는지

## 6. UI 체크

- 다크모드 가독성 확인
- 작은 화면에서 버튼 겹침 없는지
- 카드 간격과 정렬 자연스러운지
- 한국어/베트남어/성조 없는 버전 위계가 잘 보이는지

## 7. 끝나기 전

- 수정한 내용 메모 남기기
- 빌드 에러 해결 여부 기록하기
- 다음 작업 우선순위 적기

## 오늘의 1순위 목표

- `Xcode에서 실제로 한 번 실행되게 만들기`
