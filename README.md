# Vietnam Survival for Koreans

SwiftUI(iOS 17+)로 만든 iPhone 전용 MVP 앱 예제입니다.

베트남에 거주하거나 여행하는 한국인이 병원, 약국, 택시, 음식점, 흥정, 위험 상황 등에서 빠르게 사용할 수 있는 "상황 해결 버튼 앱"을 목표로 합니다.

이 앱은 복잡한 번역 입력 대신, 자주 쓰는 문장을 버튼으로 바로 열고 아래 기능을 제공합니다.

- 한국어 문장 확인
- 베트남어 문장 확인
- 성조 없는 베트남어 확인
- 베트남어 음성 재생
- 즐겨찾기 저장
- 전체 검색

## 핵심 특징

- SwiftUI 기반의 단순한 구조
- 외부 API 없이 오프라인 동작 가능한 MVP 설계
- 샘플 문장 데이터 내장
- `UserDefaults` 기반 즐겨찾기 저장
- `AVSpeechSynthesizer` 기반 베트남어 TTS
- 향후 확장용 자리 포함
  - AI 상황 추천
  - 오프라인 팩
  - 광고 영역
  - 프리미엄 화면 Placeholder

## 폴더 구조

```text
VietnamSurvivalForKoreans/
├─ App/
│  └─ VietnamSurvivalForKoreansApp.swift
├─ Data/
│  └─ SamplePhrases.swift
├─ Managers/
│  ├─ FavoritesManager.swift
│  └─ SpeechManager.swift
├─ Models/
│  ├─ Phrase.swift
│  └─ PhraseCategory.swift
├─ ViewModels/
│  └─ PhraseStore.swift
└─ Views/
   ├─ CategoryView.swift
   ├─ FavoritesView.swift
   ├─ HomeView.swift
   ├─ PhraseCardView.swift
   ├─ PhraseDetailView.swift
   ├─ PremiumPlaceholderView.swift
   ├─ RootTabView.swift
   ├─ SearchView.swift
   └─ Components/
      └─ CategoryButton.swift
```

## 실행 방법

1. Xcode에서 `App` 템플릿으로 새 iOS 프로젝트를 생성합니다.
2. 프로젝트 이름은 `VietnamSurvivalForKoreans`로 맞추면 가장 편합니다.
3. 이 저장소의 `VietnamSurvivalForKoreans` 폴더 안 파일들을 Xcode 프로젝트에 그대로 추가합니다.
4. 기본으로 생성된 예제 `ContentView.swift`는 삭제해도 됩니다.
5. 배포 타깃을 iOS 17.0 이상으로 설정합니다.
6. 시뮬레이터 또는 실제 iPhone에서 실행합니다.

## 파일 설명

- `VietnamSurvivalForKoreansApp.swift`: 앱 시작점
- `Phrase.swift`: 문장 데이터 모델
- `PhraseCategory.swift`: 카테고리 정의, 제목, 아이콘, 색상
- `SamplePhrases.swift`: 첫 실행 시 바로 보이는 샘플 데이터
- `FavoritesManager.swift`: 즐겨찾기 저장/불러오기
- `SpeechManager.swift`: 베트남어 TTS 재생
- `PhraseStore.swift`: 검색과 데이터 접근
- `HomeView.swift`: 메인 화면
- `CategoryView.swift`: 카테고리별 문장 카드 목록
- `PhraseDetailView.swift`: 큰 문장 보기, 복사, 직접 보여주기, 음성 재생
- `SearchView.swift`: 전체 검색
- `FavoritesView.swift`: 즐겨찾기 목록
- `PremiumPlaceholderView.swift`: 향후 유료 기능 구조용 Placeholder

## 향후 확장 아이디어

- JSON 파일로 문장 데이터를 분리해서 관리
- 최근 사용 문장/긴급 문장 우선 정렬
- 도시별 오프라인 팩 다운로드 구조
- AI 상황 추천 카드 연결
- 광고 배너 연결
- 베트남 지역별 발음 옵션

## 참고

- 현재 버전은 MVP에 집중한 예제입니다.
- 디자인은 중장년층도 빠르게 이해할 수 있게 큰 버튼, 단순한 정보 구조, 명확한 CTA 중심으로 구성했습니다.
