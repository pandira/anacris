INFILES=$(shell find -type f -name '*.html.in')
HTMLFILES=$(patsubst %.in,%,$(INFILES))
TEMPLATEFILES=$(wildcard templates/*.html)

all: $(HTMLFILES) $(TEMPLATEFILES)
	@echo "Created all html files ($(HTMLFILES)) from in files ($(INFILES))"

%.html:%.html.in $(TEMPLATEFILES)
	@echo Creating $@ from $<...
	@./bin/assemble_html ./templates "$<" "$@"

clean:
	@echo "Deleting $(HTMLFILES)..."
	@rm $(HTMLFILES)
