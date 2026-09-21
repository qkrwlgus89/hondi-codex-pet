# ホンディ — 済州犬 Codex Pet

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [简体中文](README.zh-CN.md)

![ホンディのアニメーションプレビュー](assets/previews/all-states.gif)

ホンディは、済州島のペット同伴旅行サービス **オモンガモン（Omeong Gameong）** の済州犬マスコットをもとに制作した、Codex/ChatGPT Work向けのカスタムペットです。

口元の毛だけを少し濃い灰褐色にしています。静止中は座ったまま、こっくりこっくり居眠りします。ドラッグで移動するときは、みかんを口にくわえて歩きます。

> 本プロジェクトは個人制作のカスタムペットです。OpenAIの公式キャラクターまたは公式配布物ではありません。

## 主なアニメーション

| 状況 | アニメーション |
|---|---|
| 待機 | 座ったまま目を閉じ、ゆっくり頭を下げて居眠り |
| 右へドラッグ | みかんを口にくわえて右へ歩行 |
| 左へドラッグ | 同じ歩行周期とみかんを保ったまま左へ移動 |
| 入力待ち | 前足を少し上げてユーザー入力を待つ |
| 作業中 | 座ったまま視線と前足を小さく動かして集中 |
| 確認 | 体と頭を傾けて結果をチェック |
| 視線追従 | 上下左右を含む16方向 |

### リクエストされた動作

| 座って居眠り | みかんをくわえて歩行 |
|---|---|
| ![居眠り](assets/previews/idle-dozing.gif) | ![みかん歩行](assets/previews/drag-right-tangerine.gif) |

## リポジトリ構成

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

## 使い方

1. [最終スプライトシート](assets/hondi-spritesheet-v2.png)をダウンロードします。
2. カスタムペットのアップロードに対応したCodex/ChatGPT Work環境でPNGを選択します。
3. アップロード前に画像サイズや透過情報を変更しないでください。
4. 動作確認には `assets/previews` 内のGIFまたはMP4を使用してください。

## 検証

- v2構造検証に合格
- 必須73フレームをすべて収録
- 未使用15セルは完全透過
- ジャンプ上昇34px、着地基準線の誤差0px
- 視線方向の中心移動は最大4px
- 最終Pets事前検証に合格

詳細は [validation.json](docs/validation.json) と [quality-report.json](docs/quality-report.json) に収録しています。

## ライセンス

キャラクターおよび画像素材には、現在オープンソースライセンスを付与していません。再配布、商用利用、二次制作には権利者の許可が必要です。詳細は [LICENSE.md](LICENSE.md) を確認してください。

## クレジット

- キャラクター：ホンディ
- プロジェクト：オモンガモン
- コンセプト：済州島のペット同伴旅行
- 制作工程：AI支援による画像生成と手動QA
