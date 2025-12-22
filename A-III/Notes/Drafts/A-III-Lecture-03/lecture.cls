
\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{lecture}
\LoadClass[openany, twoside, a5paper, 10pt]{extbook}
\RequirePackage[T2A]{fontenc}
\usepackage[utf8x]{inputenc}
\usepackage[english, russian]{babel}

%
%	Pictures: vector vs. raster
%

% \DeclareOption{UP}{\RequirePackage[pdftex]{graphicx}}

\newif\ifmypackage@usePics
\DeclareOption{usePics}{\mypackage@usePicstrue}
\DeclareOption{noUsePics}{\mypackage@usePicsfalse}

\ExecuteOptions{noUsePics} % default is noUsePics

\ProcessOptions\relax

\ifmypackage@usePics
  \RequirePackage[pdftex]{graphicx}
\fi

%
%	Text formatting
%
\usepackage{indentfirst}
\usepackage{setspace}
\usepackage{mdwlist}
\usepackage{float}
\usepackage{url}

\frenchspacing
\sloppy

%
%	Math
%
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{amscd}
\usepackage{bm}
% ---------------------------------------------------------------------------
%	a5paper: 148 x 210
%	print area: 110 x 180
%	top = bottom = (210 - 180) / 2 = 15
%	left = right = (148 - 110) / 2 = 19
\special{papersize=148mm,210mm}
\usepackage[%
   left=1.9cm,% 1.9
    top=1.5cm,% 1.5 
    right=1.9cm,% 1.9
    bottom=1.5cm,% 1.5
    headsep=0.2cm,%
    footskip=0.5cm,%
    includehead,%
    includefoot]{geometry}
\textwidth 110mm
\textheight 170mm
\linespread{1.25}
%
%	Macros
%
\newcommand{\Booktitle}{Лекция №3, осень 2025}

%
%	Fancyheader settings
%
\usepackage{fancyhdr}
\lhead{}
\rhead{}
\lfoot{}
\cfoot{\thepage}
\rfoot{}
\pagestyle{fancy}
\fancyhead[C]{\Booktitle}

%
%	Misc new commands
%
\providecommand{\No}{\textnumero} % The No command is undefined in TexLive 2013+

\newcommand{\ENGLISH}[1]{#1}%\selectlanguage{english}{#1}\selectlanguage{russian}}
\newcommand*{\HM}[1]{#1\nobreak\discretionary{}{\hbox{\(\mathsurround=0pt #1\)}}{}}

\newcommand{\processlist}[3][\relax]{% 
  \def\listfinish{#1}% 
  \long\def\listact{#2}% 
  \processnext#3\listfinish} 

\newcommand{\processnext}[1]{% 
  \ifx\listfinish#1\empty\else\listact{#1}\expandafter\processnext\fi} 

%
%	Theorems
% 

\theoremstyle{plain}
\newtheorem{theorem}{Теорема}
\newtheorem{lemma}{Лемма}

\theoremstyle{plain}
\newtheorem{definition}{Определение}

%
%	commands
%
\newcommand{\opr}{\textbf{Опр.~}}

\newcommand{\CurTitle}{TITLE}

\newcommand\Title[1]{
    \par
    \begin{centering}
        \smallskip
        {
            \large
            \textbf{\textsc{#1}}\nopagebreak \\
        }
    \end{centering}
    \nopagebreak
    \renewcommand{\CurTitle}{#1}
    \@afterheading 
    \smallskip
    \nopagebreak 
}
\makeatother

%
%
%


\makeatletter
\newcommand\Info[3]{
	\begin{center}
	\vspace{1ex}
	\par {\textit{\textbf{#1}}\\
	\vspace{1ex}
	{ \textit{#2}}\\
	\vspace{1ex}
	{ \textit{#3}}}\\
    \end{center}
    \addtocontents{toc}{\noindent\small\hspace{-0.4cm}\textit{#1}}
    \addcontentsline{toc}{OurOwnSection}{
					\small
					\CurTitle
				}
    \nopagebreak
}
\newcounter{local}


%
%		Literature and so
%
\makeatletter
\newcommand{\References}{
    \smallskip
    \nopagebreak
    \centerline{\textbf{Литература}}
    \nopagebreak
    \smallskip
    \@afterheading
}
\makeatother

\newenvironment{references}{\References\begin{enumerate*}}{\end{enumerate*}}
\newcommand{\Source}{\item}


\makeatother
\makeatother

%
%
%
\newenvironment{lect}{\setcounter{theorem}{0}\setcounter{definition}{0}\setcounter{lemma}{0}\setcounter{equation}{0}\chead[\rightmark]{\Booktitle}\begin{document}}{\stop}
