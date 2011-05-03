% This book class is based on the Tufte book class with minor
% modifications:
%
% 1. Remove large margins
% 2. Number parts and chapters
% 3. Add FEniCS book-specific commands

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{fenicsbooktest}[2010/10/21 v1.0 FEniCS book class]

\ExecuteOptions{a4paper,11pt,openright}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass{book}

\setcounter{secnumdepth}{1}

%------------------------------------------------------------------------------














%------------------------------------------------------------------------------
%\let\cleardoublepage\clearpage

\renewcommand{\baselinestretch}{1.2}


\newcommand{\plaintitle}{}%     plain-text-only title
\newcommand{\plainauthor}{}%    plain-text-only author
\newcommand{\plainpublisher}{}% plain-text-only publisher

\newcommand{\thanklesstitle}{}%     full title text minus \thanks{}
\newcommand{\thanklessauthor}{}%    full author text minus \thanks{}
\newcommand{\thanklesspublisher}{}% full publisher minus \thanks{}

\newcommand{\@publisher}{}% full publisher with \thanks{}
\newcommand{\publisher}[2][]{%
  \gdef\@publisher{#2}%
  \begingroup%
    \renewcommand{\thanks}[1]{}% swallow \thanks contents
    \protected@xdef\thanklesspublisher{#2}%
  \endgroup%
  \ifthenelse{\isempty{#1}}
    {\renewcommand{\plainpublisher}{\thanklesspublisher}}% use thankless publisher
    {\renewcommand{\plainpublisher}{#1}}% use provided plain-text publisher
}



\usepackage{hyperref}

\usepackage[osf,sc]{mathpazo}
\usepackage[scaled=0.90]{helvet}
\usepackage[scaled=0.85]{beramono}
\usepackage[T1]{fontenc}
\usepackage{textcomp}

\DeclareTextFontCommand{\textsmallcaps}{\scshape}

\RequirePackage{textcase} % provides \MakeTextUppercase and \MakeTextLowercase
\newcommand{\allcaps}[1]{\allcapsspacing{\MakeTextUppercase{#1}}}
\newcommand{\smallcaps}[1]{\smallcapsspacing{\MakeTextLowercase{#1}}}

%\usepackage{sectsty}
%\partfont{\mdseries\itshape}
%\chapterfont{\LARGE\mdseries\itshape}
%\sectionfont{\large\mdseries\itshape}
%\subsectionfont{\normalsize\mdseries\itshape}
%\subsubsectionfont{\normalsize\mdseries\itshape}
%\paragraphfont{\normalsize\mdseries\itshape}

\usepackage[a4paper,layoutsize={193mm,260mm},layoutoffset={8mm},total={157mm,235mm},%
            outer=18mm,top=13mm,includeheadfoot=true,showcrop]{geometry}

\usepackage{titlesec}
\titleformat{\chapter}{\normalfont\Huge\itshape}{\thechapter}{1.0em}{}
\titleformat*{\section}{\itshape\large}
\titleformat*{\subsection}{\itshape}
\titleformat*{\subsubsection}{\itshape}
\titleformat*{\paragraph}{\itshape}

\usepackage{titletoc}


\usepackage{fancyhdr}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\pagestyle{fancy}
\fancyhf{}
%\fancyhead[LE]{\thepage\quad\smallcaps{\newlinetospace{\plaintitle}}}
\fancyhead[RO,LE]{\bfseries The performance of new graduates}

% FEniCS book stuff
\input{layout/fenics.defs}



\usepackage{fancyhdr}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE]{\thepage\quad \leftmark}
\fancyhead[RO]{\rightmark -- \@title \quad\thepage}% chapter title


\usepackage{sidecap}

% Only show the chapter titles in the table of contents
\setcounter{tocdepth}{0}

% End of file
\endinput
