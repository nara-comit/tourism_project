from rest_framework import serializers
from .models import Category, AttractionSite, Pricing, Hotel, VisitorStat

# CategorySerializer, AttractionSiteSerializer, PricingSerializer,
#HotelSerializer, VisitorStatSerializer
    
class CategorySerializer(serializers.ModelSerializer):
    class Meta: 
        model = Category
        fields = ['name', 'description', 'icon']

class AttractionSiteSerializer(serializers.ModelSerializer):
    class Meta:
        model =AttractionSite
        fields = ['name', 'description', 'category',
                  'latitude', 'longitude',  'address',
                    'opening_hours', 'contact_phone', 'contact_email', 
                    'website', 'image', 
                    ]

class PricingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pricing
        fields = [
            'attraction_site',
            'visitor_type' , 'price', 'currency', 
              'valid_from',  'valid_until',
    
        ]

class HotelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Hotel
        fields = [
           'name', 'description', 'latitude', 'longitude',  'address',
            'contact_phone', 'contact_email', 'website', 'price_per_night',
            'total_rooms', 'available_rooms', 'amenities', 'check_out_time'
    
        ]

class VisitorStatSerializer(serializers.ModelSerializer):
    class Meta:
        model = VisitorStat
        fields = [
            'attraction_site', 'year', 'visitor_count'
     
        ]