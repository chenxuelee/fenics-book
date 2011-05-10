% This book class is based on the Tufte book class with minor
% modifications:
%
% 1. Remove large margins
% 2. Number parts and chapters
% 3. Add FEniCS book-specific commands

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{fenicsbooktest}[2010/10/21 v1.0 FEniCS book class]

\ExecuteOptions{a4paper,10pt,openright}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass{book}

\usepackage[a4paper,layoutsize={193mm,260mm},layoutoffset={8mm},total={157mm,235mm},%
            outer=18mm,top=13mm,includeheadfoot=true,headheight=25pt,showcrop]{geometry}

\setcounter{secnumdepth}{1}

%------------------------------------------------------------------------------




%------------------------------------------------------------------------------
\usepackage{emptypage}


\renewcommand{\baselinestretch}{1.2}



% FEniCS book stuff
\input{layout/fenicstest.defs}


\usepackage{hyperref}
\hypersetup{colorlinks}


\RequirePackage{fancyhdr}

\renewcommand\frontmatter{%
  \cleardoublepage%
  \@mainmatterfalse%
  \pagenumbering{arabic}%
  \pagestyle{plain}%
  \fancyhf{}%
  \fancyhead[LE,RO]{\thepage}
}


\renewcommand\mainmatter{%
  \cleardoublepage%
  \@mainmattertrue%
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \pagestyle{fancy}
  \fancyhf{}%
  %\renewcommand{\chaptermark}[1]{\markboth{##1}{}}%
  \fancyhead[LE]{\thepage\quad\rightmark}% book title
  \fancyhead[RO]{\leftmark\quad\thepage}% chapter title
  %\fancyhead[LE]{\thepage\quad\smallcaps{\newlinetospace{\plaintitle}}}% book title
  %\fancyhead[RO]{\smallcaps{\newlinetospace{\leftmark}}\quad\thepage}% chapter title
}



\usepackage[osf,sc]{mathpazo}
\usepackage[scaled=0.90]{helvet}
\usepackage[scaled=0.85]{beramono}
\usepackage[T1]{fontenc}
\usepackage{textcomp}

\DeclareTextFontCommand{\textsmallcaps}{\scshape}

\RequirePackage{textcase} % provides \MakeTextUppercase and \MakeTextLowercase
\newcommand{\allcaps}[1]{\allcapsspacing{\MakeTextUppercase{#1}}}
\newcommand{\smallcaps}[1]{\smallcapsspacing{\MakeTextLowercase{#1}}}


\usepackage{titlesec}
\titleformat{\chapter}{\normalfont\huge\itshape}{\thechapter}{1.0em}{}
\titleformat*{\section}{\itshape\large}
\titleformat*{\subsection}{\itshape}
\titleformat*{\subsubsection}{\itshape}
\titleformat*{\paragraph}{\itshape}

%\usepackage{titletoc}


%\usepackage{fancyhdr}
%\renewcommand{\headrulewidth}{0pt}
%\renewcommand{\footrulewidth}{0pt}
%\pagestyle{fancy}
%\fancyhf{}
%\fancyhead[LE]{\thepage\quad\smallcaps{\newlinetospace{\plaintitle}}}
%\fancyhead[RO,LE]{\bfseries The performance of new graduates}




%\usepackage{fancyhdr}
%\renewcommand{\headrulewidth}{0pt}
%\renewcommand{\footrulewidth}{0pt}
%\pagestyle{fancy}
%\fancyhf{}
%\fancyhead[LE]{\thepage\quad \leftmark}
%\fancyhead[RO]{\rightmark -- \@title \quad\thepage}% chapter title


\usepackage{sidecap}

% Only show the chapter titles in the table of contents
\setcounter{tocdepth}{0}

% End of file
\endinput
