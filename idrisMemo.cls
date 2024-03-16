\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idrisMemo}
\LoadClass[12pt]{article}

\RequirePackage{fancyhdr}
\usepackage{enumitem}
\usepackage{hyperref}
\usepackage{lastpage}
\usepackage{pdfpages}
\usepackage{bookOfProof}

\pagestyle{fancy}
\hypersetup{
    colorlinks=false,
    pdfborderstyle={/S/U/W 0}
}

\newcommand{\memoto}[1]{\gdef\@memoto{#1}}
\newcommand{\memofrom}[1]{\gdef\@memofrom{#1}}
\newcommand{\memosubject}[1]{\gdef\@memosubject{#1}}
\newcommand{\memodate}[1]{\gdef\@memodate{#1}}
\newcommand{\status}[1]{\gdef\@memostatus{#1}}

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
