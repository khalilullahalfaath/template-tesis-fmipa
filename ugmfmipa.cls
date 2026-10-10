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
\RequirePackage{times}% font: Times (stable, widely available)
\RequirePackage[T1]{fontenc}% proper font encoding
\RequirePackage{graphicx}
\RequirePackage{calc}%Simple arithmetic lib
\RequirePackage{pdfpages} %include pdf file in latex
\RequirePackage{pgffor} %iterative counter
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
\usepackage{hyperref}% hyperlink
\usepackage{tocloft}% edit font toc
\usepackage{fancyhdr}% page number
\usepackage[cmex10]{amsmath}
\usepackage{amssymb}
\usepackage{amsthm}

% Theorem style with italic body (per FMIPA guidelines)
\newtheoremstyle{fmipastyle}%
{12pt}{12pt}%       % space above / below
{\itshape}%          % body font: italic
{}%                  % indent
{\bfseries}%         % head font: bold
{.}%                 % punctuation after head
{ }%                 % space after head
{}%                  % head spec

\theoremstyle{fmipastyle}
\newtheorem{definisi}{Definisi}[chapter]
\newtheorem{teorema}{Teorema}[chapter]
\newtheorem{lema}{Lema}[chapter]
\newtheorem{akibat}{Akibat}[chapter]
\newtheorem{proposisi}{Proposisi}[chapter]

% English aliases (share counters with Indonesian versions)
\newtheorem{definition}[definisi]{Definition}
\newtheorem{theorem}[teorema]{Theorem}
\newtheorem{lemma}[lema]{Lemma}
\newtheorem{corollary}[akibat]{Corollary}
\newtheorem{proposition}[proposisi]{Proposition}

% Fix numbering to use Arabic chapter numbers (not Roman)
\renewcommand{\thedefinisi}{\arabic{chapter}.\arabic{definisi}}
\renewcommand{\theteorema}{\arabic{chapter}.\arabic{teorema}}
\renewcommand{\thelema}{\arabic{chapter}.\arabic{lema}}
\renewcommand{\theakibat}{\arabic{chapter}.\arabic{akibat}}
\renewcommand{\theproposisi}{\arabic{chapter}.\arabic{proposisi}}

% Proof name (language-aware)
\iftoggle{lang}{\renewcommand{\proofname}{Bukti}}{\renewcommand{\proofname}{Proof}}

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
\usepackage[
    labelsep=space,
    font=singlespacing,
    figurewithin=none,
    tablewithin=none
]{caption} % space separator, single spacing
\captionsetup[table]{font={bf,singlespacing}} % bold only for tables
\captionsetup[figure]{font={bf,singlespacing}} % bold for figures
\usepackage{subcaption} % subfigure support
% \usepackage[bookmarks=true,hidelinks,bookmarksnumbered]{hyperref}
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
    \newcommand{\acknowledgmentname}{ACKNOWLEDGMENT}%
    \newcommand{\approvalpage}{ENDORSEMENT PAGE}
    \newcommand{\statementname}{STATEMENT}
    \newcommand{\dedicationpage}{PAGE OF DEDICATION}
    \AtBeginDocument{% select the language
        \selectlanguage{english}
    }
}

