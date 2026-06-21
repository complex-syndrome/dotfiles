{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "mnkmfefaigfcieehggcbfabgkjijigbc" # Tab Counter
      "mcbpblocgmgfnpjjppndjkmgjaogfceg" # Fireshot
    ];
  };
}
