.PHONY: notesui image enter ready

notesapp.%:
	$(HIDE) docker run -it  --rm --name notesapp-$* -v $(PWD):/notesapp \
	-p 3000:3000 --link mysql -h notesapp \
	notesapp_image \
    $(if $(filter '$*','server'),bundle exec rails s --port 3000 -b '0.0.0.0',) \
    $(if $(filter '$*','bundle'),bundle install,) \
    $(if $(filter '$*','migrate'),bundle exec rake db:migrate,) \
    $(if $(filter '$*','bash'),bash,)

image:
	docker build -t notesapp_image .

enter:
	docker exec -it notesapp bash

mysql:
	docker run --name mysql \
	-h db \
	-e MYSQL_ROOT_PASSWORD=root \
	-e MYSQL_DATABASE=notesapp \
	-d mysql