% redefine commands in babel bahasa
\addto\captionsbahasa{%
    \renewcommand{\prefacename}{PRAKATA}%
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
\newcommand{\@jurusanIna}{Departemen Ilmu Komputer dan Elektronika}
\newcommand{\@jurusanEng}{Department of Computer Science and Electronics}
\newcommand{\@prodiIna}{Magister Ilmu Komputer}
\newcommand{\@prodiEng}{Master of Computer Science}
\newcommand*{\major}[1]{\newcommand{\@major}{#1}}
\newcommand*{\departmenthead}[2]{
    \newcommand{\@depheadName}{#1}
    \newcommand{\@depheadNIP}{#2}
}
\newcommand{\@city}{Yogyakarta}


%======================================
%% Cover Page
%======================================
% #1 = logo, #2 = optional note under the logo (empty for cover)
\newcommand{\@coverpage}[2]{
    \newgeometry{left=3cm,top=3cm,bottom=3cm,right=3cm}
    \thispagestyle{empty}%
    \begin{center}
        \begin{onehalfspacing}
            \iftoggle{proposaltesis}{%
                \MakeUppercase{\normalfont\bfseries \iftoggle{lang}{Proposal Tesis}{Thesis Proposal}}\\
                \vspace{1.5cm}}{}%
            \MakeUppercase{\normalfont\bfseries\@titleind}\\
            \vspace{0.5em}
            {\normalfont\itshape\@titleeng}\\
            \vspace{1cm}
            \vfill
            \includegraphics[width=5.5cm]{#1}
            \vfill
            \ifblank{#2}{}{#2\par\vspace{1em}}%
            \iftoggle{lang}
            {\normalfont\bfseries Oleh:}
            {\normalfont\bfseries By:}\\\vspace{0.4em}
            \MakeUppercase{\normalfont\bfseries\@authorName \\ \@authorID \\}
            \vspace{1cm}
            \vfill
            \vspace{0.4em}
            \textbf{
                \iftoggle{lang}{\MakeUppercase{Program Studi \@prodiIna}}{\MakeUppercase{\@prodiEng Program}} \\
                \iftoggle{lang}{\MakeUppercase{\@jurusanIna}}{\MakeUppercase{\@jurusanEng}} \\
                \iftoggle{lang}{\MakeUppercase{\@facultyIna}}{\MakeUppercase{\@facultyEng}} \\
                \MakeUppercase{\@university} \\
                \MakeUppercase{\@city} \\
                \@yearsubmit
            }
        \end{onehalfspacing}
    \end{center}
}

\newcommand{\printcover}[2]{%
    \setcounter{page}{1}
    \pagenumbering{roman}
    \@coverpage{#1}{}%
}

% Halaman judul: sama dengan sampul + kalimat pemenuhan syarat (Panduan 2.1.1)
\newcommand{\printtitlepage}[1]{%
    \newpage
    \@coverpage{#1}{\iftoggle{lang}
        {Diajukan untuk memenuhi salah satu syarat memperoleh derajat \@prodiIna}
        {Submitted in partial fulfillment of the requirements for the degree of \@prodiEng}}%
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
        \newpage
        \thispagestyle{fancy}% Use fancy style (footer center for front matter)
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

                \iftoggle{lang}{Mengetahui,\\}{Acknowledged,\\}
                \iftoggle{lang}
                {Ketua Departemen/Wakil Penanggung Jawab Program Studi}
                {Head of Department}\\
                \iftoggle{lang}{\@jurusanIna}{\@jurusanEng}\\
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
        \newpage
        \thispagestyle{fancy}% Use fancy style (footer center for front matter)
        \begin{center}
            \begin{singlespacing}
                \MakeUppercase{\normalfont\large\textbf{\iftoggle{lang}{Halaman Persetujuan Proposal Tesis}{Thesis Proposal Approval Page}}}\\
                \vspace{1em}
                \begin{flushleft}
                    \begin{tabularx}{\linewidth}{p{3.5cm} c X}
                        \iftoggle{lang}{Judul Tesis}{Thesis Title} & : & \iftoggle{lang}{\@titleind}{\@titleeng} \\
                    \end{tabularx}
                \end{flushleft}
                \begin{center}
                    \begin{singlespace}

                        \textbf{\iftoggle{lang}{Diusulkan oleh}{Proposed by}}\par

                    \end{singlespace}
                \end{center}
                \begin{flushleft}
                    \begin{tabularx}{\linewidth}{p{3.5cm} c X}
                        \iftoggle{lang}{Nama Mahasiswa}{Student Name} & : & \@authorName \\
                        \iftoggle{lang}{NIM}{Student ID}              & : & \@authorID   \\
                    \end{tabularx}
                \end{flushleft}
                \begin{center}
                    \begin{singlespace}

                        \vspace{\dimexpr 12pt * 150 / 100\relax}

                        \iftoggle{lang}{Telah disetujui}{Has been approved}\\
                        \vspace{12pt}

                        \iftoggle{lang}{pada tanggal}{on} \@examdate\\

                        \vspace{\dimexpr 12pt * 2 * 150 / 100\relax}

                        \iftoggle{lang}{Pembimbing}{Supervisor}\\

                        \vspace{\dimexpr 12pt * 3 * 150 / 100\relax}

                        \getsupervisor{1}{1}\\
                        \iftoggle{lang}{Pembimbing I}{Supervisor I}

                        \ifnum\value{spv}>1
                        \vspace{\dimexpr 12pt * 3 * 150 / 100\relax}

                        \getsupervisor{2}{1} \\
                        \iftoggle{lang}{Pembimbing II}{Supervisor II}
                        \fi

                    \end{singlespace}
                \end{center}
                \vspace{0.5cm}

            \end{singlespacing}
        \end{center}
        \phantomsection
        \addcontentsline{toc}{chapter}{\iftoggle{lang}{HALAMAN PERSETUJUAN PROPOSAL TESIS}{THESIS PROPOSAL APPROVAL PAGE}}
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
        \iftoggle{lang}{\selectlanguage{bahasa}}{\selectlanguage{english}} % Restore document language
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
    \fancyfoot[C]{\thepage}% Front matter: bottom center
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \pagestyle{fancy}
    \setlength{\parindent}{1.27cm}
}

% Configure plain style for chapter first pages
\fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyfoot[C]{\thepage}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
}

% depth of toc
\setcounter{secnumdepth}{3}
% set numbering style
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
\renewcommand\thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}
% turunan dari \thesubsection agar ikut awalan "L." di lampiran
\renewcommand\thesubsubsection {\thesubsection.\@arabic\c@subsubsection}

% set figure, table, and equation style
\@addtoreset {equation}{chapter}
\@addtoreset {figure}{chapter}
\@addtoreset {table}{chapter}
\renewcommand\theequation
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@equation}
\renewcommand \thefigure
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@figure}
\renewcommand \thetable
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@table}
\@addtoreset {algorithm}{chapter}
\renewcommand \thealgorithm
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@algorithm}
\floatname{algorithm}{\iftoggle{lang}{Algoritma}{Algorithm}}

% Section style

\titlespacing\section{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsubsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titleformat{\section}
{\raggedright\normalfont\normalsize\bfseries\singlespacing}
{\thesection}{1em}{}
\titleformat{\subsection}
{\raggedright\normalfont\normalsize\bfseries\singlespacing}
{\thesubsection}{1em}{}
\titleformat{\subsubsection}
{\raggedright\normalfont\normalsize\bfseries\singlespacing}
{\thesubsubsection}{1em}{}


% Starting the main matter	
\newcommand{\startmain}{
    \clearpage
    \setcounter{page}{1}
    \pagenumbering{arabic}
    \fancyhf{}
    \fancyhead[R]{\thepage}% Main matter: top right
    \renewcommand{\headrulewidth}{0pt}
    \onehalfspacing
    \nopagebreak
    \setlength{\parindent}{1.27cm}
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
    \addcontentsline{toc}{chapter}{\iftoggle{lang}{LAMPIRAN}{APPENDIX}}
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

