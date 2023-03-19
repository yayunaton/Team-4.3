.PHONY: test check

build:
	dune build

code:
	-dune build
	code .
	! dune build --watch

utop:
	OCAMLRUNPARAM=b dune utop src

test:
	OCAMLRUNPARAM=b dune exec test/main.exe

check:
	@bash check.sh

finalcheck:
	@bash check.sh final

zip:
	rm -f enigma.zip
	zip -r enigma.zip . -x@exclude.lst

clean:
	dune clean
	rm -f enigma.zip
