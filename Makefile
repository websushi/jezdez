.PHONY: clean

KEEP = CHECKS config.js DOKKU.md Makefile Procfile
VERSION ?=

clean:
	@echo "Keeping: $(KEEP)"
	rm -rf *
	git checkout -- $(KEEP)


install: clean
	wget https://github.com/TryGhost/Ghost/releases/download/$(VERSION)/Ghost-$(VERSION).zip
	unzip Ghost-*.zip
	rm Ghost-*.zip
