from django.contrib import admin
from .models import Category, AttractionSite, Pricing, Hotel,  VisitorStat

# Register your models here.

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display=[ 'name', 'created_at']
    search_fields=['name', 'description']

@admin.register(AttractionSite)
class AttractionSiteAdmin(admin.ModelAdmin):
    list_display =['name', 'description', 'category']
    list_filter= ['category', 'is_active']
    search_fields = ['name', 'description']

@admin.register(Pricing)
class PricingAdmin(admin.ModelAdmin):
    list_display =('attraction_site', 'visitor_type', 'price')
    search_fields = ('attraction_site', 'description')


@admin.register(VisitorStat)
class VisitorStatAdmin(admin.ModelAdmin):
    list_display=('attraction_site', 'year')

@admin.register(Hotel)
class HotelAdmin(admin.ModelAdmin):
    list_display =('name', 'description', 'star_rating', 'price_per_night')
    list_filter = ('star_rating', 'is_active')
    search_fields = ('name', 'description', 'address')