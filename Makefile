# Make tools for personal website.

serve:
	python3 -m http.server 8080 && open 'http://localhost:8080'

dev: serve

.PHONY: dev serve
