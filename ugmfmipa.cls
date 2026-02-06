%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Filename: main.tex
%%%  ---
%%%  Template for thesis at FMIPA UGM
%%%  Currently, only supports proposal and tesis 
%%%  --- 
%%%  Original Written by
%%%
%%% Developed by 
%%% Github repo:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%======================================
%% Identification
%======================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ugmfmipa}[2026/02/05 v1.0 FMIPA UGM Thesis Class]

%======================================
%% Initial Code
%======================================
\RequirePackage[english,bahasa]{babel} % language
\RequirePackage{etoolbox}% conditional statement
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage{times}% font
\RequirePackage[T1]{fontenc}% quotation
\RequirePackage{graphicx}
\RequirePackage{calc}%Simple arithmetic lib
\RequirePackage{pdfpages} %include pdf file in latex
%\RequirePackage{titlesec}

% Folder packages
\def\input@path{{packages/}}

% Format bibliography FMIPA
\RequirePackage{fmipabib}
\addbibresource{references.bib}
%======================================
%% Option Declaration
%======================================
\newtoggle{lang}
\newtoggle{proposaltesis}
\newtoggle{tesis}
% Language
\DeclareOption{bahasa}{\toggletrue{lang}}
\DeclareOption{english}{\togglefalse{lang}}
% format
\DeclareOption{proposaltesis}{\toggletrue{proposaltesis}\togglefalse{tesis}}
\DeclareOption{tesis}{\toggletrue{tesis}\togglefalse{proposaltesis}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}  % pass any unknown option to the report class


%======================================
%% Option Execution
%======================================
\ExecuteOptions{proposaltesis,bahasa} % set default format and language
\ProcessOptions


%======================================
%% Class & Package Loading
%======================================
\LoadClass[12pt, a4paper, oneside]{report}  % this class is based on the report class
\usepackage{geometry}% easy layouting
%\usepackage{hyperref}% hyperlink
\usepackage{subcaption} % subfigure
\usepackage[figurewithin=none]{caption}
\usepackage{tocloft}% edit font toc
\usepackage{fancyhdr}% page number
\usepackage[cmex10]{amsmath}
\usepackage{amssymb}
% \usepackage{cite}
\usepackage{multirow}
\usepackage{titlesec}
\usepackage{ragged2e}% text alignment
\usepackage{algorithm}
\usepackage{algcompatible}
\usepackage{algpseudocode}
\usepackage{listings}
\usepackage{color}
\usepackage{url}
\usepackage{ifthen}
\usepackage{forloop}
\usepackage{longtable}
\usepackage{enumitem}
\usepackage{tabularx}
\usepackage[labelsep=period]{caption} % use period as label separator
\usepackage[bookmarks=true,hidelinks,bookmarksnumbered]{hyperref}
\usepackage{tikz}
\usepackage{pgfplots}
\usepackage{pgf-pie}
\usetikzlibrary{calc}
\usetikzlibrary{positioning}
\usetikzlibrary{arrows}
\usetikzlibrary{shapes}

% Page break for equation
\allowdisplaybreaks

%======================================
%% Localise the Strings
%======================================
\iftoggle{lang}{
    % define new commands in bahasa
    \newcommand{\listappendixname}{DAFTAR LAMPIRAN}%
    \newcommand{\nomenclaturename}{DAFTAR LAMBANG DAN SINGKATAN}%
    \newcommand{\acknowledgmentname}{HALAMAN PERSEMBAHAN}%
    \newcommand{\approvalpage}{HALAMAN PENGESAHAN}
    \newcommand{\statementname}{PERNYATAAN BEBAS PLAGIASI}
    \newcommand{\dedicationpage}{HALAMAN PERSEMBAHAN}
    \AtBeginDocument{% select the language
        \selectlanguage{bahasa}
    }
}{
    % define new commands in english
    \newcommand{\listappendixname}{LIST OF APPENDICES}%
    \newcommand{\nomenclaturename}{NOMENCLATURE AND ABBREVIATION}%
    \newcommand{\approvalpage}{ENDORSEMENT PAGE}
    \newcommand{\statementname}{STATEMENT}
    \newcommand{\dedicationpage}{PAGE OF DEDICATION}
    \AtBeginDocument{% select the language
        \selectlanguage{english}
    }
}

