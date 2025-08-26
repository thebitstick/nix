{ config, pkgs, ... }:

{
  imports = [(./Home.nix)];

  programs = {
    nushell = {
      extraConfig = ''
      $env.config.show_banner = false

      $env.EDITOR = "nvim"
      $env.VISUAL = "nvim"

      def clean [] {
          nix-collect-garbage -d
      }

      def gc [url] {
          cd ~/Developer/Git
          git clone $url
      }
      '';
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
