# Hondi — 济州犬 Codex Pet

[한국어](README.md) · [English](README.en.md) · [日本語](README.ja.md) · [简体中文](README.zh-CN.md)

![Hondi 动画预览](assets/previews/all-states.gif)

Hondi 是一款面向 Codex/ChatGPT Work 的自定义宠物，角色原型来自济州岛宠物友好旅行服务 **Omeong Gameong（오멍가멍）** 的济州犬吉祥物。

角色只在嘴巴周围保留轻微的深灰褐色毛发。静止时，Hondi 会坐着轻轻打瞌睡；拖动移动时，它会叼着一颗橘子行走。

> 本项目为独立制作的自定义宠物，并非 OpenAI 官方角色或官方发行内容。

## 主要动画

| 场景 | 动画 |
|---|---|
| 静止 | 坐着慢慢闭眼并轻轻点头打瞌睡 |
| 向右拖动 | 叼着橘子向屏幕右侧行走 |
| 向左拖动 | 保持相同步态和橘子，向屏幕左侧行走 |
| 等待输入 | 轻轻抬起一只前爪等待用户操作 |
| 工作中 | 保持坐姿，通过视线和前爪的小动作表现专注 |
| 检查结果 | 身体和头部轻微倾斜，查看完成内容 |
| 视线跟随 | 包含上下左右在内的16个方向 |

### 定制动作预览

| 坐着打瞌睡 | 叼着橘子行走 |
|---|---|
| ![打瞌睡](assets/previews/idle-dozing.gif) | ![橘子行走](assets/previews/drag-right-tangerine.gif) |

## 仓库结构

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

## 使用方法

1. 下载[最终精灵图](assets/hondi-spritesheet-v2.png)。
2. 在支持自定义宠物上传的 Codex/ChatGPT Work 环境中选择该 PNG。
3. 上传前请勿修改图片尺寸或透明背景。
4. 可使用 `assets/previews` 中的 GIF 或 MP4 检查动画。

## 验证结果

- 通过 v2 结构验证
- 73个必需帧全部存在
- 15个未使用单元格完全透明
- 跳跃高度34px，落地基线误差0px
- 视线方向中心最大偏移4px
- 通过最终 Pets 预检

详细结果包含在 [validation.json](docs/validation.json) 和 [quality-report.json](docs/quality-report.json) 中。

## 许可

目前未对角色和图片素材授予开源许可。再发布、商业使用和二次创作均需获得权利人的许可。详情请参阅 [LICENSE.md](LICENSE.md)。

## 鸣谢

- 角色：Hondi
- 项目：Omeong Gameong
- 概念：济州岛宠物友好旅行
- 制作流程：AI辅助生成与人工质量检查
