%==============================================================================
% Document class with SETREM standards
% $Id: setrem.cls,v 1.0.0 08/08/2019 $
% Edited by: LARCC - Laboratory of Advanced Research on Cloud Computing
% Website: http://larcc.setrem.com.br
% Email: larcc@setrem.com.br
%==============================================================================
\NeedsTeXFormat{LaTeX2e}

\newcommand{\iiu@novodoc}[1]{%
		\DeclareOption{#1}{\AtEndOfClass{\input{template/#1.def}}}
}%
\iiu@novodoc{diss}
\DeclareOption{english}{\@englishtrue\OptionNotUsed}\newif\if@english
\DeclareOption{oneside}{\AtEndOfClass{\@twosidefalse}\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\special{papersize=210mm,297mm}



%\LoadClass[12pt,a4paper,twoside]{report}
\LoadClass[12pt,onecolumn,titlepage,a4paper,openright,final]{report}[2007/10/19]

%the last appearing between [] will be set the default language
\RequirePackage[english,brazilian]{babel}

\input{template/english.babel}
\input{template/brazilian.babel}
\if@english
    \selectlanguage{english}
    \AtBeginDocument{\selectlanguage{english}}
\fi
\RequirePackage{lastpage}
\RequirePackage{indentfirst}
\RequirePackage{template/setremdefs}
\usepackage[round,sort,comma]{natbib}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{ragged2e}



\DeclareRobustCommand\citep
   {\begingroup\NAT@swatrue\let\NAT@ctype\z@\NAT@partrue
         \@ifstar{\NAT@fulltrue\NAT@citetp}{\NAT@fullfalse\NAT@citetp}}



%==============================================================================
% Fonts
%==============================================================================
\RequirePackage[T1]{fontenc}
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage{blindtext}

\RequirePackage[justification=justified,singlelinecheck=false]{caption}


%==============================================================================
% Text
%==============================================================================
% Justified
\justifying

% Indented
\parindent 1.5cm

% Space between paragraphs
\parskip 6pt %18

% Space between lines
\setstretch{1.5}


%==============================================================================
% Text margin
%==============================================================================
% Top margin is 2cm before paging
\setlength{\topmargin}{2cm}
        \addtolength{\topmargin}{-1in}

% 1cm after paging
% 3cm in total
\setlength{\headsep}{1cm}

% the rest will be zero
\setlength{\headheight}{0cm}
\setlength{\footskip}{0cm}

% The page height, removing 5cm (3cm top, 2cm bottom)
\setlength{\textheight}{\paperheight}
        \addtolength{\textheight}{-5.3cm}

% 3cm left margin for even and odd pages
\setlength{\oddsidemargin}{-1in}
        \addtolength{\oddsidemargin}{3cm}
\setlength{\evensidemargin}{\oddsidemargin}

% Removing 5cm wight (3cm left, 2cm right)
\setlength{\textwidth}{\paperwidth}
        \addtolength{\textwidth}{-5.6cm}

%==============================================================================
% page number
%==============================================================================
\def\ps@setrem{
        \let\@oddfoot\@empty
        \let\@evenfoot\@empty
        \def\@evenhead{\hspace*{\fill}{\@setfontsize\normalsize{10pt}{20}\thepage}}
        \def\@oddhead{\hspace*{\fill}{\@setfontsize\normalsize{10pt}{20}\thepage}}
}
\pagestyle{empty}
\let\ps@plain\ps@empty

%==============================================================================
% Defining author, advisor, and co-advisor
%==============================================================================
\newcounter{ii@authorcount}
\renewcommand{\author}[2]{
        \addtocounter{ii@authorcount}{1}
        \expandafter\gdef\csname @author\alph{ii@authorcount}last\endcsname{#1}
        \expandafter\gdef\csname @author\alph{ii@authorcount}first\endcsname{#2}
        \expandafter\gdef\csname @author\alph{ii@authorcount}\endcsname{#2 #1}
}

\newcounter{ii@advisorcounter}
\newcommand{\advisor}[3]{
        \addtocounter{ii@advisorcounter}{1}
        \expandafter\gdef\csname @advisor\alph{ii@advisorcounter}last\endcsname{#2}
        \expandafter\gdef\csname @advisor\alph{ii@advisorcounter}first\endcsname{#1}
        \expandafter\gdef\csname @advisor\alph{ii@advisorcounter}\endcsname{#1~#3 #2}
}

\newcounter{ii@coadvisorcounter}
\newcommand{\coadvisor}[3]{
        \addtocounter{ii@coadvisorcounter}{1}
        \expandafter\gdef\csname @coadvisor\alph{ii@coadvisorcounter}last\endcsname{#2}
        \expandafter\gdef\csname @coadvisor\alph{ii@coadvisorcounter}first\endcsname{#1}
        \expandafter\gdef\csname @coadvisor\alph{ii@coadvisorcounter}\endcsname{#1~#3 #2}
}

%==============================================================================
% Department definition
%==============================================================================
\newcommand{\dept}[1]{\gdef\@dept{#1}}

%==============================================================================
% Keywords definition (mx. 10)
%==============================================================================
\newcounter{kwcounter}
\newcommand{\keyword}[1]{
        \addtocounter{kwcounter}{1}
        \expandafter\gdef\csname keyw\alph{kwcounter}\endcsname{#1}
}

\newcounter{kwcounterenglish}
\newcommand{\keywordenglish}[1]{
        \addtocounter{kwcounterenglish}{1}
        \expandafter\gdef\csname keyenglishw\alph{kwcounterenglish}\endcsname{#1}
}

\newcommand{\@cipkw}{%
        \@ifundefined{keywa}{}{1.~\expandafter\MakeUppercase\keywa\@. }%
        \@ifundefined{keywb}{}{2.~\expandafter\MakeUppercase\keywb\@. }%
        \@ifundefined{keywc}{}{3.~\expandafter\MakeUppercase\keywc\@. }%
        \@ifundefined{keywd}{}{4.~\expandafter\MakeUppercase\keywd\@. }%
        \@ifundefined{keywe}{}{5.~\expandafter\MakeUppercase\keywe\@. }%
        \@ifundefined{keywf}{}{6.~\expandafter\MakeUppercase\keywf\@. }%
        \@ifundefined{keywg}{}{7.~\expandafter\MakeUppercase\keywg\@. }%
        \@ifundefined{keywh}{}{8.~\expandafter\MakeUppercase\keywh\@. }%
        \@ifundefined{keywi}{}{9.~\expandafter\MakeUppercase\keywi\@. }%
        \@ifundefined{keywj}{}{10.~\expandafter\MakeUppercase\keywj\@. }%
}
\newcommand{\@abstractkw}{%
         \@ifundefined{keyenglishwa}{}{\expandafter\MakeUppercase\keyenglishwa}%
        \@ifundefined{keyenglishwb}{}{. \keyenglishwb}%
        \@ifundefined{keyenglishwc}{}{. \keyenglishwc}%
        \@ifundefined{keyenglishwd}{}{. \keyenglishwd}%
        \@ifundefined{keyenglishwe}{}{. \keyenglishwe}%
        \@ifundefined{keyenglishwf}{}{. \keyenglishwf}%
        \@ifundefined{keyenglishwg}{}{. \keyenglishwg}%
        \@ifundefined{keyenglishwh}{}{. \keyenglishwh}%
        \@ifundefined{keyenglishwi}{}{. \keyenglishwi}%
        \@ifundefined{keyenglishwj}{}{. \keyenglishwj}%
}

\newcommand{\@palavraschave}{%
        \@ifundefined{keywa}{}{\expandafter\MakeUppercase\keywa}%
        \@ifundefined{keywb}{}{. \keywb}%
        \@ifundefined{keywc}{}{. \keywc}%
        \@ifundefined{keywd}{}{. \keywd}%
        \@ifundefined{keywe}{}{. \keywe}%
        \@ifundefined{keywf}{}{. \keywf}%
        \@ifundefined{keywg}{}{. \keywg}%
        \@ifundefined{keywh}{}{. \keywh}%
        \@ifundefined{keywi}{}{. \keywi}%
        \@ifundefined{keywj}{}{. \keywj}%
}

%==============================================================================
% Work data
%==============================================================================
\renewcommand{\date}[2]{
        \gdef\@publmonth{#1}
        \gdef\@publyear{#2}
}
\date{\monthname}{\number\year}

\newcommand{\location}[2]{
        \gdef\@city{#1}
        \gdef\@state{#2}
}

\newcommand{\course}[1]{\gdef\@course{#1}}
\newcommand{\courseheader}[1]{\gdef\@courseheader{#1}}
\courseheader{\nulllogo[0.7]}

\newcommand{\docname}[1]{\gdef\@docname{#1}}
%==============================================================================
% Title page definition
%==============================================================================
\renewcommand{\maketitle}{%
        \begin{titlepage}
                \thetitlepage
        \end{titlepage}%
        \clearpage
        \setcounter{page}{2}%
        \@ifundefined{@cipspecificinfo}{}{\@makecippage}
}

%==============================================================================
% Cover
%==============================================================================
\newcommand{\thetitlepage}{%
    % \noindent{\@courseheader}
    % Header of the course
    \noindent\raisebox{-7.5mm}[0pt][0pt]{\rlap{\makebox[\textwidth][c]{\@courseheader}}}
    \vspace{3cm}
    \begin{center}


				% Space between the authors
				\vspace{1cm}

				% Authors
				\textbf{\MakeUppercase{\@authora}}\\
				\@ifundefined{@authorb}{}{\MakeUppercase{\textbf{\@authorb}}\\}%
				%\@ifundefined{@authorc}{}{\MakeUppercase{\textbf{\@authorc}}\\}%
				%\@ifundefined{@authord}{}{\MakeUppercase{\textbf{\@authord}}\\}%
				\vspace*{\fill}

				% Title
				{\textbf{\MakeUppercase{\@title}}\par}
				\vfill

				% City and year
				\centerline{\textbf{\@city}}
				\centerline{\textbf{\@publyear}}
    \end{center}
}

%==============================================================================
% Cover sheet
%==============================================================================
\newcommand{\@makecippage}{%
         \begin{center}
                \textbf{\MakeUppercase{\@authora}\\}
                \textbf{\@ifundefined{@authorb}{}{\MakeUppercase{\@authorb}}}%
                %\textbf{\@ifundefined{@authorc}{}{\MakeUppercase{\@authorc}\\}}%
                %\textbf{\@ifundefined{@authord}{}{\MakeUppercase{\@authord}\\}}%
                \vspace*{\fill}

                \textbf{\MakeUppercase{\@title}}
        \end{center}
        \vspace*{\fill}
        \begin{flushright}
                \hspace{10cm}
                \begin{minipage}[t][4cm][b]{0,4\textwidth}
                        \singlespacing
                        \justifying
                        \small{\noindent\@docname}
                \end{minipage}
        \end{flushright}
        \vspace*{\fill}
        \begin{center}
                \@ifundefined{@advisora}{}{\advisorname:\\\@advisora\\}
                \@ifundefined{@advisorb}{}{\@advisorb\\}
                \@ifundefined{@advisorc}{}{\@advisorc\\}
                \@ifundefined{@advisord}{}{\@advisord}

                \@ifundefined{@coadvisora}{}{\coadvisorname:\\\@coadvisora\\}
                \@ifundefined{@coadvisorb}{}{\@coadvisorb\\}
                \vspace*{\fill}
                \textbf{\@city\\}
                \textbf{\@publyear}
        \end{center}
}

%==============================================================================
% Adjusting the summary
%==============================================================================
% s  usado no apndice, precisa ser revisado e removido se for o caso
\newlength{\ii@chapnumindent}\setlength{\ii@chapnumindent}{1.8em}

\newlength{\s@tocspace}\setlength{\s@tocspace}{1pt}

\renewcommand*{\l@chapter}[2]{
		\begingroup
				\setstretch{1}
				\parskip \s@tocspace
				\@dottedtocline{1}{0em}{4em}{\uppercase{\textbf{#1}}}{\hss #2}
		\endgroup
}

\renewcommand*{\l@section}[2]{
		\begingroup
				\setstretch{1}
				\parskip \s@tocspace
				\@dottedtocline{1}{0em}{4em}{\uppercase{#1}}{\hss #2}
		\endgroup
}

\renewcommand*{\l@subsection}[2]{
		\begingroup
				\setstretch{1}
				\parskip \s@tocspace
				\@dottedtocline{1}{0em}{4em}{\textbf{#1}}{\hss #2}
		\endgroup
}

\renewcommand*{\l@subsubsection}[2]{
		\begingroup
				\setstretch{1}
				\parskip \s@tocspace
				\@dottedtocline{1}{0em}{4em}{\textit{#1}}{\hss #2}
		\endgroup
}

\newif\if@aftertoc
\@aftertocfalse

\renewcommand{\tableofcontents}{%
        \chapter*{\contentsname}
        \pagestyle{empty}
        {
                \@starttoc{toc}\@aftertoctrue%
        }
}

\renewcommand\listoffigures{%
        % \addcontentsline{lof}{figure}{\figurename #1 }
        \chapter*{\listfigurename}
        \pagestyle{empty}
        {
                % uncomment this line to merge list of figures and list of tables
                % \@starttoc{lot}
                \@starttoc{lof}
        }
}

% \renewcommand\listoffigures{%
%         \addcontentsline{lof}{figure}{\figurename #1 }
%         \chapter*{\listfigurename
%         \@mkboth{%
%            \MakeUppercase\listfigurename}{\MakeUppercase\listfigurename}}
%     \@starttoc{lof}%
% }
% \renewcommand\listoftables{%
%         \chapter*{\listtablename
%         \@mkboth{%
%            \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}
%     \@starttoc{lot}%
% }
%==============================================================================
% Definitions of abbreviation and Symbol lists
%==============================================================================
\newenvironment{listofabbrv}[1]{
        \chapter*{\listabbrvname}
        \begin{list}{\textbf{??}}{
                \settowidth{\labelwidth}{#1}
                \setlength{\labelsep}{1em}
                \setlength{\itemindent}{0mm}
                \setlength{\leftmargin}{\labelwidth}
                \addtolength{\leftmargin}{\labelsep}
                \setlength{\rightmargin}{5mm}
                \setlength{\itemsep}{.1\baselineskip}
                \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
        }
}{
        \end{list}
}
\newenvironment{listofsymbols}[1]{
        \chapter*{\listsymbolname}
        \begin{list}{\textbf{??}}{
                \settowidth{\labelwidth}{#1}
                \setlength{\labelsep}{1em}
                \setlength{\itemindent}{5mm}
                \setlength{\leftmargin}{\labelwidth}
                \addtolength{\leftmargin}{\labelsep}
                \setlength{\rightmargin}{5mm}
                \setlength{\itemsep}{.1\baselineskip}
                \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
        }
}{
        \end{list}
}

\newenvironment{singlespaced}%          environment name
{
    \setstretch{1}
}{}%                    end code

%==============================================================================
% Resumo (resumo)  and Abstract (abstract)
%==============================================================================
\renewenvironment{abstract}{%
    \singlespacing
    \chapter*{Abstract}
    \noindent

}{
    \par
    \noindent
    \textbf{Key Words:} \@abstractkw.
}

\newenvironment{resumo}[2]{%
    \singlespacing
    \if@openright\cleardoublepage\else\clearpage\fi%
    % \gdef\@englishkeywords{#2}%
    \begin{otherlanguage}{brazilian}
    \chapter*{Resumo}
    \noindent
}{
    \par
    \noindent
    \textbf{Palavras-Chave:} \@palavraschave. %\@englishkeywords.
    \end{otherlanguage}
}


\newenvironment{introduction}{%
    \chapter*{\introductionname}
}{

}


%==============================================================================
% Formating the chapters
% \@chapter and \@schapter are redefined  so that page number is correct
% \@makechapterhead  and \@makeschapterhead do this
%==============================================================================
\newcommand{\ii@chapterfont}{\@setfontsize\normalsize{12pt}{20}}

\renewcommand{\chaptername}{Chapter~}

\def\@chapapp{\chaptername}
\def\@chapter[#1]#2{%
        \refstepcounter{chapter}%
        \addcontentsline{toc}{chapter}{\thechapter\ \ #1}%
       % \addtocontents{lof}{\protect\addvspace{10\p@}}%
        %\addtocontents{lot}{\protect\addvspace{10\p@}}%


        \thispagestyle{empty}

        \@makechapterhead{#2}
        \@afterheading

        \pagestyle{setrem}\let\ps@plain\ps@setrem%

}
\def\@makechapterhead#1{%
       \vspace*{3.2cm}
        \reset@font\noindent{
        	\ii@chapterfont\sffamily\textbf{\hspace{-0.2em}\MakeUppercase\thechapter\hspace{1em}\MakeUppercase{#1}}\par
        }
        %\addvspace{42pt}
}

\def\@schapter#1{%

        \if@aftertoc\addcontentsline{toc}{chapter}{#1}\fi%

        %\addtocontents{lof}{\protect\addvspace{10\p@}}%
        %\addtocontents{lot}{\protect\addvspace{10\p@}}%


        \thispagestyle{empty}

        \@makeschapterhead{#1}
        \@afterheading


        \pagestyle{setrem}\let\ps@plain\ps@setrem%
}
\def\@makeschapterhead#1{%
        \vspace*{5.0cm}
        \reset@font\centerline{\ii@chapterfont\sffamily\textbf{\MakeUppercase{#1}}}
        \addvspace{18pt}
}

\iffalse
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  % XXX
  \gdef\@chapupp{\expandafter\MakeTextUppercase\expandafter{\appendixname}}%
  %\gdef\thechapter{\expandafter\MakeTextUppercase\expandafter{\appendixname}\nobreakspace\@Alph\c@chapter}%
  \gdef\thechapter{\@Alph\c@chapter}%
  \gdef\PP@chaptertypeout{\@chapupp\space}%
  \gdef\PP@chapternumberline{}%
  \gdef\PP@chapterfmt##1{\@chapupp\nobreakspace\thechapter\nobreakspace--\nobreakspace\protect\normalfont##1}%
  \gdef\PP@chapterfmtnodepth##1{##1}%

  \gdef\@makechapterhead##1{%
    {\parindent\z@
      \centering
      \normalfont
      \interlinepenalty\@M
      \large\bfseries\MakeTextUppercase{##1}\par\nointerlineskip\nobreak
      \normalfont\normalsize
      \vskip 6ex
    }}%
}
\fi

\renewcommand{\appendix}[1][\appendixname]{%
        \setcounter{chapter}{0}%
        \renewcommand{\thechapter}{}%
        \setcounter{tocdepth}{0}%
        \@captionlistingfalse%
        \gdef\@chapapp{\MakeUppercase{#1}\space}%

}
\newcommand{\annex}{\appendix[\annexname]}



%==============================================================================
% Section format
%
% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
%            optional * [ALTHEADING]{HEADING}
%    Generic command to start a section.
%    NAME       : e.g., 'subsection'
%    LEVEL      : a number, denoting depth of section -- e.g., chapter=1,
%                 section = 2, etc.  A section number will be printed if
%                 and only if LEVEL < or = the value of the secnumdepth
%                 counter.
%    INDENT     : Indentation of heading from left margin
%    BEFORESKIP : Absolute value = skip to leave above the heading.
%                 If negative, then paragraph indent of text following
%                 heading is suppressed.
%    AFTERSKIP  : if positive, then skip to leave below heading,
%                       else - skip to leave to right of run-in heading.
%    STYLE      : commands to set style
%  If '*' missing, then increments the counter.  If it is present, then
%  there should be no [ALTHEADING] argument.  A sectioning command
%  is normally defined to \@startsection + its first six arguments.
%==============================================================================
\setcounter{secnumdepth}{4}
\def\@beforespace{4pt}
\def\@afterspace{4pt}

% Title 1
\renewcommand{\section}{
		\@startsection{section}{1}{0pt}{\@beforespace}{\@afterspace}{\raggedright\reset@font\uppercase}
}

% Title 3
\renewcommand{\subsection}{%
    \@startsection{subsection}{2}{0pt}{\@beforespace}{\@afterspace}{\raggedright\reset@font\bfseries}
}

% Title 4
\renewcommand{\subsubsection}{%
    \@startsection{subsubsection}{3}{0pt}{\@beforespace}{\@afterspace}{\raggedright\reset@font\itshape}
}


\renewcommand{\paragraph}{%
    \@startsection{paragraph}{4}{0pt}{\@beforespace}{\@afterspace}{\raggedright\reset@font}
}
\renewcommand{\subparagraph}{%
    \@startsection{subparagraph}{5}{0pt}{1ex}{-1em}{\reset@font\bfseries}
}

%==============================================================================
% Redefining the content of Figure and Table list
%==============================================================================
 \newif\if@captionlisting\@captionlistingtrue
 \long\def\@caption#1[#2]#3{%
   %\par
   \if@captionlisting%

     \addcontentsline{\csname ext@#1\endcsname}{#1}%
        {\protect\numberline{\csname fnum@#1\endcsname:}{\ignorespaces #2}}%
   \fi%
   \begingroup
   	%\setstretch{1.0}
     \@parboxrestore
     \if@minipage
       \@setminipage
     \fi
     \normalsize
     \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}
   \endgroup%
 }


\newcommand{\source}[1]{
        \flushleft{
    		\@setfontsize\normalsize{10pt}{20}
    		\vspace{-10pt}
            {Fonte:} #1
            \vspace{-15pt}
        }
}

\newcommand{\figurebox}[2]{
		\centerline{
			\setlength\fboxsep{0pt}
			\setlength\fboxrule{0.5pt}
			\fbox{
				\includegraphics[width=#1]{#2}
			}
		}
}

%\renewcommand{\numberline}{\figurename~\oldnumberline}
%\renewcommand{\fnum@figure}{\textbf{Fig.~\thefigure}}

%==============================================================================
% Redefining long citations
%==============================================================================
%\renewenvironment{quote}{``}{''}
\renewcommand{\quote}[1]{
		``#1''
}

\newcommand{\itquote}[1]{
		``\textit{#1}''
}

\renewenvironment{quotation}{
	\begin{list}{}{
		\small%
    	\setstretch{1.0}
		\setlength{\leftmargin}{40mm}
	}
    	\item[]%
}{
	\end{list}
}

%\newcommand{\apudonline}[2]{
%	\citet{#1} \textit{apud} \citet{#2}
%}

\newcommand{\apudonline}[2]{
	\citeauthor{#1} (\citeyear{#1}, \textit{apud} \citeauthor{#2}, \citeyear{#2})
}

\newcommand{\apud}[2]{
	(\citeauthor*{#1}, \citeyear{#1} \textit{apud} \citeauthor*{#2}, \citeyear{#2})
}

%==============================================================================
% Adjusting citation format and references
%==============================================================================
%to remove the indent at references, uncomment this line
%\setlength{\bibhang}{0pt}
%\let\cite\citep

\def\citep{\citepnostar}

\def\citepnostar%
    {\@ifnextchar[{\squarecitep}{\simplecitep}}
\def\squarecitep[#1]%
    {\@ifnextchar[{\twocitep[#1]}{\onecitep[#1]}}

\def\simplecitep#1%
    {\Citep*{#1}}
\def\onecitep[#1]#2%
    {\Citep*[#1]{#2}}
\def\twocitep[#1][#2]#3%
    {(\Citeauthor*{#3}, \citeyear[#1][#2]{#3})}

%
\newcommand{\cip}{}
\newenvironment{dedicatoria}{%
        \clearpage%
        \mbox{}\vfill\begin{flushright}
}{
        \end{flushright}
}
\newenvironment{agradecimentos}{\chapter*{Acknowledgments}}{}


% Figuras em negrito conforme a metodologia da SETREM
\captionsetup[figure]{font= {small,bf},skip=0pt}
\captionsetup[longtable]{font={small, bf}}
\captionsetup[table]{font={small, bf}}
\captionsetup[listing]{font={bf}}




