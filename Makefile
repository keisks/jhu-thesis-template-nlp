.PHONY: dvi ps pdf all space clean veryclean distclean

SHELL = /bin/sh
MAKE  = gmake

TEX = pdflatex -file-line-error-style
PAPERSIZE=a4

######################################################################
# output files

target = root

tmp_files = ${target}.blg ${target}.log ${target}.bbl ${target}.aux ${target}.out ${target}.fls ${target}.lof ${target}.lot ${target}.toc ${target}-blx.bib ${target}.run.xml

######################################################################
# make targets

all: root.pdf

%.pdf: %.tex src/*.tex Makefile
	${TEX} -papersize=${PAPERSIZE} $<
	bibtex ${*F}
	${TEX} -papersize=${PAPERSIZE} $<
	bibtex ${*F}
	${TEX} -papersize=${PAPERSIZE} $<

space:
	@-/bin/rm -f ${tmp_files} *~ ${target}.pdf ${target}.ps

clean veryclean distclean:
	/bin/rm -f ${tmp_files} *~ ${target}.pdf ${target}.ps ${target}.dvi
	/bin/rm -f src/*.aux

