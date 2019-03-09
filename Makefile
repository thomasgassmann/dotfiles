INSTALLDIR ?= $(HOME)


install:
	cp -vu  git/.gitconfig					$(INSTALLDIR)/.gitconfig
	cp -vu  curl/.curlrc					$(INSTALLDIR)/.curlrc
	cp -vur bin/*							$(INSTALLDIR)/.local/bin/
	cp -vu  bashrc							$(INSTALLDIR)/.bashrc
	chmod +x -R $(INSTALLDIR)/.local/bin
	vscode/install.sh $(INSTALLDIR)


backup:
	cp -vu  $(INSTALLDIR)/.gitconfig		git/.gitconfig
	cp -vu  $(INSTALLDIR)/.curlrc			curl/.curlrc
	cp -vur $(INSTALLDIR)/.local/bin/*		bin
	cp -vu  $(INSTALLDIR)/.bashrc			bashrc
	vscode/backup.sh $(INSTALLDIR)
