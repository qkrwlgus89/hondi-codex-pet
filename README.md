# 혼디 — 제주개 Codex Pet

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [简体中文](README.zh-CN.md)

![혼디 전체 동작 미리보기](assets/previews/all-states.gif)

혼디는 제주 반려동물 여행 서비스 **오멍가멍**의 제주개 마스코트를 기반으로 만든 Codex/ChatGPT Work용 커스텀 펫입니다.

입 주변의 털만 살짝 짙은 회갈색으로 표현했으며, 가만히 있을 때는 앉아서 꾸벅꾸벅 졸고 드래그해서 옮길 때는 귤을 입에 문 채 걷습니다.

> 이 프로젝트는 개인 제작 커스텀 펫이며 OpenAI의 공식 캐릭터나 공식 배포물이 아닙니다.

## 핵심 동작

| 상황 | 동작 |
|---|---|
| 기본 대기 | 앉은 자세에서 눈꺼풀이 내려가고 고개가 천천히 숙여지는 졸기 |
| 오른쪽 드래그 | 귤을 입에 문 채 오른쪽으로 교차 보행 |
| 왼쪽 드래그 | 동일한 귤과 보행 주기를 유지하며 왼쪽으로 이동 |
| 입력 대기 | 앞발을 살짝 들고 사용자의 입력을 기다림 |
| 작업 중 | 앉아서 집중하며 시선과 앞발을 작게 움직임 |
| 검토 | 몸과 고개를 기울여 결과를 확인 |
| 시선 추적 | 위·아래·좌·우를 포함한 16방향 시선 |

### 요청 동작 미리보기

| 앉아서 졸기 | 귤을 문 채 이동 |
|---|---|
| ![졸기](assets/previews/idle-dozing.gif) | ![귤 보행](assets/previews/drag-right-tangerine.gif) |

## 파일 구성

```text
.
├── README.md
├── README.en.md
├── README.ja.md
├── README.zh-CN.md
├── LICENSE.md
├── CHANGELOG.md
├── pet-metadata.json
├── assets/
│   ├── hondi-spritesheet-v2.png
│   ├── hondi-contact-sheet.png
│   ├── previews/
│   └── stills/
└── docs/
    ├── SPRITE_SPEC.md
    ├── validation.json
    └── quality-report.json
```

## 스프라이트 규격

| 항목 | 값 |
|---|---|
| 버전 | ChatGPT Pet Sprite v2 |
| 이미지 | 투명 PNG |
| 전체 크기 | 1536 × 2288 px |
| 그리드 | 8열 × 11행 |
| 셀 크기 | 192 × 208 px |
| 필수 프레임 | 73개 |
| 기본 동작 | 9종 |
| 시선 방향 | 16방향 |
| SHA-256 | `8b2de2ac6ef0e65a03557fb95b2c25ba4c2b8b04747e55f8827241367cf62ace` |

행별 프레임과 재생시간은 [스프라이트 규격 문서](docs/SPRITE_SPEC.md)에서 확인할 수 있습니다.

## 사용 방법

1. [최종 스프라이트 시트](assets/hondi-spritesheet-v2.png)를 내려받습니다.
2. 커스텀 펫 업로드를 지원하는 Codex/ChatGPT Work 환경에서 해당 PNG를 선택합니다.
3. 업로드 전 이미지 크기와 투명 배경을 변경하지 마세요.
4. 동작 확인이 필요하면 `assets/previews`의 GIF 또는 MP4를 사용하세요.

저장소 생성과 첫 푸시는 [GitHub 업로드 가이드](docs/GITHUB_UPLOAD_GUIDE.ko.md)를 참고하세요.

## 검증

- v2 구조 검사 통과
- 필수 73프레임 존재
- 미사용 15셀 완전 투명
- 점프 상승 34px, 착지 기준선 오차 0px
- 시선 중심 최대 이동 4px
- 최종 Pets 사전검사 통과

자세한 결과는 [구조 검증](docs/validation.json)과 [품질 보고서](docs/quality-report.json)에 포함되어 있습니다.

## 라이선스

현재 이 저장소의 캐릭터와 이미지에는 오픈소스 라이선스를 부여하지 않았습니다. 포트폴리오 열람 목적 외의 재배포·상업적 이용·2차 제작은 권리자의 허가가 필요합니다. 자세한 내용은 [LICENSE.md](LICENSE.md)를 확인하세요.

## 크레딧

- Character: 혼디
- Project: 오멍가멍
- Concept: 제주 반려동물 동반 여행
- Artwork workflow: AI-assisted generation and manual QA
