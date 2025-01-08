# nix

This repository contains configurations for:

- my MacBook Pro 14 "Jorges-Laptop-Pro",
- my Framework 13 "Jorges-Laptop-Ultra" and
- my RockPro64 Linux server "Pomu"

## Jorges-Laptop-Pro (Nix-Darwin aarch64 standard)

Grab the [official Nix installer](https://nixos.org/download/) and follow Nix Academy's [guide for macOS](https://nixcademy.com/2024/01/15/nix-on-macos/). Be sure to install [nix-darwin](https://github.com/LnL7/nix-darwin) and setup flakes.

Once you're acquainted with Nix-Darwin and Flakes, you're free to use this project as reference for configuring your Mac.

Note that I compartmentalize each system into a separate "specialization" flake that gets merged with a base `configuration.nix` file that is common and shared with all my systems.

## Jorges-Laptop-Ultra (NixOS x86_64 standard)

Grab the [NixOS install ISO](https://nixos.org/download/) and follow the manual to create a basic install. The graphical installer is great as a base and helps you understand what parts you need to define to make a working system.

Once you're acquainted with NixOS and Flakes, you're free to use this project as reference for configuring your system.

Note that I compartmentalize each system into a separate "specialization" flake that gets merged with a base `configuration.nix` file that is common and shared with all my systems.

## Pomu (NixOS aarch64 RockPro64)

Build an [aarch64 NixOS install image](https://github.com/Mic92/nixos-aarch64-images/) for the RockPro64 and follow the `README.md` to create a basic install.

There's _probably_ a more correct way of getting it running, but I flashed the install image onto my eMMC and _technically configured the installer_ to be my perfect web server and Minecraft server. **It just works™**. This way I didn't have to deal with any **U-Boot garbage**.

Once you're acquainted with NixOS and Flakes, you're free to use this project as reference for configuring your system.

Note that I compartmentalize each system into a separate "specialization" flake that gets merged with a base `configuration.nix` file that is common and shared with all my systems.

## Credits

The Linux Unplugged podcast not shutting up about Nix and NixOS is the reason I finally gave it a real shot and none of this would have happened without their initial push. Thanks Chris.

Nix Academy's [guide for macOS](https://nixcademy.com/2024/01/15/nix-on-macos/) was a great starting off point for Nix-Flakes and Nix-Darwin, and definitely helps with initial configuration on the Mac.

This project really is an amalgamation of all the useful advice I could find on the internet on Nix, Nix-Darwin, Flakes and NixOS.
