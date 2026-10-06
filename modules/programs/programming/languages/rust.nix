{
  flake.modules.homeManager.rust =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        # BUG: FIX NVIM CONFIG
        # rustup
        rustc
        cargo
        rust-analyzer
      ];
    };
}
