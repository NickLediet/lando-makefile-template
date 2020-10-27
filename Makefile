.PHONY: help
THEME_PATH = ./path/to/your/theme
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

dev: ## Start gulp & webpack to compile front-end assets.
	lando npm start --prefix $(THEME_PATH)

install: ## Install development dependencies.
	lando composer install
	lando npm install --prefix $(THEME_PATH)

setup: ## Build local environment.
	lando rebuild -y
	# Uncomment if you're using the pantheon recipe
	# lando pull

nuke-deps: ## Remove installed dependencies
	rm -rf $(THEME_PATH)
