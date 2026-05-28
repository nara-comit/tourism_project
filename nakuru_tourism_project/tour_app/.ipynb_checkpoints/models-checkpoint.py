from django.db import models
from django.core.validators import MinValueValidator
from django.utils import timezone


class Category(models.Model):
    
    name = models.CharField(max_length=100, unique=True)
    description = models.TextField(blank=True, null=True)
    icon = models.ImageField(upload_to='category_icons/', blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = "Categories"
        ordering = ['name']

    def __str__(self):
        return self.name


class AttractionSite(models.Model):
    
    name = models.CharField(max_length=255)
    description = models.TextField()
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True, related_name='attraction_sites')
    latitude = models.DecimalField(max_digits=9, decimal_places=6)
    longitude = models.DecimalField(max_digits=9, decimal_places=6)
    address = models.CharField(max_length=255)
    opening_hours = models.CharField(max_length=100, default="9:00 AM - 5:00 PM")
    contact_phone = models.CharField(max_length=20, blank=True, null=True)
    contact_email = models.EmailField(blank=True, null=True)
    website = models.URLField(blank=True, null=True)
    image = models.ImageField(upload_to='attraction_sites/', blank=True, null=True)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['name']
        indexes = [
            models.Index(fields=['latitude', 'longitude']),
            models.Index(fields=['category']),
        ]

    def __str__(self):
        return self.name


class Pricing(models.Model):
   
    VISITOR_TYPE_CHOICES = [
        ('adult', 'Adult'),
        ('child', 'Child (6-17)'),
        ('student', 'Student'),
        ('family', 'Family Package'),
    ]

    attraction_site = models.ForeignKey(AttractionSite, on_delete=models.CASCADE, related_name='pricing')
    visitor_type = models.CharField(max_length=20, choices=VISITOR_TYPE_CHOICES)
    price = models.DecimalField(max_digits=10, decimal_places=2, validators=[MinValueValidator(0)])
    currency = models.CharField(max_length=3, default='KES')  
    valid_from = models.DateField(auto_now_add=True)
    valid_until = models.DateField(blank=True, null=True)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['attraction_site', 'visitor_type']
        unique_together = ['attraction_site', 'visitor_type', 'valid_from']

    def __str__(self):
        return f"{self.attraction_site.name} - {self.get_visitor_type_display()}: {self.price} {self.currency}"


class VisitorStat(models.Model):
    
    

    attraction_site = models.ForeignKey(AttractionSite, on_delete=models.CASCADE, related_name='visitor_stats')
    year =models.IntegerField()
    visitor_count= models.PositiveIntegerField()
    
    def __str__(self):
        return f"{self.attraction_site.name} - {self.year}: {self.visitor_count} visitors"


class Hotel(models.Model):
    
    RATING_CHOICES = [
        (1, '⭐'),
        (2, '⭐⭐'),
        (3, '⭐⭐⭐'),
        (4, '⭐⭐⭐⭐'),
        (5, '⭐⭐⭐⭐⭐'),
    ]

    name = models.CharField(max_length=255)
    description = models.TextField()
    latitude = models.DecimalField(max_digits=9, decimal_places=6)
    longitude = models.DecimalField(max_digits=9, decimal_places=6)
    address = models.CharField(max_length=255)
    contact_phone = models.CharField(max_length=20)
    contact_email = models.EmailField()
    website = models.URLField(blank=True, null=True)
    star_rating = models.IntegerField(choices=RATING_CHOICES, default=3)
    price_per_night = models.DecimalField(max_digits=10, decimal_places=2, validators=[MinValueValidator(0)])
    currency = models.CharField(max_length=3, default='KES')
    total_rooms = models.IntegerField(validators=[MinValueValidator(1)])
    available_rooms = models.IntegerField(validators=[MinValueValidator(0)])
    amenities = models.TextField(help_text="Comma-separated list of amenities (WiFi, Gym, Restaurant, etc.)")
    check_in_time = models.TimeField(default="14:00")
    check_out_time = models.TimeField(default="11:00")
    image = models.ImageField(upload_to='hotels/', blank=True, null=True)
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['star_rating', 'name']
        indexes = [
            models.Index(fields=['latitude', 'longitude']),
            models.Index(fields=['star_rating']),
        ]

    def __str__(self):
        return f"{self.name} ({self.get_star_rating_display()})"

    def availability_percentage(self):
        """Calculate the percentage of available rooms."""
        if self.total_rooms == 0:
            return 0
        return (self.available_rooms / self.total_rooms) * 100
