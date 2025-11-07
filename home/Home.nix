{ config, pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      settings.user = {
        name = "TheBitStick";
	email = "the@bitstick.rip";
      };
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };
    nushell = {
      enable = true;
      shellAliases = {
        cat = "bat --plain --paging=never";
        sedit = "sudo nvim";
        edit = "nvim";
        wget = "wcurl";
      };
    };
  };
}
