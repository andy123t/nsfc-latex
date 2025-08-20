# nsfc-latex: NSFC 申请书正文 LaTeX 模板 (非官方)

本模板为非官方的国家自然科学基金申请书 LaTeX 模板，根据 2025 年官方 Word 模板制作，适用于面上项目和青年科学基金的撰写。模板的制作参考了多位老师的模板，包括 [NSFC-LaTex](https://github.com/MCG-NKU/NSFC-LaTex)、[iNSFC](https://github.com/YimianDai/iNSFC) 和 [nsfc](https://github.com/fylimas/nsfc)，并在此基础上进行了适当的调整与优化。

- **main-GP.tex** 面上项目申请书正文 LaTeX 模板
- **main-YF.tex** 青年基金申请书正文 LaTeX 模板

**声明：** 请仔细比较本模板与官方 Word 模板转换 PDF 后的格式差异，然后决定是否使用此模板。

本模板推荐安装 **texlive** 发行版，并且需要 **XeLaTeX** 编译运行！

```tex
\documentclass[YF]{nsfc}
% GP -- 面上项目
% YF -- 青年基金
% fonts -- 使用本地文件夹字体
```

注：缺省 fonts 仅适用于 Windows 系统，使用 fonts 可支持 Mac 系统 (参见 字体说明.txt)。

在线 LaTeX 编辑可以使用 [TeXPage](https://www.texpage.com/)，设置字体 (`fontset=windows`) ，XeLaTeX 编译运行，推荐使用。

欢迎提出意见或建议。
