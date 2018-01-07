import cProfile
from tests.perf_benchmark import benchmark

cProfile.run("benchmark()")

