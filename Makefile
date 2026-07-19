# Variables (override these as needed)
HOSTNAME ?= $(shell hostname)
FLAKE ?= .#$(HOSTNAME)
EXPERIMENTAL ?= --extra-experimental-features "nix-command flakes"

.PHONY: help install-nix nixos-switch nixos-boot \
	nix-gc flake-update flake-check

# Reusable notification function
define alert
	@notify-send '$(1)'
	@play_ng -n synth 0.1 sine 880 vol 1
	@echo "$(1)"
endef

help:
	@echo "Available targets:"
	@echo "  install-nix          - Install the Nix package manager"
	@echo "  nixos-switch         - Switch the NixOS configuration"
	@echo "  nixos-boot           - Create new boot for the NixOS configuration"
	@echo "  nix-gc               - Run Nix garbage collection and update boot menu"
	@echo "  flake-update         - Update flake inputs"
	@echo "  flake-check          - Check the flake for issues"

install-nix:
	@echo "Installing Nix..."
	@curl -L https://nixos.org/nix/install | sh -s -- --daemon --yes
	$(call alert,Nix installation complete.)

nixos-switch:
	@echo "Rebuilding NixOS configuration..."
	@git add .  # For easier package testing
	@sudo nixos-rebuild switch --flake $(FLAKE)
	$(call alert,NixOS rebuild complete.)

nixos-boot:
	@echo "Rebuilding NixOS configuration..."
	@git add .  # For easier package testing
	@sudo nixos-rebuild boot --flake $(FLAKE)
	$(call alert,NixOS boot configuration complete.)

nix-gc:
	@echo "Collecting Nix garbage..."
	@sudo nix-collect-garbage -d
	@make nixos-boot
	$(call alert,Garbage collection and boot update complete.)

flake-update:
	@echo "Updating flake inputs..."
	@nix flake update
	$(call alert,Flake update complete.)

flake-check:
	@echo "Checking flake..."
	@nix flake check
	$(call alert,Flake check complete.)
