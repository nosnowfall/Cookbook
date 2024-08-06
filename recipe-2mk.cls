% class for recipes for Too Many Cooks
% version 1.0 (2024-04-06)
% Author: Elijah S. Berger
% this defines layout and style for recipe tex files

% ID
\ProvidesClass{recipe-2mk}[2024/03/30]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[letterpaper]{article}
\RequirePackage{geometry}
\RequirePackage{enumitem}
\RequirePackage{setspace}
\RequirePackage[default]{sourcesanspro}
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{xfrac}
% Configure page
\pagestyle{empty}
\geometry{left=1.6cm, top=1.5cm, right=1.7cm, bottom=2cm, footskip=.5cm}

% doc info
\AtBeginDocument{%
    \hypersetup{%
    pdftitle={\@title},%
    pdfauthor={\@author}%
    }
}
% font commands
\newcommand{\sbseries}{\fontseries{sb}\selectfont}
\DeclareTextFontCommand{\textsb}{\sbseries}
\sffamily

% section commands and environs
\newcommand{\credits}[2]{\large\color{gray}\sbseries\textit{#1}, #2}

\newcommand{\makerecipetitle}[1][ \vspace*{-15pt}]{%
    \raggedright\setstretch{0.8}\textsb{%
    \rt{\@title}%
    \rst{#1}}%
    \rule{.1\textwidth}{2pt}\par
}
\newcommand{\rt}[1]{{\Huge#1\par}}
\newcommand{\rst}[1]{\vspace*{5pt}{\Large\textcolor{gray}{#1}\par}}

\newenvironment{ingredients}[1][Ingredients]{%
    \vspace*{\baselineskip}\onehalfspacing%
    \textsb{#1}\par\unskip\vspace*{-.5\baselineskip}%
    \raggedright\singlespacing%
    \setlength{\parskip}{\smallskipamount}
}{%
\par\unskip}
\newcommand{\ingredient}[2]{\hangindent=1em #1 \textcolor{gray}{ #2}\par}
\newcommand{\seasoning}[1]{\hangindent=1em \textcolor{gray}{#1}\par}

\newenvironment{headnotes}{\color{gray}}{\color{black}}

\newenvironment{directions}[1][Directions]{%
    \vspace*{1em}
    {\Large\sbseries{#1}}
    \begin{enumerate}[label=\textsb{\arabic*.}, wide, labelwidth=!, labelindent=0pt]\raggedright
}{%
    \end{enumerate}
}

