#-----------------------------------------------------
# Some usefull instructions...
#
EXT=adoc
DOCTOR=asciidoctor
# npm i @asciidoctor/core asciidoctor-pdf --save-dev
DOCTOR-PDF=npx asciidoctor-web-pdf
#-----------------------------------------------------

%.html: %.$(EXT)
	@echo '==> Compiling asciidoc files with Asciidoctor to generate HTML'
	$(DOCTOR) -a data-uri $<
		
%.pdf: %.$(EXT)
	@echo '==> Compiling asciidoc files with Asciidoctor to generate PDF'
	$(DOCTOR-PDF) $<

clean:
	@echo '==> Cleaning up generated files'
	rm -f *.{html,pdf}	