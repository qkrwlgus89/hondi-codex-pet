# GitHub 업로드 가이드

## 추천 저장소 정보

- 저장소 이름: `hondi-codex-pet`
- 공개 범위: 처음에는 Private 권장, 최종 확인 후 Public 전환
- 설명:
  - 한국어: `귤을 물고 걷고 앉아서 졸기도 하는 제주개 Codex 커스텀 펫`
  - English: `A custom Jeju dog pet for Codex that carries a tangerine and dozes off while sitting.`
- 추천 Topics:
  - `codex-pet`
  - `chatgpt-work`
  - `sprite-sheet`
  - `animation`
  - `jeju`
  - `mascot`
  - `omeong-gameong`

## GitHub 웹에서 올리기

1. GitHub에서 새 저장소를 만듭니다.
2. 저장소 이름을 `hondi-codex-pet`으로 입력합니다.
3. GitHub가 자동으로 README나 라이선스를 만들지 않도록 빈 저장소로 생성합니다.
4. 이 패키지의 압축을 풀고 내부 파일과 폴더를 모두 업로드합니다.
5. 기본 브랜치는 `main`으로 유지합니다.
6. README의 GIF와 내부 링크가 정상적으로 표시되는지 확인합니다.

## 터미널에서 올리기

```bash
cd hondi-codex-pet
git init
git add .
git commit -m "feat: add Hondi Codex pet v1.0.0"
git branch -M main
git remote add origin <YOUR_GITHUB_REPOSITORY_URL>
git push -u origin main
```

## 공개 전 확인

- `README.md`가 첫 화면에서 정상 표시되는지 확인
- 4개 언어 링크가 모두 열리는지 확인
- GIF가 자동 재생되는지 확인
- `assets/hondi-spritesheet-v2.png`의 크기가 1536×2288인지 확인
- 팀 이름과 권리자 표기가 맞는지 확인
- 공개 재사용을 허용하려면 `LICENSE.md`를 원하는 라이선스로 교체

## 첫 Release 추천

- Tag: `v1.0.0`
- Title: `Hondi Codex Pet v1.0.0`
- 첨부 파일: 이 패키지의 ZIP
- Release note:

  `First validated release of Hondi, a custom Jeju dog pet with seated dozing, tangerine-carrying drag movement, nine standard states, and sixteen look directions.`

## 한 줄 설치 배포

원격 저장소는 `https://github.com/qkrwlgus89/hondi-codex-pet`입니다.
설치 스크립트와 문서 변경을 공개 `main` 브랜치에 푸시하면 README의 설치 명령어를 공유할 수 있습니다. 비공개 저장소에서는 인증 없는 설치가 동작하지 않습니다.

게시 전 `python3 tests/test_install.py`로 셸 설치를 검사하세요. Windows에서는 임시 `CODEX_HOME`을 지정한 뒤 `./install.ps1 -SourceDir .`로 설치와 재실행을 확인하세요.

게시 후 README의 원격 설치 명령어로 최종 확인하세요. 설치 후 사용자가 설정 → Pets에서 혼디를 선택해야 합니다.
