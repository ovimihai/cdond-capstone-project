from unittest import TestCase
import app

class TestPrediction(TestCase):

    def test_homepage(self):
        print(app)
        print(dir(app))
        app.app.test = True
        with app.app.test_client() as c:
            response = c.get('/')

            self.assertEqual(response.status_code, 200)

            html = f"<h3>Sklearn Prediction Home</h3>"
            self.assertEqual(response.data.decode('utf-8'), html)

    def test_prediction(self):
        app.app.test = True
        with app.app.test_client() as c:
            data = {"CHAS": {"0": 0},
                 "RM": {"0": 6.575},
                 "TAX": {"0": 296.0},
                 "PTRATIO": {"0": 15.3},
                 "B": {"0": 396.9},
                 "LSTAT": {"0": 4.98}
                 }
            response = c.post('/predict', json=data)

            self.assertEqual(response.status_code, 200)

            html = '{"prediction":[20.35373177134412]}\n'
            self.assertEqual(response.data.decode('utf-8'), html)



