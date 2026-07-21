# %s/yt-dlp/CHANGETHIS/g
{
  flake.modules.homeManager.yt-dlp =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.yt-dlp ];
    };
}
