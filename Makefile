all:
	pdflatex main.tex
	pdflatex main.tex
	bibtex main.aux
	pdflatex main.tex
	pdflatex main.tex

clean:
	rm -rf *.aux *.fls *.fdb_latexmk *.synctex.gz *.idx *.acn *.glo *.ist *.maf *.mt* *.ml* *.nlo *.log *.bbl *.blg *.out *.toc *.loa *.lob *.lov *.lof *.los *.lot

start:
	xhost +local:root
	docker-compose up -d --build
	docker exec -it latex-setrem /bin/bash

stop:
	docker-compose down --remove-orphans
