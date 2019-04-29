from django.db import models
from django.conf import settings

class SearchTerm(models.Model):
	q = models.CharField(max_length=50)
	search_date = models.DateTimeField(auto_now_add=True)
	ip_address = models.GenericIPAddressField()
	user = models.ForeignKey(settings.AUTH_USER_MODEL, null=True ,on_delete=models.CASCADE)

	def __str__(self):
		return self.q