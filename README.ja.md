# 🍊 こんにちは、ホンディです！

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [简体中文](README.zh-CN.md)

**みかんをくわえて、とことこ。眠くなったら、こっくり。オモンガモンの済州犬マスコットです。**

![みかんをくわえて歩いたり、居眠りしたりするホンディ](assets/previews/all-states.gif)

ホンディは、ペットと一緒に済州島を旅するためのアプリ **オモンガモン（Omeong Gameong）** のマスコット。丸いお顔と少し濃い口元、口にくわえたみかんが目印です。

そんなホンディを、画面の片隅にも迎えてみませんか。じっとしていると、座ったままこっくり。場所を動かすと、みかんをくわえてとことこ歩きます。このリポジトリでは、ホンディをCodexのカスタムペットとして迎えるためのファイルと手順を紹介しています。

**[🐾 オモンガモンに遊びに行く →](https://omeong-gameong-web.vercel.app/login)**

## 🐾 次の旅は、オモンガモンと

潮風を感じたり、初めての道を並んで歩いたり。大切なペットとの次の旅に済州島を思い浮かべたら、**オモンガモン**をのぞいてみてください。

ホンディを気に入ってくれたら、この子が暮らす旅行アプリにも、ぜひ遊びに来てくださいね。🍊

**[オモンガモンをWebで見る →](https://omeong-gameong-web.vercel.app/login)**

## 🍊 ホンディの小さな一日

| こんなとき | ホンディは… |
|---|---|
| 静かに過ごすとき | 座ったまま、こっくり居眠り |
| 左右に動かすとき | みかんをくわえて、とことこ |
| あいさつするとき | 前足を上げて、ごあいさつ |
| 待っているとき | 前足を少し上げて、じっと待機 |
| 集中するとき | 座ったまま、目と前足を少し動かします |
| よく見るとき | 体を傾けて、首をかしげます |
| 周りを見るとき | 16方向に視線を向けます |

| ちょっとだけ、お昼寝 💤 | みかんも一緒に 🍊 |
|---|---|
| ![居眠りするホンディ](assets/previews/idle-dozing.gif) | ![みかんをくわえて歩くホンディ](assets/previews/drag-right-tangerine.gif) |

## 🏡 コマンド1つでインストール

カスタムペットv2対応のCodexデスクトップアプリが必要です。

**macOS / Linux shell**

```sh
curl -fsSL https://raw.githubusercontent.com/qkrwlgus89/hondi-codex-pet/main/install.sh | sh
```

**Windows PowerShell**

```powershell
& ([scriptblock]::Create((Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/qkrwlgus89/hondi-codex-pet/main/install.ps1).Content))
```

インストール後、**設定 → Pets → 更新 → 혼디 (Hondi)** を選択します。表示されなければアプリを再起動してください。

<details>
<summary>インストール先・再インストール・削除</summary>

保存先は `~/.codex/pets/hondi`（`CODEX_HOME` 設定時はその配下）です。画像のSHA-256を検証し、既存の異なるバージョンはCodexホームの `pet-backups` に保存します。Git・Python・管理者権限は不要です。シェル版にはcurlとshasum/sha256sumが必要です。

ローカルからは `sh install.sh --from .`、Windowsでは `./install.ps1 -SourceDir .` を実行します。削除するには別のペットを選択し、インストール先の `hondi` フォルダーだけを削除します。

IDE拡張はペット表示に非対応です。Linuxでの表示はクライアントのv2対応に依存します。Webアップロード用v1形式とは異なります。[公式案内](https://learn.chatgpt.com/docs/pets)。

</details>

<details>
<summary>スプライト仕様と検証記録</summary>

## リポジトリ構成

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

## スプライト仕様

| 項目 | 値 |
|---|---|
| バージョン | ChatGPT Pet Sprite v2 |
| 形式 | 透過PNG |
| 全体サイズ | 1536 × 2288 px |
| グリッド | 8列 × 11行 |
| セルサイズ | 192 × 208 px |
| 必須フレーム | 73 |
| 基本状態 | 9種類 |
| 視線方向 | 16方向 |
| SHA-256 | `8b2de2ac6ef0e65a03557fb95b2c25ba4c2b8b04747e55f8827241367cf62ace` |

行順と再生時間は [SPRITE_SPEC.md](docs/SPRITE_SPEC.md) を参照してください。

## 検証

- v2構造検証に合格
- 必須73フレームをすべて収録
- 未使用15セルは完全透過
- ジャンプ上昇34px、着地基準線の誤差0px
- 視線方向の中心移動は最大4px
- 最終Pets事前検証に合格

詳細は [validation.json](docs/validation.json) と [quality-report.json](docs/quality-report.json) に収録しています。

</details>

## ライセンス

キャラクターおよび画像素材には、現在オープンソースライセンスを付与していません。個人の非商用Codexペット利用とリポジトリリンクの共有は許可します。素材の再配布、商用利用、二次制作には権利者の許可が必要です。詳細は [LICENSE.md](LICENSE.md) を確認してください。

## クレジット

- キャラクター：ホンディ
- プロジェクト：オモンガモン
- コンセプト：済州島のペット同伴旅行
- 制作工程：AI支援による画像生成と手動QA

ホンディはオモンガモンのマスコットです。このカスタムペットはOpenAIの公式キャラクター・公式配布物ではありません。
