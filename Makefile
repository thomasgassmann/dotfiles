DEST_HOME = $(HOME)
DEST_ETC = /etc

define install 
	@stow --target ${1} --dir ${2} ${3}
endef

define sinstall
	@sudo stow --target ${1} --dir ${2} ${3}
endef

define uninstall
	@stow --target ${1} --dir ${2} --delete ${3}
endef

define suninstall
	@sudo stow --target ${1} --dir ${2} --delete ${3}
endef

define install_common
	$(call install, $(DEST_HOME), common, home)
endef

define uninstall_common
	$(call uninstall, $(DEST_HOME), common, home)
endef

define install_desktop
	$(call install, $(DEST_HOME), desktop, home)
endef

define uninstall_desktop
	$(call uninstall, $(DEST_HOME), desktop, home)
endef

setup:
	@mkdir -p $(DEST_HOME)/.config/1Password/settings

# matebook
.PHONY: matebook
matebook: setup
	$(call install_common)
	$(call install_desktop)

.PHONY: uninstall-matebook
uninstall-matebook:
	$(call uninstall_common)
	$(call uninstall_desktop)

# raptor
.PHONY: raptor
raptor: setup
	$(call install_common)
	$(call install_desktop)

.PHONY: uninstall-raptor
uninstall-raptor:
	$(call uninstall_common)
	$(call uninstall_desktop)

# nas
.PHONY: nas
nas: setup
	$(call install_common)

.PHONY: uninstall-nas
uninstall-nas:
	$(call uninstall_common)
