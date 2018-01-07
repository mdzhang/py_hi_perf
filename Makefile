PYFILES = particle_sim tests

install:
	pip install -r requirements.txt -r requirements-dev.txt -r requirements-test.txt

format:
	yapf -r -i ${PYFILES}

lint:
	flake8 ${PYFILES}

run:
	python -m particle_sim

# Also has pytest benchmarks
test:
	pytest tests

profile:
	PYTHONPATH=$$PYTHONPATH:./ python tests/perf_profile.py

lprofile:
	PYTHONPATH=$$PYTHONPATH:./ kernprof -l -v tests/perf_benchmark.py

taylor:
	python -m cProfile -o prof.out taylor.py
	pyprof2calltree -i prof.out -o prof.calltree
	qcachegrind prof.calltree
