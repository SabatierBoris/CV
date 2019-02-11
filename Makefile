MAIN_SRC=cv.tex
TARGET=cv.pdf
SUB_SRC=$(wildcard cv_*.tex)
SUB_TARGET=$(SUB_SRC:.tex=.pdf)

${TARGET}: ${MAIN_SRC} ${SUB_TARGET}

%.pdf: %.tex
	docker run --rm -v ${PWD}:/data blang/latex pdflatex -interaction=nonstopmode -halt-on-error $<

clean:
	rm -f *.pdf *.log *.out *.aux
