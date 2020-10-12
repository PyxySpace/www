# ####################### #
# ##### Application ##### #
# ####################### #
PROJECT_NAME=Pyxy

app.init: docker.up app.composer.install

app.permissions:
	docker-compose -p $(PROJECT_NAME) exec -uroot php chown -R www-data:www-data /app/var || true

app.composer.install: app.permissions
	docker-compose -p $(PROJECT_NAME) exec php composer install


release:
	yarn install
	git checkout develop
	git pull origin develop
	git checkout master
	git merge develop
	npm run release
	git push origin master
	git push origin develop
	git push --follow-tags origin master

# ################## #
# ##### Docker ##### #
# ################## #

docker.up:
	rm -rf var/{cache,log,sessions}
	docker-compose -p $(PROJECT_NAME) up -d --build;\
