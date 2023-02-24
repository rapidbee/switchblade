.PHONY: all install brew vendor clean

brew:
	brew bundle

clean:
	rm -rf $(shell pwd)/vendor

vendor: clean
	@echo "Installing additional dependencies..."
	git clone https://github.com/vulnersCom/nmap-vulners.git $(shell pwd)/vendor/nmap-vulners

install: vendor
	@echo "Intalling sb..."
	mkdir -p $${HOME}/.sb/
	@if [[ ! -d $${HOME}/.sb/commands/ ]]; then \
		ln -s $(shell pwd)/commands/ $${HOME}/.sb/commands;\
	else \
		echo "$${HOME}/.sb/commands/ symlink already exists, skipping";\
	fi
	@if [[ ! -d $${HOME}/.sb/vendor/ ]]; then \
		ln -s $(shell pwd)/vendor/ $${HOME}/.sb/vendor;\
	else \
		echo "$${HOME}/.sb/vendor/ symlink already exists, skipping";\
	fi
	sudo install sb /usr/local/bin

all: brew vendor install