# 🍊 안녕, 나는 혼디!

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [简体中文](README.zh-CN.md)

**귤을 물고 총총, 졸리면 꾸벅꾸벅. 오멍가멍의 제주개 마스코트예요.**

![귤을 물고 걷고 꾸벅꾸벅 조는 혼디](assets/previews/all-states.gif)

혼디는 반려동물과 함께하는 제주 여행 앱 **오멍가멍**의 마스코트예요. 동그란 얼굴에 살짝 짙은 입가, 입에 꼭 문 귤이 눈에 띄는 친구랍니다.

오멍가멍에서 만나는 혼디를 화면 한쪽에서도 만나 보세요. 가만히 앉아 졸기도 하고, 자리를 옮겨 주면 귤을 문 채 총총 걸어요. 이 저장소에는 혼디를 Codex 펫으로 데려올 수 있는 파일과 설치 방법을 담았어요.

**[🐾 혼디가 있는 오멍가멍 놀러 가기 →](https://omeong-gameong-web.vercel.app/login)**

## 🐾 다음 여행은, 오멍가멍

우리 집 강아지와 바닷바람도 쐬고, 낯선 길도 나란히 걸어 보고 싶은 날. 다음 목적지로 제주를 떠올리고 있다면 **오멍가멍**에 놀러 오세요.

반려동물과 함께하는 제주 여행을 위한 앱, 오멍가멍. 혼디가 마음에 들었다면 혼디의 원래 집도 살짝 들러 주세요. 🍊

**[오멍가멍 웹에서 만나기 →](https://omeong-gameong-web.vercel.app/login)**

## 🍊 혼디의 작은 하루

| 이럴 때 | 혼디는요 |
|---|---|
| 가만히 있을 때 | 편하게 앉아서 꾸벅꾸벅 졸아요 |
| 왼쪽이나 오른쪽으로 옮길 때 | 귤을 꼭 물고 총총 걸어요 |
| 인사할 때 | 앞발을 들어 반갑게 인사해요 |
| 기다릴 때 | 앞발을 살짝 들고 기다려요 |
| 집중할 때 | 앉은 채로 눈과 앞발을 조금씩 움직여요 |
| 살펴볼 때 | 몸과 고개를 갸웃해요 |
| 시선을 움직일 때 | 위아래, 양옆으로 고개와 눈길을 돌려요 |

| 잠깐만… 졸려요 💤 | 귤은 꼭 챙겨야 해요 🍊 |
|---|---|
| ![앉아서 꾸벅꾸벅 조는 혼디](assets/previews/idle-dozing.gif) | ![귤을 물고 총총 걷는 혼디](assets/previews/drag-right-tangerine.gif) |

## 🏡 혼디 데려오기

아래 명령어 한 줄이면 혼디를 설치할 수 있어요. 펫 v2를 지원하는 Codex 데스크톱 앱을 준비하고, 사용하는 운영체제에 맞는 명령어를 터미널에 붙여 넣어 주세요.

**macOS / Linux 셸**

```sh
curl -fsSL https://raw.githubusercontent.com/qkrwlgus89/hondi-codex-pet/main/install.sh | sh
```

**Windows PowerShell**

```powershell
& ([scriptblock]::Create((Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/qkrwlgus89/hondi-codex-pet/main/install.ps1).Content))
```

설치가 끝나면 **설정 → Pets(펫) → 새로고침 → 혼디 (Hondi)**를 선택해 주세요. 목록에 아직 안 보인다면 앱을 완전히 종료했다가 다시 열어 주세요.

<details>
<summary>설치 경로 · 재설치 · 삭제 안내</summary>

- Git·Python·Node.js·관리자 권한 없이 설치합니다. macOS/Linux는 `curl`과 `shasum` 또는 `sha256sum`이 필요합니다.
- 기본 설치 경로는 `~/.codex/pets/hondi`이며, `CODEX_HOME`을 설정했다면 해당 경로를 사용합니다.
- 원본 이미지의 SHA-256 검증 후 설치합니다. 같은 파일이 이미 있으면 그대로 두고, 기존 파일을 교체할 때는 Codex 홈의 `pet-backups`에 백업합니다.
- IDE 확장에는 펫 표시 기능이 없습니다. Linux 셸에서 파일 설치는 가능하지만, 실제 표시는 사용하는 클라이언트의 펫 v2 지원 여부에 달려 있습니다.
- 이 v2 이미지는 웹 업로드용 v1 규격과 다릅니다. [공식 펫 안내](https://learn.chatgpt.com/docs/pets)를 참고하세요.

### 내려받은 프로젝트에서 설치

```sh
sh install.sh --from .
```

Windows: `./install.ps1 -SourceDir .`

설치 코드는 [install.sh](install.sh) / [install.ps1](install.ps1)에서 확인할 수 있습니다. 제거하려면 앱에서 다른 펫을 선택한 뒤 설치 경로의 `hondi` 폴더만 삭제하세요.

</details>

<details>
<summary>스프라이트 규격과 검증 기록</summary>

## 파일 구성

```text
.
├── README.md
├── README.en.md
├── README.ja.md
├── README.zh-CN.md
├── LICENSE.md
├── CHANGELOG.md
├── install.sh
├── install.ps1
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

## 검증

- v2 구조 검사 통과
- 필수 73프레임 존재
- 미사용 15셀 완전 투명
- 점프 상승 34px, 착지 기준선 오차 0px
- 시선 중심 최대 이동 4px
- 최종 Pets 사전검사 통과

자세한 결과는 [구조 검증](docs/validation.json)과 [품질 보고서](docs/quality-report.json)에 포함되어 있습니다.

</details>

## 함께 지켜 주세요

혼디를 개인의 비상업적 Codex 펫으로 설치하고 사용하는 것은 괜찮아요. 친구에게 소개하고 싶다면 이 저장소 링크를 공유해 주세요.

캐릭터와 이미지에는 오픈소스 라이선스가 적용되지 않습니다. 이미지 파일의 재배포, 상업적 이용, 2차 제작에는 권리자의 허가가 필요해요. 자세한 내용은 [LICENSE.md](LICENSE.md)를 확인해 주세요.

## 혼디를 만든 곳

- **캐릭터 · 서비스:** 혼디 · [오멍가멍](https://omeong-gameong-web.vercel.app/login)
- **제작:** AI를 활용한 이미지 생성 및 수동 품질 검수

이 펫은 오멍가멍의 마스코트를 활용한 커스텀 펫이며, OpenAI의 공식 캐릭터나 공식 배포물이 아닙니다.
