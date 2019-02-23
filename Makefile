INSTDIR ?= $(HOME)


install:
	cp -vu git/.gitconfig			$(INSTDIR)/.gitconfig


backup:
	cp -v $(INSTDIR)/.gitconfig		git/.gitconfig