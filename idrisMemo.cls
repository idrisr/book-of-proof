\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idrisMemo}
\LoadClass[12pt]{article}

\RequirePackage{fancyhdr}

\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{enumitem}
\usepackage{pdfpages}
\usepackage{lastpage}
\usepackage{hyperref}

\pagestyle{fancy}
\hypersetup{
    colorlinks=false,
    pdfborderstyle={/S/U/W 0}
}

\setlength{\headheight}{15pt}

\newcommand{\memoto}[1]{\gdef\@memoto{#1}}
\newcommand{\memofrom}[1]{\gdef\@memofrom{#1}}
\newcommand{\memosubject}[1]{\gdef\@memosubject{#1}}
\newcommand{\memodate}[1]{\gdef\@memodate{#1}}
\newcommand{\status}[1]{\gdef\@memostatus{#1}}

\fancyhead[L,C]{}
\fancyhead[R]{\@memosubject}
\fancyhead[L]{\jobname}
\fancyhead[C]{\@memostatus}
\fancyfoot[L]{\@memodate}
\fancyfoot[C]{\@memoto}
\fancyfoot[R]{\thepage/\pageref{LastPage}}
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}
