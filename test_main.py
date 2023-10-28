import unittest
import numpy as np
import soundfile as sf

from main import load_prepare

class TestAudioTimeScaling(unittest.TestCase):
    def test_load_prepare(self):
        # Test if the load_prepare function loads and processes an audio file correctly
        fs, inp_s, sigout = load_prepare(file_input="test_mono.wav", N=2048)
        self.assertEqual(fs, 22050)  # Adjust this based on your actual sample rate
        self.assertEqual(len(inp_s), len(sigout))
if __name__ == '__main__':
    unittest.main()
