{
  # Currently did not find declarative (and simple enough) way to config this
  flake.modules.homeManager.obsidian = {
    programs.obsidian.enable = true;
  };
}
# Plugin list https://github.com/obsidianmd/obsidian-releases/blob/master/community-plugins.json
# Config example https://github.com/fengstats/obsidian-config/tree/main
