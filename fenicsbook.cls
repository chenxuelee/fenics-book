% Basic setup
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fenicsbook}
\LoadClass[a4paper,10pt,twoside,openright]{book}

% Specify geometry for T2 book format
\usepackage[%
  a4paper,
  layoutsize={193mm,260mm}, % trim size
  text={157mm,216mm},       % text area
  hmargin={18mm,18mm},      % inner and outer margins
  top=20mm,                 % top margin including header should be 13mm + 8mm = 21mm
                            % but when measured it comes out as 22mm so we take 20mm
  headsep=4.5mm,            % adjust top header to 13mm by trial and error
  layouthoffset={8.5mm},    % center on 210 x 297 A4 paper: 0.5*(210 - 193)
  layoutvoffset={18.5mm},   % center on 210 x 297 A4 paper: 0.5*(297 - 260)
  showcrop                  % show crop of page
  ]{geometry}

% Section numbering depth
\setcounter{secnumdepth}{2}

% TOC related setting
\setcounter{tocdepth}{0} % Only show the chapter titles in the table of contents
\renewcommand\bibname{References} % Name of references section

% Make empty page really empty
\usepackage{emptypage}

% Font selection
\usepackage[sc]{mathpazo}
\usepackage[scaled=0.90]{helvet}
\usepackage[scaled=0.85]{beramono}
\usepackage[T1]{fontenc}
\usepackage{textcomp}
\DeclareTextFontCommand{\textsmallcaps}{\scshape}
\RequirePackage{textcase} % provides \MakeTextUppercase and \MakeTextLowercase
\newcommand{\allcaps}[1]{\allcapsspacing{\MakeTextUppercase{#1}}}
\newcommand{\smallcaps}[1]{\smallcapsspacing{\MakeTextLowercase{#1}}}

% Formatting of chapter, sections, etc
\usepackage{titlesec}
\titleformat{\chapter}{\normalfont\huge\itshape}{\thechapter}{1.0em}{}
\titleformat*{\section}{\itshape\large}
\titleformat*{\subsection}{\itshape}
\titleformat*{\subsubsection}{\itshape}
\titleformat*{\paragraph}{\itshape}

% Typeset URLs
\usepackage{url}

% Misc packages
\usepackage{multicol}
\usepackage{makeidx}

% Bibliography packages
\usepackage{natbib}

% Font and math packages
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{amsbsy}
\usepackage{amscd}
\usepackage{stmaryrd}

% Code environments
\usepackage{codehighlight}

% Needed for new Inkscape LaTeX figure import
\usepackage{import}

% Graphics packages
\usepackage{graphicx}

% Subfigure messes up references to figures and tables
\usepackage[caption=false]{subfig}

% Table packages
\usepackage{booktabs}
\usepackage{longtable}
\usepackage{array}

% Typesetting packages
\usepackage{microtype}
\usepackage{xspace}

% Small line spacing stretch
\usepackage{setspace}
\setstretch{1.05}

% Side captions
\usepackage{floatrow}
\DeclareFloatVCode{grayruleabove}%
{{\color{gray}\par\rule\hsize{2.8pt}\vskip4pt\par}}
\DeclareFloatVCode{grayrulebelow}%
{{\color{gray}\par\vskip4pt\rule\hsize{2.8pt}}}
\floatsetup[figure]{%
  capposition=beside,
  capbesidewidth=0.32\textwidth,
  facing=yes,
  capbesideposition={top,inside},
  %rowprecode=grayruleabove,rowpostcode=grayrulebelow},
  floatwidth=0.65\textwidth,
  }
\usepackage[font={rm,small}]{caption}

% Algorithm packages
\usepackage{algorithm}
\usepackage{algorithmicx}
\usepackage{algpseudocode}

% Comments package
\usepackage[colorinlistoftodos,textwidth=4cm,shadow]{todonotes}

% Colors
\usepackage{color}
\definecolor{Grey}{rgb}{0.5, 0.5, 0.5}
\definecolor{DarkGrey}{rgb}{0.2, 0.2, 0.2}
\newcommand{\grey}[1]{\textcolor{Grey}{#1}}

% Hyperlinks
\usepackage{hyperref}
\hypersetup{colorlinks,
            citecolor=blue,
            filecolor=blue,
            linkcolor=blue,
            urlcolor=blue}

% Environments
\newtheorem{example}{Example}[chapter]
\newtheorem{definition}{Definition}[chapter]
\newtheorem{proposition}{Proposition}[section]
\newtheorem{remark}{Remark}[section]

% Macro for printing month and year
\newcommand{\monthyear}{%
  \ifcase\month\or January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or
  December\fi\space\number\year
}

% Settings for graphics
\setkeys{Gin}{width=\linewidth,totalheight=\textheight,keepaspectratio}
\newcommand{\largefig}{0.63\textwidth}     % for normal large figure
\newcommand{\smallfig}{0.4\textwidth}      % for normal small figure
\newcommand{\twofigs}{0.3\textwidth}       % for 1/2 of normal figure
\newcommand{\threefigs}{0.2\textwidth}     % for 1/3 of normal figure
\newcommand{\fourfigs}{0.2\textwidth}      % for 1/4 of normal figure
\newcommand{\fullfig}{0.9\textwidth}       % for 90% full width figure
\newcommand{\twofigsfull}{0.45\textwidth}  % for 1/2 of full width figure
\newcommand{\threefigsfull}{0.3\textwidth} % for 1/3 of full width figure

% Typesetting macros
\newcommand{\blankpage}{\newpage\hbox{}\thispagestyle{empty}\newpage}
\newcommand{\hairsp}{\hspace{1pt}}
\newcommand{\ie}{\textit{i.\hairsp{}e.}\xspace}
\newcommand{\eg}{\textit{e.\hairsp{}g.}\xspace}
\newcommand{\tab}{\hspace*{2em}}
\newcommand{\emp}[1]{\texttt{#1}}

% Math notation macros
\newcommand{\dx}{\, \mathrm{d}x}
\newcommand{\dX}{\, \mathrm{d}X}
\newcommand{\dxhat}{\, \mathrm{d}\hat{x}}
\newcommand{\ds}{\, \mathrm{d}s}
\newcommand{\dS}{\, \mathrm{d}S}
\newcommand{\dt}{\, \mathrm{d}t}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Hdiv}{H(\mathrm{div})}
\newcommand{\Hcurl}{H(\mathrm{curl})}
\newcommand{\Rset}{\ensuremath{\mathbb{R}}}
\newcommand{\inner}[2]{\langle #1, #2 \rangle}
\newcommand{\renni}[2]{\langle #2, #1 \rangle}
\newcommand{\deltat}{\Delta t}
\newcommand{\bm}[1]{#1}
\newcommand{\e}{\mathrm{e}}
\newcommand{\brac}[1]{\left( {#1} \right)}
\newcommand{\bracc}[1]{\left\{ {#1} \right\}}
\newcommand{\foralls}{\forall\,}
\newcommand{\mesh}{\mathcal{T}_h}
\newcommand{\Poly}[1]{\mathcal{P}_{#1}}
\newcommand{\CiarletSpace}{\mathcal{V}}
\newcommand{\avg}[1]{\langle {#1} \rangle}
\newcommand{\jump}[1]{\llbracket {#1} \rrbracket}
\newcommand{\jumpn}[1]{\llbracket {#1} \rrbracket_n}
\newcommand{\cgone}{$\mathrm{cG}(1)$}

% Math operatorsg
\DeclareMathOperator{\Div}{div}
\DeclareMathOperator{\Grad}{grad}

% Difficult names
\newcommand{\nedelec}{N\'ed\'elec}
\newcommand{\babuska}{Babu\v{s}ka}

% Misc macros
\newcommand{\apriori}{\emph{a~priori}}
\newcommand{\apost}{\emph{a~posteriori}}

% Package names
\newcommand{\packagefont}[1]{{#1}\xspace}
\newcommand{\fenics}{\packagefont{FEniCS}}
\newcommand{\dolfin}{\packagefont{DOLFIN}}
\newcommand{\ufl}{\packagefont{UFL}}
\newcommand{\fiat}{\packagefont{FIAT}}
\newcommand{\ferari}{\packagefont{FErari}}
\newcommand{\sfc}{\packagefont{SFC}}
\newcommand{\ufc}{\packagefont{UFC}}
\newcommand{\ffc}{\packagefont{FFC}}
\newcommand{\viper}{\packagefont{Viper}}
\newcommand{\swig}{\packagefont{SWIG}}
\newcommand{\petsc}{\packagefont{PETSc}}
\newcommand{\slepc}{\packagefont{SLEPc}}
\newcommand{\hypre}{\packagefont{Hypre}}
\newcommand{\trilinos}{\packagefont{Trilinos}}
\newcommand{\vtk}{\packagefont{VTK}}
\newcommand{\itk}{\packagefont{ITK}}
\newcommand{\ginac}{\packagefont{GiNaC}}
\newcommand{\sympy}{\packagefont{SymPy}}
\newcommand{\numpy}{\packagefont{NumPy}}
\newcommand{\scipy}{\packagefont{SciPy}}
\newcommand{\instant}{\packagefont{Instant}}

% Book macros
\newcommand{\fenicsinput}[1]{\input{chapters/#1/chapter}}
\newcommand{\fenicschapter}[4]{\chapter{#1} \vspace{-1cm} \large By #3 \normalsize \vspace{1.5cm}\label{chap:#4}}
\newcommand{\fenicsfig}[3]{\def\svgwidth{#3}\import{chapters/#1/pdf/}{#2.pdf_tex}}
\newcommand{\fenicsauthor}[5]{
  \noindent
  \begin{minipage}{\linewidth}
    \noindent \textbf{#1} \\ % \texttt{<#2>} \\
    #5 \vspace{0.2cm} \\
    \noindent #3 \vspace{0.2cm} \\
    \small \textit{#4} \normalsize \vspace{0.5cm}
\end{minipage}}
\newcommand{\authornote}[1]{\todo[inline, color=blue!40]{\underline{Author note:} #1}}
\newcommand{\editornote}[1]{\todo[inline, color=red!40]{\underline{Editor note:} #1}}

% Macro for Ciarlet FEM definition which is used in at least two chapters
\newcommand{\femdefinition}{
\index{finite element definition}
\index{Ciarlet finite element definition}
\begin{itemize}
\item
  the domain $T$ is a bounded, closed subset of $\R^d$ (for $d = 1,
  2, 3, \dots$) with nonempty interior and piecewise smooth
  boundary;
\item
  the space $\CiarletSpace = \CiarletSpace(T)$ is a finite
  dimensional function space on $T$ of dimension $n$;
\item
  the set of degrees of freedom (nodes) $\mathcal{L} = \{\ell_1,
  \ell_2,\ldots, \ell_{n}\}$ is a basis for the dual space
  $\CiarletSpace'$; that is, the space of bounded linear functionals
  on $\CiarletSpace$.
\end{itemize}}
