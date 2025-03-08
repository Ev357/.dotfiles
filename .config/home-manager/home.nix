{ pkgs, ... }@inputs:

{
  home.username = "evest";
  home.homeDirectory = "/home/evest";

  home.stateVersion = "24.11";

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    fnm
    nerd-fonts.geist-mono
    yazi
    dotnet-sdk_6
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "$HOME/.dotnet/tools"
    "$HOME/.local/bin"
  ];

  home.file = {
    ".config/electron-flags.conf".source = ./dotfiles/.config/electron-flags.conf;
    ".config/backgrounds/".source = ./dotfiles/.config/backgrounds;
    ".config/OpenTabletDriver/Presets/".source = ./dotfiles/.config/OpenTabletDriver/Presets;
    ".config/mpv/mpv.conf".source = ./dotfiles/.config/mpv/mpv.conf;
    ".config/zed/settings.json".source = ./dotfiles/.config/zed/settings.json;
    ".icons/hypr_Bibata-Modern-Classic/".source = builtins.fetchTarball {
      url = "https://github.com/LOSEARDES77/Bibata-Cursor-hyprcursor/releases/download/1.0/hypr_Bibata-Modern-Classic.tar.gz";
      sha256 = "08q5l2sywc0s70zdn7jvr0rbzz0w8j18wmlkf2x1l64y93lbvzsj";
    };
    ".face.icon".source = ./dotfiles/.face.icon;
  };

  programs = {
    home-manager.enable = true;
    nixvim = import ./programs/neovim inputs;
    zsh = import ./programs/zsh inputs;
    starship = import ./programs/starship inputs;
    git = import ./programs/git;
    btop = import ./programs/btop;
    rofi = import ./programs/rofi inputs;
    bat.enable = true;
    mpv.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  services = {
    swaync.enable = true;
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    image = ./dotfiles/.config/backgrounds/wall2.png;
    targets = {
      nixvim.enable = false;
      rofi.enable = false;
    };
    fonts = with pkgs.nerd-fonts; {
      serif = {
        package = geist-mono;
        name = "GeistMono NFM";
      };

      sansSerif = {
        package = geist-mono;
        name = "GeistMono NFM";
      };

      monospace = {
        package = geist-mono;
        name = "GeistMono NFM";
      };

      emoji = {
        package = geist-mono;
        name = "GeistMono NFM";
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

