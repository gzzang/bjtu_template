\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{bjtu_template}

\newif\ifbjtu@review\bjtu@reviewfalse %匿名送审，删除作者和导师名称、 致谢、resume中的个人简历部分，发表文章作者姓名，dataset数据修改
\DeclareOption{review}{\bjtu@reviewtrue}
\newif\ifbjtu@signature\bjtu@signaturefalse % 签字版本，插入扫描的授权书和独创性声明
\DeclareOption{signature}{\bjtu@signaturetrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[a4paper,UTF8,scheme=chinese, openright, twoside,fontset=windows,zihao=-4]{ctexbook}

\RequirePackage[inner=3.5cm, outer=2.5cm, top=3cm, bottom=2.5cm, headheight=13pt]{geometry} %headheight=13pt可以取消间距过窄的警告，showframe显示边框便于检查--gzzang_210411
\RequirePackage{fancyhdr}	%页眉页脚设置宏包
\RequirePackage{multirow}	%表格设置宏包，表格支持跨行
\RequirePackage{tabularx}	%我自己插入的宏包，排版固定宽度的表格，提供表格环境tabularx
\RequirePackage{booktabs} %表格设置宏包
\RequirePackage{mathtools,amsthm,amssymb,bm,mathrsfs} 
\RequirePackage{graphicx}	%插入图宏包
\RequirePackage{subfigure}	%插入图宏包
\RequirePackage{caption} %图表标题设置宏包 by gzang 230220
\RequirePackage[list=off]{bicaption} %图表标题设置宏包 by gzang 230220
\RequirePackage[numbers,sort&compress]{natbib}	%参考文献宏包包括cite宏包，所以不需要cite宏包
\RequirePackage{pdfpages}	%插入pdf页面
\RequirePackage{algorithm}	%插入算法描述
\RequirePackage{setspace}	%设置局部行距宏包(调目录用到--gzzang)
\RequirePackage{algpseudocode} % 用于算法 by gzang 201009
\RequirePackage{lastpage} % 自动计算总页数by gzang 201009
\RequirePackage{changepage} % 用于简历部分 
\RequirePackage{anyfontsize} % 
\RequirePackage[xetex,			% 生成有书签的pdf及其开关, 该宏包应放在所有宏包的最后, 防止宏包之间有冲突
bookmarksnumbered=true,	%把节标号放入书签
bookmarksopen=true,	%默认打开书签
colorlinks=true,	%为true时，目录没有红框
urlcolor=black,
linkcolor=black,
citecolor=black,
plainpages=false,
pdfstartview=FitH]{hyperref}
\RequirePackage{tikz}% foreach解决多章节不同文件的问题--gzzang_210414
\RequirePackage{xparse}
\RequirePackage{longtable}%跨页表格宏包 by gzang 230220

%字体修改 by gzang 230220
\ExplSyntaxOn
\ctex_set_font_size:Nnn \Huge  { 2 } { }
\ctex_set_font_size:Nnn \huge  {  -2 } { }
\ctex_set_font_size:Nnn \LARGE { 3 } { }
\ctex_set_font_size:Nnn \Large {  -3 } { }
\ctex_set_font_size:Nnn \large { 4 } { }
\ctex_set_font_size:Nnn \normalsize   {  -4 } { }
\ctex_set_font_size:Nnn \small        { 5 } { }
\ctex_set_font_size:Nnn \footnotesize {  -5 } { }
\ctex_set_font_size:Nnn \scriptsize   { 6 } { }
\ctex_set_font_size:Nnn \tiny  {  -6 } { }
\ExplSyntaxOff

\urlstyle{same}

%==============================================
% 模板中文设置
%==============================================
\AtEndOfClass{\input{bjtu_template.cfg}}

%==============================================
% 行距设置
%==============================================
\renewcommand{\baselinestretch}{1.38} % 刚好保证正文是20磅行距


%==============================================
% 关闭超宽警告
%==============================================
\hfuzz=\maxdimen
\tolerance=10000
\hbadness=10000

%==============================================
% 字体设置
%==============================================
% Set the mainfont
\setmainfont{Times New Roman}	%字体配置设置
% 允许宋体加粗--gzang_210406
\let\songti\relax % 清除songti旧定义
\newCJKfontfamily\songti{宋体}[AutoFakeBold] % 重定义songti并开启自动加粗
\let\heiti\relax % 清除songti旧定义
\newCJKfontfamily\heiti{黑体}[AutoFakeBold] % 重定义heiti并开启自动加粗

%==============================================
% 文献引用设置
%==============================================
%参考文献引用序号上标
\newcommand{\bjtucite}[1]{\textsuperscript{\cite{#1}}} % 统一命名

%==============================================
% 跳页设置
%==============================================
\def\cleardoublepage{\clearpage
	\ifodd
	\c@page
	\else
	\thispagestyle{empty}
	\hbox{}
	\newpage
	\fi
}


%==============================================
% 图表标号设置
%==============================================
% 定公式、图、表、算法的编号为"3-1"的形式，即分隔符由.变为短杠
% 把"--"变成了"-" by gzang 201006
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand\p@subfigure{\thefigure}
%双语标题设置 by gzang 230220
\captionsetup{format=plain,labelformat=simple,labelsep=space,justification=centering,font=small}
\captionsetup[figure][bi-first]{name=图}
\captionsetup[figure][bi-second]{name=Figure}
\captionsetup[table][bi-first]{name=表}
\captionsetup[table][bi-second]{name=Table}

%==============================================
% 页眉设置
%==============================================
% 删除页眉中每章的章节号 by gzang 201005
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}


%==============================================
% 目录设置
%==============================================
\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)

%==============================================
% 章节标题格式设置
%==============================================
\ctexset{chapter={
		name={,},	%将章序号去掉“第××章”
		number = \arabic{chapter},	%将章序号改为阿拉伯数字
		fixskip = true, % fixskip可以去除多余的间距，否则上面有空隙--gzzang_210411
		nameformat={\zihao{3}\mdseries\heiti}, % 默认是粗体，\mdseries调整为正常--gzzang_210411
		titleformat={\zihao{3}\mdseries\heiti},
		beforeskip={24pt}, 
		afterskip={18pt},
	}
}

\ctexset{section={
		format={\zihao{-3}\heiti},
		beforeskip={24pt},
		afterskip={18pt},
	}
}
% Title Settings at the subection Level
\ctexset{subsection={
		format={\zihao{4}\heiti},
		indent={0\ccwd},
		beforeskip={24pt},
		afterskip={18pt},
	}
}
% Title Settings at the subsubection Level
\ctexset{subsubsection={
		format={\zihao{-4}\heiti},
		indent={0\ccwd},
		beforeskip={12pt},
		afterskip={9pt},
	}
}

%==============================================
% 目录名称
%==============================================

%% CTeX Settings
% 名称：目录、表格索引、插图索引
\ctexset{contentsname={\bjtu@contentsname}}
\ctexset{listfigurename={\bjtu@listfigurename}}
\ctexset{listtablename={\bjtu@listtablename}}

%==============================================
% 定理环境
%==============================================
% 统一定理环境格式（可在此补充添加相关定理环境）--gzang_210406
\newtheoremstyle{new}% name
{}%      Space above, empty = `usual value'
{}%      Space below
{}% Body font
{}%         Indent amount (empty = no indent, \parindent = para indent)
{\bfseries}% Thm head font
{}%        Punctuation after thm head
{1em}% Space after thm head: \newline = linebreak
{}%         Thm head spec
\theoremstyle{new}
\newtheorem{prop}{\bjtu@label@prop~}[chapter]
\newtheorem{defn}{\bjtu@label@defn~}[chapter]
\renewcommand{\proofname}{\bf\bjtu@label@proof}


%==============================================
% 版式页眉页脚设置
%==============================================
%自定义一个针对封面二和致谢的无页眉版式
%修改新章首页的页眉页脚为与所有正文页的一样(main格式)
\fancypagestyle{plain}{
	\fancyhf{} %清空所有页眉页脚（ctexbook默认的页眉页脚格式）
	\fancyhead[CO]{\zihao{5}\leftmark} %奇数页
	\fancyhead[CE]{\zihao{5}\bjtu@label@firstcover@school\bjtu@label@firstcover@statement}
	\fancyfoot[C]{\zihao{-5}\thepage}
	\renewcommand{\headrulewidth}{0.5pt} % 页眉横线加粗到0.5 by gzang 201005
}
% 自定义所有正文页(非新章首页)页眉页脚
\fancypagestyle{main}{
	\fancyhf{} %清空所有页眉页脚（ctexbook默认的页眉页脚格式）
	\fancyhead[CO]{\zihao{5}\leftmark} %奇数页
	\fancyhead[CE]{\zihao{5}\bjtu@label@firstcover@school\bjtu@label@firstcover@statement}
	\fancyfoot[C]{\zihao{-5}\thepage}
	\renewcommand{\headrulewidth}{0.5pt} % 页眉横线加粗到0.5 by gzang 201005
}

\fancypagestyle{noheader}{
	\fancyhf{}
	\fancyhead{}
	\fancyfoot[C]{\zihao{-5}\thepage}
	\renewcommand{\headrulewidth}{0pt}
}


%==============================================
% 图表环境
%==============================================
\newenvironment{bjtutable}
{
	\begin{table}[!htbp]
	\small
}
{
	\end{table}
}

\newenvironment{bjtufigure}
{
	\begin{figure}[!htbp]
		\centering
	}
	{
	\end{figure}
}

%==============================================
% 自动引用
%==============================================
\def\chapterautorefname~#1\null{第~#1~章\null}
\def\sectionautorefname~#1\null{第~#1~节\null}
\def\subsectionautorefname~#1\null{第~#1~节\null}
\def\subsubsectionautorefname~#1\null{第~#1~节\null}
\def\figureautorefname~#1\null{图~#1~\null}
\def\subfigureautorefname~#1\null{图~#1~\null}
\def\tableautorefname~#1\null{表~#1~\null}
\def\equationautorefname~#1\null{公式~(#1)~\null}
\def\defnautorefname~#1\null{定理~#1~\null}
\def\propautorefname~#1\null{命题~#1~\null}
\def\algorithmautorefname~#1\null{算法~#1~\null}
\newcommand\bjturef[1]{\autoref{#1}}

\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\textbf{输入:}}
\renewcommand{\algorithmicensure}{\textbf{输出:}}

%==============================================
% id.tex中的中文设置
%==============================================
\newcommand\chinesetitlefirstline[1]{\def\bjtu@value@chinesetitlefirstline{#1}}
\newcommand\chinesetitlesecondline[1]{\def\bjtu@value@chinesetitlesecondline{#1}}
\newcommand\englishtitle[1]{\def\bjtu@value@englishtitle{#1}}
\newcommand\defenddate[1]{\def\bjtu@value@defenddate{#1}}
\newcommand\classification[1]{\def\bjtu@value@classification{#1}}
\newcommand\degree[1]{\def\bjtu@value@degree{#1}}
\newcommand\major[1]{\def\bjtu@value@major{#1}}
\newcommand\direction[1]{\def\bjtu@value@direction{#1}}

\newcommand\chinesekeyword[1]{\def\bjtu@value@chinesekeyword{#1}}
\newcommand\englishkeyword[1]{\def\bjtu@value@englishkeyword{#1}}

\newcommand\chairman[1]{\def\bjtu@value@chairman{#1}}
\newcommand\reviewers[1]{\def\bjtu@value@reviewers{#1}}
\newcommand\secretary[1]{\def\bjtu@value@secretary{#1}}

\ifbjtu@review %如果是匿名送审
\newcommand\authorname[1]{\def\bjtu@value@authorname{}}
\newcommand\advisor[1]{\def\bjtu@value@advisor{}}
\newcommand\studentnumber[1]{\def\bjtu@value@studentnumber{}}
\newcommand\jobtitle[1]{\def\bjtu@value@jobtitle{}}

\newcommand\secretonly[1]{\def\bjtu@value@secretonly{}}
\newcommand\yearonly[1]{\def\bjtu@value@yearonly{}}
\newcommand\schoollength[1]{\def\bjtu@value@schoollength{}}
\newcommand\reviewernames[1]{\def\bjtu@value@reviewernames{}}
\newcommand\chairmanname[1]{\def\bjtu@value@chairmanname{}}
\newcommand\membernames[1]{\def\bjtu@value@membernames{}}
\else %不是匿名送审
\newcommand\authorname[1]{\def\bjtu@value@authorname{#1}}
\newcommand\advisor[1]{\def\bjtu@value@advisor{#1}}
\newcommand\studentnumber[1]{\def\bjtu@value@studentnumber{#1}}
\newcommand\jobtitle[1]{\def\bjtu@value@jobtitle{#1}}

\newcommand\secretonly[1]{\def\bjtu@value@secretonly{#1}}
\newcommand\yearonly[1]{\def\bjtu@value@yearonly{#1}}
\newcommand\schoollength[1]{\def\bjtu@value@schoollength{#1}}
\newcommand\reviewernames[1]{\def\bjtu@value@reviewernames{#1}}
\newcommand\chairmanname[1]{\def\bjtu@value@chairmanname{#1}}
\newcommand\membernames[1]{\def\bjtu@value@membernames{#1}}
\fi


%==============================================
% 首页封面
%==============================================
\newcommand\makeFirstcover{
	\cleardoublepage
	\thispagestyle{empty}
	\begin{center}
		\vspace*{1.5cm}
		\begin{figure}[!htp]
			\centering
			\includegraphics[width=10.8cm]{bjtu_name.pdf}
		\end{figure}
		\vskip 10pt
		{\songti\bfseries\zihao{2}\ziju{0.36pt}\bjtu@label@firstcover@statement}%通过重新定义宋体加粗实现--gzzang_210406
		\vskip 2cm
		{\songti\zihao{-3}\bjtu@value@chinesetitlefirstline\par\bjtu@value@chinesetitlesecondline}
		\vskip 0.8cm
		{\songti\zihao{-3}\bjtu@value@englishtitle}
		\vfill
		{\songti\zihao{4}\bjtu@label@firstcover@author}{\songti\zihao{4}\bjtu@value@authorname}
		\vskip 0.7cm
		{\songti\zihao{4}\bjtu@label@firstcover@advisor}{\songti\zihao{4}\bjtu@value@advisor}
		\vskip 4cm
		{\songti\zihao{4}\bjtu@label@firstcover@school}
		\vskip 0.7cm
		{\songti\zihao{4}\bjtu@value@defenddate}
	\end{center}
	\cleardoublepage
}

%==============================================
% 授权书
%==============================================
\newcommand\makeDeclareAuthorization[1]{
	\cleardoublepage
	\thispagestyle{empty}

	\ifbjtu@signature	
	\includepdf[]{#1}
	\else
	\vspace*{0.2cm}
	\begin{center}
		{\bf\zihao{3} \bjtu@label@authorization}
	\end{center}
	\vskip 10pt
	{\par\zihao{-4}\bjtu@label@authorizationcontent\par}
	
	\vskip 3.8cm
	
	%作者和导师签名处
	\begin{minipage}[t]{0.9\textwidth}
		\begin{minipage}[t]{0.5\textwidth}
			\bjtu@label@authorsign
			\vskip 0.7cm
			\bjtu@label@signDate
		\end{minipage}\hfill
		\begin{minipage}[t]{0.4\textwidth}
			\bjtu@label@Supervisorsign
			\vskip 0.7cm
			\bjtu@label@signDate
		\end{minipage}
	\end{minipage}
	%空白页
	\fi
	\cleardoublepage
}

%==============================================
% 次页封面
%==============================================
\newcommand\makeSecondcover{
	\frontmatter % 罗马数字编号
	\cleardoublepage
	\thispagestyle{noheader} %封面二设置为只有页脚的版面
	
	{\songti\zihao{5}\noindent\bjtu@label@secondcover@schoolcode}
	\hfill
	{\songti\zihao{5}\bjtu@label@secondcover@secret}
	
	\vskip 1.4cm
	
	\begin{center}
		{\kaishu\zihao{0}\ziju{0.18pt}\bjtu@label@firstcover@school} % 在word模板中楷体显示不正常--gzang_210406
		\vskip 2ex
		{\songti\bfseries\zihao{2}\ziju{0.24pt}\bjtu@label@firstcover@statement}
		\vskip 2cm
		{\songti\zihao{-3}\bjtu@value@chinesetitlefirstline\par\bjtu@value@chinesetitlesecondline}
		\vskip 0.8cm
		{\songti\zihao{-3}\bjtu@value@englishtitle}
		
		\vskip 2cm
		% 如果平分文本宽度会导致超出边界，因此只能略为减小列距--gzzang_210407
		\begin{minipage}[t]{0.49\textwidth}
			\songti\zihao{4}\noindent
			\bjtu@label@secondcover@author\bjtu@value@authorname\vspace{0.64cm} \\	  	
			\bjtu@label@secondcover@advisor\bjtu@value@advisor\vspace{0.64cm} \\	  	
			\bjtu@label@secondcover@classification\bjtu@value@classification\vspace{0.64cm} \\	  	
			\bjtu@label@secondcover@major\bjtu@value@major
		\end{minipage}
		\hfill
		\begin{minipage}[t]{0.49\textwidth}
			\songti\zihao{4}\noindent
			\bjtu@label@secondcover@studentnumber\bjtu@value@studentnumber\vspace{0.64cm} \\	  	
			\bjtu@label@secondcover@jobtitle\bjtu@value@jobtitle\vspace{0.64cm} \\	  	
			\bjtu@label@secondcover@degree\bjtu@value@degree\vspace{0.64cm} \\	  	
			\bjtu@label@secondcover@direction\bjtu@value@direction
		\end{minipage}
		
		\vfill
		
		{\songti\zihao{4}\bjtu@label@firstcover@school}
		\vskip 0.6cm
		{\songti\zihao{4}\bjtu@value@defenddate}
	\end{center}

\cleardoublepage
}

%==============================================
% 学位委员会
%==============================================
\newcommand\genrows[2]{\@for\one:=#1\do{\expandafter#2\expandafter\genonerowbylist\expandafter{\one}}}
\NewDocumentCommand{\genonerowbylist}{ >{\SplitArgument{2}{;}} m}{\genonerow #1}
\NewDocumentCommand{\genonerow}{mmm}{ &\genvspace #1 \genvspacedown &\genvspace #2\genvspacedown &\genvspace #3\genvspacedown \\\hline}
\newcommand\genchairmanrow[1]{\genvspace \bjtu@label@chairman \genvspacedown\expandafter\genonerowbylist\expandafter{#1}}
\newcommand\genreviewerrows[1]{\genrows{#1}{\genvspace\bjtu@label@reviewer\genvspacedown}}
\newcommand\gensecretaryrow[1]{\genvspace \bjtu@label@secretary \genvspacedown\expandafter\genonerowbylist\expandafter{#1}}
\newcommand\genvspace{\vspace{-0.1cm}}
\newcommand\genvspacedown{\vspace{0.3cm}}
\newcommand\makeCommittee{
\ifbjtu@review\relax
\else
	\chapter*{\bjtu@label@committee}
	{
	\zihao{4}
	\begin{center}
		\begin{tabularx}{\textwidth}{|X<{\centering}|X<{\centering}|p{5.8cm}<{\centering}|X<{\centering}|}
			\hline
			\genvspace\bfseries{答辩委员会}\genvspacedown&\genvspace\bfseries{姓名}\genvspacedown&\genvspace\bfseries{工作单位}\genvspacedown&\genvspace\bfseries{职称}\genvspacedown\\\hline
			\genchairmanrow{\bjtu@value@chairman}
			\genreviewerrows{\bjtu@value@reviewers}
			\gensecretaryrow{\bjtu@value@secretary}
		\end{tabularx}
	\end{center}
	}
	\thispagestyle{noheader}
\fi
}
%==============================================
% 致谢
%==============================================
\renewenvironment{thanks}
{
	\chapter*{\bjtu@label@thanks} %*号设置，使得不出现在目录中
	\thispagestyle{noheader} %致谢设置为只有页脚的版面
} 

% 将致谢写为函数--gzzang_210407
\newcommand\makeThanks[1]{
	\pagestyle{noheader} % 设置致谢非首页的页眉页脚设置格式
%如果是匿名送审，不要致谢部分
\ifbjtu@review\relax
\else
\begin{thanks}
	\input{#1}
\end{thanks}
\fi
}

%==============================================
% 摘要
%==============================================
\newenvironment{abstract}{
	\chapter{\bjtu@label@abstract}
}

\newenvironment{englishabstract}{
	\chapter{\bjtu@label@englishabstract}
	}


% 将摘要写为函数--gzzang_210407
\newcommand\makeAbstract[2]{
	\pagestyle{main} % 设置所有非新章首页的页眉页脚设置格式
\begin{abstract}
	\input{#1}
	\par\vspace{2ex}\noindent{\songti\bfseries\zihao{-4}\bjtu@label@keywords} \bjtu@value@chinesekeyword % 把关键字参数化了 by gzang 201006
\end{abstract}

\begin{englishabstract}
	\input{#2}
	\par\vspace{2ex}\noindent{\songti\bfseries\zihao{-4}\bjtu@label@englishkeywords} \bjtu@value@englishkeyword
\end{englishabstract}
}

%===================================================
% 目录
%===================================================
\renewcommand\tableofcontents{%
	\cleardoublepage	%pdfbookmark前面必须有\cleardoublepage或者\clearpage
	\pdfbookmark[0]{\contentsname}{toc}	%目录中没有目录标签，但是书签有目录标签
	\begin{spacing}{1.5}	%设置目录局部行距，由1.6调整为1.5--gzzang_210408
		\chapter*{\contentsname}
		\markboth{\contentsname}{}
		\@starttoc{toc}%
	\end{spacing}  
}

\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}
% 按交大标准, 缩小目录中各级标题之间的缩进，使它们相隔一个字符距离，也就是12pt
\renewcommand*\l@chapter{\@dottedtocline{0}{0em}{2em}}%控制英文目录： 细点\@dottedtocline  粗点\@dottedtoclinebold
\renewcommand*\l@section{\@dottedtocline{1}{1.2em}{2.1em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2.5em}{3em}}
\def\@dotsep{1}	%缩小细点间距

\newcommand\makeTableofcontents{
	\tableofcontents % 目录
	\listoffigures % 图目录
	\listoftables % 表目录
}

%==============================================
% 正文
%==============================================
\newcommand\makeBody[1]{
	\mainmatter	% 阿拉伯数字编号
	\raggedbottom % 取消底部对其
	\foreach \x in {#1} {\input{\x}} % 解决多章节不同文件的问题--gzzang_210414
}


%==============================================
% 参考文献
%==============================================
\newcommand{\makeReferences}[1]{
	\zihao{5}	%参考文献采用五号字体
	\bibliographystyle{bjtu_template.bst}
	\cleardoublepage	%\addcontentsline命令包含的命令会因为换页造成目录的引用链接页码不一致，需要在此之前加入换页命令
	\phantomsection	%使用了hyperref宏包生成书签，还需要使用\plantomsection命令	
	\addcontentsline{toc}{chapter}{\bjtu@label@reference}	%参考文献加入到中文目录
	\setlength{\bibsep}{0.5ex}  % vertical spacing between references参考文献垂直间距减小
	\bibliography{#1}
}

%==============================================
% 附录
%==============================================
\newcommand{\makeAppendix}[1]{
	\appendix
	\renewcommand\theequation{\Alph{chapter}--\arabic{equation}}	
	\renewcommand\thefigure{\Alph{chapter}--\arabic{figure}}
	\renewcommand\thetable{\Alph{chapter}--\arabic{table}}
	\zihao{5}
	\foreach \x in {#1} {\input{\x}} 
}

%====================================================
% 个人简历和取得的成果
%====================================================
\newenvironment{ResumePublications}{
	\cleardoublepage
	\chapter{\bjtu@label@ResumePublications}
	\zihao{5}}

\newcounter{resumec} %自定义新计数器
\newenvironment{ResumeList}{%%%%%定义新环境
	\begin{list}{\chinese{resumec}、} %%标签格式
		{ %列表格式设置
			\usecounter{resumec}
			\setlength{\leftmargin}{2em}     % 左边界 \leftmargin =\itemindent + \labelwidth + \labelsep
			\setlength{\itemindent}{0em}     % 标号缩进量
			\setlength{\labelsep}{0em}       % 标号和列表项之间的距离,默认0.5em
			\setlength{\listparindent}{3em} 
			\setlength{\rightmargin}{0em}    % 右边界
			\setlength{\topsep}{0ex}         % 列表到上下文的垂直距离
			\setlength{\parsep}{0ex}         % 段落间距
			\setlength{\itemsep}{0ex}        % 标签间距
			\setlength{\listparindent}{0pt} % 段落缩进量
	}}
	{\end{list}}%%%%%

\newcounter{pubctr} %自定义新计数器
\newenvironment{PublicationsList}{%%%%%定义新环境
	\begin{list}{[\arabic{pubctr}]} %%标签格式
		{ %列表格式设置
			\usecounter{pubctr}
			\setlength{\leftmargin}{2em}     % 左边界 \leftmargin =\itemindent + \labelwidth + \labelsep
			\setlength{\itemindent}{0em}     % 标号缩进量
			\setlength{\labelsep}{0.5em}       % 标号和列表项之间的距离,默认0.5em
			\setlength{\rightmargin}{0em}    % 右边界
			\setlength{\topsep}{0ex}         % 列表到上下文的垂直距离
			\setlength{\parsep}{0ex}         % 段落间距
			\setlength{\itemsep}{0ex}        % 标签间距
			\setlength{\listparindent}{0pt} % 段落缩进量
	}}
	{\end{list}}


\newcommand{\makeResume}[2]
{
\backmatter	% 文后无编号部分
\ifbjtu@review %如果是匿名送审
\input{#2}
\else %不是匿名送审
\input{#1}
\fi
}
%==========================================================
% 答辩决议书
%==========================================================

\newenvironment{Resolution}{
	\cleardoublepage
	\chapter{\bjtu@label@resolution}
	\zihao{5}}

\newcommand\makeResolution[2]{%
\cleardoublepage
	\ifbjtu@signature
		\thispagestyle{empty}
		\includepdf[addtotoc={1,chapter,1,\bjtu@label@resolution,}]{#2}
	\else
	\input{#1}
\fi
}

%==========================================================
% 独创性声明
%==========================================================
\newcommand\makeDeclareOriginal[1]{%
	\cleardoublepage %要是在偶数页，则另起新页在奇数页
	\ifbjtu@signature
		\thispagestyle{empty}
		\includepdf[addtotoc={1,chapter,1,\bjtu@label@original,}]{#1}
	\else
	\chapter{\bjtu@label@original}%
	\vskip 10pt
	{\par\zihao{5}\bjtu@label@originalcontent\par}
	
	\vskip 1.8cm
	
	%作者签名处
	\begin{minipage}[t]{0.9\textwidth}
		\begin{minipage}[t]{0.5\textwidth}
			\zihao{5}\bjtu@label@authorsign
		\end{minipage}\hfill
		\begin{minipage}[t]{0.4\textwidth}
			\zihao{5}\bjtu@label@signDate
		\end{minipage}
	\end{minipage}
\fi
}

%==============================================
% 数据集
%==============================================
% \newcommand\getchairmanname{\expandafter\getname\expandafter{\bjtu@value@chairman}}
% \newcommand\getreviewernames{\expandafter\getnames\expandafter{\bjtu@value@reviewers}、}
% \newcommand\getnames[1]{\@for\one:=#1\do{\expandafter\getname\expandafter{\one}}}
% \NewDocumentCommand{\getname}{>{\SplitArgument{2}{;}}m}{\getfirst #1}
% \NewDocumentCommand{\getfirst}{mmm}{#1}

\newcommand\makeDataSet{
	\cleardoublepage
	\chapter{\bjtu@label@dataset}
	\markboth{\bjtu@label@dataset}{}
	\zihao{5}
	\begin{center}
		表1.1：数据集
		\begin{tabularx}{\textwidth}{|X|X|X|X|X|}\hline
			关键词*	&	密级*	&	中图分类号	&	UDC	&	论文资助	\\\hline
			{\bjtu@value@chinesekeyword}	&	公开	&  & 	&	{} \\\hline
			\multicolumn{2}{|l|}{学位授予单位名称*}	&	学位授予单位代码*	&	学位类别*	&	学位级别*	\\\hline
			\multicolumn{2}{|l|}{\bjtu@label@firstcover@school}	&	\bjtu@label@dataset@schoolcodeonly	&	\bjtu@value@classification	&	\bjtu@value@degree	\\\hline
			\multicolumn{2}{|l|}{论文题目*}	&	\multicolumn{2}{l|}{并列题目}	&	论文语种*	\\\hline
			\multicolumn{2}{|>{\hsize=2\hsize}X|}{\bjtu@value@chinesetitlefirstline\bjtu@value@chinesetitlesecondline}	&	\multicolumn{2}{l|}{}	&	中文	\\\hline
			作者姓名*	&	\multicolumn{2}{l|}{\bjtu@value@authorname}	&	学号*	&	\bjtu@value@studentnumber	\\\hline
			\multicolumn{2}{|l|}{培养单位名称*}	&	培养单位代码*	&	培养单位地址	&	邮编	\\\hline
			\multicolumn{2}{|l|}{\bjtu@label@firstcover@school}	&	\bjtu@label@dataset@schoolcodeonly	&	\bjtu@label@dataset@addressonly	&	\bjtu@label@dataset@postcodeonly	\\\hline
			\multicolumn{2}{|l|}{学科专业*}	&	研究方向*	&	学制*	&	学位授予年*	\\\hline
			\multicolumn{2}{|l|}{\bjtu@value@major}	&	{\bjtu@value@direction}	&	\bjtu@value@schoollength	&	{\bjtu@value@yearonly}	\\\hline
			论文提交日期*	&	\multicolumn{4}{l|}{\bjtu@value@defenddate}	\\\hline
			导师姓名*	&	\multicolumn{2}{l|}{\bjtu@value@advisor}	&	职称*	&	\bjtu@value@jobtitle	\\\hline
			评阅人	&	\multicolumn{2}{l|}{答辩委员会主席*}	&	\multicolumn{2}{l|}{答辩委员会成员}	\\\hline
			\bjtu@value@reviewernames	&	\multicolumn{2}{l|}{\bjtu@value@chairmanname}	&	\multicolumn{2}{l|}{\bjtu@value@membernames}\\\hline
			\multicolumn{5}{|l|}{电子版论文提交格式~~~~文本（\checkmark）  图像（ ） 视频（ ） 音频（ ） 多媒体（ ） 其他（ ）}	\\
			\multicolumn{5}{|l|}{推荐格式：application/msword；application/pdf}	\\\hline
			\multicolumn{2}{|l|}{电子版论文出版（发布）者}	&	\multicolumn{2}{l|}{电子版论文出版（发布）地}	&	权限声明	\\\hline
			\multicolumn{2}{|l|}{}	&	\multicolumn{2}{l|}{}	&		\\\hline
			论文总页数*	&	\multicolumn{4}{l|}{\pageref{LastPage}页}	\\\hline
			\multicolumn{5}{|l|}{共33项，其中带*为必填数据，为21项。}	\\\hline
		\end{tabularx}
	\end{center}
}

\endinput