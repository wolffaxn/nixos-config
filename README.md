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
nix (Nix) 2.15.0

```

Test the install:

```sh
$ nix-shell -p nix-info --run "nix-info -m"
 - system: `"aarch64-darwin"`
 - host os: `Darwin 22.5.0, macOS 13.4.1`
 - multi-user?: `yes`
 - sandbox: `no`
 - version: `nix-env (Nix) 2.15.0`
 - nixpkgs: `/nix/store/h1dm1rf84gjnmk6m5g6jdaa4xik00jfx-source`

```

After installing Nix I'm getting "SSL peer certificate or SSH remote key was not OK (60)" when I try to hit the cache. This fixes the problem: [#3261](https://github.com/NixOS/nix/issues/3261)

```sh
$ sudo rm /etc/ssl/certs/ca-certificates.crt
$ sudo ln -s /nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt /etc/ssl/certs/ca-certificates.crt
```

## Install Home Manager

Add Home Manager channel:

```sh
$ nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
$ nix-channel --update
```

Run the Home Manager installation command and create the first Home Manager generation:

```sh
$ nix-shell '<home-manager>' -A install
```

Enable experimental features:

```sh
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

## Applying

Run new shell with Git and OpenSSH installed (bundled version of OpenSSH with macOS Monterey doesn't support ed25519-sk keys):

```sh
$ nix-shell -p git openssh
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

$ home-manager build
$ home-manager switch --flake ".#deimos"
```

On macOS you may also:

```sh
$ nix build ./#darwinConfigurations.deimos.system
$ ./result/sw/bin/darwin-rebuild switch --flake .
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

After uninstall you have to remove the following files manually.

```sh
$ rm ~/.nix-channels
$ rm -Rf ~/.nix-defexpr
$ rm -Rf ~/.nix-profile
$ rm -Rf ~/.cache/nix
$ rm -Rf ~/.local/state/nix
```

# License

This project is licensed under the terms of the [MIT license](LICENSE).
