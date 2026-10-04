{ ... }:

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
      withPython3 = true;
      withRuby = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };
    nushell = {
      enable = true;
      shellAliases = {
        cat = "bat";
        sedit = "sudo nvim";
        edit = "nvim";
        wget = "wcurl";
      };
    };
  };
}
