from operator import imod
from django.contrib.auth.models import User
from rest_framework import status
from rest_framework.test import APIClient
import pytest

@pytest.mark.django_db
class TestCreateCollection:
    def test_if_user_is_anonymous_returns_401(self):
        #ARRANGE-- prepare the test

        #ACT
        client = APIClient()
        response = client.post('/store/collections/', {'title':'a'})

        # ASSERT -- IF OUR APPLICATION IS BEHAVING THE WAY IT IS SUPPOSED TO
        assert response.status_code == status.HTTP_401_UNAUTHORIZED

    # Test to authenticate a user
    def test_if_user_is_not_admin_returns_403(self):
        client = APIClient()
        client.force_authenticate(user={})
        response = client.post('/store/collections/', {'title':'a'})
        assert response.status_code == status.HTTP_403_FORBIDDEN

    # Test where the user is authenticated and current user is admin but data is invalid - use of multiple assertions
    def test_if_data_is_invalid_returns_400(self):
        client = APIClient()
        client.force_authenticate(user=User(is_staff=True))
        response = client.post('/store/collections/', {'title':''})
        assert response.status_code == status.HTTP_400_BAD_REQUEST
        assert response.data['title'] is not None

    # Test if data is valid
    def test_if_data_is_valid_returns_200(self):
        client = APIClient()
        client.force_authenticate(user=User(is_staff=True))
        response = client.post('/store/collections/', {'title':'a'})
        assert response.status_code == status.HTTP_201_CREATED
        assert response.data['id'] > 0
