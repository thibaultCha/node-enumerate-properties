REPORTER = spec
BIN = ./node_modules/.bin

build:
	$(BIN)/coffee -b -o lib src/*.coffee

test: build
	@NODE_ENV=test ./node_modules/.bin/mocha --compilers coffee:coffee-script \
        --reporter $(REPORTER)

doc:
	$(BIN)/markdox src/enumerate-properties.coffee -o documentation.md

.PHONY: build test doc
