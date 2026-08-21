<div align="center">

# HKUST(GZ) Thesis LaTeX Template

**香港科技大学（广州）研究型研究生学位论文非官方 LaTeX 模板**

An unofficial LaTeX thesis template for research postgraduates at HKUST(GZ).

[![LaTeX](https://img.shields.io/badge/LaTeX-XeLaTeX-008080?logo=latex&logoColor=white)](https://www.latex-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/luckyfan-cs/Template-of-HKUST-GZ-Thesis)](https://github.com/luckyfan-cs/Template-of-HKUST-GZ-Thesis/issues)
[![Last commit](https://img.shields.io/github/last-commit/luckyfan-cs/Template-of-HKUST-GZ-Thesis)](https://github.com/luckyfan-cs/Template-of-HKUST-GZ-Thesis/commits/main)

</div>

> [!IMPORTANT]
> 本项目由社区维护，并非 HKUST(GZ) 官方发布或认证的模板。学校要求可能随时间更新；提交论文前，请务必以 [HKUST(GZ) 最新的 Guidelines on Thesis Preparation](https://fytgs.hkust-gz.edu.cn/rpg-handbook/guidelines-on-thesis-preparation) 以及所在 Hub、Thrust/Division 和导师的要求为准。

> [!WARNING]
> 当前 `ustthesis.cls` 源自较早版本的 HKUST 模板，尚未完成对最新版 HKUST(GZ) 规定的逐项验证。以 2025 年 4 月版官方指南为例，其要求的前置页顺序为“标题页、摘要、授权页、签字页、致谢、目录、图表目录”，而本仓库当前示例的顺序并不完全一致。正式提交前请逐页核对并按学校要求调整。

## 模板特点

- 使用 `ustthesis` 文档类，包含标题页、授权页、签字页、致谢、目录、摘要、正文、参考文献和附录等常用结构。
- 以 `XeLaTeX` 排版，支持中英文混排。
- 使用 `natbib` 与 BibTeX 管理参考文献，示例采用 `IEEEtran` 样式。
- 章节拆分为独立 `.tex` 文件，便于维护长篇论文。
- 内置 VS Code + LaTeX Workshop 配置，可通过 `latexmk` 自动完成多轮编译。

## 快速开始

### 1. 准备环境

建议安装较新的 [TeX Live](https://www.tug.org/texlive/)、[MacTeX](https://www.tug.org/mactex/) 或 [MiKTeX](https://miktex.org/)，并确认以下命令可用：

```bash
xelatex --version
latexmk --version
bibtex --version
```

模板优先使用中文字体 `AR PL UMing HK`，不可用时会依次回退到 TeX 发行版通常自带的 `FandolSong-Regular` 和 macOS 的 `Songti SC`。如需指定其他字体，可在 `000_thesis.tex` 中修改：

```tex
\IfFontExistsTF{AR PL UMing HK}{
  \setCJKmainfont{AR PL UMing HK}
}{
  \IfFontExistsTF{FandolSong-Regular}{
    \setCJKmainfont{FandolSong-Regular}
  }{
    \setCJKmainfont[Script=Default]{Songti SC}
  }
}
```

### 2. 获取模板

```bash
git clone https://github.com/luckyfan-cs/Template-of-HKUST-GZ-Thesis.git
cd Template-of-HKUST-GZ-Thesis
```

也可以从 GitHub 页面选择 **Code → Download ZIP**，解压后使用。

### 3. 填写论文信息

打开 `000_thesis.tex`，修改标题、作者、学位、培养单位、导师和答辩日期等字段：

```tex
\title{Your Thesis Title}
\author{Your Name}
\degree{\MPhil}       % 可选：\AM、\MSc、\MPhil、\PhD
\stage{\Thesis}
\subject{Your Thrust}
\department{Your Thrust}
\advisor{Prof. A}
\depthead{Prof. C}
\defencedate{2026}{8}{21}
```

随后将摘要、致谢和各章节内容写入对应的 `.tex` 文件，并在 `references.bib` 中维护参考文献。

### 4. 编译

推荐使用 `latexmk`，它会自动处理 XeLaTeX、BibTeX 和所需的重复编译：

```bash
latexmk -xelatex 000_thesis.tex
```

生成文件为 `000_thesis.pdf`。清理中间文件：

```bash
latexmk -c
```

如果没有安装 `latexmk`，可手动执行：

```bash
xelatex 000_thesis.tex
bibtex 000_thesis
xelatex 000_thesis.tex
xelatex 000_thesis.tex
```

## VS Code 使用方式

1. 安装 [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 扩展。
2. 使用 VS Code 打开整个仓库目录，而不是只打开单个 `.tex` 文件。
3. 打开并保存 `000_thesis.tex`；仓库内置的配置会使用 **latexmk (XeLaTeX)** 自动构建。
4. 从 LaTeX Workshop 面板预览生成的 PDF。

## Overleaf 使用方式

1. 下载仓库 ZIP，并在 Overleaf 中选择 **New Project → Upload Project**。
2. 将 **Main document** 设置为 `000_thesis.tex`。
3. 将编译器设置为 **XeLaTeX**。
4. 若提示找不到 CJK 字体，请将 `\setCJKmainfont` 改为 Overleaf 可用的中文字体。

## 项目结构

| 文件 | 作用 |
| --- | --- |
| `000_thesis.tex` | 主文档、宏包配置和论文元数据 |
| `00I_dedication.tex` | 献词（可选，默认未启用） |
| `00II_acknowledgments.tex` | 致谢 |
| `00III_abstract.tex` | 英文摘要 |
| `01_introduction.tex` | 引言 |
| `02_guidelines.tex` | 学校论文准备指南摘录（默认未启用） |
| `02_scientific_background_literature_review.tex` | 科学背景与文献综述 |
| `03_methods.tex` | 研究方法 |
| `05_conclusion.tex` | 结论 |
| `A_tips.tex` | 附录示例（默认未启用） |
| `references.bib` | BibTeX 参考文献数据库 |
| `ustthesis.cls` | 论文文档类 |
| `.vscode/settings.json` | LaTeX Workshop 构建配置 |

新增章节时，在主文档中加入：

```tex
\chapter{Chapter Title}
\label{chp:chapter-title}
\input{chapter_file}
```

## 提交前检查

模板只能帮助排版，不能替代学校的最终审核。根据 HKUST(GZ) 的论文准备指南，提交前至少应确认：

- 前置页的内容与顺序符合当前规定；
- 英文摘要不超过 300 词；
- 所有字体均已嵌入 PDF；
- 图片分辨率满足打印和屏幕阅读要求；
- 论文正文为单个、未加密的 PDF，并按提交系统要求另行处理授权页和签字页；
- 标题、姓名、学位、培养单位、签字和日期准确无误。

## 常见问题

<details>
<summary><strong>编译时报 “The font ... cannot be found”</strong></summary>

安装缺失字体，或将 `\setCJKmainfont` 的字体名称替换为系统已安装的中文字体。可使用 `fc-list`（Linux）或字体册（macOS）查看字体名称。

</details>

<details>
<summary><strong>参考文献没有出现或编号没有更新</strong></summary>

优先执行 `latexmk -C` 清理旧缓存，再运行 `latexmk -xelatex 000_thesis.tex`。同时确认正文中已经引用对应的 BibTeX 条目。

</details>

<details>
<summary><strong>学校要求与模板输出不一致</strong></summary>

以学校最新规定为准。请先在 [Issues](https://github.com/luckyfan-cs/Template-of-HKUST-GZ-Thesis/issues) 搜索是否已有讨论；若没有，请附上官方要求链接、最小复现代码、TeX 发行版版本和编译日志后新建 issue。

</details>

## 反馈与贡献

欢迎通过 [GitHub Issues](https://github.com/luckyfan-cs/Template-of-HKUST-GZ-Thesis/issues) 报告问题或提出建议，也欢迎提交 Pull Request。反馈编译问题时，请尽量提供：

- 操作系统及 TeX Live / MacTeX / MiKTeX 版本；
- 完整编译命令；
- 可复现问题的最小示例；
- 日志中第一处报错及其上下文。

## License

本项目采用 [MIT License](LICENSE)。学校名称、标识及相关商标的权利归其各自权利人所有。
