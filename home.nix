{ pkgs, ... }@inputs:

{
  home = {
    username = "evest";
    homeDirectory = "/home/evest";
    stateVersion = "24.11";

    packages = with pkgs; [
      fnm
      nerd-fonts.geist-mono
      (with dotnetCorePackages; combinePackages [
        sdk_6_0
        sdk_8_0
      ])
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
    sessionPath = [
      "$HOME/.dotnet/tools"
      "$HOME/.local/bin"
    ];

    file = {
      ".config/electron-flags.conf".source = ./dotfiles/.config/electron-flags.conf;
      ".config/starship.toml".source = ./dotfiles/.config/starship.toml;
      ".config/backgrounds/".source = ./dotfiles/.config/backgrounds;
      ".config/OpenTabletDriver/Presets/".source = ./dotfiles/.config/OpenTabletDriver/Presets;
      ".config/mpv/mpv.conf".source = ./dotfiles/.config/mpv/mpv.conf;
      ".config/zed/settings.json".source = ./dotfiles/.config/zed/settings.json;
      ".config/hyprpanel/config.json".source = ./dotfiles/.config/hyprpanel/config.json;
      ".config/ghostty/config".source = ./dotfiles/.config/ghostty/config;
      ".config/hypr/".source = ./dotfiles/.config/hypr;
      ".icons/hypr_Bibata-Modern-Classic/".source = builtins.fetchTarball {
        url = "https://github.com/LOSEARDES77/Bibata-Cursor-hyprcursor/releases/download/1.0/hypr_Bibata-Modern-Classic.tar.gz";
        sha256 = "08q5l2sywc0s70zdn7jvr0rbzz0w8j18wmlkf2x1l64y93lbvzsj";
      };
      ".face.icon".source = ./dotfiles/.face.icon;
    };
  };

  fonts.fontconfig.enable = true;

  programs = {
    home-manager.enable = true;
    bat.enable = true;
    mpv.enable = true;
    nixvim = {
      enable = true;
      imports = [ (import ./programs/nixvim inputs) ];
    };
    zsh = import ./programs/zsh inputs;
    starship = import ./programs/starship;
    git = import ./programs/git;
    btop = import ./programs/btop;
    rofi = import ./programs/rofi inputs;
    yazi = import ./programs/yazi inputs;
    fzf = import ./programs/fzf;
    zoxide = import ./programs/zoxide;
    eza = import ./programs/eza;
    direnv = import ./programs/direnv;
  };

  services = {
    swaync.enable = true;
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    targets = {
      nixvim.enable = false;
      rofi.enable = false;
      yazi.enable = false;
      mpv.enable = false;
      starship.enable = false;
    };
    fonts = with pkgs; {
      serif = {
        package = geist-font;
        name = "Geist";
      };
      sansSerif = {
        package = geist-font;
        name = "Geist";
      };
      monospace = {
        package = nerd-fonts.geist-mono;
        name = "GeistMono Nerd Font";
      };
      emoji = {
        package = nerd-fonts.geist-mono;
        name = "GeistMono Nerd Font";
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };

  nix = {
    package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "dotnet-sdk-6.0.428"
    ];
  };
}

