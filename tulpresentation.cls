%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tulpresentation}[2022/02/20 TUL presentation class version 2.0]
% Licence: CC BY

\newcommand{\TUL@baseclass}{beamer}

\DeclareOption{EN}{\PassOptionsToPackage{\CurrentOption}{EN}}

\DeclareOption{FS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FT}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FP}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{EF}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FA}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FM}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{FZS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{UZS}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{CXI}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{bwtitles}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{bw}{\PassOptionsToPackage{\CurrentOption}{tul}}
\DeclareOption{fonts}{\PassOptionsToPackage{\CurrentOption}{tul}}
\ProcessOptions\relax

\LoadClass[aspectratio=169,t]{\TUL@baseclass}
\let\logo\undefined
\RequirePackage[noheader]{tul}
\noTULfooter
\pagestyle{empty}
% \LoadClass[t]{\TUL@baseclass} %4:3

\usepackage{polyglossia}
\setdefaultlanguage{czech}
% \setdefaultlanguage{english}

% FONTY
\usefonttheme[onlymath]{serif} %sazba matematiky jako v article módu, ale malá mezera u mocnin

% sazba matematiky pomocí Fira Math fontu, ale...
% při aplikaci problém s definicí odsazení výčtových prostředí
% při aplikaci nutné upravit matematickou sazbu např. místo \bf dát \symbf
%\usepackage{amsmath} 
%\usepackage[mathrm=sym]{unicode-math}
%\setmathfont{Fira Math}

\setsansfont{Inter}[Mapping=tex-text,BoldFont={* Bold}]
\renewcommand{\verbatim@font}{\large\bf\ttfamily} %změna strojopisného fontu

\RequirePackage{graphbox}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{tikz}

% indikator, ktera fakulta/ustav je aktivni, hodnotu meni volby baliku
% jazykova verze
\newcommand{\CZthank}{D\v{e}kuji za pozornost}
\newcommand{\ENthank}{Thank you for your attention}
\newcommand{\TULthank}{\ifthenelse{\equal{\TUL@nguage}{EN}}{\ENthank}{\CZthank}}

% barvy TUL a jednotlivych fakult
\definecolor{tul}{HTML}{5948AD}
\definecolor{tulgray}{cmyk}{0, 0, 0, 0.8}
\definecolor{tulFS}{HTML}{888B95}
\definecolor{tulFT}{HTML}{924C14}
\definecolor{tulFP}{HTML}{0076D5}
\definecolor{tulEF}{HTML}{65A812}
\definecolor{tulFUA}{HTML}{006443}
\definecolor{tulFM}{HTML}{EA7603}
\definecolor{tulFZS}{HTML}{00B0BE}
\definecolor{tulCXI}{HTML}{C20019}

% volby baliku
\DeclareOption{EN}{\renewcommand{\TUL@nguage}{EN}}

\DeclareOption{FS}{\TUL@FS@setup}
\DeclareOption{FT}{\TUL@FT@setup}
\DeclareOption{FP}{\TUL@FP@setup}
\DeclareOption{EF}{\TUL@EF@setup}
\DeclareOption{FE}{\TUL@EF@setup}   % nedokumentovana, pro pouziti s databazemi obsahujicimi FE
\DeclareOption{FUA}{\TUL@FUA@setup}
\DeclareOption{FA}{\TUL@FUA@setup}  % pro zpetnou kompatibilitu
\DeclareOption{FM}{\TUL@FM@setup}
\DeclareOption{FZS}{\TUL@FZS@setup}
\DeclareOption{CXI}{\TUL@CXI@setup}

\DeclareOption{bwtitles}{
  \renewcommand{\titlecolor}{black}
}

\DeclareOption{bw}{
%  \renewcommand{\tulcolor}{black!80}
  \renewcommand{\tulcolor}{black}  
  \renewcommand{\titlecolor}{black}
}

\ProcessOptions
\mode<presentation>
{
  \useinnertheme{circles}

  % VNĚJŠÍ BAREVNÉ TÉMA NADPISŮ    
  \usecolortheme{whale}  

  % VNITŘNÍ BAREVNÉ TÉMA VÝČTŮ, BLOKŮ ATD.  
  \usecolortheme{orchid} 
  
  \setbeamercolor{title}{fg=white,bg=\tulcolor}
  \setbeamercolor{titlelike}{parent=structure}
  \setbeamercolor{frametitle}{fg=\tulcolor}
  \setbeamercolor{item}{fg=\tulcolor} 
  \setbeamertemplate{navigation symbols}{}% [vertical] % potlačení navigačních symbolů
  \setbeamercolor{block title}{fg=white,bg=\tulgray}%\tulcolor} % předefinování barvy zákl. bloku, při změně barvy na tulcolor by u některých součástí docházelo k problému v rozlišení alert/blok, např. CXI
  
  \setbeamercolor{caption name}{fg=\tulcolor}
  
  \setbeamercolor{bibliography entry author}{fg=black} % literatura černě a ne modře
  \setbeamercolor{bibliography entry title}{fg=black} % literatura černě a ne modře
  \setbeamercolor{bibliography entry journal}{fg=black} % literatura černě a ne modře
  \setbeamercolor{bibliography entry note}{fg=black} % literatura černě a ne modře
  \setbeamertemplate{bibliography item}{}
}

