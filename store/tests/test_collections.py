from rest_framework import status
from rest_framework.test import APIClient

class TestCreateCollection:
    def test_if_user_is_anonymous_returns_401(self):
        #ARRANGE

        #ACT
        client = APIClient()
        response = client.post('store/collections/', {'title':'a'})

        # ASSERT -- IF OUR APPLICATION IS BEHAVING THE WAY IT IS SUPPOSED TO
        assert response.status_code == status.HTTP_401_UNAUTHORIZED