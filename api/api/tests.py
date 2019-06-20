from django.test import TestCase

from api.models import User
from api.views import UserView

import json

# Create your tests here.

class UserTestCase(TestCase):
    def setUp(self):
        User.objects.create_user(email="test@email.fr",
                                password="testpassword",
                                phone="+33 1 15 35 95 75",
                                first_name="firstname",
                                last_name="lastname",
                                username="testusername"
                                )

    def test_user_password(self):
        user = User.objects.get(email="test@email.fr")
        self.assertTrue(user.check_password("testpassword"))

    def test_api(self):
        user = User.objects.get(email="test@email.fr")

        userView = UserView();
        request = userView.get(request=None, id=user.id)
        content_decoded = request.content.decode('utf8')
        content_json = json.loads(content_decoded)

        self.assertEqual(content_json['data']['email'], user.email)
        self.assertEqual(content_json['data']['phone'], user.phone)
        self.assertEqual(content_json['data']['first_name'], user.first_name)
        self.assertEqual(content_json['data']['last_name'], user.last_name)
