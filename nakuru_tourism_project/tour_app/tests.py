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


# testing the API
from django.test import TestCase
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase

from .models import AttractionSite

class AttractionsiteTest(TestCase):
    @classmethod
    def setUpTestData(cls):
       cls.attraction = AttractionSite.objects.create(
           name= 'nakuru national park',
           description= 'home of flamigoes',
           category= 'national park'
       )

    def test_model_content(self):
        self.assertEqual(self.attraction.name, 'nakuru national park')
        self.assertEqual(self.attraction.description, 'home of flamingoes')
        self.assertEqual(self.attraction.category, 'national park')

    def test_api_listview(self):
        response = self.client.get(reverse('attraction_list'))
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(AttractionSite.objects.count(), 1)
        self.assertContains(response, self.attraction)

    def test_api_detailview(self):
        response = self.client.get(
            reverse("attraction-detals", kwargs={"pk": self.attraction.id}),
            format="json"
        )
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(AttractionSite.objects.count(), 1)
        self.assertContains(response, 'nakuru national park')