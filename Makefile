INSTALLDIR ?= $(HOME)


install:
	cp -vu  git/.gitconfig					$(INSTALLDIR)/.gitconfig
	cp -vu  curl/.curlrc					$(INSTALLDIR)/.curlrc
	cp -vur bin/*							$(INSTALLDIR)/.local/bin/
	chmod +x -R $(INSTALLDIR)/.local/bin


backup:
	cp -vu  $(INSTALLDIR)/.gitconfig		git/.gitconfig
	cp -vu  $(INSTALLDIR)/.curlrc		curl/.curlrc
	cp -vur $(INSTALLDIR)/.local/bin		bin
