INSTALLDIR ?= $(HOME)


install:
	cp -vu  profile							$(INSTALLDIR)/.profile
	cp -vu  git/.gitconfig					$(INSTALLDIR)/.gitconfig
	cp -vu  curl/.curlrc					$(INSTALLDIR)/.curlrc
	cp -vur bin/*							$(INSTALLDIR)/.local/bin/
	cp -vu  bash/bashrc						$(INSTALLDIR)/.bashrc
	cp -vu  zsh/zshrc						$(INSTALLDIR)/.zshrc
	chmod +x -R $(INSTALLDIR)/.local/bin
	vscode/install.sh $(INSTALLDIR)


backup:
	cp -vu  $(INSTALLDIR)/.gitconfig		git/.gitconfig
	cp -vu  $(INSTALLDIR)/.curlrc			curl/.curlrc
	cp -vur $(INSTALLDIR)/.local/bin/*		bin
	cp -vu  $(INSTALLDIR)/.bashrc			bash/bashrc
	cp -vu  $(INSTALLDIR)/.zshrc			zsh/zshrc
	vscode/backup.sh $(INSTALLDIR)
