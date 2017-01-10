.PHONY: build clean precommit push

VERSION:=$(shell cat VERSION)

build: precommit tag
	gem build *.gemspec

clean:
	rm *.gem

push: build
	gem push *-$(VERSION).gem
	make clean

precommit:
	-rubocop -Da
	bundle-audit check --update

tag:
	git tag -f v$(VERSION)
