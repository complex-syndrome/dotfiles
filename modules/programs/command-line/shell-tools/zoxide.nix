# %s/zoxide/CHANGETHIS/g
{
  flake.modules.homeManager.zoxide = {
    programs.zoxide.enable = true;

    home.shellAliases = {
      cd = "z";
    };
  };
}
