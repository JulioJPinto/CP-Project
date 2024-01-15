\documentclass[11pt, a4paper, fleqn]{article}
\usepackage{cp2324t}
\makeindex

%================= lhs2tex=====================================================%
%include polycode.fmt
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format .=?=. = "\mathbin{\stackrel{\mathrm{?}}{=}}"
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const (f)) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (lcbr3 (x)(y)(z)) = "\begin{lcbr}" x "\\" y "\\" z "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format (for (f) (i)) = "\for{" f "}\ {" i "}"
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
%format <$> = "\mathbin{\mathopen{\langle}\$\mathclose{\rangle}}"
%format Either a b = a "+" b
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textbf{NB}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format outLTree = "\mathsf{out}"
%format inLTree = "\mathsf{in}"
%format inFTree = "\mathsf{in}"
%format outFTree = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format l2 = "l_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format LTree = "{\LTree}"
%format FTree = "{\FTree}"
%format inNat = "\mathsf{in}"
%format (cata (f)) = "\llparenthesis\, " f "\,\rrparenthesis"
%format (cataNat (g)) = "\cataNat{" g "}"
%format (cataList (g)) = "\llparenthesis\, " g "\,\rrparenthesis"
%format (cataLTree (x)) = "\llparenthesis\, " x "\,\rrparenthesis"
%format (cataFTree (x)) = "\llparenthesis\, " x "\,\rrparenthesis"
%format (cataRose (x)) = "\llparenthesis\, " x "\,\rrparenthesis_\textit{\tiny R}"
%format (ana (g)) = "\ana{" g "}"
%format (anaList (g)) = "\anaList{" g "}"
%format (anaLTree (g)) = "\lanabracket\," g "\,\ranabracket"
%format (anaRose (g)) = "\lanabracket\," g "\,\ranabracket_\textit{\tiny R}"
%format (hylo (g) (h)) = "\llbracket\, " g ",\," h "\,\rrbracket"
%format (hyloRose (g) (h)) = "\llbracket\, " g ",\," h "\,\rrbracket_\textit{\tiny R}"
%format Nat0 = "\N_0"
%format Rational = "\Q "
%format toRational = " to_\Q "
%format fromRational = " from_\Q "
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"
%format .&&&. = "\wedge"
%format cdots = "\cdots "
%format pi = "\pi "
%format (curry (f)) = "\overline{" f "}"
%format delta = "\Delta "
%format (plus (f)(g)) = "{" f "}\plus{" g "}"
%format ++ = "\mathbin{+\!\!+}"
%format Integer  = "\mathbb{Z}"
%format (Cp.cond (p) (f) (g)) = "\mcond{" p "}{" f "}{" g "}"
%format (square (x)) = x "^2"

%format (cataTree (f) (g)) = "\llparenthesis\, " f "\:" g "\,\rrparenthesis_{\textit{\tiny T}}"
%format (cataForest (f) (g)) = "\llparenthesis\, " f "\:" g "\,\rrparenthesis_{\textit{\tiny F}}"
%format (anaTree (f) (g)) = "\lanabracket\;\!" f "\:" g "\:\!\ranabracket_{\textit{\tiny T}}"
%format (anaForest (f) (g)) = "\lanabracket\;\!" f "\:" g "\:\!\ranabracket_{\textit{\tiny F}}"
%format (hyloTree (ft) (ff) (gt) (gf)) = "\llbracket\, " ft "\:" ff ",\," gt "\:" gf "\,\rrbracket_{\textit{\tiny T}}"
%format (hyloForest (ft) (ff) (gt) (gf)) = "\llbracket\, " ft "\:" ff ",\," gt "\:" gf "\,\rrbracket_{\textit{\tiny F}}"
%format inTree = "\mathsf{in}_{Tree}"
%format inForest = "\mathsf{in}_{Forest}"
%format outTree = "\mathsf{out}_{Tree}"
%format outForest = "\mathsf{out}_{Forest}"

