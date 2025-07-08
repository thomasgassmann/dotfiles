DEST_HOME = $(HOME)
DEST_ETC = /etc

define install 
	@stow --target ${1} --dir ${2} ${3}
endef

define uninstall
	@stow --target ${1} --dir ${2} --delete ${3}
endef

define install_common
	$(call install, $(DEST_HOME), common, home)
endef

define uninstall_common
	$(call uninstall, $(DEST_HOME), common, home)
endef

setup_desktop:
	@mkdir -p $(DEST_HOME)/.sage
	@mkdir -p $(DEST_HOME)/.config/discord

# desktop
.PHONY: desktop
desktop: setup_desktop
	$(call install_common)
	$(call install, $(DEST_HOME), desktop, home)
	./desktop/shortcuts/gsettings.pl --import ./desktop/shortcuts/shortcuts.csv

.PHONY: uninstall-desktop
uninstall-desktop:
	$(call uninstall_common)
	$(call uninstall, $(DEST_HOME), desktop, home)
	./desktop/shortcuts/gsettings.pl --uninstall ./desktop/shortcuts/shortcuts.csv

# zenbook
.PHONY: zenbook
zenbook: setup_desktop
	$(call install_common)
	$(call install, $(DEST_HOME), desktop, home)
	$(call install, $(DEST_HOME), zenbook, home)
	./desktop/shortcuts/gsettings.pl --import ./desktop/shortcuts/shortcuts.csv

.PHONY: uninstall-zenbook
uninstall-zenbook:
	$(call uninstall_common)
	$(call uninstall, $(DEST_HOME), desktop, home)
	$(call uninstall, $(DEST_HOME), zenbook, home)
	./desktop/shortcuts/gsettings.pl --uninstall ./desktop/shortcuts/shortcuts.csv

# headless
.PHONY: headless
headless:
	$(call install_common)

.PHONY: uninstall-headless
uninstall-headless:
	$(call uninstall_common)

# mac OS
.PHONY: macos
macos:
	rm -rf $(DEST_HOME)/.zshrc
	$(call install_common)
	rm -rf $(DEST_HOME)/.zshrc
	$(call install, $(DEST_HOME), macos, home)

.PHONY: uninstall-macos
uninstall-macos:
	$(call uninstall_common)
	$(call uninstall, $(DEST_HOME), macos, home)
