# macOS configuration

To build and set as config

First, install nix:

```shell
curl -L https://nixos.org/nix/install | sh
```

Enable flakes:

```shell
mkdir -p ~/.config/nix
cat <<EOF > ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF
```

Clone the repository, build and set configuration

```shell
git clone https://github.com/abhidg/nixos-configs
cd macos
nix build .#darwinConfigurations.fungi.system
./result/sw/bin/darwin-rebuild switch --flake .
```
