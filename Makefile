.PHONY: notesui image enter ready

BUNDLE = notesapp_bundle

notesapp.%:
	$(HIDE) docker run -it  --rm --name notesapp-$* \
		-v $(BUNDLE):/notesapp_bundle \
		-v $(PWD):/notesapp \
		$(if $(filter '$*','server'),-p 3000:3000,) \
		--link mysql \
		notesapp_image \
		$(if $(filter '$*','server'),bundle exec rails s --port 3000 -b '0.0.0.0',) \
		$(if $(filter '$*','bundle'),bundle install,) \
		$(if $(filter '$*','migrate'),bundle exec rake db:migrate,) \
		$(if $(filter '$*','bash'),bash,)

image:
	docker build -t notesapp_image .

enter:
	docker exec -it notesapp-server bash

mysql:
	docker run --name mysql \
	-h db \
	-e MYSQL_ROOT_PASSWORD=root \
	-e MYSQL_DATABASE=notesapp \
	-d mysql