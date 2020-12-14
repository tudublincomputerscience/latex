% slides.cls

\NeedsTeXFormat{LaTeX2e}

\def\fileversion{0.1.0}
\def\filedate{2019/02/04}

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
\usetheme{Boadilla}
\usecolortheme{dolphin}

% Set a sensible input encoding
\RequirePackage[utf8]{inputenc}
\RequirePackage[official]{eurosym}

\ifpaper
	\usepackage{pgfpages}
	\pgfpagesuselayout{4 on 1}[a4paper,border shrink=5mm,landscape]
	\setbeamercolor{background canvas}{bg=black!2}
\fi

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

% Style Customization
\definecolor{themeprimary}{HTML}{004C6C}
\definecolor{themesecondary}{HTML}{00a9b7}
\definecolor{themetertiary}{HTML}{486884}
\definecolor{themequaternary}{HTML}{6C5600}
\definecolor{themegrey}{HTML}{001b26}
\definecolor{backgroundgrey}{HTML}{f8f8f8}

\setbeamercolor{background canvas}{bg=backgroundgrey}

\setbeamercolor{normal text}{fg=themegrey}
\setbeamercolor{palette primary}{bg=themetertiary}
\setbeamercolor{palette secondary}{bg=themesecondary}
\setbeamercolor{palette tertiary}{bg=themeprimary}
\setbeamercolor{palette quaternary}{bg=themequaternary,fg=white}

\setbeamercolor{palette sidebar primary}{bg=themetertiary}
\setbeamercolor{palette sidebar secondary}{bg=themesecondary}
\setbeamercolor{palette sidebar tertiary}{bg=themeprimary}
\setbeamercolor{palette sidebar quaternary}{bg=themequaternary,fg=white}

\setbeamercolor{date in head/foot}{fg=white}
\setbeamercolor{titlelike}{fg=themeprimary}

\setbeamerfont{alerted text}{series=\bfseries}
\setbeamercolor{alerted text}{fg=themequaternary}

\setbeamercolor{block title}{bg=themeprimary, fg=themesecondary!20!white}
\setbeamercolor{block body}{bg=themeprimary!20!white, fg=themesecondary!30!black}

\setbeamercolor{section number projected}{bg=themetertiary,fg=white}
\setbeamercolor{subsection number projected}{bg=themegrey,fg=white}
\setbeamerfont{section in toc}{series=\bfseries}
\setbeamercolor{section in toc}{fg=themeprimary}
\setbeamercolor{subsection in toc}{fg=black}

% Pretty code highlighting
\RequirePackage{minted}

\useoutertheme{miniframes}


% Summary of Sections and Subsections at each section break
\AtBeginSection[]
{
	\begin{frame}
		\frametitle{Table of Contents}
		\tableofcontents[
		currentsection,
		currentsubsection,
		subsectionstyle=hide/hide/hide
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
	\begin{frame}<presentation>[plain]}
	{\end{frame}
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

\endinput