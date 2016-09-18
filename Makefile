TARGETS= chapter.pdf

.PHONY: all
all: $(TARGETS)

.PHONY: clean
clean:
	-latexmk -C
	-rm -f *.bbl

.SUFFIXES: .pdf .tex
.tex.pdf:
	latexmk -pdf -shell-escape $<

chapter.tex: chapter-*.tex

# Words that have to be wrapped in \en{...}.
words=
words:= buffers?
words:= $(words)|caches?
words:= $(words)|dataflow
words:= $(words)|downstream
words:= $(words)|end-of-stream
words:= $(words)|events?
words:= $(words)|fast-forward
words:= $(words)|flush
words:= $(words)|frameworks?
words:= $(words)|null
words:= $(words)|pads?
words:= $(words)|paused
words:= $(words)|pipelines?
words:= $(words)|pixels?
words:= $(words)|players?
words:= $(words)|playing
words:= $(words)|plugins?
words:= $(words)|pulse-code\s+modulation
words:= $(words)|quality\s+of\s+service
words:= $(words)|raw
words:= $(words)|ready
words:= $(words)|red-green-blue
words:= $(words)|rewind
words:= $(words)|seek
words:= $(words)|sink\s+pads?
words:= $(words)|sinks?
words:= $(words)|source\s+pads?
words:= $(words)|sources?
words:= $(words)|start
words:= $(words)|stop
words:= $(words)|string
words:= $(words)|upstream
.PHONY: check
check:
	./sc.pl --sc-local='/([^{\\]\b($(words))\b[^}])/english' chapter.tex
