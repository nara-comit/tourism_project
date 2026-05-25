from django.test import TestCase
from .models import AttractionSite
# Create your tests here.
class AttractionSiteModelTest(TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.attractionsite=AttractionSite.objects.create(
            name='Nakuru national park', 
            description='home of flamingoes',
            latitude=34.5,
            longitude=-1.24

        )
    def test_model_content(self):
        self.assertEqual(self.attractionsite.name, 'Nakuru national park')
        self.assertEqual(self.attractionsite.description, 'home of flamingoes')
        self.assertEqual(self.attractionsite.latitude, 34.5)
        self.assertEqual(self.attractionsite.longitude, -1.24)
