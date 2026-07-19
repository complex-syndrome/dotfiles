{
  flake.modules.homeManager.discord = { pkgs, ... }: {
    home.packages = with pkgs; [
      vesktop
    ];

    # Sometimes call will make headsets change mode (?) and will not change it back
    # Use this to attempt to fix it
    # Change from stereo output profile -> lower-quality Hands-Free (HFP) mode for efficient bi-transmission
    # Seems to be this issue when using headsets for both audio input and output
    # Using dedicated hardware will fix this issue
    home.shellAliases = {
      discord-audio-fix = "pkill -f vesktop";
    };
  };
}
