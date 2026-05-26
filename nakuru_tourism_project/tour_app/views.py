from rest_framework.generics import ListAPIView, RetrieveAPIView
from .models import Category, AttractionSite, Pricing, Hotel, VisitorStat
from .serializers import CategorySerializer, AttractionSiteSerializer, PricingSerializer
from .serializers import HotelSerializer, VisitorStatSerializer
    
# Create your views here.
#CategoryListAPIView, CategoryRetrieveAPIView, AttractionSiteListAPIView,
# AttractionSiteRetrieveAPIView, PricingSiteListAPIView, PricingRetrieveAPIView, 
# HotelListAPIView, HotelRetrieveAPIView, VisitorStatListAPIView, VisitorStatRetrieveAPIView
class CategoryList(ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

class CategoryRetrieve(RetrieveAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

class AttractionSiteList(ListAPIView):
    queryset = AttractionSite.objects.all()
    serializer_class = CategorySerializer

class AttractionSiteRetrieve(RetrieveAPIView):
    queryset = AttractionSite.objects.all()
    serializer_class = AttractionSiteSerializer

# pricibf views
class PricingList(ListAPIView):
    queryset = Pricing.objects.all()
    serializer_class = PricingSerializer

class PricingRetrieve(RetrieveAPIView):
    queryset = Pricing.objects.all()
    serializer_class = PricingSerializer

# Hotel views
class HotelList(ListAPIView):
    queryset = Hotel.objects.all()
    serializer_class = HotelSerializer

class HotelRetrieve(RetrieveAPIView):
    queryset = Hotel.objects.all()
    serializer_class = HotelSerializer

# VisitorStat views
class VisitorStatList(ListAPIView):
    queryset = VisitorStat.objects.all()
    serializer_class = VisitorStatSerializer

class VisitorStatRetrieve(RetrieveAPIView):
    queryset = VisitorStat.objects.all()
    serializer_class = VisitorStatSerializer

