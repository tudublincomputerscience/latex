% slides.cls

\NeedsTeXFormat{LaTeX2e}

\def\fileversion{0.1.0}
\def\filedate{2019/02/06}

\ProvidesClass{tudslides}[\filedate\space Version \fileversion\space by
Jack O'Neill]



\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

\makeatletter
	\newif\ifpaper
		\@ifclasswith{beamer}{handout}{\papertrue}{\paperfalse}
\makeatother

% Document class based on Beamer
\LoadClass{beamer}
\usetheme{dublin}


\RequirePackage{xfp}
\PassOptionsToPackage{british,calc,useregional=numeric,datesep=/}{datetime2}
\RequirePackage{datetime2}

% Set a sensible input encoding and load up euro symbol
\RequirePackage[utf8]{inputenc}
\RequirePackage[official]{eurosym}

% Print slides 4 to a page if doing handouts
\ifpaper
	\usepackage{pgfpages}
	\pgfpagesuselayout{4 on 1}[a4paper,border shrink=5mm,landscape]
	\setbeamercolor{background canvas}{bg=black!2}
\fi

% Include TUDublin Logo
\titlegraphic{%
	\includegraphics[width=2cm]{TUDublinLogo}%
}

% Enable notes for use with the Mac `presentation` App
\RequirePackage{pdfcomment}
\newcommand{\pdfnote}[1]{\marginnote{\pdfcomment[icon=note]{#1}}}

% Break URLs where necessary
\PassOptionsToPackage{hyphens}{url}\RequirePackage{hyperref}
\definecolor{links}{HTML}{2A1B81}
\hypersetup{colorlinks,linkcolor=,urlcolor=links}

% Pretty code highlighting
\RequirePackage{minted}

% Summary of Sections and Subsections at each section break
\AtBeginSection[]
{
	\begin{frame}
		\frametitle{Table of Contents}
		\tableofcontents[
		currentsection,
		currentsubsection,
		subsectionstyle=show/show/hide
		]
	\end{frame}
}

\newcommand{\slideheading}{\frametitle{\insertsubsectionhead}\framesubtitle{\insertsectionhead}}

% Show frame title and section title in header
\newenvironment{defaultframe}
{
	\begin{frame}<presentation>
		\slideheading}
	{\end{frame}
}

% Show frame title and section title in header
\newenvironment{emptyframe}
{
	\begin{frame}<presentation>[plain]}%
	{\end{frame}%
}

% Minted environment #1 is the type of code used
\newenvironment{code}[1]
{%
	\VerbatimEnvironment
	\centering
	\small
	\begin{minted}[breaklines,frame=single,tabsize=2]{#1}%
	}
	{%
	\end{minted}%
}

% Larger skip between paragraphs
\setlength{\parskip}{2em}

\newcommand*{\lecturedate}{2020-01-01}

\newcount\myoffset
\newcommand{\calculatelecturedate}[1]{%
	\DTMsavedate{foo}{\lecturedate}%
	\DTMsaveddateoffsettojulianday{foo}{\fpeval{(#1-1)*7}}{\myoffset}%
	\DTMsavejulianday{foo}{\number\myoffset}%
	\DTMusedate{foo}%
}

% https://tex.stackexchange.com/questions/23487/how-can-i-get-roman-numerals-in-text
\newcommand{\RNum}[1]{\uppercase\expandafter{\romannumeral #1\relax}}

\DTMnewdatestyle{ddmmroman}{%
	\renewcommand*{\DTMdisplaydate}[4]{%
		\DTMtwodigits{##3}\DTMsep{yearmonth}\RNum{##2}}%
	\renewcommand*{\DTMDisplaydate}{\DTMdisplaydate}%
}

\newcommand{\LectureTitlePage}{%
	\setcounter{framenumber}{0}
	\global\def\inserttitle{{Lecture \insertlecturenumber: \insertlecture}}
	\global\def\insertshorttitle{{Lecture \insertlecturenumber: \insertlecture}}
	\global\def\insertdate{\calculatelecturedate\insertlecturenumber}
	\global\def\insertshortdate{\calculatelecturedate\insertlecturenumber}
	\titlepage
}

\AtBeginLecture{
	\begin{frame}
		\LectureTitlePage
	\end{frame}
}

\endinput