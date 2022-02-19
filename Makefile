DESTINATION = $(HOME)

setup:
	@mkdir -p $(DESTINATION)/.config/1Password/settings

# matebook
.PHONY: matebook
matebook: setup
	@stow  --target $(DESTINATION) common matebook

.PHONY: uninstall-matebook
uninstall-matebook:
	@stow --target $(DESTINATION) --delete common matebook

# raptor
.PHONY: raptor
raptor: setup
	@stow  --target $(DESTINATION) common raptor

.PHONY: uninstall-raptor
uninstall-raptor:
	@stow --target $(DESTINATION) --delete common raptor

# nas
.PHONY: nas
nas: setup
	@stow  --target $(DESTINATION) common nas

.PHONY: uninstall-nas
uninstall-nas:
	@stow --target $(DESTINATION) --delete common nas
