import subprocess
import tempfile
import unittest
from pathlib import Path


class TestSimpleInterest(unittest.TestCase):
    def test_calculates_simple_interest(self):
        with tempfile.TemporaryFile() as input_stream:
            input_stream.write(b"1000\n5\n2\n")
            input_stream.seek(0)
            result = subprocess.run(
                ["bash", "./simple-interest.sh"],
                cwd=Path(__file__).parent,
                stdin=input_stream,
                capture_output=True,
                text=True,
                check=True,
            )

        self.assertIn("Simple Interest = 100", result.stdout)
