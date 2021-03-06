REPORTER = dot
MOCHA = ./node_modules/.bin/mocha
_MOCHA = ./node_modules/.bin/_mocha
ISTANBUL = ./node_modules/.bin/istanbul
TESTS = test/**/*.test.js

test:
	@NODE_ENV=test $(MOCHA) \
		--ui exports \
		--reporter $(REPORTER) \
		--async-only \
		$(TESTS)

test-w:
	@NODE_ENV=test $(MOCHA) \
		--ui exports \
		--reporter $(REPORTER) \
		--async-only \
		--growl \
		--watch \
        $(TESTS)

coverage:
	@test -d reports || mkdir reports
	$(ISTANBUL) cover --report html --dir ./reports $(_MOCHA) -- -A -u exports -R spec $(TESTS)

.PHONY: test test-w
