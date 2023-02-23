PHONY: all install brew clipboard

brew:
	brew bundle

clipboard:
	@if [[ ! -f /usr/local/bin/clipboard ]]; then \
		echo "Installing clipboard";\
		curl -sSL https://github.com/Slackadays/Clipboard/raw/main/src/install.sh | sh;\
	else \
		echo "Clipboard already installed";\
	fi
install:
	@echo "Intalling sb..."
	mkdir -p $${HOME}/.sb/
	@if [[ ! -d $${HOME}/.sb/commands/ ]]; then \
		ln -s $(shell pwd)/commands/ $${HOME}/.sb/commands/;\
	else \
		echo "$${HOME}/.sb/commands/ symlink already exists, skipping";\
	fi
	sudo install sb /usr/local/bin

all: brew clipboard install