% This book class is based on the Tufte book class with minor
% modifications:
%
% 1. Remove large margins
% 2. Number parts and chapters
% 3. Add FEniCS book-specific commands

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{fenicsbooktest}[2010/10/21 v1.0 FEniCS book class]

\ExecuteOptions{a4paper,11pt}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass{book}

\renewcommand{\baselinestretch}{1.2}

\usepackage{hyperref}
\usepackage{mathpazo}

\usepackage{sectsty}
\partfont{\mdseries\itshape}
\chapterfont{\LARGE\mdseries\itshape}
\sectionfont{\large\mdseries\itshape}
\subsectionfont{\normalsize\mdseries\itshape}
\subsubsectionfont{\normalsize\mdseries\itshape}
\paragraphfont{\normalsize\mdseries\itshape}

% FEniCS book stuff
\input{layout/fenics.defs}

\usepackage[a4paper,layoutsize={193mm,260mm},layoutoffset={8mm},total={157mm,235mm},%
            outer=18mm,top=13mm,includeheadfoot=true,showcrop]{geometry}


\usepackage{sidecap}

% Only show the chapter titles in the table of contents
\setcounter{tocdepth}{0}

% End of file
\endinput
