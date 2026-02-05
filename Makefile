all: *.adoc
	asciidoctor index.adoc

full: *.adoc
	asciidoctor -a data-uri index.adoc

pdf: *.adoc
	asciidoctor-pdf index.adoc
