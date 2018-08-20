dev:
	cp ./src/services/util_dev.js ./src/services/util.js
	npm run dev

pro:
	cp ./src/services/util_pro.js ./src/services/util.js
	npm run build
