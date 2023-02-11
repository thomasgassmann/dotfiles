DEST_HOME = $(HOME)
DEST_ETC = /etc

define install 
	@stow --target ${1} --dir ${2} ${3}
endef

define uninstall
	@stow --target ${1} --dir ${2} --delete ${3}
endef

define sinstall 
	@sudo stow --target ${1} --dir ${2} ${3}
endef

define suninstall
	@sudo stow --target ${1} --dir ${2} --delete ${3}
endef

define install_common
	$(call install, $(DEST_HOME), common, home)
	$(call sinstall, $(DEST_ETC), common, etc)
endef

define uninstall_common
	$(call uninstall, $(DEST_HOME), common, home)
	$(call suninstall, $(DEST_ETC), common, etc)
endef

setup_desktop: setup_common
	@mkdir -p $(DEST_HOME)/.sage

setup_common:
	@mkdir -p $(DEST_ETC)/security
	@mkdir -p $(DEST_ETC)/X11/xorg.conf.d

# desktop
.PHONY: desktop
desktop: setup_desktop
	$(call install_common)
	$(call install, $(DEST_HOME), desktop, home)
	$(call sinstall, $(DEST_ETC), desktop, etc)

.PHONY: uninstall-desktop
uninstall-desktop:
	$(call uninstall_common)
	$(call uninstall, $(DEST_HOME), desktop, home)
	$(call suninstall, $(DEST_ETC), desktop, etc)

# matebook
.PHONY: matebook
matebook: desktop
	$(call install, $(DEST_HOME), matebook, home)

.PHONY: uninstall-matebook
uninstall-matebook: uninstall-desktop
	$(call uninstall, $(DEST_HOME), matebook, home)

# headless
.PHONY: headless
headless: setup_common
	$(call install_common)

.PHONY: uninstall-headless
uninstall-headless:
	$(call uninstall_common)
