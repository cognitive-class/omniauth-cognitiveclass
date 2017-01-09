.PHONY: build precommit push

VERSION:=$(shell cat VERSION)

build: precommit tag
	gem build *.gemspec

push: build
	gem push *-$(VERSION).gem

precommit:
	-rubocop -Da
	bundle-audit check --update

tag:
	git tag -f v$(VERSION)
