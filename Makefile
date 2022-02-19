DESTINATION = $(HOME)

setup:
	@mkdir -p $(DESTINATION)

# matebook
.PHONY: install
matebook: setup
	@stow  --target $(DESTINATION) common matebook

.PHONY: uninstall
uninstall-matebook:
	@stow --target $(DESTINATION) --delete common matebook

# raptor
.PHONY: install
raptor: setup
	@stow  --target $(DESTINATION) common raptor

.PHONY: uninstall
uninstall-raptor:
	@stow --target $(DESTINATION) --delete common raptor

# nas
.PHONY: install
nas: setup
	@stow  --target $(DESTINATION) common nas

.PHONY: uninstall
uninstall-nas:
	@stow --target $(DESTINATION) --delete common nas
