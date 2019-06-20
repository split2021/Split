from django.test import TestCase
from django.http import HttpRequest

from api.models import User
from api.views import UserView, UsersView

import json

# Create your tests here.

def getJsonFromResponse(response):
        content_decoded = response.content.decode()
        return json.loads(content_decoded)

class UserTestCase(TestCase):
    def setUp(self):
        self.userView = UserView()

        self.emptyRequest = HttpRequest()
        self.emptyRequest.META['CONTENT_LENGTH'] = 0
        self.emptyRequest._body = b""

        User.objects.create_user(email="test@email.fr",
                                password="testpassword",
                                phone="+33 1 15 35 95 75",
                                first_name="testfirstname",
                                last_name="testlastname",
                                username="testusername"
                                )

    def test_get_existing_user(self):
        user = User.objects.get(email="test@email.fr")

        response = self.userView.get(request=self.emptyRequest, id=user.id)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 200)
        self.assertEqual(content_json['reason'], "user retrieved successfully")

        self.assertEqual(content_json['data']['email'], user.email)
        self.assertEqual(content_json['data']['phone'], user.phone)
        self.assertEqual(content_json['data']['first_name'], user.first_name)
        self.assertEqual(content_json['data']['last_name'], user.last_name)
        self.assertEqual(content_json['data']['username'],  user.username)

    def test_get_nonexisting_user(self):
        response = self.userView.get(request=self.emptyRequest, id=42)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 404)
        self.assertEqual(content_json['reason'], "user not found")


    def test_patch_existing_user_with_content(self):
        user = User.objects.get(email="test@email.fr")

        request = HttpRequest()
        request._body = json.dumps({
            'email': "testpatch@email.fr",
            'phone': "+33 2 15 35 95 75",
            'first_name': "patchfirstname",
            'last_name': "patchlastname",
            'username': "patchusername"
        }).encode()
        request.META['CONTENT_LENGTH'] = 42
        response = self.userView.patch(request=request, id=user.id)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 200)
        self.assertEqual(content_json['reason'], "user updated successfully")

        user = User.objects.get(id=user.id)
        self.assertEqual(user.email, "testpatch@email.fr")
        self.assertEqual(user.phone, "+33 2 15 35 95 75")
        self.assertEqual(user.first_name, "patchfirstname")
        self.assertEqual(user.last_name,  "patchlastname")
        self.assertEqual(user.username,  "patchusername")

    def test_patch_existing_user_without_content(self):
        user = User.objects.get(email="test@email.fr")

        response = self.userView.patch(request=self.emptyRequest, id=user.id)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 204)
        self.assertEqual(content_json['reason'], "A content is required to update user")

    def test_patch_existing_user_with_content(self):
        request = HttpRequest()
        request._body = json.dumps({
            'email': "testpatch@email.fr",
            'phone': "+33 2 15 35 95 75",
            'first_name': "patchfirstname",
            'last_name': "patchlastname",
            'username': "patchusername"
        }).encode()
        request.META['CONTENT_LENGTH'] = 42
        response = self.userView.patch(request=request, id=42)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 404)
        self.assertEqual(content_json['reason'], "user not found")


    def test_post_user_with_content(self):
        request = HttpRequest()
        request._body = json.dumps({
            'email': "test2@email.fr",
            'password': "test2password",
            'phone': "+33 2 15 35 95 75",
            'first_name': "test2firstname",
            'last_name': "test2lastname",
            'username': "test2username",
        }).encode()
        request.META['CONTENT_LENGTH'] = 42
        response = self.userView.post(request=request)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 201)
        self.assertEqual(content_json['reason'], "user created successfully")

    def test_post_user_without_content(self):
        response = self.userView.post(request=self.emptyRequest)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 204)
        self.assertEqual(content_json['reason'], "A content is required to create user")


    def test_put_existing_user_with_content(self):
        user = User.objects.get(email="test@email.fr")

        request = HttpRequest()
        request._body = json.dumps({
            'email': "testput@email.fr",
            'phone': "+33 3 15 35 95 75",
            'first_name': "putfirstname",
            'last_name': "putlastname",
            'username': "putusername"
        }).encode()
        request.META['CONTENT_LENGTH'] = 42
        response = self.userView.put(request=request, id=user.id)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 200)
        self.assertEqual(content_json['reason'], "user updated successfully")

        user = User.objects.get(id=user.id)
        self.assertEqual(user.email, "testput@email.fr")
        self.assertEqual(user.phone, "+33 3 15 35 95 75")
        self.assertEqual(user.first_name, "putfirstname")
        self.assertEqual(user.last_name,  "putlastname")
        self.assertEqual(user.username,  "putusername")

    def test_put_nonexisting_user_with_content(self):
        request = HttpRequest()
        request._body = json.dumps({
            'email': "testput@email.fr",
            'phone': "+33 3 15 35 95 75",
            'first_name': "putfirstname",
            'last_name': "putlastname",
            'username': "putusername"
        }).encode()
        request.META['CONTENT_LENGTH'] = 42
        response = self.userView.put(request=request, id=42)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 200)
        self.assertEqual(content_json['reason'], "user created successfully")

        user = User.objects.get(id=42)
        self.assertEqual(user.email, "testput@email.fr")
        self.assertEqual(user.phone, "+33 3 15 35 95 75")
        self.assertEqual(user.first_name, "putfirstname")
        self.assertEqual(user.last_name,  "putlastname")
        self.assertEqual(user.username,  "putusername")

    def test_put_existing_user_without_content(self):
        user = User.objects.get(email="test@email.fr")

        response = self.userView.put(request=self.emptyRequest, id=user.id)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 204)
        self.assertEqual(content_json['reason'], "A content is required to emplace user")

    def test_put_nonexisting_user_without_content(self):
        response = self.userView.put(request=self.emptyRequest, id=42)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 204)
        self.assertEqual(content_json['reason'], "A content is required to emplace user")


    def test_delete_existing_user(self):
        user = User.objects.get(email="test@email.fr")

        response = self.userView.delete(request=self.emptyRequest, id=user.id)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 200)
        self.assertEqual(content_json['reason'], "user deleted successfully")

    def test_delete_nonexisting_user(self):
        response = self.userView.delete(request=self.emptyRequest, id=42)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 404)
        self.assertEqual(content_json['reason'], "user not found")


