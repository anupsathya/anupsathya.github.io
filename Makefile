# Make tools for personal website.

CHROME = /Applications/Google Chrome.app/Contents/MacOS/Google Chrome
PORT   = 8080
PDF    = anup-sathya-cv.pdf

serve:
	python3 -m http.server $(PORT) & open 'http://localhost:$(PORT)'

dev: serve

pdf:
	@python3 -m http.server $(PORT) & echo $$! > /tmp/cv-server.pid
	@sleep 1
	"$(CHROME)" \
		--headless=new \
		--disable-gpu \
		--no-pdf-header-footer \
		--virtual-time-budget=3000 \
		--print-to-pdf="$(PWD)/$(PDF)" \
		"http://localhost:$(PORT)/cv/"
	@kill $$(cat /tmp/cv-server.pid) 2>/dev/null; rm -f /tmp/cv-server.pid
	@echo "Generated $(PDF) ($$(du -h $(PDF) | cut -f1))"

.PHONY: dev serve pdf
