OPENRESTY_VERSION ?= 1.25.3.1

build: build-heroku-22

build-heroku-22:
	@echo "Building OpenResty in Docker for heroku-22 ..."
	@docker run -v $(shell pwd):/buildpack -w /buildpack --rm -it \
		 -e "STACK=heroku-22" -e "OPENRESTY_VERSION=$(OPENRESTY_VERSION)" -e "LUAROCKS_VERSION=$(LUAROCKS_VERSION)" \
		heroku/heroku:22-build bin/build /buildpack/dist/openresty-heroku-22.tar.gz

shell-heroku-22:
	@echo "Start a Docker shell for heroku-22 ..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=heroku-22" -w /buildpack heroku/heroku:22-build bash

release:
	git commit -a -m "Rebuilding stacks"
	git push origin master
