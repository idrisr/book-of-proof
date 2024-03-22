\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idrisMemo}
\LoadClass[12pt]{article}

\RequirePackage{fancyhdr}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{lastpage}
\RequirePackage{mathrsfs}
\RequirePackage{bookOfProof} % Assuming this package is defined elsewhere

% Define the page styles
\fancypagestyle{styleTOC}{
    \fancyhead[L,C]{}
    \fancyhead[R]{\@memosubject}
    \fancyhead[L]{\@memostatus}

    \fancyfoot[L]{\@memodate}
    \fancyfoot[C]{}
    \fancyfoot[R]{\thepage/\pageref{LastPage}}
    \setlength{\headheight}{15pt}
    \renewcommand{\headrulewidth}{1pt}
    \renewcommand{\footrulewidth}{1pt}
}

\fancypagestyle{styleE}{
    \fancyfoot[C]{}
    \fancyfoot[L]{\@memostatus}
    \fancyfoot[R]{\thepage/\pageref{LastPage}}
    \fancyhead[R, L, C]{}
    \renewcommand{\headrulewidth}{1pt}
    \renewcommand{\footrulewidth}{1pt}
}

% Define the custom command for the table of contents
\newcommand{\toc}{
    \clearpage % Ensure the table of contents ends on a new page
    \pagestyle{styleE} % Switch to another page style after the table of contents
}

% Define custom memo fields
\newcommand{\memoto}[1]{\gdef\@memoto{#1}}
\newcommand{\memofrom}[1]{\gdef\@memofrom{#1}}
\newcommand{\memosubject}[1]{\gdef\@memosubject{#1}}
\newcommand{\memodate}[1]{\gdef\@memodate{#1}}
\newcommand{\status}[1]{\gdef\@memostatus{#1}}

\endinput
