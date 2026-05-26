from django.urls import path
from .views import ( CategoryList, CategoryRetrieve, AttractionSiteList,
 AttractionSiteRetrieve, PricingList, PricingRetrieve,
 HotelList, HotelRetrieve, VisitorStatList, VisitorStatRetrieve)

urlpatterns =[

    #Categories urls
    path('categories/', CategoryList.as_view(), name='category-list'),
    path('categories/<int:pk>/', CategoryRetrieve.as_view(), name='category-detail'),

 # 2 Attraction site urls
    path('attractions/', AttractionSiteList.as_view(), name='attraction-list'),
    path('attractions/<int:pk>/', AttractionSiteRetrieve.as_view(), name='attraction-details'),

    # 3 Pricing uls
    path('pricing/', PricingList.as_view(), name='pricing-list'),
    path('pricing/<int:pk>/', PricingRetrieve.as_view(), name='pricing-details'),

    #4 visitor stat urls
    path('visitors/', VisitorStatList.as_view(), name='visitor-statitics'),
    path('visitors/<int:pk>/', VisitorStatRetrieve.as_view(), name='visitor-statics-details'),
    
    #5 hoels uls

    path('hotels/', HotelList.as_view(), name='hotels-list'),
    path('hotels/<int:pk>/', HotelRetrieve.as_view(), name='hotel-details'),
     
     ]