%format (cata' (f) (g)) = "\llparenthesis\, " f "\:" g "\,\rrparenthesis"
%format (ana' (f) (g)) = "\lanabracket\;\!" f "\:" g "\:\!\ranabracket"
%format (hylo' (ft) (ff) (gt) (gf)) = "\llbracket\, " ft "\:" ff ",\," gt "\:" gf "\,\rrbracket"
%------------------------------------------------------------------------------%


%====== DEFINIR GRUPO E ELEMENTOS =============================================%

\group{G99}
\studentA{xxxxxx}{Nome }
\studentB{xxxxxx}{Nome }
\studentC{xxxxxx}{Nome }

%==============================================================================%

\begin{document}
\sffamily
\setlength{\parindent}{0em}
\emergencystretch 3em
\renewcommand{\baselinestretch}{1.25} 
\input{Cover}
\pagestyle{pagestyle}

\newgeometry{left=25mm,right=20mm,top=25mm,bottom=25mm}
\setlength{\parindent}{1em}

\section*{Preâmbulo}

\CP\ tem como objectivo principal ensinar a progra\-mação de computadores
como uma disciplina científica. Para isso parte-se de um repertório de \emph{combinadores}
que formam uma álgebra da programação % (conjunto de leis universais e seus
corolários) e usam-se esses combinadores para construir programas \emph{composicionalmente},
isto é, agregando programas já existentes.

Na sequência pedagógica dos planos de estudo dos cursos que têm
esta disciplina, opta-se pela aplicação deste método à programação
em \Haskell\ (sem prejuízo da sua aplicação a outras linguagens
funcionais). Assim, o presente trabalho prático coloca os
alunos perante problemas concretos que deverão ser implementados em
\Haskell. Há ainda um outro objectivo: o de ensinar a documentar
programas, a validá-los e a produzir textos técnico-científicos de
qualidade.

Antes de abodarem os problemas propostos no trabalho, os grupos devem ler
com atenção o anexo \ref{sec:documentacao} onde encontrarão as instruções
relativas ao sofware a instalar, etc.

Valoriza-se a escrita de \emph{pouco} código que corresponda a soluções
simples e elegantes que utilizem os combinadores de ordem superior estudados
na disciplina.

%if False
\begin{code}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable, FlexibleInstances #-}
module Main where
import Cp
import List hiding (fac)
import Nat hiding (aux)
import LTree
import FTree
import Probability
import Data.List hiding (find)
import Svg hiding (for)
import Control.Monad
import Control.Applicative hiding ((<|>))
import System.Process
import Data.Char
import Control.Concurrent

main = undefined
\end{code}
%endif

\section{Exercício 1}

Este problema, retirado de um \emph{site} de exercícios de preparação para entrevistas de emprego, 
tem uma formulação simples:
\begin{quote}\em
Dada uma matriz de uma qualquer dimensão, listar todos os seus elementos rodados em espiral. 
Por exemplo, dadas as seguintes matrizes:

	\figura

\noindent
dever-se-á obter, respetivamente, |[1,2,3,6,9,8,7,4,5]| e |[1,2,3,4,8,12,11,10,9,5,6,7]|.
\\ $\Box$
\end{quote}

\noindent
Valorizar-se-ão as soluções \emph{pointfree} que empreguem os combinadores
estudados na disciplina, e.g. |f.g|, |split f g|, |f >< g|, |either f g|, |f+g|, bem como
catamorfismos e anamorfismos. 

Recomenda-se a escrita de \emph{pouco} código e de soluções simples
e fáceis de entender. Recomenda-se que o código venha acompanhado de uma
descrição de como funciona e foi concebido, apoiado em diagramas explicativos.
Para instruções sobre como produzir esses diagramas e exprimir raciocínios
de cálculo, ver o anexo \ref{sec:diagramas}.

\pagebreak
\subsection{Resolução}
De maneira a resolver este problema decidimos fazer alguma pesquisa. Chegamos à conclusão que este problema era bastante conhecido como \textbf{matrot}.

A nossa resolução baseia-se na utilização das funções \textit{transpose} e \textit{reverse}.




\Problema

Este problema, que de novo foi retirado de um \emph{site} de exercícios de preparação para entrevistas de emprego, tem uma formulação muito simples:
\begin{quote}\em
Inverter as vogais de um \emph{string}.
\end{quote}
Esta formulação deverá ser generalizada a:
\begin{quote}\em
Inverter os elementos de uma dada lista que satisfazem um dado predicado.
\end{quote}

\noindent
Valorizam-se as soluções tal como no problema anterior e fazem-se as mesmas
recomendações.


\Problema

\begin{center}
\fbox{A fornecer na segunda edição deste enunciado}
\end{center}

\Problema

\begin{center}
\fbox{A fornecer na segunda edição deste enunciado}
\end{center}

\newpage
\part*{Anexos}

\appendix

\section{Natureza do trabalho a realizar}
\label{sec:documentacao}
Este trabalho teórico-prático deve ser realizado por grupos de 3 alunos.
Os detalhes da avaliação (datas para submissão do relatório e sua defesa
oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo em \textbf{todos}
os exercícios do trabalho, para assim poderem responder a qualquer questão
colocada na \emph{defesa oral} do relatório.

Para cumprir de forma integrada os objectivos do trabalho vamos recorrer
a uma técnica de programa\-ção dita ``\litp{literária}'' \cite{Kn92}, cujo
princípio base é o seguinte:
%
\begin{quote}\em
	Um programa e a sua documentação devem coincidir.
\end{quote}
%
Por outras palavras, o \textbf{código fonte} e a \textbf{documentação} de um
programa deverão estar no mesmo ficheiro.

O ficheiro \texttt{cp2324t.pdf} que está a ler é já um exemplo de
\litp{programação literária}: foi gerado a partir do texto fonte
\texttt{cp2324t.lhs}\footnote{O sufixo `lhs' quer dizer
\emph{\lhaskell{literate Haskell}}.} que encontrará no \MaterialPedagogico\
desta disciplina des\-com\-pactando o ficheiro \texttt{cp2324t.zip}.

Como se mostra no esquema abaixo, de um único ficheiro (|lhs|)
gera-se um PDF ou faz-se a interpretação do código \Haskell\ que ele inclui:

	\esquema

Vê-se assim que, para além do \GHCi, serão necessários os executáveis \PdfLatex\ e
\LhsToTeX. Para facilitar a instalação e evitar problemas de versões e
conflitos com sistemas operativos, é recomendado o uso do \Docker\ tal como
a seguir se descreve.

\section{Docker} \label{sec:docker}

Recomenda-se o uso de um \container\ Docker que deverá ser gerado a partir do ficheiro
\texttt{Dockerfile} que se encontra na diretoria que resulta de descompactar
\texttt{cp2324t.zip}. Este \container\ deverá ser usado na execução
do \GHCi\ e dos comandos relativos ao \Latex. (Ver também a \texttt{Makefile}
que é disponibilizada.)

Após \href{https://docs.docker.com/engine/install/}{instalar o Docker} e
descarregar o referido zip com o código fonte do trabalho,
basta executar os seguintes comandos:
\begin{Verbatim}[fontsize=\small]
    $ docker build -t cp2324t .
    $ docker run -v ${PWD}:/cp2324t -it cp2324t
\end{Verbatim}
\textbf{NB}: O objetivo é que o container\ seja usado \emph{apenas} 
para executar o \GHCi\ e os comandos relativos ao \Latex.
Deste modo, é criado um \textit{volume} (cf.\ a opção \texttt{-v \$\{PWD\}:/cp2324t}) 
que permite que a diretoria em que se encontra na sua máquina local 
e a diretoria \texttt{/cp2324t} no \container\ sejam partilhadas.

Pretende-se então que visualize/edite os ficheiros na sua máquina local e que
os compile no \container, executando:
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp2324t.lhs > cp2324t.tex
    $ pdflatex cp2324t
\end{Verbatim}
\LhsToTeX\ é o pre-processador que faz ``pretty printing'' de código Haskell
em \Latex\ e que faz parte já do \container. Alternativamente, basta executar
\begin{Verbatim}[fontsize=\small]
    $ make
\end{Verbatim}
para obter o mesmo efeito que acima.

Por outro lado, o mesmo ficheiro \texttt{cp2324t.lhs} é executável e contém
o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp2324t.lhs
\end{Verbatim}

\noindent Abra o ficheiro \texttt{cp2324t.lhs} no seu editor de texto preferido
e verifique que assim é: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
é seleccionado pelo \GHCi\ para ser executado.

\section{Em que consiste o TP}

Em que consiste, então, o \emph{relatório} a que se referiu acima?
É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relatório deverá conter ainda a identificação dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp2324t.aux
    $ makeindex cp2324t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. (Como já se disse, pode fazê-lo
correndo simplesmente \texttt{make} no \container.)

No anexo \ref{sec:codigo} disponibiliza-se algum código \Haskell\ relativo
aos problemas que são colocados. Esse anexo deverá ser consultado e analisado
à medida que isso for necessário.

Deve ser feito uso da \litp{programação literária} para documentar bem o código que se
desenvolver, em particular fazendo diagramas explicativos do que foi feito e
tal como se explica no anexo \ref{sec:diagramas} que se segue.

\section{Como exprimir cálculos e diagramas em LaTeX/lhs2TeX} \label{sec:diagramas}

Como primeiro exemplo, estudar o texto fonte (\lhstotex{lhs}) do que está a ler\footnote{
Procure e.g.\ por \texttt{"sec:diagramas"}.} onde se obtém o efeito seguinte:\footnote{Exemplos
tirados de \cite{Ol18}.}
\begin{eqnarray*}
\start
|
	id = split f g
|
\just\equiv{ universal property }
|
     lcbr(
          p1 . id = f
     )(
          p2 . id = g
     )
|
\just\equiv{ identity }
|
     lcbr(
          p1 = f
     )(
          p2 = g
     )
|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo à \emph{package} \Xymatrix, por exemplo:
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

\section{Código fornecido}\label{sec:codigo}

\subsection*{Problema 1}

\begin{code}
m1 = [[1,2,3], [4,5,6], [7,8,9]]
m2 = [[1,2,3,4], [5,6,7,8], [9,10,11,12]]
m3 = words "Cristina Monteiro Carvalho Sequeira"

test1 = matrot m1 == [1,2,3,6,9,8,7,4,5]
test2 = matrot m2 == [1,2,3,4,8,12,11,10,9,5,6,7]
test3 = matrot m3 == "CristinaooarieuqeSCMonteirhlavra"
\end{code}

\subsection*{Problema 2}

\begin{code}
test4 = reverseVowels "" == ""
test5 = reverseVowels "ácidos" == "ocidás"
test6 = reverseByPredicate even [1..20] == [1,20,3,18,5,16,7,14,9,12,11,10,13,8,15,6,17,4,19,2]
\end{code}

%----------------- Soluções dos alunos -----------------------------------------%

\section{Soluções dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas soluções para os exercícios
propostos, de acordo com o ``layout'' que se fornece.
Não podem ser alterados os nomes ou tipos das funções dadas, mas pode ser
adicionado texto ao anexo, bem como diagramas e/ou outras funções auxiliares
que sejam necessárias.

\noindent
\textbf{Importante}: Não pode ser alterado o texto deste ficheiro fora deste anexo.

\subsection*{Problema 1}

\begin{code}
matrot:: Eq a => [[a]] -> [a]
matrot= undefined
\end{code}

\subsection*{Problema 2}

\begin{code}
reverseVowels :: String -> String
reverseVowels = undefined

reverseByPredicate :: (a -> Bool) -> [a] -> [a]
reverseByPredicate p = undefined
\end{code}

%----------------- Índice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp2324t}

%----------------- Fim do documento -------------------------------------------%
\end{document}
