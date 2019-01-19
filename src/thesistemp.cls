% Template for SWE reports

\ProvidesClass{thesistemp}[2019/01/19 Aaron Cesaro Thesis Template]
\NeedsTeXFormat{LaTeX2e}

\usepackage{graphicx}

% Custom variables
\newcommand{\subtitle}[1]{\def\@subtitle{#1}} % Optional
\newcommand{\creationdate}[1]{\def\@creationdate{#1}}
\newcommand{\redactedby}[1]{\def\@redactedby{#1}}

% Defaults for some variables
\def\@redactedby{--}
\def\@approvedby{--}

% Use article as base
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% A4 format
\usepackage{geometry}
\geometry{a4paper}

% Better typography
\usepackage[protrusion=true,expansion=true]{microtype}

% New page at each section
\usepackage{titlesec}
\newcommand{\sectionbreak}{\clearpage}

% Don't link last page in footer, no * without hyperref
\AtBeginDocument{
	\@ifpackageloaded{hyperref}{
		\newcommand{\unlinkedpageref}[1]{\pageref*{#1}}
	}{
		\newcommand{\unlinkedpageref}[1]{\pageref{#1}}
	}
}

% Header and footer
\usepackage{fancyhdr}
\usepackage{lastpage}
\pagestyle{fancy}
\fancyhf{}
% Header
\lhead{\leftmark}
% Footer
\rfoot{Pagina \thepage\ di \unlinkedpageref{LastPage}}
% Line above footer
\renewcommand{\footrulewidth}{0.4pt}

% Title page + document info
\newcommand{\titledivider}{\rule{\linewidth}{0.2mm}}
\renewcommand{\maketitle}{
	\begin{titlepage}
		\center
		\textsc{\LARGE Universit\`{a} degli Studi di Padova}\\[3mm]
		\textsc{\Large Dipartimento di Matematica “Tullio Levi-Civita”}\\
		\titledivider\\[3mm]
		\textsc{Scuola Di Scienze\\Corso Di Laurea In Informatica}\vfill
		\begin{center}
			\includegraphics[scale=.25]{/logo.png}\vspace*{150pt}
		\end{center}
		\textsc{\Large\@title}
		\ifcsname @subtitle\endcsname\textsc{\@subtitle}\\[3mm]\fi
	\end{titlepage}
	\begin{center}
		\textbf{\large Informazioni sul documento}\\[3mm]
		\begin{tabular}{r|l}
			\textbf{Titolo} & \@title \\
			\textbf{Creazione} & \@creationdate \\
			\textbf{Redazione} & \@redactedby \\
			\textbf{Email di riferimento} & aaron.cesaro@studenti.unipd.it \\
		\end{tabular}\\[1.5cm]
	\end{center}
}

% Hack around hyperref breakage
\AtBeginDocument{
	\label{CorrectFirstPageLabel}
	\def\fpage{\pageref{CorrectFirstPageLabel}}
}

% 4th section level, sub-paragraph
\titleclass{\subsubsubsection}{straight}[\subsection]
\newcounter{subsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
\renewcommand\theparagraph{\thesubsubsubsection.\arabic{paragraph}}
\titleformat{\subsubsubsection}
  {\normalfont\normalsize\bfseries}{\thesubsubsubsection}{1em}{}
\titlespacing*{\subsubsubsection}
{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\makeatletter
\renewcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\parindent}%
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\def\toclevel@subsubsubsection{4}
\def\toclevel@paragraph{5}
\def\toclevel@paragraph{6}
\def\l@subsubsubsection{\@dottedtocline{4}{7em}{4em}}
\def\l@paragraph{\@dottedtocline{5}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{6}{14em}{6em}}
\makeatother
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

% 5th section level
\titleclass{\subsubsubsubsection}{straight}[\subsection]
\newcounter{subsubsubsubsection}[subsubsection]
\renewcommand\thesubsubsubsubsection{\thesubsubsubsection.\arabic{subsubsubsubsection}}
\titleformat{\subsubsubsubsection}
  {\normalfont\normalsize\bfseries}{\thesubsubsubsubsection}{1em}{}
\titlespacing*{\subsubsubsubsection}
{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\makeatletter
\def\toclevel@subsubsubsubsection{5}
\def\l@subsubsubsubsection{\@dottedtocline{5}{7em}{4em}}
\makeatother
\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{5}