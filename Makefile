lint:
	pipenv run flake8 ./

test:
	pipenv run coverage run test.py
	pipenv run coverage report -m

scrape:
	pipenv run nasawildfires modis --indent=2 > data/modis.json
	pipenv run nasawildfires viirs --indent=2 > data/viirs.json

ship:
	rm -rf build/
	rm -rf dist/
	pipenv run python setup.py sdist bdist_wheel
	pipenv run twine upload dist/* --skip-existing

.PHONY: lint test scrape ship
