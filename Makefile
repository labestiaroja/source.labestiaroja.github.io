BASE_HREF = /
GITHUB_USER = labestiaroja
GITHUB_PAGE = labestiaroja.github.io
GITHUB_REPO = https://github.com/$(GITHUB_USER)/$(GITHUB_PAGE)
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy:
	@echo "PROCESS: flutter clean"
	flutter clean

	@echo "PROCESS: flutter pub get"
	flutter pub get

	@echo "PROCESS: flutter create . -e --platforms web --project-name labestiaroja"
	flutter create . -e --platforms web --project-name labestiaroja

	@echo "PROCESS: flutter build web --base-href $(BASE_HREF) --release"
	flutter build web --base-href $(BASE_HREF) --release

	@echo "PROCESS: Deploying"
	mkdir -p build/web/.github/workflows/ && \
	cp static.yaml build/web/.github/workflows/ && \
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "task(deploy): $(BUILD_VERSION)" && \
	git branch -M master && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u -f origin master

	@echo "DEPLOY: $(GITHUB_REPO)"
	@echo "WEBURL: https://$(GITHUB_USER).github.io/"

.PHONY: deploy