class UsersTestCase(TestCase):
    def setUp(self):
        self.usersView = UsersView()

        self.emptyRequest = HttpRequest()
        self.emptyRequest.META['CONTENT_LENGTH'] = 0
        self.emptyRequest._body = b""

        User.objects.create_user(email="test@email.fr",
                                password="testpassword",
                                phone="+33 1 15 35 95 75",
                                first_name="testfirstname",
                                last_name="testlastname",
                                username="testusername"
                                )

    def test_get_users(self):
        response = self.usersView.get(request=self.emptyRequest)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 200)
        self.assertEqual(content_json['reason'], "users retrieved successfully")

        self.assertEqual(type(content_json['data']), list)

    def test_patch_users(self):
        response = self.usersView.patch(request=self.emptyRequest)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 405)
        self.assertEqual(content_json['reason'], "Verb not allowed")

    def test_post_users_with_content(self):
        request = HttpRequest()
        request._body = json.dumps({
            'email': "test2@email.fr",
            'password': "test2password",
            'phone': "+33 2 15 35 95 75",
            'first_name': "test2firstname",
            'last_name': "test2lastname",
            'username': "test2username",
        }).encode()
        request.META['CONTENT_LENGTH'] = 42
        response = self.usersView.post(request=request)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 201)
        self.assertEqual(content_json['reason'], "user created successfully")

    def test_post_users_without_content(self):
        response = self.usersView.post(request=self.emptyRequest)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 204)
        self.assertEqual(content_json['reason'], "A content is required to create user")

    def test_put_users(self):
        response = self.usersView.put(request=self.emptyRequest)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 405)
        self.assertEqual(content_json['reason'], "Verb not allowed")

    def test_delete_users(self):
        response = self.usersView.delete(request=self.emptyRequest)
        content_json = getJsonFromResponse(response)

        self.assertEqual(content_json['statuscode'], 405)
        self.assertEqual(content_json['reason'], "Verb not allowed")
