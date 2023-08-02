# dotfiles

[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub last commit (branch)](https://img.shields.io/github/last-commit/wolffaxn/dotfiles/main.svg)](https://github.com/wolffaxn/dotfiles)

## Installing Nix

I recommend installing Nix using the Determinate Nix installer.

To run the installer ...

```sh
$ curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

or if you want to examine the installation script.

```sh
$ curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix > nix-installer.sh
$ chmod +x nix-installer.sh
$ ./nix-installer.sh install
```

Open a new login shell and verify the installed nix version.

```sh
$ nix --version
nix (Nix) 2.15.0

```

Install and run a program with nix.

```sh
$ nix-shell -p nix-info --run "nix-info -m"
 - system: `"aarch64-darwin"`
 - host os: `Darwin 22.5.0, macOS 13.4.1`
 - multi-user?: `yes`
 - sandbox: `no`
 - version: `nix-env (Nix) 2.15.0`
 - nixpkgs: `/nix/store/h1dm1rf84gjnmk6m5g6jdaa4xik00jfx-source`

```

## Uninstall Nix

To run the uninstaller

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

## License

This project is licensed under the terms of the [MIT license](LICENSE).
