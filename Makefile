out ?= out
examples := screen triangle

$(examples): %: %.c
	gcc -lGL -lGLU -lGLEW -lglut -lglfw -o $@ $@.c

.PHONY: examples
examples: $(examples)

$(out)/bin: $(examples)
	mkdir -p $(out)/bin
	mv $(examples) $(out)/bin
