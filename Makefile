# 📄 /Makefile

COMPOSE = docker compose -f deploy/docker-compose.yml

up:
	@$(COMPOSE) up -d --build
	@$(COMPOSE) exec gateway php artisan key:generate || true
	@echo "✅ Laravel key generated"

logs:
	@$(COMPOSE) logs -f

logs-%:
	@$(COMPOSE) logs -f $*

health:
	@curl -s http://localhost:8080/api/healthz | jq

down:
	@$(COMPOSE) down

restart:
	@$(MAKE) down
	@$(MAKE) up

lint:
	@docker run --rm -v $(PWD)/gateway:/app -w /app laravelsail/php82-composer:latest \
	bash -c "composer global require laravel/pint && ~/.composer/vendor/bin/pint"
	@docker run --rm -v $(PWD)/panel:/app -w /app node:20-alpine \
	sh -c "npm install && npm run lint || true"
