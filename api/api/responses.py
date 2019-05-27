from django.http import JsonResponse

class CORSResponse(JsonResponse):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self['Access-Control-Allow-Origin'] = '*'


class APIResponse(CORSResponse):

    def __init__(self, code, reason, data={}, *args, **kwargs):
        super().__init__({
            'statuscode': code,
            'reason': reason,
            'data': data
        }, safe=False, *args, **kwargs)


class NotImplemented(APIResponse):

    def __init__(self, *args, **kwargs):
        super().__init__(501, "Verbs not implemented", *args, **kwargs)