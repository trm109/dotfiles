{ pkgs, ... }:
{
  # TODO
  # - Nixvim
  # - gtk debugging
  # - hypr
  # - XDG
  # - thunar
  # - stylix?
  home = {
    username = "saik";
    homeDirectory = "/home/saik";
    stateVersion = "24.11";
  };
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
  programs = {
    home-manager.enable = true;
    # shell
    fish.enable = true;
    # utility / convience
    bat.enable = true;
  };
  #catppuccin = {
  #  enable = true;
  #  mako.enable = false;
  #  gtk.enable = true;
  #  kvantum.enable = true;
  #};
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  gtk = {
    enable = true;
  };
  qt = {
    enable = true;
  };
}