% tvorba loga a proporčního symbolu
\newlength{\mytextsize}
\makeatletter
\setlength{\mytextsize}{\f@size pt}
\makeatother

% Nastavení odsazení názvů slidů
\makeatletter
\setbeamertemplate{frametitle}{
  \ifbeamercolorempty[bg]{frametitle}{}{\nointerlineskip}%
  \@tempdima=\textwidth%
  \advance\@tempdima by\beamer@leftmargin%
  \advance\@tempdima by\beamer@rightmargin%

  \begin{beamercolorbox}[sep=20pt,wd=\the\@tempdima]{frametitle}
    \usebeamerfont{frametitle}%
    \vbox{}\vskip-1ex%
    \if@tempswa\else\csname beamer@ftecenter\endcsname\fi%
    
    % Název prezentace v záhlaví
    \begin{minipage}[t]{0.95\textwidth}
      {\footnotesize\inserttitle}
    \end{minipage}

    \vskip1.25ex%

    \strut\textbf{\LARGE\insertframetitle}\strut\par%
    \vskip-0.75ex%
    \if@tempswa\else\vskip-.3cm\fi
  \end{beamercolorbox}%
}
\makeatother

% Změna odsazení mezi odrážkami
\newenvironment{items}
  {\begin{itemize} \setlength{\itemsep}{0.75\baselineskip} \setlength{\parskip}{0pt} \setlength{\parsep}{0pt}}
  {\end{itemize}}

\newenvironment{subitems}
  {\vspace{0.5em}\begin{items}}
  {\end{items}}

\usepackage{changepage}

%============================================================================
% TITULNÍ STRANA
%============================================================================
\makeatletter
\newcommand{\TULtitleframe}{
  \setbeamercolor{background canvas}{bg=\tulcolor}
  \begin{frame}[plain]
  \begin{tikzpicture}[remember picture,overlay]
    \node[below right,inner sep=20pt] at (current page.north west){
      \begin{minipage}[t]{\textwidth}
        \scalebox{0.5}{\logotextwh}
      \end{minipage}
    };
    \node[below left,inner sep=10pt] at (current page.north east){
        \scalebox{0.5}{\symbolTULwh}
    };
    \node[below right,inner xsep=20pt,inner ysep=0.34\paperheight] at (current page.north west){ 
      \begin{minipage}[t]{0.95\textwidth}
        \color{white}
        {\bf \Huge \inserttitle}
          
        \vspace*{0.07\textheight}    
          
        {\Large\insertsubtitle}
      \end{minipage}   
    };    
    \node[above right,inner sep=20pt] at (current page.south west){  
      \begin{minipage}[t]{\textwidth}
        \color{white}
        \textbf{\insertauthor}
      
        \TULheader
        
        \vspace*{1em}
        
      \end{minipage}
    };
  \end{tikzpicture}
  \end{frame}
  
  % Set white background to next slides
  \setbeamercolor{background canvas}{bg=white}
  % Add logo to slides
  \addtobeamertemplate{background canvas}{
    \raisebox{20pt}[0pt][0pt]{%
      \hspace{20pt}\scalebox{0.4}{\logotext}%
    }%
  }
}
\makeatother

