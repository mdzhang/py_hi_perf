PYFILES = particle_sim tests

install:
	pip install -r requirements.txt -r requirements-dev.txt

format:
	yapf -r -i ${PYFILES}

lint:
	flake8 ${PYFILES}

run:
	python -m particle_sim

test:
	python -m unittest discover -s tests

bench:
	time PYTHONPATH=$$PYTHONPATH:./ python tests/benchmark.py
