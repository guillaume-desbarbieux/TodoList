import io
from src.todo import app

def test_app_runs():
    environ = {
        'REQUEST_METHOD': 'GET',
        'PATH_INFO': '/todo',
        'wsgi.input': io.BytesIO(b''),
        'wsgi.errors': io.StringIO(),
        'wsgi.version': (1, 0),
        'wsgi.run_once': False,
        'wsgi.url_scheme': 'http',
        'wsgi.multithread': False,
        'wsgi.multiprocess': False,
    }

    def start_response(status, headers, exc_info=None):
        assert status.startswith('200')

    result = app(environ, start_response)
    body = b''.join(result)
    assert b"Todo" in body