# dotfiles

[![Built with Nix](https://img.shields.io/static/v1?logo=nixos&logoColor=white&label=&message=Built%20with%20Nix&color=5277c3)](https://builtwithnix.org)
[![NixOS Unstable](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=flat-square&logo=NixOS&logoColor=white)](https://nixos.org)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/wolffaxn/dotfiles/main.svg)](https://github.com/wolffaxn/dotfiles)

Configuration files for MacOS and NixOS.

# Getting started

## Install Nix

I recommend installing Nix using the Determinate Nix installer.

To run the installer:

```sh
$ curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Open a new login shell and show nix version:

```sh
$ nix --version
nix (Nix) 2.18.1

```

## Install Home Manager

To install Home manager you can use standalone home-manager on non-nixos system.

```sh
$ nix run home-manager/master -- init --switch
```

This will generate a flake.nix and a home.nix file in ~/.config/home/manager (creating the directory if it does not exist).

## Install dotfiles

Run new shell with Git and OpenSSH installed (bundled version of OpenSSH with macOS Monterey doesn't support ed25519-sk keys):

```sh
$ nix shell nixpkgs#git nixpkgs#openssh
```

Clone dotfiles:

```sh
$ git clone git@github.com:wolffaxn/dotfiles.git ~/.dotfiles
Cloning into '/Users/alex/.dotfiles'...
Confirm user presence for key ED25519-SK SHA256:qnkGlZ1hUW3Ub7j3l440jE/8fA+z7hHzMc8U6RYKcfI
...
```

Run Home Manager:

```sh
$ cd ~/.dotfiles

# to temporarily allow broken and unfree packages
$ export NIXPKGS_ALLOW_BROKEN=1
$ export NIXPKGS_ALLOW_UNFREE=1

$ home-manager build
$ home-manager switch --impure --flake .#deimos
```

On macOS you may also:

```sh
$ nix build ./#darwinConfigurations.deimos.system
$ ./result/sw/bin/darwin-rebuild switch --flake .
```

# Update & Garbage collect

This will update all input channels to the latest version. After that you need to run home-manager to apply the changes.

```sh
$ nix flake update
$ home-manager switch --impure --flake .#deimos
```

Run garbage collector

```sh
$ nix store gc
```

Rerun nix-index

```sh
$ export NIX_PATH=nixpkgs=flake:nixpkgs
$ nix run github:nix-community/nix-index#nix-index
```

# Uninstall

## Uninstall Home Manager

To run the uninstaller:

```sh
$ home-manager uninstall
```

## Uninstall Nix

To run the uninstaller:

```sh
$ /nix/nix-installer uninstall
```

# Bugs

After installing Nix I'm getting "SSL peer certificate or SSH remote key was not OK (60)" when I try to hit the cache. This fixes the problem: [#3261](https://github.com/NixOS/nix/issues/3261)

```sh
$ sudo rm /etc/ssl/certs/ca-certificates.crt
$ sudo ln -s /nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt /etc/ssl/certs/ca-certificates.crt
```

# License

This project is licensed under the terms of the [MIT license](LICENSE).
