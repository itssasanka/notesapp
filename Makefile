.PHONY: notesui image enter ready
notesapp:
	docker run -it  --rm --name notesapp -v $(PWD):/notesapp \
	-p 3000:3000 --link mysql -h notesapp \
	notesapp_image bundle exec rails s --port 3000 -b '0.0.0.0'
image:
	docker build -t notesapp_image .
enter:
	docker exec -it --rm notesapp bash
migrate:
	docker run -it --rm -v $(PWD):/notesapp \
	--link mysql \
	notesapp_image \
	bundle exec rake db:migrate
mysql:
	docker run --name mysql \
	-h db \
	-e MYSQL_ROOT_PASSWORD=root \
	-e MYSQL_DATABASE=notesapp \
	-d mysql