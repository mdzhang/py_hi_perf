import unittest

from particle_sim.simulator import ParticleSimulator
from particle_sim.particle import Particle


class TestParticleSimulator(unittest.TestCase):
    def test_evolve(self):
        particles = [Particle( 0.3,  0.5, +1),
                     Particle( 0.0, -0.5, -1),
                     Particle(-0.1, -0.4, +3)]
        simulator = ParticleSimulator(particles)
        simulator.evolve(0.1)
        p0, p1, p2 = particles

        def fequal(a, b, eps=1e-5):
            return abs(a - b) < eps

        self.assertTrue(fequal(p0.x, 0.210269))
        self.assertTrue(fequal(p0.y, 0.543863))
        self.assertTrue(fequal(p1.x, -0.099334))
        self.assertTrue(fequal(p1.y, -0.490034))
        self.assertTrue(fequal(p2.x,  0.191358))
        self.assertTrue(fequal(p2.y, -0.365227))


if __name__ == '__main__':
    unittest.main()
