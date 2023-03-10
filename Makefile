.PHONY: release install test build compile lint

release: test build compile lint
	rm -rf build
	mkdir build
	cp dist build -r
	cp backend/dist build/server -r
	cp backend/runtime-package.json build/package.json
	printf "npm install && node ./server" >build/run.sh
	printf "npm install && node .\server" >build/run.bat

install:
	npm install
	cd backend && npm install

test: install
	npm run test

build: install
	npm run build

compile: install
	cd backend && npm run compile

lint: install
	npm run lint

clean:
	rm -rf build dist node_modules
	rm -rf backend/coverage backend/dist backend/node_modules
