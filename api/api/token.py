from django.conf import settings

import base64
import hmac
import hashlib
import json

def generate_signature(message):
    return bytes(base64.b64encode(hmac.new(settings.SECRET_TOKEN, message, hashlib.sha512).digest()).strip(b"="))

class Token(object):
    """
    """

    header = base64.b64encode(bytes(json.dumps({'typ': "split", 'alg': "SHA512"}), 'utf-8')).strip(b"=")
    payload = b""
    signature = ""

    complete = ""

    def __init__(self, payload, *args, **kwargs):
        """
        """

        self.payload = self.generate_payload(payload)
        self.sign()
        self.complete = f"{self.header.decode('utf-8')}.{self.payload.decode('utf-8')}.{self.signature.decode('utf-8')}"

    def __str__(self):
        return self.complete

    @staticmethod
    def generate_payload(payload):
        if isinstance(payload, dict):
            return base64.b64encode(bytes(json.dumps(payload), 'utf-8')).strip(b"=")
        else:
            return base64.b64encode(payload).strip(b"=")

    def sign(self):
        self.signature = generate_signature(self.header + self.payload)
