.DEFAULT_GOAL := default

default: help

.PHONY: run
run:	## 预览主题
	@echo "\033[32m =====> running ...\033[0m"	
	hugo server --source=exampleSite

.PHONY: build
build:	clear	## 构建主题
	hugo --source=exampleSite
	@echo "\033[32mbuild done!\033[0m"

.PHONY: clear
clear:	## 清除构建产物 (public 文件夹)
	@echo "\033[32m =====> Clearing public folder ..."
	@-rm -rf ./exampleSite/public
	@echo "Done!\033[0m"

.PHONY: help
help: Makefile ## 打印 Makefile help 信息.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<TARGETS>\033[0m\n\n\033[35mTargets:\033[0m\n"} /^[0-9A-Za-z._-]+:.*?##/ { printf "  \033[36m%-45s\033[0m %s\n", $$1, $$2 } /^\$$\([0-9A-Za-z_-]+\):.*?##/ { gsub("_","-", $$1); printf "  \033[36m%-45s\033[0m %s\n", tolower(substr($$1, 3, length($$1)-7)), $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' Makefile #$(MAKEFILE_LIST)