%===============================================================================
% NADPIS SEKCE
%===============================================================================
\makeatletter
\newcommand{\TULsectionframe}[2]{
  \setbeamercolor{background canvas}{bg=\tulcolor}
  \setbeamertemplate{background canvas}{\pagecolor{\tulcolor}}
  \begin{frame}[plain]
  \begin{tikzpicture}[remember picture,overlay]
    \node[below right,inner sep=20pt] at (current page.north west){
      \begin{minipage}[t]{\textwidth}
        \scalebox{0.5}{\logotextwh}
      \end{minipage}
    };
    \node[below left,inner sep=10pt] at (current page.north east){
        \scalebox{0.5}{\symbolTULwh}
    };
    \node[below right,inner xsep=20pt,inner ysep=0.34\paperheight] at (current page.north west){ 
      \begin{minipage}[t]{0.95\textwidth}
        \color{white}
        {\bf \Huge {#1}}
          
        \vspace*{0.07\textheight}    
          
        {\Large {#2}}
      \end{minipage}   
    };
  \end{tikzpicture}
  \end{frame}
  
  % Set white background to next slides
  \setbeamercolor{background canvas}{bg=white}
  % Add logo to slides
  \addtobeamertemplate{background canvas}{
    \raisebox{20pt}[0pt][0pt]{%
      \hspace{20pt}\scalebox{0.4}{\logotext}%
    }%
  }
}
\makeatother

%===============================================================================
% ÚPRAVA BARVY TEXTU V OBSAHU 
%===============================================================================
\setbeamercolor{section in toc}{fg=\tulcolor}
\setbeamercolor{subsection in toc}{fg=\tulcolor}
\setbeamercolor{subsubsection in toc}{fg=\tulcolor}
\setbeamercolor{button}{bg=\tulcolor}
\setbeamertemplate{subsection in toc}{%
  \leavevmode\leftskip=1em{\color{\tulcolor}$\bullet$}\hskip0.5em\inserttocsubsection\par
}
\setbeamertemplate{subsubsection in toc}{%
  \leavevmode\leftskip=2em{\color{\tulcolor}$\bullet$}\hskip0.5em\inserttocsubsubsection\par
}

\hypersetup{colorlinks,linkcolor=,citecolor=\tulcolor, urlcolor=\tulcolor}

%===============================================================================
% POSLEDNÍ STRANA PREZENTACE
%===============================================================================
\makeatletter
\def\TULendframe{
  \setbeamertemplate{background canvas}{\pagecolor{\tulcolor}}
  \begin{frame}[plain]
  \begin{tikzpicture}[remember picture,overlay]
    \node[below right,inner sep=20pt] at (current page.north west){
      \begin{minipage}[t]{\textwidth}
        \scalebox{0.5}{\logotextwh}
      \end{minipage}
    };
    \node[below left,inner sep=10pt] at (current page.north east){
        \scalebox{0.5}{\symbolTULwh}
    };
    \node[below right,inner xsep=20pt,inner ysep=0.34\paperheight] at (current page.north west){ 
      \begin{minipage}[t]{0.95\textwidth}
        \color{white}
        {\bf \Huge \TULthank}
          
        \vspace*{0.07\textheight}    
          
      \end{minipage}   
    };
  \end{tikzpicture}
  \end{frame}
  \setbeamercolor{background canvas}{bg=white}
}
\makeatother

\makeatletter
% Beamer margin
\setbeamersize
{
  text margin left=0.7cm, %1.35em  nastavení je optimální zarovnání bloků, číslovaných výčtů a obsahu s názvem slajdu, které přesahují hranici textového pole
  text margin right=0.7cm
}
%\setlength{\leftmargini}{1em}
\settowidth{\leftmargini}{\usebeamertemplate{itemize item}}
\addtolength{\leftmargini}{0.9em}%{\labelsep}
\settowidth{\leftmarginii}{\usebeamertemplate{itemize item}}
\addtolength{\leftmarginii}{\labelsep}
\settowidth{\leftmarginiii}{\usebeamertemplate{itemize item}}
\addtolength{\leftmarginiii}{\labelsep}
\makeatother

% Change standard block width
% \addtobeamertemplate{block begin}{%
%  \setlength{\textwidth}{0.8\textwidth}
% \leftskip=20ex% HERE YOU SET THE DESIRED LEFT MARGIN
% %%\addtolength{\textwidth}{-\leftskip}%
% }{}
% Change alert block width
\addtobeamertemplate{block alerted begin}{%
%  \leftskip=0.5\textwidth\usebeamerfont{block body}
 \centering%
  \setlength{\textwidth}{1.0\textwidth}
% \leftskip=20ex% HERE YOU SET THE DESIRED LEFT MARGIN
%  \addtolength{\textwidth}{-\leftskip}%
}{}
% Change example block width
\addtobeamertemplate{block example begin}{%
  \setlength{\textwidth}{1.0\textwidth}
}{}

\defbeamertemplate{section in toc}{my toc}{%
  \leavevmode{\Large\color{\tulcolor}$\bullet$} { \inserttocsection}}

\setbeamertemplate{sections/subsections in toc}[my toc]