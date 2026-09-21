# 🍊 你好，我是 Hondi！

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [简体中文](README.zh-CN.md)

**叼着橘子走几步，困了就打个小盹。我是 오멍가멍 的济州犬吉祥物。**

![叼着橘子散步、坐着打盹的 Hondi](assets/previews/all-states.gif)

Hondi 是 **Omeong Gameong（오멍가멍）** 的吉祥物。这是一款面向携宠济州旅行的应用。圆圆的脸、颜色稍深的嘴巴，还有嘴里叼着的小橘子，都是认出 Hondi 的小线索。

现在，也可以让 Hondi 待在你的屏幕一角啦。安静时坐着打盹，挪动位置时就叼着橘子迈开小步。这份仓库提供了将 Hondi 安装为 Codex 自定义宠物所需的文件和说明。

**[🐾 去 Omeong Gameong 找 Hondi 玩 →](https://omeong-gameong-web.vercel.app)**

## 🐾 下一站，和毛孩子一起去济州

一起吹吹海风，并肩走过陌生的小路。如果你正想着带毛孩子去济州旅行，欢迎来 **Omeong Gameong** 看看。

喜欢这只叼橘子的小狗？也来逛逛它原本的家吧。🍊

**[打开 Omeong Gameong 网页版 →](https://omeong-gameong-web.vercel.app)**

## 🍊 Hondi 的小日常

| 什么时候 | Hondi 在做什么 |
|---|---|
| 安静待着 | 坐下来，迷迷糊糊地打个盹 |
| 向左或向右拖动 | 叼紧橘子，迈着小步走 |
| 打招呼 | 举起前爪，向你挥一挥 |
| 等待时 | 微微抬起前爪，乖乖等着 |
| 专注时 | 坐着，轻轻动动眼睛和前爪 |
| 仔细看时 | 探探身子，歪歪脑袋 |
| 环顾四周 | 将视线转向16个方向 |

| 就眯一小会儿 💤 | 橘子也要一起走 🍊 |
|---|---|
| ![打盹的 Hondi](assets/previews/idle-dozing.gif) | ![叼着橘子走路的 Hondi](assets/previews/drag-right-tangerine.gif) |

## 🏡 一条命令安装

需要支持自定义宠物v2的Codex桌面应用。

**macOS / Linux shell**

```sh
curl -fsSL https://raw.githubusercontent.com/qkrwlgus89/hondi-codex-pet/main/install.sh | sh
```

**Windows PowerShell**

```powershell
& ([scriptblock]::Create((Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/qkrwlgus89/hondi-codex-pet/main/install.ps1).Content))
```

安装后打开 **设置 → Pets → 刷新 → 혼디 (Hondi)**。如未显示，请重启应用。

<details>
<summary>安装位置、重新安装与卸载</summary>

安装位置为 `~/.codex/pets/hondi`，设置了 `CODEX_HOME` 时使用该目录。安装前验证图片SHA-256；已有的不同版本备份至Codex主目录下的 `pet-backups`。无需Git、Python或管理员权限。Shell脚本需要curl和shasum/sha256sum。

从本地项目安装：`sh install.sh --from .`；Windows：`./install.ps1 -SourceDir .`。卸载时先选择其他宠物，再仅删除安装位置的 `hondi` 文件夹。

IDE扩展不显示宠物。Linux上的显示取决于客户端是否支持v2。此v2图集不同于网页上传所需的v1格式。参见[官方说明](https://learn.chatgpt.com/docs/pets)。

</details>

<details>
<summary>精灵图规格与验证记录</summary>

## 仓库结构

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

## 精灵图规格

| 项目 | 参数 |
|---|---|
| 版本 | ChatGPT Pet Sprite v2 |
| 格式 | 透明 PNG |
| 图集尺寸 | 1536 × 2288 px |
| 网格 | 8列 × 11行 |
| 单元格尺寸 | 192 × 208 px |
| 必需帧数 | 73 |
| 基础状态 | 9种 |
| 视线方向 | 16个 |
| SHA-256 | `8b2de2ac6ef0e65a03557fb95b2c25ba4c2b8b04747e55f8827241367cf62ace` |

行顺序和播放时长请参阅 [SPRITE_SPEC.md](docs/SPRITE_SPEC.md)。

## 验证结果

- 通过 v2 结构验证
- 73个必需帧全部存在
- 15个未使用单元格完全透明
- 跳跃高度34px，落地基线误差0px
- 视线方向中心最大偏移4px
- 通过最终 Pets 预检

详细结果包含在 [validation.json](docs/validation.json) 和 [quality-report.json](docs/quality-report.json) 中。

</details>

## 许可

目前未对角色和图片素材授予开源许可。允许个人非商业Codex宠物安装使用及分享仓库链接。素材再发布、商业使用和二次创作均需获得权利人的许可。详情请参阅 [LICENSE.md](LICENSE.md)。

## 鸣谢

- 角色：Hondi
- 项目：Omeong Gameong
- 概念：济州岛宠物友好旅行
- 制作流程：AI辅助生成与人工质量检查

Hondi 是 Omeong Gameong 的吉祥物。本自定义宠物并非 OpenAI 官方角色或官方发行内容。