% redefine commands in babel bahasa
\addto\captionsbahasa{%
    \renewcommand{\prefacename}{KATA PENGANTAR}%
    \renewcommand{\contentsname}{DAFTAR ISI}%
    \renewcommand{\listfigurename}{DAFTAR GAMBAR}%
    \renewcommand{\listtablename}{DAFTAR TABEL}%
    \renewcommand{\abstractname}{INTISARI}%
    \renewcommand{\partname}{BAGIAN}%
    \renewcommand{\chaptername}{BAB}%
    \renewcommand{\appendixname}{LAMPIRAN}%
    \renewcommand{\refname}{DAFTAR PUSTAKA}%
    \renewcommand{\bibname}{DAFTAR PUSTAKA}%
    \renewcommand{\indexname}{Indek}%
    \renewcommand{\figurename}{Gambar}%
    \renewcommand{\tablename}{Tabel}%
    \renewcommand{\pagename}{Halaman}%
}

% redefine commands in babel english
\addto\captionsenglish{%
    \renewcommand{\prefacename}{PREFACE}%
    \renewcommand{\contentsname}{CONTENTS}%
    \renewcommand{\listfigurename}{LIST OF FIGURES}%
    \renewcommand{\listtablename}{LIST OF TABLES}%
    \renewcommand{\abstractname}{\emph{Abstract}}%
    \renewcommand{\partname}{PART}%
    \renewcommand{\chaptername}{CHAPTER}%
    \renewcommand{\appendixname}{APPENDIX}%
    \renewcommand{\refname}{REFERENCES}%
    \renewcommand{\bibname}{REFERENCES}%
    \renewcommand{\indexname}{Index}%
    \renewcommand{\figurename}{Figure}%
    \renewcommand{\tablename}{Table}%
    \renewcommand{\pagename}{Page}%
}

%======================================
%% General Page Layout
%======================================
\geometry{
    a4paper,
    top=4cm,
    left=4cm,
    right=3cm,
    bottom=3cm,
    footskip=1.5cm,
}
\setlength{\parindent}{3em} %Indent approx 6 character

