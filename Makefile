INSTALLDIR ?= $(HOME)


install:
	cp -vu  profile							$(INSTALLDIR)/.profile
	cp -vu  git/.gitconfig					$(INSTALLDIR)/.gitconfig
	cp -vu  curl/.curlrc					$(INSTALLDIR)/.curlrc
	cp -vur bin/*							$(INSTALLDIR)/.local/bin/
	cp -vu  bash/bashrc						$(INSTALLDIR)/.bashrc
	cp -vu  zsh/zshrc						$(INSTALLDIR)/.zshrc
	cp -vu  tmux/tmux.conf					$(INSTALLDIR)/.tmux.conf
	cp -vu  tmux/tmux.conf.local			$(INSTALLDIR)/.tmux.conf.local
	cp -vu  bash/bash_profile				$(INSTALLDIR)/.bash_profile
	chmod +x -R $(INSTALLDIR)/.local/bin
	vscode/install.sh $(INSTALLDIR)


backup:
	cp -vu  $(INSTALLDIR)/.gitconfig		git/.gitconfig
	cp -vu  $(INSTALLDIR)/.curlrc			curl/.curlrc
	cp -vur $(INSTALLDIR)/.local/bin/*		bin
	cp -vu  $(INSTALLDIR)/.bashrc			bash/bashrc
	cp -vu  $(INSTALLDIR)/.zshrc			zsh/zshrc
	cp -vu  $(INSTALLDIR)/.tmux.conf		tmux/tmux.conf
	cp -vu  $(INSTALLDIR)/.tmux.conf.local	tmux/tmux.conf.local
	cp -vu  $(INSTALLDIR)/.bash_profile		bash/bash_profile
	vscode/backup.sh $(INSTALLDIR)
