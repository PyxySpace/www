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
	#yarn install
	#...

# ################## #
# ##### Docker ##### #
# ################## #

docker.up:
	rm -rf var/{cache,log,sessions}
	docker-compose -p $(PROJECT_NAME) up -d --build;\
