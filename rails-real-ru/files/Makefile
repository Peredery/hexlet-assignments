setup:
	bin/setup
	yarn install
	bin/rails db:fixtures:load

start:
	bin/dev

console:
	bin/rails console

shell:
	docker-compose run --rm web bash

test:
	yarn run build
	yarn run build:css
	NODE_ENV=test bin/rails test

.PHONY: test