%======================================
%%  Information Setup
%======================================
% Author info
\renewcommand*{\author}[2]{
    \newcommand{\@authorName}{#1}
    \newcommand{\@authorID}{#2}
}
% Thesis info
\renewcommand*{\title}[1]{\renewcommand{\@title}{#1}}

\newcommand{\titleind}[1]{\gdef\@titleind{#1}}
\newcommand{\@titleind}{}
\newcommand{\titleeng}[1]{\gdef\@titleeng{#1}}
\newcommand{\@titleeng}{}

% Exam info
\newcommand*{\degree}[1]{\newcommand{\@degree}{#1}}
\newcommand*{\program}[3]{
    \newcommand{\@program}{#1}
    \newcommand{\@programcoorName}{#2}
    \newcommand{\@programcoorNIP}{#3}
}
% Exam info
\newcommand*{\examdate}[1]{\newcommand{\@examdate}{#1}}
\newcommand*{\approvaldate}[1]{\newcommand{\@approvaldate}{#1}}
\newcommand*{\yearsubmit}[1]{\newcommand{\@yearsubmit}{#1}}
% Using array-like to dynamically store examiner & supervisor data
% First option keeps ID, second option keeps name(1) or nip(2)
% Examiners
\newcounter{exm}
\newcommand\addexaminer[2]{%
    \stepcounter{exm}%
    \csdef{exmname\theexm}{#1}
    \csdef{exmnip\theexm}{#2}
}
\newcommand\getexaminer[2]{%
    % if second option = 1, get name
    % if second option = 2, get nip
    \ifthenelse{\equal{\detokenize{#2}}{\detokenize{1}}}
    {\csuse{exmname#1}}
    {\csuse{exmnip#1}}
}
% Supervisors/Promotors info
\newcounter{spv}
\newcommand\addsupervisor[2]{%
    \stepcounter{spv}%
    \csdef{spvname\thespv}{#1}
    \csdef{spvnip\thespv}{#2}
}
\newcommand\getsupervisor[2]{%
    % if second option = 1, get name
    % if second option = 2, get nip
    \ifthenelse{\equal{\detokenize{#2}}{\detokenize{1}}}
    {\csuse{spvname#1}}
    {\csuse{spvnip#1}}
}

% Department info
\newcommand{\@university}{Universitas Gadjah Mada}
\newcommand{\@facultyIna}{Fakultas Matematika dan Ilmu Pengetahuan Alam}
\newcommand{\@facultyEng}{Faculty of Mathematics and Natural Sciences}
\newcommand{\@departmentIna}{Departemen Ilmu Komputer dan Elektronika}
\newcommand{\@departmentEng}{Department of Computer Science and Electronics}
\newcommand{\@graduateIna}{Magister Ilmu Komputer}
\newcommand{\@graduateEng}{Master of Computer Science}
\newcommand*{\major}[1]{\newcommand{\@major}{#1}}
\newcommand*{\departmenthead}[2]{
    \newcommand{\@depheadName}{#1}
    \newcommand{\@depheadNIP}{#2}
}
\newcommand{\@city}{Yogyakarta}


%======================================
%% Cover Page
%======================================
% if tesis
\iftoggle{tesis}{
    \newcommand{\printcover}[2]{
        \newgeometry{left=3cm,top=3cm,bottom=3cm,right=3cm}
        \thispagestyle{empty}%
        \setcounter{page}{1}
        \pagenumbering{roman}
        \begin{center}
            \begin{singlespacing}
                \MakeUppercase{\normalfont\bfseries\@titleind}\\
                \MakeUppercase{\normalfont\bfseries\@titleeng}\\
                \vspace{1cm}
                \vfill
                \includegraphics[width=0.5\textwidth]{#1}
                \vfill
                \iftoggle{lang}
                {\normalfont\bfseries Oleh:}
                {\normalfont\bfseries By:}\\\vspace{0.4em}
                \MakeUppercase{\normalfont\bfseries\@authorName \\ \@authorID \\}
                \vspace{1cm}
                \vfill
                \vspace{0.4em}
                \textbf{
                    \iftoggle{lang}{\MakeUppercase{Program \@graduateIna}}{\MakeUppercase{\@graduateEng Program}} \\
                    \iftoggle{lang}{\MakeUppercase{ \@departmentIna}}{\MakeUppercase{\@departmentEng}} \\
                    \iftoggle{lang}{\MakeUppercase{\@facultyIna}}{\MakeUppercase{\@facultyEng}} \\
                    \MakeUppercase{\@university} \\
                    \MakeUppercase{\@city} \\
                    \@yearsubmit
                }
            \end{singlespacing}
        \end{center}
    }
}

\iftoggle{proposaltesis}{
    \newcommand{\printcover}[2]{
        \newgeometry{left=3cm,top=3cm,bottom=3cm,right=3cm}
        \thispagestyle{empty}%
        \setcounter{page}{1}
        \pagenumbering{roman}
        \begin{center}
            \begin{singlespacing}
                \MakeUppercase{\normalfont\bfseries Usulan Penelitian S2}\\
                \vspace{1.5cm}
                \MakeUppercase{\normalfont\bfseries\@titleind}\\
                \vspace{1cm}
                \vfill
                \includegraphics[width=0.5\textwidth]{#1}
                \vfill
                \iftoggle{lang}
                {\normalfont\bfseries Oleh:}
                {\normalfont\bfseries By:}\\\vspace{0.4em}
                \MakeUppercase{\normalfont\bfseries\@authorName \\ \@authorID \\}
                \vspace{1cm}
                \vfill
                \vspace{0.4em}
                \textbf{
                    \iftoggle{lang}{\MakeUppercase{Program \@graduateIna}}{\MakeUppercase{\@graduateEng Program}} \\
                    \iftoggle{lang}{\MakeUppercase{ \@departmentIna}}{\MakeUppercase{\@departmentEng}} \\
                    \iftoggle{lang}{\MakeUppercase{\@facultyIna}}{\MakeUppercase{\@facultyEng}} \\
                    \MakeUppercase{\@university} \\
                    \MakeUppercase{\@city} \\
                    \@yearsubmit
                }
            \end{singlespacing}
        \end{center}
    }
}

%======================================
%% Endorsement Page
%======================================
% If tesis
\iftoggle{tesis}{
    \newcommand{\printendorsementpdf}{
        %\chapter*{\approvalpage}
        \addtocounter{page}{1}
        \addcontentsline{toc}{chapter}{\approvalpage}
        \includepdf[page={1}]{contents/endorsement/endorsement.pdf}
        \addtocounter{page}{-1}
    }
    \newcommand{\printendorsement}{
        %	\chapter*{\endorsementname}%
        \fancyhf{}
        \fancyfoot[C]{\thepage}
        \begin{center}
            \begin{singlespacing}
                \textbf{\iftoggle{lang}{TESIS}{THESIS}}\\
                \vspace{1em}
                \MakeUppercase{\bfseries\fontsize{14pt}{16pt}\selectfont\@titleind}\\
                \vspace{0.5cm}
                \iftoggle{lang}{Dipersiapkan dan disusun oleh}{Written by}\\
                \vspace{1em}
                \textbf{\underline{\@authorName} \\ \@authorID \\}
                \vspace{1em}
                \iftoggle{lang}
                {Telah dipertahankan di depan dewan penguji}
                {Has been presented} \\
                \iftoggle{lang}
                {Pada tanggal: \@examdate}
                {on \@examdate}\\
                \vspace{1em}
                \iftoggle{lang}
                {\textbf{Susunan Dewan Penguji}}
                {\textbf{Thesis Examiners}}\\

                \begin{center}
                    \begin{tabular}{ccc}
                        \iftoggle{lang}{Pembimbing I}{Supervisor I}   & \hspace{2cm}   & \iftoggle{lang}{Anggota Dewan Penguji Lain}{Examiners} \\
                        \vspace{0.3cm}                                & \vspace{0.3cm} & \vspace{0.3cm}                                         \\
                        \textbf{\underline{\getsupervisor{1}{1}}}     &                &
                        \textbf{\underline{\getexaminer{1}{1}}}                                                                                 \\
                        \iftoggle{lang}{Pembimbing II}{Supervisor II} & \hspace{2cm}   &                                                        \\
                        \vspace{0.3cm}                                & \vspace{0.3cm} & \vspace{0.3cm}                                         \\
                        \textbf{\underline{\getsupervisor{2}{1}}}     &                &
                        \textbf{\underline{\getexaminer{2}{1}}}                                                                                 \\
                    \end{tabular}
                \end{center}
                \vspace{0.5cm}

                \iftoggle{lang}
                {Tesis ini telah diterima sebagai salah satu persyaratan \\ untuk memperoleh gelar Magister}
                {This thesis has been accepted as a partial fulfillment \\ for the degree of Master}\\
                \vspace{0.3cm}

                \iftoggle{lang}{Tanggal:}{Date: $\ldots\ldots$} \\
                \iftoggle{lang}
                {Pengelola Program Studi \@program}
                {Program Coordinator of \@program}\\
                \vspace{1.3cm}
                \textbf{\underline{\@programcoorName}}\\
                NIP. \@programcoorNIP \\
                \vspace{0.5cm}

                \iftoggle{lang}{Mengetahui,\\}{}
                \iftoggle{lang}
                {Ketua Departemen/Wakil Penanggung Jawab Program Studi}
                {Head of Department}\\
                \iftoggle{lang}{\@departmentIna}{\@departmentEng}\\
                \vspace{1.3cm}
                \textbf{\underline{\@depheadName}}\\
                NIP. \@depheadNIP \\

            \end{singlespacing}
        \end{center}
        \addcontentsline{toc}{chapter}{\approvalpage}
    }
}

% If proposaltesis
\iftoggle{proposaltesis}{
    \newcommand{\printendorsementpdf}{
        %\chapter*{\approvalpage}
        \addtocounter{page}{1}
        \addcontentsline{toc}{chapter}{\approvalpage}
        \includepdf[page={1}]{contents/endorsement/endorsement-proposal.pdf}
        \addtocounter{page}{-1}
    }
    \newcommand{\printendorsement}{
        %	\chapter*{\endorsementname}%
        \fancyhf{}
        \fancyfoot[C]{\thepage}
        \begin{center}
            \begin{singlespacing}
                \MakeUppercase{\normalfont\large\textbf{Halaman Pengesahan Usulan Penelitian S2}}\\
                \vspace{1em}
                \begin{flushleft}
                    \begin{tabularx}{\linewidth}{p{3.5cm} c X}
                        Judul Tesis & : & \@titleind \\
                    \end{tabularx}
                \end{flushleft}
                \begin{center}
                    \begin{singlespace}

                        \textbf{Diusulkan oleh}\par

                    \end{singlespace}
                \end{center}
                \begin{flushleft}
                    \begin{tabularx}{\linewidth}{p{3.5cm} c X}
                        Nama Mahasiswa & : & \@authorName \\
                        NIM            & : & \@authorID   \\
                    \end{tabularx}
                \end{flushleft}
                \begin{center}
                    \begin{singlespace}

                        \vspace{\dimexpr 12pt * 150 / 100\relax}

                        Telah disetujui\\
                        \vspace{12pt}

                        pada tanggal \@examdate\\

                        \vspace{\dimexpr 12pt * 2 * 150 / 100\relax}

                        Pembimbing\\

                        \vspace{\dimexpr 12pt * 3 * 150 / 100\relax}

                        \getsupervisor{1}{1}\\
                        Pembimbing I

                        \ifdefempty{\@secondsupervisor}
                        {
                        }
                        {
                            \vspace{\dimexpr 12pt * 3 * 150 / 100\relax}

                            \getsupervisor{2}{1} \\
                            Pembimbing II
                        }

                    \end{singlespace}
                \end{center}
                \vspace{0.5cm}

            \end{singlespacing}
        \end{center}
        \phantomsection
        \addcontentsline{toc}{chapter}{HALAMAN PENGESAHAN USULAN PENELITIAN S2}
    }
}

%======================================
%% Scanned JPG Endorsement Page
%======================================
\newcommand{\printendorsementjpg}[1]{
    \newpage
    \fancyhf{}
    \fancyfoot[C]{\thepage}
    \begin{center}
        \vspace*{-4cm}
        \noindent\makebox[\textwidth]{\includegraphics[width=\paperwidth]{#1}}
    \end{center}
    \addcontentsline{toc}{chapter}{\approvalpage}
    \clearpage
}

%======================================
%% Dedication Page
%======================================
\newcommand{\chapterdedication}[1]{
    \iftoggle{proposaltesis}{
        % tidak ada halaman persembahan untuk proposal
    }{\newgeometry{top=2.54cm,bottom=2.54cm,left=3.54cm,right=2.54cm}
        \chapter*{\dedicationpage}%
        \input{#1}
        \addcontentsline{toc}{chapter}{\dedicationpage}}

}

%======================================
%% Statement Page
%======================================
\newcommand{\chapterstatement}[1]{
    \iftoggle{proposaltesis}{
        % tidak ada halaman pernyataan untuk proposal
    }{\newgeometry{right=2.54cm,left=3.54cm,top=2.54cm,bottom=2.54cm}
        \chapter*{\statementname}%
        \input{#1}
        \addcontentsline{toc}{chapter}{\statementname}}

}

%======================================
%% Scanned JPG Statement Page
%======================================
\newcommand{\chapterstatementjpg}[1]{
    \newpage
    \fancyhf{}
    \fancyfoot[C]{\thepage}
    \begin{center}
        \vspace*{-4cm}
        \noindent\makebox[\textwidth]{\includegraphics[width=\paperwidth]{#1}}
    \end{center}
    \addcontentsline{toc}{chapter}{\statementname}
    \clearpage
}

%======================================
%% Preface
%======================================
\newcommand{\chapterpreface}[1]{
    \iftoggle{proposaltesis}{
        % tidak ada kata pengantar untuk proposal
    }{
        \restoregeometry% Restore Geometry
        \chapter*{\prefacename}%
        \input{#1}
        \addcontentsline{toc}{chapter}{\prefacename}
    }

}

%======================================
%% Nomenclature
%======================================
\newcommand{\chapternomenclature}[1]{
    \chapter*{\nomenclaturename}
    \input{#1}
    \addcontentsline{toc}{chapter}{\nomenclaturename}
}

%======================================
%% Intisari (Indonesian Abstract)
%======================================
\newcommand{\chapterintisari}[1]{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{INTISARI}
    \thispagestyle{plain} % Menampilkan nomor halaman (biasanya romawi)

    \begin{center}
        % Judul Halaman
        {\fontsize{14pt}{16pt}\selectfont\bfseries INTISARI}\par
        \vspace{1em}

        % Judul Tesis (Indonesia)
        {\fontsize{12pt}{14pt}\selectfont\bfseries\MakeUppercase{\@titleind}}\par
        \vspace{1em}

        % Identitas Penulis
        {\normalfont Oleh}\par
        \vspace{0.5em}
        {\normalfont \@authorName}\par
        {\normalfont \@authorID}\par
        \vspace{1.5em}
    \end{center}

    % Isi Intisari
    \begin{singlespace}
        \input{#1}
    \end{singlespace}
}

%======================================
%% Abstract (English Abstract)
%======================================
\newcommand{\chapterabstract}[1]{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{ABSTRACT}
    \thispagestyle{plain}

    \begin{center}
        % Page Title
        {\fontsize{14pt}{16pt}\selectfont\bfseries ABSTRACT}\par
        \vspace{1em}

        % Thesis Title (English) 
        {\fontsize{12pt}{14pt}\selectfont\bfseries\MakeUppercase{\@titleeng}}\par
        \vspace{1em}

        % Author Identity
        {\normalfont By}\par
        \vspace{0.5em}
        {\normalfont \@authorName}\par
        {\normalfont \@authorID}\par
        \vspace{1.5em}
    \end{center}

    % Content (English hyphenation & Single space)
    \begin{singlespace}
        \selectlanguage{english}
        \input{#1}
        \selectlanguage{bahasa} % Kembalikan ke bahasa indonesia setelah selesai
    \end{singlespace}
}

% BAB YANG HANYA ADA DI TESIS
\newcommand{\inputChapter}[1]{%
    \cleardoublepage
    \phantomsection
    \include{#1}%
}

\newcommand{\thesisContent}[1]{%
    \iftoggle{tesis}{%
        #1%
    }{%
        % Bab ini tidak ada
    }%
}

\newcommand{\proposalContent}[1]{%
    \iftoggle{proposaltesis}{%
        #1%
    }{%
        % Kosong: Jika mode tesis, kode di sini diabaikan
    }%
}

%======================================
%% Table of Contents
%% List of Figures and Tables
%======================================
\setcounter{tocdepth}{3}
% dot length
\renewcommand{\cftdotsep}{1} %default: 4.5
% Put dots for chapter entries
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
% set font chapter
\renewcommand\cftchapfont{\mdseries}
\renewcommand\cftchappagefont{\mdseries}%


% Modified list entries in TOC, LOT, LOF
\setlength{\cftbeforechapskip}{0em} % no space between list
\renewcommand{\cftchappresnum}{\chaptername \space}
\renewcommand\cfttabpresnum{\tablename \space}
\renewcommand\cftfigpresnum{\figurename \space}
\AtBeginDocument{
    \addtolength\cftchapnumwidth{\widthof{\bfseries \chaptername }}
    \addtolength\cfttabnumwidth{\widthof{\bfseries \tablename }}
    \addtolength\cftfignumwidth{\widthof{\bfseries \figurename }}
}


% Adding entry to TOC
\newcommand{\thetoc}{
    \newpage
    \addcontentsline{toc}{chapter}{\contentsname}
}
% Adding entry to LOT
\newcommand{\thelot}{
    \newpage
    \addcontentsline{toc}{chapter}{\listtablename}
}
% Adding entry to LOF
\newcommand{\thelof}{
    \newpage
    \addcontentsline{toc}{chapter}{\listfigurename}
}
% Put title of TOC, LOF, and LOT in top-center page
\AtBeginDocument{
    \renewcommand{\cfttoctitlefont}{\vspace{-2.5cm}\hfill\bfseries\fontsize{14pt}{16pt}\selectfont}
    \renewcommand{\cftaftertoctitle}{\hfill}
    \renewcommand{\cftlottitlefont}{\vspace{-2.5cm}\hfill\bfseries\fontsize{14pt}{16pt}\selectfont}
    \renewcommand{\cftafterlottitle}{\hfill}
    \renewcommand{\cftloftitlefont}{\vspace{-2.5cm}\hfill\bfseries\fontsize{14pt}{16pt}\selectfont}
    \renewcommand{\cftafterloftitle}{\hfill}
}

%======================================
%% Tables and Figures
%======================================
% Give padding in tabular environment
\renewcommand{\arraystretch}{1.2}

%======================================
%% Misc Styling
%======================================
%Source code style
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}

\lstdefinestyle{mystyle}{
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\small,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2
}
\lstset{style=mystyle}


%======================================
%% Chapters and Sections
%======================================
% set page number style
\AtBeginDocument{
    \fancyhf{}
    \fancyhead[R]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \pagestyle{fancy}
    \setlength{\parindent}{1.25cm}
}
% depth of toc
\setcounter{secnumdepth}{3}
% set numbering style
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
\renewcommand\thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}

% set figure, table, and equation style
\@addtoreset {equation}{chapter}
\renewcommand\theequation
{\ifnum \c@chapter>\z@ \@arabic\c@chapter-\fi \@arabic\c@equation}
\renewcommand \thefigure
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@figure}
\renewcommand \thetable
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@table}

% Section style

\titlespacing\section{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsubsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titleformat*{\section}{\raggedright\normalfont\normalsize\bfseries}
\titleformat*{\subsection}{\raggedright\normalfont\normalsize\bfseries}
\titleformat*{\subsubsection}{\raggedright\normalfont\normalsize\bfseries}


% Starting the main matter	
\newcommand{\startmain}{
    \clearpage
    \setcounter{page}{1}
    \pagenumbering{arabic}
    \onehalfspacing
    \nopagebreak
    \setlength{\parindent}{1.25cm}
}


% Main chapter head styling
\renewcommand{\@makechapterhead}[1]{%   
    {\parindent \z@ \centering \bfseries
            \fontsize{14pt}{16pt}\selectfont
            \chaptername \space \thechapter
            \par\nobreak
            \MakeUppercase{#1}\par\nobreak
            \vskip 20\p@
        }}

% Other chapter head styling
\renewcommand{\@makeschapterhead}[1]{%
    {\parindent \z@ \centering \bfseries
            \fontsize{14pt}{16pt}\selectfont
            \par\nobreak
            \MakeUppercase{#1}\par\nobreak
            \vskip 20\p@
        }}

% References
\newcommand{\thereferences}{
    \addcontentsline{toc}{chapter}{\bibname}
    \singlespacing
    \nopagebreak
}

% Appendix
\newcommand{\chapterappendix}[1]{
    \newpage
    % Reset counter
    %\setcounter{chapter}{0}
    %\setcounter{section}{0}
    \setcounter{page}{1}
    % Makes all chapter name to L
    \renewcommand{\thechapter}{L}
    \renewcommand{\thepage}{L-\arabic{page}}
    \renewcommand \thesection {L.\@arabic\c@section}
    \renewcommand\thesubsection {L.\@arabic\c@section.\@arabic\c@subsection}

    % Add to TOC
    \addcontentsline{toc}{chapter}{LAMPIRAN}
    %\addcontentsline{toc}{chapter}{\protect\setcounter{tocdepth}{1}\protect\appendixname}
    %\addcontentsline{toc}{chapter}{\protect\setcounter{tocdepth}{1}\protect\appendixname}
    %\addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
    % Page number style
    \fancyhf{}
    \fancyfoot[C]{\thepage}

    \fontsize{14pt}{16pt}\selectfont
    %\centering\MakeUppercase{\normalfont\bfseries \appendixname }\\
    \vspace{20pt}
    \fontsize{12}{2}\selectfont
    \onehalfspacing
    \input{#1}
}

\newcommand{\chapterappendixadd}[1]{
    \newpage

    % Makes all chapter name to L
    \renewcommand{\thechapter}{L}
    \renewcommand{\thepage}{L-\arabic{page}}
    \renewcommand \thesection {L.\@arabic\c@section}
    \renewcommand\thesubsection {L.\@arabic\c@section.\@arabic\c@subsection}

    % Add to TOC
    %\addcontentsline{toc}{chapter}{\protect\setcounter{tocdepth}{1}\protect\appendixname}
    %\addcontentsline{toc}{chapter}{\protect\setcounter{tocdepth}{1}\protect\chaptername}	
    %\addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
    % Page number style
    \fancyhf{}
    \fancyfoot[C]{\thepage}

    \fontsize{14pt}{16pt}\selectfont
    %\centering\MakeUppercase{\normalfont\bfseries \appendixname }\\
    \vspace{20pt}
    \fontsize{12}{2}\selectfont
    \onehalfspacing
    \input{#1}
}

\newcommand{\appendixtables}{
    \renewcommand{\thetable}{L.\arabic{table}}%
    \setcounter{table}{0}%
}

\newcommand{\appendixfigures}{
    \renewcommand{\thefigure}{L.\arabic{figure}}
    \setcounter{figure}{0}
}

%----------------
% List
%---------------

\setlist[enumerate,1]{leftmargin=2em, label=\arabic*., topsep=0pt, itemsep=0pt, partopsep=1ex, parsep=1ex}
\setlist[itemize,1]{align=parleft, left=0pt, label=•, itemsep=0pt, topsep=0pt, partopsep=1ex, parsep=1ex}

