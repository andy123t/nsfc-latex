%%
%% This is file `nsfc.cls',
%%
%% @author andy123t
%% @date 2026/01/06
%% @version v1.1
%% @address https://github.com/andy123t/nsfc
%% LaTeX thesis template for NSFC
%%

%---------- 定义的新的Class ----------
\ProvidesClass{nsfc}[2026/01/06 v1.1 国家自然科学基金申请书正文 LaTeX 类]
\NeedsTeXFormat{LaTeX2e}

\newif\ifnsfc@GP\nsfc@GPfalse
\newif\ifnsfc@YF\nsfc@YFfalse
%\newif\ifnsfc@fonts\nsfc@fontsfalse
\DeclareOption{GP}{\nsfc@GPtrue}
\DeclareOption{YF}{\nsfc@YFtrue}
%\DeclareOption{fonts}{\nsfc@fontstrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{GP}
\ProcessOptions\relax

%---------------------------------
% GP -- 面上项目
% YF -- 青年基金
% fonts -- 适合 Mac 或 Windows 系统, 需调用本地文件夹 fonts 中字体
%---------------------------------

%---------- 修改字体宏包Options ----------
\PassOptionsToPackage{no-math}{fontspec}

%---------- 加载基础类及字体配置 -----------
\LoadClass[UTF8,zihao=-4,punct,oneside,fontset=none]{ctexbook}
\setCJKmainfont[Path=fonts/,AutoFakeSlant=0.3,AutoFakeBold=3]{SimSun}%
\setCJKsansfont[Path=fonts/,AutoFakeSlant=0.3,AutoFakeBold=3]{KaiTi}%
\setCJKmonofont[Path=fonts/]{FangSong}%
\setCJKfamilyfont{zhkai}[%
  Path=fonts/,
  AutoFakeSlant=0.3,
  AutoFakeBold=3,
  ]{KaiTi.ttf}
\newfontfamily{\enkai}[%
  Path=fonts/,
  AutoFakeSlant=0.3,
  AutoFakeBold=3,
  ]{KaiTi.ttf}
\setCJKfamilyfont{zhsong}[%
  Path=fonts/,
  AutoFakeSlant=0.3,
  AutoFakeBold=3,
  ]{SimSun.ttf}
\newfontfamily{\ensong}[%
  Path=fonts/,
  AutoFakeSlant=0.3,
  AutoFakeBold=3,
  ]{SimSun.ttf}
\providecommand\songti{\CJKfamily{zhsong}}
\providecommand\kaishu{\CJKfamily{zhkai}}
\setmainfont{Times New Roman}
%\setmainfont[Path=fonts/]{Times New Roman}
\setsansfont[Scale=0.98]{Arial}

\@ifclasslater{ctexbook}{2017/01/01}{}{%
  \ClassError{nsfc}{ctex >= 2017/01/01 is required ...}{}%
}

%---------- 基础宏包 ----------
\RequirePackage{fontspec}
\RequirePackage{geometry}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{indentfirst}
\RequirePackage[figurewithin=none]{caption}
\RequirePackage[linktoc=none,bookmarks=false]{hyperref}

%---------- 设置超链接 ----------
\hypersetup{%
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  filecolor=black,
  urlcolor=black
}

%---------- 定义颜色 -----------
\definecolor{NSFCblue}{RGB}{0,112,192}
\definecolor{NSFCred}{RGB}{255,0,0}

%---------- 设置不同的参数 ----------
\ifnsfc@GP
\geometry{a4paper,left=3.05cm,right=3.05cm,top=2.72cm,bottom=2.54cm}%
\fi
\ifnsfc@YF
\geometry{a4paper,left=3.2cm,right=3.2cm,top=2.72cm,bottom=2.54cm}%
\fi

%---------- 符号设置 ----------
\defaultfontfeatures{Mapping=tex-text} % 连字符
\xeCJKsetwidth{，。；}{1em} % 符号宽度
\xeCJKsetwidth{、}{1.1em} % 符号宽度
\xeCJKsetwidth{（）}{1em} % 符号宽度

%----- 控制汉字和英文之间的间距, 应该设置成弹性间距 -----
\xeCJKsetup{CJKecglue={\hskip 4pt plus 0.08\baselineskip}}

%----- 字距 ------
\ziju{0.005}

%---------- 中文段落缩进和行距 ----------
\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{4pt plus 1pt minus 1pt}
\linespread{1.35}  % 设置行距

%---------- 取消章节自动分页 ----------
\renewcommand{\chapter}{%
  \if@openright\else\clearpage\fi % remove forced page break
  \secdef\@chapter\@schapter
}

%---------- 设置章节编号深度和目录深度 ----------
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

%---------- 定义章节标题格式 ------------
% chapter title
\titleformat{\chapter}
  {\linespread{1.3}\color{NSFCblue}\kaishu\enkai\zihao{4}} % format
  {\kern2.1em\textbf{（\chinese{chapter}）}} % name/number
  {0em} % spacing between number and title
  {}
% section title
\titleformat{\section}[block]
  {\linespread{1.3}\color{NSFCblue}\kaishu\enkai\zihao{4}} % format
  {\kern2.0em\arabic{section}．} % number
  {0em}
  {}
% subsubsection title
\titleformat{\subsection}[hang]
  {\linespread{1.0}\zihao{-4}}
  {\hspace{2.1em}\sffamily(\arabic{subsection})}
  {0.6em}
  {\bfseries}

% NSFC note
\newcommand{\NSFCnote}[1]{%
\begingroup
\linespread{1.3}\color{NSFCblue}\kaishu\enkai\zihao{4}\selectfont%
#1\par
\endgroup
}

%---------- 设置章节标题间距 ----------
\titlespacing*{\chapter}{0pt}{4pt plus 1pt minus 1pt}{4pt plus 1pt minus 1pt}
\titlespacing*{\section}{0pt}{6pt plus 1pt minus 1pt}{2pt plus 1pt minus 1pt}
\titlespacing*{\subsection}{0pt}{8pt plus 1pt minus 1pt}{2pt plus 1pt minus 1pt}

%---------- 设置图片和表格样式 ----------
\captionsetup[figure]{position=bottom,skip={6pt},name={图}}
\captionsetup[table]{position=top,skip={3pt},name={表}}
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}
\setlength{\floatsep}{10pt plus 2pt minus 2pt}
\setlength{\intextsep}{10pt plus 2pt minus 2pt}

%---------- 设置公式, 图和表编号 ----------
\renewcommand{\theequation}{\arabic{equation}}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}

%---------- 重新设置图表autoref ----------
\renewcommand{\figureautorefname}{图}
\renewcommand{\tableautorefname}{表}

%---------- 设置页码为空 ----------
\pagestyle{empty}

%---------- 数学公式设置 ----------
\allowdisplaybreaks

%---------- 设置公式间距 ----------
\AtBeginDocument{%
  \setlength{\abovedisplayskip}{6pt plus 2pt minus 2pt}
  \setlength{\belowdisplayskip}{6pt plus 2pt minus 2pt}
  \setlength{\abovedisplayshortskip}{3pt plus 1pt minus 1pt}
  \setlength{\belowdisplayshortskip}{3pt plus 1pt minus 1pt}
}

%---------- 设置图形路径 ----------
\graphicspath{{figures/}}

%---------- 标题页命令 ----------
\renewcommand{\maketitle}{%
\centerline{\kaishu\enkai\fontsize{16pt}{22pt}\selectfont\qquad\textbf{报告正文（{\addfontfeatures{LetterSpace=1}2026}版）}}
\vspace{5pt}
}

% End of file `nfsc.cls'.
