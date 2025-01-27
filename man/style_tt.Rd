% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/style_tt.R
\name{style_tt}
\alias{style_tt}
\title{Style a Tiny Table in either LaTeX or HTML format}
\usage{
style_tt(
  x,
  i = NULL,
  j = NULL,
  bold = FALSE,
  italic = FALSE,
  monospace = FALSE,
  underline = FALSE,
  strikeout = FALSE,
  color = NULL,
  background = NULL,
  fontsize = NULL,
  width = NULL,
  align = NULL,
  colspan = NULL,
  indent = 0,
  tabularray_inner = NULL,
  tabularray_outer = NULL,
  bootstrap_class = "table",
  bootstrap_css = NULL,
  bootstrap_css_rule = NULL,
  ...
)
}
\arguments{
\item{x}{A table object created by \code{tt()}.}

\item{i}{Row indices where the styling should be applied. Can be a single value or a vector. \code{i=0} is the header, and negative values are higher level headers. If \code{colspan} is used, \code{i} must be of length 1.}

\item{j}{Column indices where the styling should be applied. Can be a single value, a vector, or a Perl-style regular expression applied to column names of the original data frame. If \code{colspan} is used, \code{j} must be of length 1.}

\item{bold}{Logical; if \code{TRUE}, text is styled in bold.}

\item{italic}{Logical; if \code{TRUE}, text is styled in italic.}

\item{monospace}{Logical; if \code{TRUE}, text is styled in monospace font.}

\item{underline}{Logical; if \code{TRUE}, text is underlined.}

\item{strikeout}{Logical; if \code{TRUE}, text has a strike through line.}

\item{color}{Text color. There are several ways to specify colors, depending on the output format.
\itemize{
\item HTML:
\itemize{
\item Hex code composed of # and 6 characters, ex: #CC79A7.
\item Keywords: black, silver, gray, white, maroon, red, purple, fuchsia, green, lime, olive, yellow, navy, blue, teal, aqua
}
\item LaTeX:
\itemize{
\item Hex code composed of # and 6 characters, ex: "#CC79A7". See the section below for instructions to add in LaTeX preambles.
\item Keywords: black, blue, brown, cyan, darkgray, gray, green, lightgray, lime, magenta, olive, orange, pink, purple, red, teal, violet, white, yellow.
\item Color blending using xcolor\verb{, ex: }white!80!blue\verb{, }green!20!red`.
\item Color names with luminance levels from \href{https://mirror.quantum5.ca/CTAN/macros/latex/contrib/ninecolors/ninecolors.pdf}{the \code{ninecolors} package} (ex: "azure4", "magenta8", "teal2", "gray1", "olive3").
}
}}

\item{background}{Background color. Specified as a color name or hexadecimal code. Can be \code{NULL} for default color.}

\item{fontsize}{Integer Font size in pt units.}

\item{width}{Width of the cell or column. Can be \code{NULL} for default width.}

\item{align}{A single character or a string with a number of characters equal to the number of columns in \code{j}. Valid characters include 'c' (center), 'l' (left), or 'r' (right).}

\item{colspan}{Number of columns a cell should span. Can only be used if both \code{i} and \code{j} are of length 1. Must be an integer greater than 1.}

\item{indent}{Text indentation in em units. Positive values only.}

\item{tabularray_inner}{A string that specifies the "inner" settings of a tabularray LaTeX table.}

\item{tabularray_outer}{A string that specifies the "outer" settings of a tabularray LaTeX table.}

\item{bootstrap_class}{String. A Bootstrap table class such as \code{"table"}, \code{"table table-dark"} or \code{"table table-dark table-hover"}. See the bootstrap documentation.}

\item{bootstrap_css}{A vector of CSS style declarations to be applied (ex: \code{"font-weight: bold"}). Each element corresponds to a cell defined by \code{i} and \code{j}.}

\item{bootstrap_css_rule}{A string with complete CSS rules that apply to the table class specified using the \code{theme} argument of the \code{tt()} function.}

\item{...}{extra arguments are ignored}
}
\value{
An object of class \code{tt} representing the table.
}
\description{
Style a Tiny Table in either LaTeX or HTML format
}
\details{
This function applies styling to a table created by \code{tt()}. It allows customization of text style (bold, italic, monospace), text and background colors, font size, cell width, text alignment, column span, and indentation. The function supports both LaTeX (tabularray) and HTML (bootstrap) formats.

Note that Markdown and Word formats are limited to these styles: italic, bold, strikeout.
}
\section{LaTeX preamble}{


When rendering Quarto and Rmarkdown documents, \code{tinytable} will populate the LaTeX preamble automatically with all the required packages. For standalone LaTeX packages, these commands should be inserted in the preamble:

\if{html}{\out{<div class="sourceCode latex">}}\preformatted{\\usepackage\{tabularray\}
\\usepackage\{float\}
\\usepackage\{graphicx\}
\\usepackage\{codehigh\}
\\usepackage[normalem]\{ulem\}
\\UseTblrLibrary\{booktabs\}
\newcommand{\tinytableTabularrayUnderline}[1]\{\\underline\{#1\}\}
\newcommand{\tinytableTabularrayStrikeout}[1]\{\\sout\{#1\}\}
\\NewTableCommand\{\\tinytableDefineColor\}[3]\{\\definecolor\{#1\}\{#2\}\{#3\}\}
}\if{html}{\out{</div>}}
}

\examples{
library(tinytable)
x <- mtcars[1:5, 1:5]
tab <- tt(x)
tab <- style_tt(tab, j = 1:5, align = "lcccr")
tab <- style_tt(tab, i = 2:3,
 background = "black", color = "orange", bold = TRUE)

}
