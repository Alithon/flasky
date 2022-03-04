all:
	@echo "Invalid make target"
	@echo "Try one of the following"
	@echo "make build	- To build zeroarm"
	@echo "make run   	- To run zeroarm"
	@echo "make test  	- To run test cases"
	@exit 1
.PHONY: all

build:
	docker build . -t alithon/zeroarm
.PHONY: build

run:
	export FLASK_APP=zeroarm.py
	export FLASK_DEBUG=1
	export FLASK_CONFIG="development"
	export ZEROARM_DEV_DATABASE_URL="mysql://bill:bill2021@127.0.0.1:3306/zeroarm?charset=utf8"
	flask deploy
	flask run --host=0.0.0.0
.PHONY: run

build:
	docker build -t alithon/zeroarm .
.PHONY: build

test:
	python3 -m unittest discover tests/
.PHONY: test
