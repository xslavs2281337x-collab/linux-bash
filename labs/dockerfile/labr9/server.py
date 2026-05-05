import os
from http.server import HTTPServer, BaseHTTPRequestHandler

VERSION = os.environ.get("APP_VERSION", "unknown")
AUTHOR = "Slavus"
APP_ENV = os.environ.get("APP_ENV", "unknown")

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/health":
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"ok")
            return
        self.send_response(200)
        self.send_header("Content-Type", "text/html; charset=utf-8")
        self.end_headers()
        html = f"<h1>Version: {VERSION}</h1><p>Author: {AUTHOR}</p><p>Env: {APP_ENV}</p>"
        self.wfile.write(html.encode())

HTTPServer(("0.0.0.0", 8000), Handler).serve_forever()