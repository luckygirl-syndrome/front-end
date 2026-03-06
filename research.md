# 또바바 (ttobaba) — Front-End 프로젝트 리서치

> README.md 작성을 위한 내부 분석 문서입니다.

---

## 1. 프로젝트 개요

**또바바**는 쇼핑 결정을 어려워하는 사람들을 도와주는 **AI 기반 소비 결정 도우미 모바일 앱**입니다.

> 슬로건 힌트: "또 사기 전에 또바!"

사용자가 고민 중인 의류·패션 아이템의 **쇼핑몰 링크를 입력**하면, AI 캐릭터 **또바**가 채팅을 통해 구매 여부를 함께 고민해 줍니다.
단순한 쇼핑 앱이 아니라, **사용자의 쇼핑 성향(S-BTI)**을 기반으로 맞춤형 소비 결정을 돕는 것이 핵심입니다.

---

## 2. 기술 스택

| 구분 | 기술 |
|------|------|
| 프레임워크 | Flutter (Dart, SDK ≥3.0) |
| 상태관리 | Riverpod 2.x (`flutter_riverpod`, `riverpod_generator`) |
| 라우팅 | `go_router` 13.x |
| 네트워크 | `dio` 5.x |
| 인증 | `flutter_secure_storage` (JWT 토큰 로컬 저장) |
| 모델 직렬화 | `freezed` + `json_serializable` |
| 폰트 | Pretendard (Regular 400, Medium 500, Bold 700, ExtraBold 800) |
| 배포 | Firebase Hosting + Vercel (웹 타겟) |
| 플랫폼 | Android / iOS / Web (최대 너비 480px로 모바일 UI 제한) |

---

## 3. 주요 기능 (화면 흐름)

### 3-1. 인증 플로우
```
스플래시 → 로그인 / 회원가입
```
- `splash_screen`: 앱 시작 시 항상 표시, 토큰 여부에 따라 홈 또는 로그인으로 리다이렉트
- `login_screen`: 로그인
- `signup_screen`: 회원가입

### 3-2. S-BTI (쇼핑 성향 테스트)
```
sbti_start → sbti_question (or sbti_no_like)
```
- 로그인 없이도 접근 가능 (비로그인 허용 경로)
- 사용자의 **쇼핑 성향 유형(Persona Type)**을 진단
- '또바와 함께 쇼핑 성향(S-BTI)을 알아볼까요?'라는 캐치프레이즈 사용

### 3-3. 초기 취향 설문 (initial_question)
```
initial_question_start → initial_question → (taste_update_complete or initial_question_no_like)
```
- 회원가입 후 또는 마이페이지에서 '취향 다시 설정' 시 진행
- 자주 이용하는 쇼핑몰, 추구미(스타일) 등을 입력받음
- 완료 메시지: "진짜로 끝났어요 / 또바바와 함께 또 사기 전에 또바!"

### 3-4. 홈 화면 (home) — 메인
탭바(3개):
| 탭 | 내용 |
|----|------|
| **또바와 진대** | AI 또바와의 최근 대화/상품 추천 섹션 |
| **결정** | 구매 결정완료 된 아이템 목록 |
| **안사도 돼** (NobuReceipt) | 구매 포기로 절약한 내역 영수증 형태로 표시 |

### 3-5. 채팅 (chat)
```
chat_list → (+ FAB: 링크 입력 팝업 → chat/survey/:id) → chat/:id (상세)
```
- **채팅 목록**: 최근 대화 카드 + 전체/결정완료/고민중 필터
- **새 채팅 시작**: FAB(+) 클릭 → 쇼핑몰 상품 링크 입력 → 설문(survey) → AI 채팅 시작
- **상세 채팅**: 실제 AI 또바와의 대화 인터페이스 (`detail_chat_screen.dart`, 46KB — 가장 핵심적인 화면)
- 상태: `고민 중` / `구매 완료` / `구매 포기` 세 가지

### 3-6. 피드백 (feedback)
- 앱 사용 후 피드백을 받는 화면

### 3-7. 마이페이지 (my_page)
구성:
- **프로필 헤더**: 프로필 이미지, 닉네임, 퍼소나 타입(S-BTI 결과)
- **나의 S-BTI**: 쇼핑 성향 결과 카드 + 다시 설정하기
- **나의 취향**: 자주 이용하는 쇼핑몰 태그, 추구미(스타일) 태그 + 다시 설정하기
- **나의 옷장**: 고심 끝에 구매한 옷(수량 + 금액), 아쉽지만 포기한 옷(수량 + 금액)

---

## 4. 아키텍처 패턴

```
lib/
├── core/                   # 공통 인프라
│   ├── auth/               # 인증 상태 관리 (authStateProvider)
│   ├── network/            # Dio HTTP 클라이언트
│   ├── router/             # GoRouter 설정 + 인증 기반 리다이렉션
│   ├── theme/              # 색상(AppColors), 텍스트 스타일(AppTextStyles)
│   ├── utils/              # 유틸 함수 (가격 포맷 등)
│   └── widgets/            # 공통 위젯 (AppTopbar, AppNavbar, AppButton 등)
│
└── features/               # 기능별 모듈
    ├── chat/               # 채팅 (핵심 기능)
    ├── home/               # 홈 화면
    ├── sbti/               # 쇼핑 성향 테스트
    ├── initial_question/   # 초기 취향 설문
    ├── my_page/            # 마이페이지
    ├── login/              # 로그인
    ├── signup/             # 회원가입
    ├── splash/             # 스플래시
    ├── products/           # 상품 관련
    ├── feedback/           # 피드백
    └── onboarding/         # 온보딩
```

각 feature는 `models / providers / repositories / screens / widgets` 구조를 따름.

---

## 5. 앱 정체성 / 브랜드

- **앱 이름**: 또바바 (ttobaba)
- **AI 캐릭터**: 또바 (고양이 이미지 사용 — `assets/images/cats/`)
- **브랜드 컬러**: `AppColors.primaryMain` — 노란색 계열
- **핵심 메시지**: "또 사기 전에 또바!" (충동구매 방지)
- **타겟 유저**: 패션 쇼핑 시 결정을 못 내리거나 충동구매로 후회하는 사람

---

## 6. README.md 작성 시 포함 권장 항목

### 필수 항목
- [ ] 프로젝트 소개 (한 줄 설명 + 핵심 가치)
- [ ] 주요 기능 목록 (S-BTI, 채팅 결정, 나의 옷장 등)
- [ ] 기술 스택 테이블
- [ ] 시작하기 (환경 설정 방법)
  - Flutter SDK 버전 (`>=3.0.0 <4.0.0`)
  - `flutter pub get`
  - `flutter run`
  - 개발 팁: `flutter run --dart-define=CLEAR_TOKEN_ON_START=true` (토큰 초기화)
- [ ] 프로젝트 구조 설명
- [ ] 배포 정보 (Firebase Hosting / Vercel)

### 선택 항목
- [ ] 스크린샷 / 데모 GIF
- [ ] API 연동 방법 (백엔드 URL 설정 위치)
- [ ] 기여 방법 (Contributing Guide)
- [ ] 라이선스

---

## 7. 참고 메모

- 현재 README.md는 Flutter 기본 템플릿 그대로 (`A new Flutter project.`) — 완전히 새로 작성 필요
- `vercel.json`이 있어 웹 빌드 배포도 지원
- `.firebaserc`가 있어 Firebase Hosting 배포도 지원
- 최대 화면 너비 **480px** 제한으로 모바일 UX에 최적화된 웹앱으로도 사용 가능
