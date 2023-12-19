% UST THESIS DOCUMENT CLASS -- version 2023.0 
%  Upgraded from version 2.0 by Dr. Chi-kiu Lo on May 10, 2023
%    according to the thesis sample pages provided 
%    in the Guidelines on Thesis Preparation of the Handbook of Research Postgraduate Studies 
%    (https://fytgs.hkust.edu.hk/academics/Academic-Regulations-and-Requirements/Handbook-for-Research-Postgraduate-Studies/guidelines-thesis-preparation)
%	  on May 2023.
%  Released to Overleaf template gallery. 

% UST THESIS DOCUMENT CLASS -- version 2.0 - not released
%  Upgraded from version 1.0 by Kam-Fai Chan on August 1, 2001
%    according to the guidelines on thesis preparation released
%    on March 2001 by the PG secretary of the University. 

% UST THESIS DOCUMENT CLASS -- version 1.0 - not released
%  This is the thesis document class for the Department of Computer Science, 
%    The Hong Kong University of Science and Technology,
%    adapted from the previous `ustthesis.sty' for LaTeX 2.09.
%  The version 1.0 of the `ustthesis.cls' file is created by
%    Kam-Fai Chan (kchan@cs.ust.hk).

% THESIS DOCUMENT STYLE -- version 1.1 - not released
%  This is the Department of Computer Science, The Hong Kong University
%  of Science and Technology Thesis document style, adapted from the Duke
%  University version brought in by Jogesh Muppala, adapted from the
%  Wisconsin version brought in by Mark Holliday.  The Duke University
%  version adapted by Charlie Martin and Russ Tuck. The CSD-HKUST version
%  adapted by Chee-Wai Yeung <cheewai@cs.ust.hk>
%  adapted from:
%    REPORT DOCUMENT STYLE -- version 0.91 - released 27 January 1985
%      for LaTeX version 2.08
%    Copyright (C) 1985 by Leslie Lamport
%
%  Feb 6 1986 - William K. Kalsow
%
%  This document style is intended to produce output comforming
%  to the offical Department of Computer Science, The Hong Kong
%  Univrsity of Science and Technology  requirements.
%
%  NOTE: only 12pt type is supported.
%        only one sided output is supported.

%  Changes by Russ Tuck (Dec. 3-11, 1986):
%	changed bibliography so it is included in the table of contents
%	added \newblock definition and 2 more lines to Bibliography, 
%		from report.sty
%	reworded copyright notice
%	rewrote title page handling entirely; includes AM, MS, and PhD options.
%  Changes by Russ Tuck, April 1990:
%   added \textspace and \textspaceundo
%   added \textspace and \textspaceundo to \abstract
%   no page number for \abstract
%   added \acknowledgements \endacknowledgements 
%   many small fixes
%  Changes by David Kotz, October 1990:
%   added \biography 
%   added \subject for the abstract title page
%   added ABSTRACT and subject to the top of abstract title page
%  Changes by David Kotz, February 1991:
%   removed textspace from \biography
%   centered signature lines on title pages
%  Changes by Chee-Wai Yeung, June, 1993:
%   \typeout{Document Style `thesis'.  Version 1.2, 15 Feb 1991, Duke CS Dept.}
%   \typeout{Please report any problems to problem@duke.}

%  Changes to the CSD-HKUST version.
%  Chan:
%    2002/01/01 -
%      Adding a definition to handle the title of acting department head.
%    2002/07/23 -
%      Fix a logical bug to allow explicit use of \chapters.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
%\ProvidesClass{ustthesis}[1999/08/31 v1.0 LaTeX document class]
%\ProvidesClass{ustthesis}[2001/08/01 v2.0 LaTeX document class]
\ProvidesClass{ustthesis}[2002/07/23 v2.1 LaTeX document class]

%  Chan:
%    Disable the output of the following messages:
%      \typeout{Document Style `ustthesis'.  Version 1.3, December 1995, HKUST CS Dept.}
%      \typeout{Please report any problems to cheewai@cs.ust.hk}
%      \typeout{Please report any problems to cssystem@cs.ust.hk}
%  Lo, 20230510:
%    Disable the output of the following messages:
%      \typeout{This class file is adapted from `ustthesis.sty' v1.3 (for LaTeX 2.09).}
%      \typeout{Please report any problems to kchan@cs.ust.hk}
\typeout{This class file is adapted from `ustthesis.cls' v2.0 (for LaTeX 2.09).}
\typeout{Please report any problems to chikiu.lo@gmail.com}

\PassOptionsToClass{12pt,twoside}{report}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass{report}[1995/12/20 v1.3q Standard LaTeX document class]

%  draft option
%
% \overfullrule = 0pt                % Default is don't mark overfull hboxes.
% tuck 4/4/90: Preliminary (abstract, acknowledgements) and main chapters 
% must be double spaced, but toc shouldn't be.  Turning on double spacing
% twice makes quadruple spacing, etc.  
% \textspace turns double spacing on, and \textspaceundo turns it off.
% See \abstract and \endabstract, \acknowledgements and \endacknowledgements.
\def\textspace{\openup 3 \jot\relax}  % Begin double spaced text (default)
\def\textspaceundo{\openup -3 \jot\relax}  % Resume single spacing
\def\versiontag{}                    % Default is NO tag
\def\ds@draft{
	%%% -- DRAFT is double spaced -- \def\textspace{}  % Single spaced text
	\overfullrule 5pt % Causes overfull hboxes to be marked.
	\def\versiontag{{\normalsize\rm - DRAFT \number\month/\number\day{} -}}
}

%
% More options. Somehow not defined??
%
% Define four switches: \ifAM, \ifMS, \ifMPhil and \ifPhD.  At most one must be
% true when the title page is actually printed.  They are all set false
% here, and one is normally set true by specifying an optional 
% \documentstyle parameter, one of: AM, MS, MPhil, PhD.  If they are all false
% when \maketitle is invoked, the effect the same as \AMtrue.

\newif\ifAM  \AMfalse
\newif\ifMS  \MSfalse
\newif\ifMPhil  \MPhilfalse
\newif\ifPhD \PhDfalse
\newif\ifAPPENDIX \APPENDIXfalse
\newif\ifINAPPENDIX \INAPPENDIXfalse

\def\ds@AM{
	\AMtrue
}
\def\ds@MS{
	\MStrue
}
\def\ds@MPhil{
	\MPhiltrue
}
\def\ds@PhD{
	\PhDtrue
}
\newif\ifPQE  \PQEfalse
\newif\ifProposal  \Proposalfalse
\newif\ifThesis  \Thesisfalse

%  Chan:
%    Disable italic to reduce the width of each word in the title.
%\newfont{\Lbi}{cmbxti10 scaled\magstep3}
%\newfont{\lbi}{cmbxti10 scaled\magstep2}
%\newfont{\nbi}{cmbxti10 scaled\magstep1}
\newfont{\Lbi}{cmbx10 scaled\magstep3}
\newfont{\lbi}{cmbx10 scaled\magstep2}
\newfont{\nbi}{cmbx10 scaled\magstep1}

%  Cheewai:
%    Added \undottedtocline to be used similar to \dottedtocline except that there
%      is NO dotted line. The vglue part will screw up when there are captions that
%      are too long and wrapped. The entries in the LOF/TOC/LOT will be messed up.
%      Return to the original dottedtocline macro on not fixing vglue.
\def\@undottedtocline#1#2#3#4#5{\ifnum #1>\c@tocdepth \else
  \vskip \z@ plus.2\p@
  {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
   \interlinepenalty\@M
   \leavevmode
   \@tempdima #3\relax \advance\leftskip \@tempdima \hbox{} \hskip -\leftskip
    #4\hfill \nobreak
      \hbox to\@pnumwidth{\hfil\reset@font\rm #5}\par}\fi}

\let\@dottedtocline\@undottedtocline

% The \@options command causes the execution of every command \ds@FOO
% which is defined and for which the user typed the FOO option in his
% \documentstyle command.  For every option BAR he typed for which
% \ds@BAR is not defined, the file BAR.sty will be read after the present
% (main) .STY file is executed.

\@options

%  ****************************************
%  *               FONTS                  *
%  ****************************************
%

\lineskip 1pt            % \lineskip is 1pt for all font sizes.
\normallineskip 1pt
\def\baselinestretch{1}

% Each size-changing command \SIZE executes the command
%        \@setsize\SIZE{BASELINESKIP}\FONTSIZE\@FONTSIZE
% where:
%   BASELINESKIP = Normal value of \baselineskip for that size.  (Actual
%                  value will be \baselinestretch * BASELINESKIP.)
%
%  \FONTSIZE     = Name of font-size command.  The currently available
%                  (preloaded) font sizes are: \vpt (5pt), \vipt (6pt),
%                  \viipt (etc.), \viiipt, \ixpt, \xpt, \xipt, \xiipt,
%                  \xivpt, \xviipt, \xxpt, \xxvpt.
%  \@FONTSIZE    = The same as the font-size command except with an
%                  '@' in front---e.g., if \FONTSIZE = \xivpt then
%                  \@FONTSIZE = \@xivpt.
%
% For reasons of efficiency that needn't concern the designer,
% the document style defines \@normalsize instead of \normalsize .  This is
% done only for \normalsize, not for any other size-changing commands.

\def\@normalsize{\@setsize\normalsize{14.5pt}\xiipt\@xiipt
\abovedisplayskip 12pt plus3pt minus7pt%
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip  \z@ plus3pt%
\belowdisplayshortskip  6.5pt plus3.5pt minus3pt}

\def\small{\@setsize\small{13.6pt}\xipt\@xipt
\abovedisplayskip 11pt plus3pt minus6pt%
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip  \z@ plus3pt%
\belowdisplayshortskip  6.5pt plus3.5pt minus3pt
\def\@listi{\parsep 4.5pt plus 2pt minus 1pt
            \itemsep \parsep
            \topsep 9pt plus 3pt minus 5pt}}

\def\footnotesize{\@setsize\footnotesize{12pt}\xpt\@xpt
\abovedisplayskip 10pt plus2pt minus5pt%
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip  \z@ plus3pt%
\belowdisplayshortskip  6pt plus3pt minus3pt
\def\@listi{\topsep 6pt plus 2pt minus 2pt\parsep 3pt plus 2pt minus 1pt
\itemsep \parsep}}

\def\scriptsize{\@setsize\scriptsize{9.5pt}\viiipt\@viiipt}
\def\tiny{\@setsize\tiny{7pt}\vipt\@vipt}
\def\large{\@setsize\large{18pt}\xivpt\@xivpt}
\def\Large{\@setsize\Large{22pt}\xviipt\@xviipt}
\def\LARGE{\@setsize\LARGE{25pt}\xxpt\@xxpt}
\def\huge{\@setsize\huge{30pt}\xxvpt\@xxvpt}
\let\Huge=\huge

\normalsize  % Choose the normalsize font.

%  ****************************************
%  *            PAGE LAYOUT               *
%  ****************************************
%
% All margin dimensions measured from a point one inch from top and side
% of page.  Dimensions shrink by about 2 percent

% SIDE MARGINS:
% tuck 4/4/90: make left margin 1.75in and right 1.25 in, giving .25in
% room for error on both sides (required: 1.5in left, 1in right)
% Chan:
%	Make changes according to the guidelines released on March 2001.
%\oddsidemargin 1.45cm   %  Left margin on odd-numbered pages.
%\evensidemargin 1.45cm  %  Note that \oddsidemargin = \evensidemargin
%\oddsidemargin 15mm   %  25mm + 15mm = 40mm
%\evensidemargin 15mm  %  25mm + 15mm = 40mm
\oddsidemargin 0mm   %  25mm + 15mm = 40mm
\evensidemargin 7mm  %  25mm + 15mm = 40mm
\marginparwidth 0pt   %  Width of marginal notes.
\marginparsep 0pt     % Horizontal space between outer margin and marginal note


% VERTICAL SPACING: Modified 24 Nov 87 CRM
% \topmargin 0pt vice 20pt
                         % Top of page:
\topmargin 0mm           %    Nominal distance from top of page to top of
                         %    box containing running head.
% Chan:
%	Make changes according to the guidelines released on March 2001.
%\headheight 12pt         %    Height of box containing running head.
%\headsep 8pt            %    Space between running head and text.
\headheight 0pt         %    Height of box containing running head.
\headsep 0pt            %    Space between running head and text.
% \topskip = 10pt        %    '\baselineskip' for first line of page.
                         % Bottom of page:
% Chan:
%   \footheight becomes obsolete in LaTeX 2e.
%\footheight 12pt         %    Height of box containing running foot.
\footskip 10mm           %    Distance from baseline of box containing foot
                         %    to baseline of last line of text.


% DIMENSION OF TEXT:
%  8 Sept 87 -- changed the page sizes for new style req't
%  crm@duke.
% Chan:
%	Make changes according to the guidelines released on March 2001.
%\textheight 22.7cm      % Height of text (including footnotes and figures,
                         % excluding running head and foot). 635 vice
						 % 605
\textheight 247mm        % 297mm - 25mm * 2 = 247mm
                         % According to the sample shown in the guidelines,
                         % page number is placed below the bottom margin.
\textwidth 15.3cm        % 210mm Width of text line. 400 vice 430
                         % For two-column mode:
\columnsep 10pt          %    Space between columns
\columnseprule 0pt       %    Width of rule between columns.

% Chan:
%	Add a new definition \PNumberAboveBottomMargin so that
%	the author may choose to have the page number printed above
%	the bottom margin.
\newif\ifmovedupdefined 
\movedupdefinedfalse
\def\PNumberAboveBottomMargin{%
  \ifmovedupdefined \else
    \addtolength{\textheight}{-8mm}
    \movedupdefinedtrue
    \typeout{+--------}
    \typeout{|  Enable shorter page - page number is above the bottom margin.}
    \typeout{+--------}
  \fi
}

% A \raggedbottom command causes 'ragged bottom' pages: pages set to
% natural height instead of being stretched to exactly \textheight.

% FOOTNOTES:

\footnotesep 14pt    % Height of strut placed at the beginning of every
                     % footnote.
\skip\footins 8pt plus 2pt minus 4pt  % Space between last line of text and
                                      % top of first footnote.

% FLOATS: (a float is something like a figure or table)
%
%  FOR FLOATS ON A TEXT PAGE:
%
\floatsep 14pt plus 2pt minus 4pt        % Space between adjacent floats moved
                                         % to top or bottom of text page.
\textfloatsep 20pt plus 6pt minus 4pt    % Space between main text and floats
                                         % at top or bottom of page.
\intextsep 14pt plus 4pt minus 4pt       % Space between in-text figures and
                                         % text.
% Chan:
%   \maxsep becomes obsolete in LaTeX 2e.
%\@maxsep 20pt                            % The maximum of \floatsep,
                                         % \textfloatsep and \intextsep (minus
                                         % the stretch and shrink).

%  FOR FLOATS ON A SEPARATE FLOAT PAGE:
\@fptop 0pt plus 1fil    % Stretch at top of float page. (Must be 0pt plus ...)
\@fpsep 10pt plus 2fil   % Space between floats on float page.
\@fpbot 0pt plus 1fil    % Stretch at bottom of float page. (Must be 0pt plus ... )

% MARGINAL NOTES:
%
\marginparpush 7pt       % Minimum vertical separation between two marginal
                         % notes.

%  ****************************************
%  *           PARAGRAPHING               *
%  ****************************************
%
\parskip 6pt plus 1pt minus 1pt    % Extra vertical space between paragraphs.
\parindent 1.5em                   % Width of paragraph indentation.
\topsep 10pt plus 4pt minus 6pt    % Extra vertical space, in addition to
                                   % \parskip, added above and below list and
                                   % paragraphing environments.
\partopsep 3pt plus 2pt minus 2pt  % Extra vertical space, in addition to
                                   % \parskip and \topsep, added when user
                                   % leaves blank line before environment.
\itemsep 5pt plus 2.5pt minus 1pt  % Extra vertical space, in addition to
                                   % \parskip, added between list items.

% The following page-breaking penalties are defined

\@lowpenalty   51      % Produced by \nopagebreak[1] or \nolinebreak[1]
\@medpenalty  151      % Produced by \nopagebreak[2] or \nolinebreak[2]
\@highpenalty 301      % Produced by \nopagebreak[3] or \nolinebreak[3]

\@beginparpenalty -\@lowpenalty    % Before a list or paragraph environment.
\@endparpenalty   -\@lowpenalty    % After a list or paragraph environment.
\@itempenalty     -\@lowpenalty    % Between list items.

% \clubpenalty         % 'Club line'  at bottom of page.
% \widowpenalty        % 'Widow line' at top of page.
% \displaywidowpenalty % Math display widow line.
% \predisplaypenalty   % Breaking before a math display.
% \postdisplaypenalty  % Breaking after a math display.
% \interlinepenalty    % Breaking at a line within a paragraph.
% \brokenpenalty       % Breaking after a hyphenated line.

%    ****************************************
%    *        CHAPTERS AND SECTIONS         *
%    ****************************************
%
% DEFINE COUNTERS:
%
% \newcounter{NEWCTR}[OLDCTR] : Defines NEWCTR to be a counter, which is
%                               reset to zero when counter OLDCTR is stepped.
%                               Counter OLDCTR must already be defined.

% Chan:
%   The following counters have been defined in `report.cls'.
%\newcounter {chapter}
%\newcounter {section}[chapter]
%\newcounter {subsection}[section]
%\newcounter {subsubsection}[subsection]
%\newcounter {paragraph}[subsubsection]
%\newcounter {subparagraph}[paragraph]

% For any counter CTR, \theCTR is a macro that defines the printed version
% of counter CTR.  It is defined in terms of the following macros:
%
%  \arabic{COUNTER} : The value of COUNTER printed as an arabic numeral.
%  \roman{COUNTER}  : Its value printed as a lower-case roman numberal.
%  \Roman{COUNTER}  : Its value printed as an upper-case roman numberal.
%  \alph{COUNTER}   : Value of COUNTER printed as a lower-case letter:
%                         1 = a, 2 = b, etc.
%  \Alph{COUNTER}   : Value of COUNTER printed as an upper-case letter:
%                           1 = A, 2 = B, etc.
%

\def\thechapter       {\arabic{chapter}}
\def\thesection       {\thechapter.\arabic{section}}
\def\thesubsection    {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection .\arabic{subsubsection}}
\def\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph  {\theparagraph.\arabic{subparagraph}}


% \@chapapp is initially defined to be 'Chapter'.  The \appendix
% command redefines it to be 'Appendix'.

\def\@chapapp{CHAPTER}

% \@makechapterhead {TEXT} : Makes the heading for the \chapter command.
%
% modified to suite CSD-HKUST format.
%

\def\@makechapterhead#1{             % Heading for \chapter command
  \vspace*{0pt}                     % Space at top of text page.
  { \begin{center}
    \ifnum \c@secnumdepth >\m@ne     % IF secnumdepth > -1 THEN
       {\Lbi \@chapapp~\thechapter} % Print 'Chapter' and number.
      \par
      \vskip 20pt \fi                  % Space between number and title.
    {\Lbi                        % Title.
    \uppercase{#1}}
    \end{center}
    \nobreak                         % TeX penalty to prevent page break.
%    \vskip 40pt                      % Space between title and text.
  }
  % Chan:
  %   Comment out the following line.  Otherwise, the page number in
  %   a shorter page cannot be in the same position as that in the
  %   other pages.
  %\advance\@colht-\footskip          % tell LaTeX to build a shorter page!
  \pagegoal\@colht                   % let TeX in on what's happening
}

% \@makeschapterhead {TEXT} : Makes the heading for the \chapter* command.
%
% modified to suite CSD-HKUST format.
%

\def\@makeschapterhead#1{             % Heading for \chapter* command
  \vspace*{0pt}                     % Space at top of page.
  { \begin{center}
    {\Lbi                        % Title.
    \uppercase{#1}\par}
    \end{center}
    \nobreak                         % TeX penalty to prevent page break.
%    \vskip 40pt                      % Space between title and text.
  } 
  % Chan:
  %   Comment out the following line.  Otherwise, the page number in
  %   a shorter page cannot be in the same position as that in the
  %   other pages.
  %\advance\@colht-\footskip          % tell LaTeX to build a shorter page!
  \pagegoal\@colht                   % let TeX in on what's happening
}

% \secdef{UNSTARCMDS}{STARCMDS} :
%    When defining a \chapter or \section command without using
%    \@startsection, you can use \secdef as follows:
%       \def\chapter { ... \secdef \CMDA \CMDB }
%       \def\CMDA    [#1]#2{ ...   % Command to define \chapter[...]{...}
%       \def\CMDB    #1{ ...       % Command to define \chapter*{...}

\def\chapter{\clearpage      % Starts new page.
   \thispagestyle{headings}  % Page style of chapter page is 'headings'
   \global\@topnum\z@        % Prevents figures from going at top of page.
   \@afterindentfalse        % Suppresses indent in first paragraph.  Change
   \secdef\@chapter\@schapter}   % to \@afterindenttrue to have indent.

\def\@chapter[#1]#2{%
% Chan:
%	Add the following to insert "\chapters" automatically.
  \ifbodydefined \else
    \chapters
  \fi
        \ifnum \c@secnumdepth >\m@ne
        \refstepcounter{chapter}
        \typeout{\@chapapp\space\the\c@chapter.}
% Chan:
%	Comment out the following lines according to the guidelines
%	released on March 2001.
%        \ifAPPENDIX \addcontentsline{toc}{chapter}{Appendices}
%        \APPENDIXfalse\fi
        \ifINAPPENDIX
% Chan:
%	Make changes according to the guidelines released on March 2001.
%         \addcontentsline{toc}{appendix}{\protect
%         \numberline{\thechapter}#1}\else
%        \addcontentsline{toc}{chapter}{\protect
%        \numberline{\thechapter}#1}
        \addcontentsline{toc}{chapter}{{Appendix \thechapter}\hspace{1em}#1}\else
        \addcontentsline{toc}{chapter}{{Chapter \thechapter}\hspace{1em}#1}
       \fi
        \else
% Chan:
%	Comment out the following lines according to the guidelines
%	released on March 2001.
%        \ifAPPENDIX \addcontentsline{toc}{chapter}{Appendices}
%        \APPENDIXfalse\fi
        \ifINAPPENDIX
        \addcontentsline{toc}{appendix}{\protect
        \numberline{\thechapter}#1}\else
      \addcontentsline{toc}{chapter}{#1}\fi
     \fi
   \chaptermark{#1}
   \addtocontents{lof}{\protect\addvspace{1pt}} % Adds between-chapter space
   \addtocontents{lot}{\protect\addvspace{1pt}} % to lists of figs & tables.
   \@makechapterhead{#2}
   \@afterheading         % Routine called after chapter and section heading.
}

%\def\@schapter#1{\@makeschapterhead{#1} \@afterheading}

\def\@schapter#1{
   \@makeschapterhead{#1} 
   \@afterheading         % Routine called after chapter and section heading.
}

\def\pchapter#1{%% A preliminary chapter
	% tuck 3/17/90: removed \thispagestyle; \chapter* handles page style.
	\chapter*{#1}
	\addcontentsline{toc}{chapter}{#1}
	\typeout{#1}
}

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

\def\section{\@startsection {section}{1}{\z@}{-3.5ex plus -1ex minus
    -.2ex}{2.3ex plus .2ex}{\Large\bf}}
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.25ex plus -1ex minus
   -.2ex}{1.5ex plus .2ex}{\large\bf}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus
   -1ex minus -.2ex}{1.5ex plus .2ex}{\normalsize\bf}}
\def\paragraph{\@startsection
     {paragraph}{4}{\z@}{3.25ex plus 1ex minus .2ex}{-1em}{\normalsize\bf}}
\def\subparagraph{\@startsection
     {subparagraph}{4}{\parindent}{3.25ex plus 1ex minus
     .2ex}{-1em}{\normalsize\bf}}

% Default initializations of \...mark commands.  (See below for their
% uses in defining page styles.
%

\def\chaptermark#1{}
% \def\sectionmark#1{}           % Preloaded definitions
% \def\subsectionmark#1{}
% \def\subsubsectionmark#1{}
% \def\paragraphmark#1{}
% \def\subparagraphmark#1{}

% The value of the counter secnumdepth gives the depth of the
% highest-level sectioning command that is to produce section numbers.
%

\setcounter{secnumdepth}{2}

% COPYRIGHT
%
%
% modified to suite CSD-HKUST.
%

\def\Copyright{
\typeout{Copyright}
\begin{center}
{Copyright \copyright\ by \@author \year}
\thepage{}
\end{center}
}

% Chan:
%	Add a new definition \candidate for the signature on the
%	authorization page.
\newlength{\AuthorNameLength}
\def\candidate#1{%
  \settowidth{\AuthorNameLength}{\expandafter{#1}}
  \addtolength{\AuthorNameLength}{6cm}
  \raisebox{-12pt}[0pt][17pt]{\rule{\AuthorNameLength}{.5pt}}\par
					% Print line.
  \raisebox{0pt}[0pt][0pt]{\expandafter{#1}}\par
					% Print name below.
}

% Authorization Page
%
% Added for authorisation
%
% cheewai

% Chan:
%	Make changes according to the guidelines released on March 2001.
%	"Authorsation" is changed to "Authorization" instead.
\def\authorise{
	\pchapter{Authorization}
%        \addcontentsline{toc}{chapter}{Authorisation Page}

    %\onehalfspace
	\mbox{}
	\par\indent
	{I hereby declare that I am the sole author of the thesis.}
	\par\vspace{1cm}
	\indent
%	{I authorise The Hong Kong University of Science and Technology to lend
	{I authorize the Hong Kong University of Science and Technology (Guangzhou) to lend
this thesis to other institutions or individuals for the purpose of scholarly
research.}
% Chan:
%	Keep each paragraph with equal distance.
%	\par\vspace{6cm}
	\par\vspace{1cm}
	\indent
%	{I further authorise The Hong Kong University of Science and Technology
	{I further authorize the Hong Kong University of Science and Technology (Guagnzhou)
to reproduce the thesis by photocopying or by other means, in total or in part,
at the request of other institutions or individuals for the purpose of
scholarly research.}
% Chan:
%	Add a signature part for the candidate.
	\par\vspace{4cm}
        \begin{center}
          \candidate{\@author}
          \today
        \end{center}
  	\textspaceundo
	\newpage
}

% Chan:
%	Add a new definition \TOffset for the extra vertical space
%	before the title.
\def\TOffset{ \mbox{} \vglue 6ex }

% tuck 4/4/90:
% Both abstract formats are acceptable to Duke, 
% as long as text of abstract is double spaced.

% ABSTRACT
%
%   - this produces pages suitable for a UW-Abstract
% tuck 4/4/90: to be acceptable to Duke, must double space;
% to avoid quad spacing main chapters, use \endabstract after body of abstract.
\def\abstract{
  \absdefinedtrue
  \typeout{Abstract}
  \newpage
  %\pagenumbering{arabic}
  %\setcounter{page}{1}
    \textspace
    \addcontentsline{toc}{chapter}{Abstract}
    \null
    \parskip=0pt
    \TOffset
    \begin{center}
      {\Lbi \expandafter{\@title} \par}
      \vglue 4ex
      {\lbi by \par}
      \vglue 2ex
      {\lbi \expandafter{\@author} \par}
      \vglue 4ex

      {\normalsize \@department\par}
      \vglue 2ex
      {\normalsize The Hong Kong University of Science and Technology (Guangzhou) \par}
      \vglue 10ex
      {\Lbi ABSTRACT \par\par\normalsize}
    \end{center}
    
}
% dfk 4/1/91: added \par to force end of paragraph before undoing
% double spacing
\def\endabstract{
 \par\textspaceundo
% \setcounter{footnote}{0}
}

%  UNIV. Microfilms abstract
% tuck 4/4/90:
% This creates a header with info required by UMI, but the header is redundant;
% all the required info is on the abstract title page Duke requires.
%
% tuck 4/4/90: to be acceptable to Duke, must double space;
% to avoid quad spacing main chapters, use \endabstract after body of abstract.
\def\UMIabstract{
	% tuck 3/17/90, replace "\titlepage\pagestyle{empty}" with next line,
	% so start with page 1 (not 0) and don't turn page numbers off forever.
	\abstractpage\thispagestyle{empty}
	% tuck 3/17/90: added next two lines (show Abstract in toc)
	\addcontentsline{toc}{chapter}{ABSTRACT}
	\typeout{UMIabstract}
	\textspace
	\begin{center}
		\def\thanks##1{} % temporarily kill any thanks lines
		{\large \expandafter{\@title} \par}
		{\large\lineskip .75em\begin{tabular}[t]{c}{\@author}\end{tabular}\par}
		{\large Under the supervision of Professor \@advisor \par}
		\vskip 1.5em
	\end{center}
}

% DEDICATION
%
\def\dedication{
  \pchapter{Dedication}
  \textspace
}

\def\enddedication{
    \par\textspaceundo
}

% Chan:
%	Make changes according to the guidelines released on March 2001.
%	"Acknowledgments" is used instead of "Acknowledgements".

%% ACKNOWLEDGEMENTS
% ACKNOWLEDGMENTS
%
% tuck 4/4/90: to be acceptable to Duke, must double space; to avoid
%% quad spacing main chapters, use \endacknowledgements after body of acks.
%\def\acknowledgements{
% quad spacing main chapters, use \endacknowledgments after body of acks.
\def\acknowledgments{
  \acknowdefinedtrue
  \pchapter{Acknowledgments}
  \textspace
}
% dfk 4/1/91: added \par to force end of paragraph before undoing
% double spacing
%\def\endacknowledgements{
\def\endacknowledgments{
  \par\textspaceundo
}

% BIOGRAPHY:
%
% dfk 10/7/89: biography is required, AFTER the references.
% I bet that it must also be double spaced, like the others. 
% dfk 2/4/91: nope, we're still in double-space mode from \chapters.
% Right way might be to have an \endchapters command.
\def\biography{
  \pchapter{Biography}
  \textspace
}
\def\endbiography{
  \textspaceundo
}

% Chan:
%	Define and initialize several \newif variables for handling errors.

\newif\ifaddlinedefined 
\newif\ifbodydefined 
\newif\iferrordefined 

\newif\iftitledefined 
\newif\ifacknowdefined 
\newif\iftocdefined 
\newif\iflofdefined 
\newif\iflotdefined 
\newif\ifabsdefined 

\addlinedefinedtrue
\bodydefinedfalse
\errordefinedfalse
\titledefinedfalse
\acknowdefinedfalse
\tocdefinedfalse
\lofdefinedfalse
\lotdefinedfalse
\absdefinedfalse

% Chan:
%	Add a new definition \CheckParts to check if the authors has
%	included all essential parts.
\def\CheckParts{
  \addlinedefinedfalse
  \iftitledefined \else
    \typeout{}
    \typeout{%
      Warning: No title page.  \noexpand\maketitle should be included.
    }
    \addlinedefinedtrue
  \fi
  \ifacknowdefined \else
    \typeout{}
    \typeout{%
      Warning: No acknowledgment page.
    }
    \addlinedefinedtrue
  \fi
  \iftocdefined \else
    \typeout{}
    \typeout{%
      Warning: No table of contents.  \noexpand\tableofcontents should
	be included.
    }
    \addlinedefinedtrue
  \fi
  \iflofdefined \else
    \typeout{}
    \typeout{%
      Warning: No list of figures.  \noexpand\listoffigures should
	be included.
    }
    \addlinedefinedtrue
  \fi
  \iflotdefined \else
    \typeout{}
    \typeout{%
      Warning: No list of tables.  \noexpand\listoftables should
	be included.
    }
    \addlinedefinedtrue
  \fi
  \ifabsdefined \else
    \typeout{}
    \typeout{%
      Warning: No abstract.
    }
    \addlinedefinedtrue
  \fi
  \ifaddlinedefined
    \typeout{}
    \iferrordefined \else
      \ShowSamplePath
      \errordefinedtrue
    \fi
  \fi
}

% CHAPTERS
%
%
\def\chapters{
% Chan:
  \bodydefinedtrue
  % Check if all the required parts are present.
  \CheckParts
  \newpage
  \parskip 6pt plus 1 pt minus 1pt
  \textspace
  \pagenumbering{arabic}
}

\def\endchapters{
	\textspaceundo
	\parskip=0pt
}

% APPENDIX
%
% The \appendix command must do the following:
%    -- reset the chapter counter to zero
%    -- set \@chapapp to Appendix (for messages)
%    -- redefine the chapter counter to produce appendix numbers
%    -- reset the section counter to zero
%    -- redefine the \chapter command if appendix titles and headings are
%       to look different from chapter titles and headings.

\def\appendix{\par
  \APPENDIXtrue
  \INAPPENDIXtrue
  \parskip 6pt plus 1pt minus 1pt
  \setcounter{chapter}{0}
  \setcounter{section}{0}
  \def\@chapapp{APPENDIX}
  \def\thechapter{\Alph{chapter}}}

\def\endappendix{
	\textspaceundo
	\parskip=0pt
}

%    ****************************************
%    *                LISTS                 *
%    ****************************************
%

% The following commands are used to set the default values for the list
% environment's parameters. See the LaTeX manual for an explanation of
% the meanings of the parameters.  Defaults for the list environment are
% set as follows.  First, \rightmargin, \listparindent and \itemindent
% are set to 0pt.  Then, for a Kth level list, the command \@listK is
% called, where 'K' denotes 'i', 'ii', ... , 'vi'.  (I.e., \@listiii is
% called for a third-level list.)  By convention, \@listK should set
% \leftmargin to \leftmarginK.
%
% For efficiency, level-one list's values are defined at top level, and
% \@listi is defined to set only \leftmargin.

\leftmargini 2.5em
\leftmarginii 2.2em     % > \labelsep + width of '(m)'
\leftmarginiii 1.87em   % > \labelsep + width of 'vii.'
\leftmarginiv 1.7em     % > \labelsep + width of 'M.'
\leftmarginv 1em
\leftmarginvi 1em

\leftmargin\leftmargini
\labelwidth\leftmargini\advance\labelwidth-\labelsep
\labelsep .5em
\parsep 5pt plus 2.5pt minus 1pt

\def\@listi{\leftmargin\leftmargini}

\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii\advance\labelwidth-\labelsep
   \topsep 5pt plus 2.5pt minus 1pt
   \parsep 2.5pt plus 1pt minus 1pt
   \itemsep \parsep}

\def\@listiii{\leftmargin\leftmarginiii
    \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
    \topsep 2.5pt plus 1pt minus 1pt
    \parsep \z@ \partopsep 1pt plus 0pt minus 1pt
    \itemsep \topsep}

\def\@listiv{\leftmargin\leftmarginiv
     \labelwidth\leftmarginiv\advance\labelwidth-\labelsep}

\def\@listv{\leftmargin\leftmarginv
     \labelwidth\leftmarginv\advance\labelwidth-\labelsep}

\def\@listvi{\leftmargin\leftmarginvi
     \labelwidth\leftmarginvi\advance\labelwidth-\labelsep}


%    ****************************************
%    *                LISTS                 *
%    ****************************************
%

% ENUMERATE
%  Enumeration is done with four counters: enumi, enumii, enumiii
%  and enumiv, where enumN controls the numbering of the Nth level
%  enumeration.  The label is generated by the commands \labelenumi
%  ... \labelenumiv.  The expansion of \p@enumN\theenumN defines the
%  output of a \ref command.

\def\labelenumi{\arabic{enumi}.}
\def\theenumi{\arabic{enumi}}

\def\labelenumii{(\alph{enumii})}
\def\theenumii{\alph{enumii}}
\def\p@enumii{\theenumi}

\def\labelenumiii{\roman{enumiii}.}
\def\theenumiii{\roman{enumiii}}
\def\p@enumiii{\theenumi(\theenumii)}

\def\labelenumiv{\Alph{enumiv}.}
\def\theenumiv{\Alph{enumiv}}
\def\p@enumiv{\p@enumiii\theenumiii}

% ITEMIZE
% Itemization is controlled by four commands: \labelitemi, \labelitemii,
% \labelitemiii, and \labelitemiv, which define the labels of the various
% itemization levels.

\def\labelitemi{$\bullet$}
\def\labelitemii{\bf --}
\def\labelitemiii{$\ast$}
\def\labelitemiv{$\cdot$}


% VERSE
%   The verse environment is defined by making clever use of the
%   list environment's parameters.  The user types \\ to end a line.
%   This is implemented by \let'in \\ equal \@centercr.
%
\def\verse{\let\\=\@centercr
  \list{}{\itemsep\z@ \itemindent -1.5em\listparindent \itemindent
          \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse\endlist

% QUOTATION
%   Fills lines
%   Indents paragraph
%
\def\quotation{\list{}{\listparindent 1.5em
    \itemindent\listparindent
    \rightmargin\leftmargin\parsep 0pt plus 1pt}\item[]}
\let\endquotation=\endlist

% QUOTE -- same as quotation except no paragraph indentation,
%
\def\quote{\list{}{\rightmargin\leftmargin}\item[]}
\let\endquote=\endlist

% DESCRIPTION
%
%  To change the formatting of the label, you must redefine
%  \descriptionlabel.

\def\descriptionlabel#1{\hspace\labelsep \bf #1}
\def\description{\list{}{\labelwidth\z@ \itemindent-\leftmargin
       \let\makelabel\descriptionlabel}}

\let\enddescription\endlist

\newdimen\descriptionmargin
\descriptionmargin=3em

%    ****************************************
%    *         OTHER ENVIRONMENTS           *
%    ****************************************
%
%
% THEOREM
% \@begintheorem ... \@endtheorem are the commands executed at the
% beginning and end of a (user-defined) theorem-like environment.
%
%\def\@begintheorem#1#2{\it \trivlist \item[\hskip \labelsep{\bf #1\ #2}]}
% changed by WU,Zhaojun. No italic font needed!
\def\@begintheorem#1#2{\trivlist \item[\hskip \labelsep{\bf #1\ #2}]}

\def\@endtheorem{\endtrivlist}

% EQUATION and EQNARRAY -- must follow \chapter definition
%
% \newcounter{equation}
%
\@addtoreset{equation}{chapter}   % Makes \chapter reset 'equation' counter.

\def\theequation{\thechapter.\arabic{equation}}

% \jot = 3pt      % Extra space added between lines of an eqnarray environment

% The macro \@eqnnum defines how equation numbers are to appear in equations.
%
% \def\@eqnnum{(\theequation)}
%


% TITLEPAGE
%  In the normal environments, the titlepage environment does nothing but
%  start and end a page, and inhibit page numbers.  It also resets the
%  page number to zero.
%\def\titlepage{\newpage\thispagestyle{empty}\c@page\z@}
\def\titlepage{\newpage\thispagestyle{empty}}

\def\endtitlepage{\newpage}
% defeat the setting to 0 of the page number for abstract pages.
\def\abstractpage{\newpage}

\def\endabstractpage{\newpage}
% CODE
%  The code environment is essentially a 'quote'd verbatim environment.
%     \begin{code} ... \end{code}
%          ==>  {\quote\verbatim ... \endverbatim\endquote}
%  Page breaks are discouraged by \interlinepenalty=150.
%
\begingroup \catcode `|=0 \catcode `[=1
\catcode`]=2 \catcode`\{=12 \catcode `\}=12
%\catcode`\\=12 |gdef|@xcode#1\end{code}[#1|end[code]]
\catcode`\\=12 |gdef|@xcode#1[#1|end[code]]
|endgroup
\def\code{\par\list{}{\parskip 0pt plus 1pt\normalbaselines\interlinepenalty=150}\item[]\@verbatim\frenchspacing\@vobeyspaces\@xcode}
\def\endcode{\endtrivlist\endlist}

% PROC
%  The proc environment is a 'quoted' tabbing environment with tabs set
%  at fixed distances
%  Page breaks are discouraged by \interlinepenalty=150.
%
\def\proctabs{\qquad\=\qquad\=\qquad\=\qquad\=\qquad\=\qquad\=\qquad\=\kill}
\newenvironment{proc}{\quote\interlinepenalty=150\relax\tt\tabbing\proctabs}{\endtabbing\endquote\leavevmode}

% ARRAY AND TABULAR
%

\arraycolsep 5pt     % Half the space between columns in an array environment.
\tabcolsep 6pt       % Half the space between columns in a tabular environment.
\arrayrulewidth .4pt % Width of rules in array and tabular environment.
\doublerulesep 2pt   % Space between adjacent rules in array or tabular env.

% TABBING
%
\tabbingsep \labelsep   % Space used by the \' command.  (See LaTeX manual.)

% MINIPAGE
%  \@minipagerestore is called upon entry to a minipage environment to
%  set up things that are to be handled differently inside a minipage
%  environment. In the current styles, it does nothing.
%
% \skip\@mpfootins : plays same role for footnotes in a minipage as
%                    \skip\footins does for ordinary footnotes

\skip\@mpfootins = \skip\footins

% FRAMEBOX
%
\fboxsep = 3pt    % Space left between box and text by \fbox and \framebox.
\fboxrule = .4pt  % Width of rules in box made by \fbox and \framebox.

%    ****************************************
%    *         TABLE OF CONTENTS, ETC.      *
%    ****************************************
%
% A \subsection command writes a
%       \contentsline{subsection}{TITLE}{PAGE}
% command on the .toc file, where TITLE contains the contents of the
% entry and PAGE is the page number.  If subsections are being numbered,
% then TITLE will be of the form
%       \numberline{NUM}{HEADING}
% where NUM is the number produced by \thesubsection.  Other sectioning
% commands work similarly.
%
% A \caption command in a 'figure' environment writes
%    \contentsline{figure}{\numberline{NUM}{CAPTION}}{PAGE}
% on the .lof file, where NUM is the number produced by \thefigure and
% CAPTION is the figure caption.  It works similarly for a 'table' environment.
%
% The command \contentsline{NAME} expands to \l@NAME.  So, to specify
% the table of contents, we must define \l@chapter, \l@section,
% \l@subsection, ... ; to specify the list of figures, we must define
% \l@figure; and so on.  Most of these can be defined with the
% \@dottedtocline command, which works as follows.
%
% \@dottedtocline{LEVEL}{INDENT}{NUMWIDTH}{TITLE}{PAGE}
%    LEVEL    : An entry is produced only if LEVEL < or = value of
%               'tocdepth' counter.  Note, \chapter is level 0, \section
%               is level 1, etc.
%    INDENT   : The indentation from the outer left margin of the start of
%               the contents line.
%    NUMWIDTH : The width of a box in which the section number is to go,
%               if TITLE includes a \numberline command.
%
% This command uses the following three parameters, which are set
% with a \def (so em's can be used to make them depend upon the font).
%   \@pnumwidth : The width of a box in which the page number is put.
%   \@tocrmarg  : The right margin for multiple line entries.  One
%                 wants \@tocrmarg > or = \@pnumwidth
%   \@dotsep    : Separation between dots, in mu units.  Should be \def'd to
%                 a number like 2 or 1.7

\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{2}


% TABLEOFCONTENTS
%
\def\tableofcontents{
% Chan:
%	Set \tocdefined to be true.
  \tocdefinedtrue
  \normalbaselines
\thispagestyle{empty}
  % tuck 3/17/90: deleted \thispagestyle; redundant, \chapter* does page style.
  %\chapter*{Table of Contents}
  \addcontentsline{toc}{chapter}{Table of Contents} 
  \vspace*{0pt}                     % Space at top of page.
  { \begin{center}
    {\Lbi                        % Title.
    \uppercase{Table of Contents}\par}
    \end{center}
    \nobreak                         % TeX penalty to prevent page break.
%    \vskip 40pt                      % Space between title and text.
  } 
  \typeout{Table of Contents}
  \markboth{CONTENTS}{CONTENTS}
  \@starttoc{toc}
}

\def\l@chapter#1#2{\pagebreak[3]
   \vskip 1.0em plus 1pt  % space above chapter line
   \@tempdima 1.5em       % width of box holding chapter number
   \begingroup
     \parindent \z@ \rightskip \@pnumwidth
     \parfillskip -\@pnumwidth
     \bf                  % Boldface.
     \leavevmode          % TeX command to enter horizontal mode.
     #1\hfil \hbox to\@pnumwidth{\hss #2}\par
   \endgroup}

\def\l@appendix#1#2{\pagebreak[3]
   \vskip 1.0em plus 1pt  % space above chapter line
   \@tempdima 1.5em       % width of box holding chapter number
   \begingroup
     \parindent \z@ \rightskip \@pnumwidth
     \parfillskip -\@pnumwidth
     \hglue 1.7em
     \bf                  % Boldface.
     \leavevmode          % TeX command to enter horizontal mode.
     #1\hfil \hbox to\@pnumwidth{\hss #2}\par
   \endgroup}

\def\l@section{\@undottedtocline{1}{0em}{1.7em}}
\def\l@subsection{\@undottedtocline{2}{2em}{2.5em}}
\def\l@subsubsection{\@undottedtocline{3}{5em}{3.5em}}
\def\l@paragraph{\@undottedtocline{4}{8em}{4.5em}}
\def\l@subparagraph{\@undottedtocline{5}{10em}{5.5em}}

% LIST OF FIGURES
%
\def\listoffigures{
% Chan:
  %	Set \lofdefined to be true.
  \typeout{LOF 1}
  \lofdefinedtrue
  \typeout{LOF 2}
  \normalbaselines
  \typeout{LOF 3}
  \pchapter{List of Figures}
  \typeout{LOF 4}
  \markboth{LIST OF FIGURES}{LIST OF FIGURES}
  \typeout{LOF 5}
  \@starttoc{lof}
  \typeout{LOF 6}
}

%
% Explicitly uses undottedtocline instead of the aliases dottedtocline.
% cheewai
%

\def\l@figure{\@undottedtocline{1}{1.5em}{2.3em}}

% LIST OF TABLES
%
\def\listoftables{
% Chan:
%	Set \lotdefined to be true.
  \lotdefinedtrue
	\normalbaselines
	\pchapter{List of Tables}
	\markboth{LIST OF TABLES}{LIST OF TABLES}
	\@starttoc{lot}
}

\let\l@table\l@figure


% GREMLIN
%
%  \Gremlin{includefile}{width}{height}{F/E}
%     Warning: ignoring the Flyback/End option
%
\def\Gremlin#1#2#3#4{
	\leavevmode\hbox to #2{\vbox to #3{\special{#1}\vfil}\hfil}
}

%    ****************************************
%    *             BIBLIOGRAPHY             *
%    ****************************************
%
\renewcommand{\bibname}{BIBLIOGRAPHY}
%  TEMPORARY DEFINITIONS:

\def\thebibliography#1{
% Chan:
%	Output "References" (for consistence).
  \typeout{References}
  \chapter*{References\markboth{REFERENCES}{REFERENCES}}
  \list{[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep\usecounter{enumi}}
  \addcontentsline{toc}{chapter}{References}
  \def\newblock{\hskip .11em plus .33em minus -.07em}
  \sloppy
  \sfcode`\.=1000\relax
}


\let\endthebibliography=\endlist

% \def\@biblabel#1{[#1]\hfill}  % Produces the label for a \bibitem[...]
                                % command.
% \def\@cite#1{[#1]}            % Produces the output of the \cite command.


%    ****************************************
%    *              THE INDEX               *
%    ****************************************
%
% THE INDEX ENVIRONMENT
% Produces double column format, with each paragraph a separate entry.
% The user commands \item, \subitem and \subsubitem are used to
% produce the entries, and \indexspace adds an extra vertical space
% that's the right size to put above the first entry with a new letter
% of the alphabet.

\def\theindex{
\columnseprule \z@
\columnsep 35pt\twocolumn[\@makeschapterhead{Index}]
    \markboth{INDEX}{INDEX}\thispagestyle{plain}\parindent\z@
    \parskip\z@ plus .3pt\relax\let\item\@idxitem}

\def\@idxitem{\par\hangindent 40pt}

\def\subitem{\par\hangindent 40pt \hspace*{20pt}}

\def\subsubitem{\par\hangindent 40pt \hspace*{30pt}}

\def\endtheindex{\onecolumn}

\def\indexspace{\par \vskip 10pt plus 5pt minus 3pt\relax}

%    ****************************************
%    *             FOOTNOTES                *
%    ****************************************
%
% \footnoterule is a macro to draw the rule separating the footnotes from
% the text.  It should take zero vertical space, so it needs a negative
% skip to compensate for any positive space taken by the rule.  (See
% PLAIN.TEX.)

\def\footnoterule{\kern-1\p@
  \hrule width .4\columnwidth
  \kern .6\p@}                 % The \hrule has default height of .4pt .

% \newcounter{footnote}
\@addtoreset{footnote}{chapter}  % Numbers footnotes within chapters

%   \@makefntext{NOTE} :
%        Must produce the actual footnote, using \@thefnmark as the mark
%        of the footnote and NOTE as the text.  It is called when effectively
%        inside a \parbox of width \columnwidth (i.e., with \hsize =
%        \columnwidth).  The following macro indents
%        all lines of the footnote by 10pt, and indents the first line of
%        a new paragraph by 1em.  To change these dimensions, just substitute
%        the desired value for '10pt' [in both places] or '1em'.
%        The mark is flushright against the footnote.
%
%        It is much easier to write a macro in which the footnote text is
%        set like an ordinary text paragraph, with no indentation except
%        on the first line of a paragraph, and the first line of the
%        footnote.  In that case, all the macro must do is set \parindent
%        to the appropriate value for succeeding paragraphs and put the
%        proper indentation before mark.

\long\def\@makefntext#1{\@setpar{\@@par\@tempdima \hsize
  \advance\@tempdima-10pt\parshape \@ne 10pt \@tempdima}\par
  \parindent 1em\noindent \hbox to \z@{\hss$^{\@thefnmark}$}#1}


% \@makefnmark : A macro to generate the footnote marker that goes
%    in the text.  Default used.
%


%    ****************************************
%    *         FIGURES AND TABLES           *
%    ****************************************
%
% Float placement parameters.  See LaTeX manual for their definition.
%
\setcounter{topnumber}{2}
\def\topfraction{.7}
\setcounter{bottomnumber}{1}
\def\bottomfraction{.3}
\setcounter{totalnumber}{3}
\def\textfraction{.2}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}

%
% fix a BUG? in latex.tex
%
\let\@@addtocurcol\@addtocurcol
\def\@addtocurcol{{\@floatplacement\@@addtocurcol}}

% \@makecaption{NUMBER}{TEXT} : Macro to make a figure or table caption.
%      NUMBER : Figure or table number--e.g., 'Figure 3.2'
%      TEXT   : The caption text.
%  Macro should be called inside a \parbox of right width, with \normalsize.

\long\def\@makecaption#1#2{
   \vskip 10pt
   \setbox\@tempboxa\hbox{#1: #2}
   \ifdim \wd\@tempboxa >\hsize   % IF longer than one line:
       \unhbox\@tempboxa\par      %   THEN set as ordinary paragraph.
     \else                        %   ELSE  center.
       \hbox to\hsize{\hfil\box\@tempboxa\hfil}
   \fi}

% To define a float of type TYPE (e.g., TYPE = figure), the document style
% must define the following.
%
%  \fps@TYPE   : The default placement specifier for floats of type TYPE.
%
%  \ftype@TYPE : The type number for floats of type TYPE.  Each TYPE has
%                associated a unique positive TYPE NUMBER, which is a power
%                of two.  E.g., figures might have type number 1, tables type
%                number 2, programs type number 4, etc.
%
%  \ext@TYPE   : The file extension indicating the file on which the
%                content<s list for float type TYPE is stored.  For example,
%                \ext@figure = 'lof'.
%
%  \fnum@TYPE  : A macro to generate the figure number for a caption.
%                For example, \fnum@TYPE == Figure \thefigure.
%
%  The actual float-making environment commands--e.g., the commands
%  \figure and \endfigure--are defined in terms of the macros \@float
%  and \end@float, which are described below.
%
%  \@float{TYPE}[PLACEMENT] : Macro to begin a float environment for a
%     single-column float of type TYPE with PLACEMENT as the placement
%     specifier.  The default value of PLACEMENT is defined by \fps@TYPE.
%     The environment is ended by \end@float.
%     E.g., \figure == \@float{figure}, \endfigure == \end@float.


% FIGURE

%\newcounter{figure}[chapter]
%\def\thefigure{\thechapter.\@arabic\c@figure}

%
% Uses article's figure and table numbering.
%

% Chan:
%   Use default numbering of figures in report class; otherwise the
%   figure number will be reset in each new chapter.
%\newcounter{figure}
%\def\thefigure{\@arabic\c@figure}

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{Figure \thefigure}
\def\figure{\@float{figure}}
\let\endfigure\end@float
\@namedef{figure*}{\@dblfloat{figure}}
%\@namedef{endfigure*}{\end@dblfloat}

% TABLE
%
% Uses article's table and figure numbering.
%

%\newcounter{table}[chapter]
%\def\thetable{\thechapter.\@arabic\c@table}

% Chan:
%   Use default numbering of figures in report class; otherwise the
%   figure number will be reset in each new chapter.
%\newcounter{table}
%\def\thetable{\@arabic\c@table}

\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{Table \thetable}
\def\table{\@float{table}}
\let\endtable\end@float
\@namedef{table*}{\@dblfloat{table}}
%\@namedef{endtable*}{\end@dblfloat}

%    ****************************************
%    *         TITLE AND ABSTRACT           *
%    ****************************************

% Chan:
%	Add the definitions of the higher degrees.
\def\MA{\gdef\@DegreeFName{Master of Arts} \gdef\@DegreeSName{MA\ }}
\def\MSc{\gdef\@DegreeFName{Master of Science} \gdef\@DegreeSName{MSc\ }}
\def\MPhil{%
  \gdef\@DegreeFName{Master of Philosophy} \gdef\@DegreeSName{MPhil\ }
}
\def\PhD{%
  \gdef\@DegreeFName{Doctor of Philosophy} \gdef\@DegreeSName{PhD\ }
}
\def\@DegreeFName{ ??DEGREE?? }
\def\@DegreeSName{ ??MPhil or PhD?? }

% \degree{degree name} -- used macro to declare the name of the degree.
% Chan:
%	Add error handling routine to \degree.
%\def\degree#1{\gdef\@degree{#1}}
\newif\ifdegreedefined 
\def\degree#1{#1 \gdef\@degree{\@DegreeFName} \degreedefinedtrue}
\degreedefinedfalse

% Lo, 20230510:
%	Add the definitions of the higher degrees.
\def\PQE{\gdef\@StageFName{PQE Survey\ } \PQEtrue}
\def\Proposal{\gdef\@StageFName{Proposal\ } \Proposaltrue}
\def\Thesis{\gdef\@StageFName{Thesis\ } \Thesistrue}
\def\@StageFName{ ??STAGE?? }

% \degree{degree name} -- used macro to declare the name of the degree.
% Chan:
%	Add error handling routine to \degree.
%\def\degree#1{\gdef\@degree{#1}}
\newif\ifstagedefined 
\def\stage#1{#1 \gdef\@stage{\@StageFName} \degreedefinedtrue}
\degreedefinedfalse

% \department{department name} -- user macro to declare name of department.
% Chan:
%	Add error handling routine to \department.
%\def\department#1{\gdef\@department{#1}}
\newif\ifdeptdefined 
\def\department#1{\gdef\@department{#1} \deptdefinedtrue}
\department{??DEPARTMENT??}
\deptdefinedfalse

% \subject{subject name} -- user macro to declare subject. This is
% used on the abstract title page. Eg, {Chemistry --- Organic}
% For Computer Science, there is only one official subject, ``Computer
% Science''. List is in the UMI document, ``Publishing your
% dissertation'', obtained from the graduate school.
% Chan:
%	Add error handling routine to \subject.
% \def\subject#1{\gdef\@subject{#1}}
\newif\ifsubjectdefined 
\def\subject#1{\gdef\@subject{#1} \subjectdefinedtrue}
\subject{??SUBJECT??}
\subjectdefinedfalse

% \advisor{advisor name} -- user macro to declare name of advisor/supervisor.
% Chan:
%	Add error handling routine to \advisor.
%\def\advisor#1{\gdef\@advisor{#1}}
\newif\ifadvisordefined 
\def\advisor#1{\gdef\@advisor{#1} \advisordefinedtrue}
\advisor{??ADVISOR??}
\advisordefinedfalse

% Chan:
%     Add a new definition for the co-adviosr.
\def\coadvisor#1{\member{#1, Thesis Supervisor}}

% Set default values for department name, advisor name, and current year, and
% the degree name.

% Chan:
%	Disable the following as all of default values have been
%	defined above.
%\department{??DEPARTMENT??}
%\advisor{??ADVISOR??}
%\subject{??SUBJECT??}
%\degree{??DEGREE??}
%\date{\number\year}

% The macros and counters between here and the definition of \maketitle help 
% \maketitle handle the signature lines.

% \@member{member name} -- internal macro to print a line to sign on, and the
%	name of a committee member (sole argument) below the line.
\newcommand{\@member}[1]{
  \textspace
  \raisebox{-8pt}[0pt][17pt]{\rule{5in}{.5pt}}\par	% Print line.
%  \raisebox{-8pt}[0pt][17pt]{\rule{\maxmem}{.5pt}}\par	% Print line.
  \raisebox{0pt}[0pt][0pt]{\expandafter{#1}}\par	% Print member name below.
  \textspaceundo
  \vglue 6ex
}

\newlength{\maxmem}	       	% Max length of member text
\newlength{\currmem}		% Length of the current member text
\newcounter{@members}		% Number of member macros defined so far.
% Chan:
%	Make changes according to the guidelines released on March 2001.
%\newcommand{\@membera}{\@member{\@advisor, Supervisor}}
%\setcounter{@members}{1}	% Advisor is always 1st member
%\settowidth{\maxmem}{\uppercase\expandafter{\@advisor, Supervisor}}
\newcommand{\@membera}{\@member{\@advisor, Thesis Supervisor}}
\setcounter{@members}{1}	% Advisor is always 1st member
\settowidth{\maxmem}{\expandafter{\@advisor, Thesis Supervisor}}

% @minmembers -- holds mimumum number of member macros needed.  It is set in
% \maketitle.
\newcounter{@minmembers}

% \member{member name} -- user macro to declare the name of a committee member.
%	May be used up to 7 times.  Should not be used for advisor.
\newcommand{\member}[1]{
  \addtocounter{@members}{1}	% Inc. num of members to include this new one.
  \ifcase\value{@members} 
    \typeout{Thesis format internal error.  Too few committee members.} \or
    \typeout{Thesis format internal error.  Advisor left off committee.} \or
    \newcommand{\@memberb}{\@member{#1}} \or
    \newcommand{\@memberc}{\@member{#1}} \or
    \newcommand{\@memberd}{\@member{#1}} \or
    \newcommand{\@membere}{\@member{#1}} \or
    \newcommand{\@memberf}{\@member{#1}} \or
    \newcommand{\@memberg}{\@member{#1}} \or
    \newcommand{\@memberh}{\@member{#1}} 
  \else
    \typeout{Error using thesis format.  Too many committee members.}
  \fi

%
% Works out the maximum length of member text. This is used to draw the
% signature line for all members.
%

  \ifnum\value{@members} < 8
    \settowidth{\currmem}{\expandafter{#1}}
    \ifdim\currmem > \maxmem
      \setlength{\maxmem}{\currmem}
    \fi
  \fi
}

% Chan:
%	Add a new definition \ShowSamplePath to show the path where
%	a sample file can be found.
\def\ShowSamplePath{
  \typeout{+-------------------------------------------------------------------}
  \typeout{| For usage of the class, please refer to the following sample file:}
%  \typeout{| /usr/local/share/texmf/tex/latex/local/ustthesis_test.tex}
  \typeout{| /homes/kchan/pub/latex/ustthesis_test.tex}
  \typeout{+-------------------------------------------------------------------}
  \typeout{}
}

% Chan:
%	Add a new definition \CheckDefinitions to check if all
%	essential definitions exist.
\def\CheckDefinitions{
  \addlinedefinedfalse
  \ifdegreedefined \else
    \typeout{}
    \typeout{%
      Warning: \noexpand\degree{ \noexpand\MA or \noexpand\MSc or
	\noexpand\MPhil or \noexpand\PhD} not yet defined.
    }
    \addlinedefinedtrue
  \fi
  \ifdeptdefined \else
    \typeout{}
    \typeout{%
      Warning: \noexpand\department{Department Name} not yet defined.
    }
    \addlinedefinedtrue
  \fi
  \ifsubjectdefined \else
    \typeout{}
    \typeout{%
      Warning: \noexpand\subject{Subject Name} not yet defined.
    }
    \addlinedefinedtrue
  \fi
  \ifadvisordefined \else
    \typeout{}
    \typeout{%
      Warning: \noexpand\advisor{Prof. Name} not yet defined.
    }
    \addlinedefinedtrue
  \fi
  %   Check if \depthead and \defencedate have been defined.
  \ifdheaddefined \else
    \typeout{}
    \typeout{%
      Warning: \noexpand\depthead{Prof. Name} not yet defined.
    }
    \member{Prof. ???, Head of Thrust}
    \addlinedefinedtrue
  \fi
  \ifdatedefined \else
    \typeout{}
    \typeout{%
      Warning: \noexpand\defencedate{year}{month}{day} not yet defined.
      Use \noexpand\today instead.
    }
    \addlinedefinedtrue
  \fi
  \ifaddlinedefined
    \typeout{}
    \iferrordefined \else
      \ShowSamplePath
      \errordefinedtrue
    \fi
  \fi
}

%% -- Changed for the new style info 31 August 87 by CRM
%% 
%% Define an abstract macro to provide an abstract page that exactly
%% duplicates the title page, EXCEPT for the words ``an abstract'' vice
%% ``a dissertation.''
%%
%% Changed by DFK 10/7/90 to put ABSTRACT at the top of the abstract
%% title page, as well as ``(Computer Science)''. 
%%
\def\maketitle{		% Define macro to print title page.
% Chan:
%	Check if all the definitions have been defined.
  \CheckDefinitions
  \titledefinedtrue
  \typeout{Title page}
  \begin{titlepage}
    \textspace
%    \let\footnotesize\small % Local definitions to make \thanks produce
%    \let\footnoterule\relax % \normalsize footnotes with no separating rule.
 %   \setcounter{page}{1}
    \null
    \parskip=0pt
% Chan:
%	Add certain vertical space before the title.
    \TOffset
    \begin{center}
      {\Lbi \expandafter{\@title} \par}
% Chan:
%	Make changes according to the guidelines released on March 2001.
%      \vglue 8ex
%      {\lbi BY \par}
%      \vglue 8ex
      \vglue 10ex
      {\lbi by \par}
      \vglue 2ex
      {\lbi \expandafter{\@author} \par\par}
% Chan:
%	Make changes according to the guidelines released on March 2001.
%      \vglue 8ex
%      {\normalsize A Thesis Presented to \par}
      \vglue 10ex
      {\normalsize A \@StageFName Submitted to \par}
      {\normalsize The Hong Kong University of Science and Technology (Guangzhou)\par}
% Chan:
%	Make changes according to the guidelines released on March 2001.
%      {\normalsize in Partial Fulfillment\par}
%      {\normalsize of the Requirements for\par}
%      {\normalsize the Degree of \@degree\par}
      {\normalsize in Partial Fulfillment of the Requirements for\par}
      {\normalsize the Degree of \@DegreeFName\par}
%    \ifAM
%      {\normalsize Master of Arts\par}
%    \else
%      \ifMS
%        {\normalsize Master of Science\par}
%      \else
%        \ifPhD
%          {\normalsize Doctor of Philosophy\par}
%        \else
%          {\normalsize Master of Philosophy\par}
%        \fi 
%      \fi
%    \fi
% Chan:
%	The following should be \@subject instead.
%     {\normalsize in \@department\par}
%      \vglue 7em
     {\normalsize in \@subject\par}
     \vglue 6ex
% Chan:
%	Make changes according to the guidelines released on March 2001.
%      {\normalsize Hong Kong, \space\mon\space\number\year\par}
      {\normalsize \space\mon\space\number\year, Guangzhou\par}
      \vglue 12ex plus 1fill
      {\normalsize \Copyright}
    \end{center}
    \addcontentsline{toc}{chapter}{Title Page}
    \newpage

% End of Page 1
\ifThesis
    \authorise

% End of Page 2

%    \let\footnotesize\small % Local definitions to make \thanks produce
%    \let\footnoterule\relax % \normalsize footnotes with no separating rule.
    %    \setcounter{page}{0}
    \typeout{Signature Page}
    \textspace
    \null
    \parskip=0pt
%    \ifPhD
      \setcounter{@minmembers}{8} % PhD committees have at least 5 members
%    \else
%      \setcounter{@minmembers}{3} % Masters committees have at least 3 members
%    \fi
% Chan:
%	Add certain vertical space before the title.
      \TOffset
    \begin{center}
      {\Lbi \expandafter{\@title} \par}
      
% Chan:
%	Make changes according to the guidelines released on March 2001.
%      \vglue 8ex
%      {\lbi BY \par}
%      \vglue 8ex
      \vglue 6ex
      {\lbi by \par}
      \vglue 2ex
             {\lbi \expandafter{\@author} \par}
% Chan:
%	Extend the centering environment for the whole page.
%    \end{center}
        \vglue 6ex
% Chan:
%	Make changes according to the guidelines released on March 2001.
    {\normalsize This is to certify that I have examined the above \@DegreeSName thesis\par}
    {\normalsize and have found that it is complete and satisfactory in all respects,\par}
    {\normalsize and that any and all revisions required by\par}
    {\normalsize the thesis examination committee have been made.\par}
%    \begin{flushleft}
    \vglue 0ex plus 1fill
%    \parbox{0.75\textwidth}{
%    \parbox{5in}{
      {	% @membersprinted counts the number of committee members printed so far
 	\newcounter{@membersprinted}\setcounter{@membersprinted}{0}
 	% Print the committee members defined by the user.
 	\loop
 	\ifnum \value{@membersprinted} < \value{@members} 
 	  \addtocounter{@membersprinted}{1}
 	  \ifcase\value{@membersprinted}
 	    \typeout{Thesis style--internal error printing members.} \or
 	    \@membera \or
 	    \@memberb \or
 	    \@memberc \or
 	    \@memberd \or
 	    \@membere \or
 	    \@memberf \or
 	    \@memberg \or
 	    \@memberh
 	  \else \typeout{Thesis style--internal error printing members.}
 	  \fi
 	\repeat
	% If the minimum number of signature lines haven't been printed,
	% print some more.
%	\loop
%	\ifnum \value{@membersprinted} < \value{@minmembers}
%	  \addtocounter{@membersprinted}{1}
%	  \@member{}
        %	\repeat
      }
 %   }
    \par
    {\normalsize \@department\par}
%    \vglue 3ex plus 1fill
    {\normalsize \today\par}
%   {\normalsize Date:\hfill\rule[-.4ex]{2.35in}{.5pt}}
%    }\hfill\par
%    \end{flushleft}
% Chan:
%	Move \end{center} from above position to here.
    \end{center}
    \addcontentsline{toc}{chapter}{Signature Page}
    \textspaceundo
    \newpage
\fi
  \end{titlepage}

%
% End of TitlePage
%

  \setcounter{footnote}{0} % Footnotes start at zero again.
  \let\maketitle\relax % only ONCE!?
}
%% Makeabstract command
\def\makeabstract{		% Define macro to print title page.
  \typeout{Abstract}
  \begin{abstractpage}
%    \let\footnotesize\small % Local definitions to make \thanks produce
%    \let\footnoterule\relax % \normalsize footnotes with no separating rule.
    \null
    \parskip=0pt
% Chan:
%	Add certain vertical space before the title.
    \TOffset
    \begin{center}
 %     {\Lbi \uppercase\expandafter{\@title} \par}
 %     \vglue 4ex
% Chan:
%	Make changes according to the guidelines released on March 2001.
%      {\lbi BY \par}
%      \vglue 4ex
 %     {\lbi by \par}
 %     \vglue 2ex
 %     {\lbi \uppercase\expandafter{\@author} \par}
%      \vglue 6ex
 %     \vglue 4ex
% Chan:
%	Make changes according to the guidelines released on March 2001.
%%      {\normalsize A Thesis Presented to \dotfill\par}
%      {\normalsize A Thesis Submitted to \dorfill\par}
%      \vglue 8ex
%      {\normalsize Hong Kong \mon\space\number\year\par}
%      \vglue 10ex
 %     {\normalsize Department of \@department\par}
 %     {\normalsize The Hong Kong University of Science and Technology \par}
 %     \vglue 4ex
      {\Lbi ABSTRACT \par\par\normalsize}
    \end{center}
  \end{abstractpage}
  \setcounter{footnote}{0} % Footnotes start at zero again.
  \let\makeabstract\relax % only ONCE!?
  \addcontentsline{toc}{chapter}{Abstract}
  \textspace
}
%% End of the make abstract

% Old junk; probably should be deleted.
%\def\Type#1{\gdef\@Type{#1}}
%\Type{Dissertation}

%    ****************************************
%    *            PAGE STYLES               *
%    ****************************************
%
% The page style 'foo' is defined by defining the command \ps@foo.  This
% command should make only local definitions.  There should be no stray
% spaces in the definition, since they could lead to mysterious extra
% spaces in the output.
%
% The \ps@... command defines the macros \@oddhead, \@oddfoot,
% \@evenhead, and \@evenfoot to define the running heads and
% feet---e.g., \@oddhead is the macro to produce the contents of the
% heading box for odd-numbered pages.  It is called inside an \hbox of
% width \textwidth.
%
% To make headings determined by the sectioning commands, the page style
% defines the commands \chaptermark, \sectionmark, ... , where
% \chaptermark{TEXT} is called by \chapter to set a mark, and so on.
% The \...mark commands and the \...head macros are defined with the
% help of the following macros.  (All the \...mark commands should be
% initialized to no-ops.)
%
% MARKING CONVENTIONS:
% LaTeX extends TeX's \mark facility by producing two kinds of marks
% a 'left' and a 'right' mark, using the following commands:
%     \markboth{LEFT}{RIGHT} : Adds both marks.
%     \markright{RIGHT}      : Adds a 'right' mark.
%     \leftmark  : Used in the \@oddhead, \@oddfoot, \@evenhead or \@evenfoot
%                  macro, gets the current 'left'  mark.  Works like TeX's
%                  \botmark command.
%     \rightmark : Used in the \@oddhead, \@oddfoot, \@evenhead or \@evenfoot
%                  macro, gets the current 'right'  mark.  Works like TeX's
%                  \firstmark command.
% The marking commands work reasonably well for right marks 'numbered
% within' left marks--e.g., the left mark is changed by a \chapter command and
% the right mark is changed by a \section command.  However, it does
% produce somewhat anomalous results if two \bothmark's occur on the same page.
%

\mark{{}{}}   % Initializes TeX's marks

\def\ps@empty{\def\@oddhead{\versiontag\hfil} \def\@oddfoot{}
\def\@evenhead{\versiontag\hfil}\def\@evenfoot{}}

%
% Definiton of 'plain' page style.
%   This page style is used on 2nd and subsequent pages of a chapter

\def\ps@plain{%
%\def\@oddhead{\versiontag\hfil\rm\thepage}
\def\@oddhead{}
\def\@oddfoot{\hfil\thepage\hfil}
\let\@evenhead\@oddhead
\let\@evenfoot\@oddfoot}

% Definition of 'headings' page style
%  Note the use of ##1 for parameter of \def\chaptermark inside the
%  \def\ps@headings.
%

%%% \newdimen\shortpage % text height of a chapter page
%%% \newbox\mybox
%%% \shortpage\textheight \advance\shortpage -\footskip% find page length
%%% \advance\textheight-\footskip%
%%% \setbox\@tempboxa=\vsplit255 to \shortpage%   chop off any extra lines
%%% \setbox\mybox=\box255 \setbox255=\box\@tempboxa%
%%% \newpage \unvbox\mybox%
%%% \unvbox255 \setbox255=\box\@tempboxa%          and return them to the input
%%% \advance\textheight by -\footskip%  leave room for the footer

\def\ps@headings{%
\def\@oddfoot{\hfil\rm\thepage\hfil}%  centered page number
\let\@evenfoot\@oddfoot
\def\@oddhead{\versiontag\hfil}
\let\@evenhead\@oddhead
\def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
  \@chapapp\ \thechapter. \ \fi ##1}}}}

% Definition of 'myheadings' page style.  The user's \head command
% changes the definition of \@lhead and/or \@rhead.
%
\def\ps@myheadings{\def\@oddhead{\hbox{}\sl\@rhead \hfil \rm\thepage}%
\def\@oddfoot{}\def\@evenhead{\rm \thepage\hfil\sl\@lhead\hbox {}}%
\def\@evenfoot{}\def\chaptermark##1{}\def\sectionmark##1{}}

% FOR VERSION 2.08
%\def\ps@myheadings{\ps@headings\def\chaptermark##1{}\def\sectionmark##1{}}


%    ****************************************
%    *            MISCELLANEOUS             *
%    ****************************************
%
% DATE
%
\def\today{%
  \number\day\space
  \ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
% \space\number\day, \number\year}
  \space\number\year}

\def\mon{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
}

% Chan:
%   Add two new definitions: \defencedate and \depthead.
%   Add one more definition: \acting for handling the title of acting
%     department head (2002/01/01).

\newif\ifdatedefined 
\datedefinedfalse
\def\defencedate#1#2#3{%
  \def\year{ #1 } \def\month{ #2 } \def\day{ #3 }
  \datedefinedtrue
}

\newif\ifactingdefined
\actingdefinedfalse
\def\acting{%
  \ifdheaddefined
    \ifaddlinedefined
      \typeout{}
      \addlinedefinedfalse
    \fi
    \typeout{%
      Warning: \noexpand\acting should be defined before 
		\noexpand\depthead{Prof. Name}.
    }
    \typeout{}
  \else
    \actingdefinedtrue
  \fi
}
\newif\ifdheaddefined 
\dheaddefinedfalse
\def\depthead#1{%
  \ifdheaddefined
    \ifaddlinedefined
      \typeout{}
      \addlinedefinedfalse
    \fi
    \typeout{%
      Warning: \noexpand\depthead{Prof. Name} has already been defined.
    }
    \typeout{}
  \else
    \ifactingdefined
      \member{#1, Acting Head of Thrust}
    \else
      \member{#1, Head of Thrust}
    \fi
    \dheaddefinedtrue
  \fi
}

%    ****************************************
%    *           INITIALIZATION             *
%    ****************************************
%
% Default initializations

\ps@plain                   % 'plain' page style
\pagenumbering{roman}       % roman page numbers
\renewcommand{\thepage}{\nbi\roman{page}}
\onecolumn                  % Single-column.
\raggedbottom               % Ragged bottom

%The following lines are added for you to give definition, lemma, theorem etc.
%in your thesis.  ......... Wei Xiong
%begin
\def\nameDefinition{Definition}
\def\nameTheorem{Theorem}
\def\nameLemma{Lemma}
\def\nameAlgorithm{Algorithm}
\def\nameConjecture{Conjecture}
\def\nameExample{Example}  % added by WU,Zhaojun

\newtheorem{definition}{\nameDefinition}[section]
\newtheorem{theorem}{\nameTheorem}[section]
\newtheorem{lemma}{\nameLemma}[section]
\newtheorem{algo}{\nameAlgorithm}[section]
\newtheorem{conjecture}{\nameConjecture}[section]
\newtheorem{example}{\nameExample}[chapter] % added by WU,Zhaojun

\def\defi#1{\nameDefinition~\ref{#1}}
\def\theo#1{\nameTheorem~\ref{#1}}
\def\alg#1{\nameAlgorithm~\ref{#1}}
\def\exam#1{\nameExample~\ref{#1}} % added by WU,Zhaojun
%end

