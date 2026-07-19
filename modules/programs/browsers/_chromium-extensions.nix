{ pkgs, ... }:

{
  programs.chromium.extensions = [
    { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
    { id = "mnkmfefaigfcieehggcbfabgkjijigbc"; } # Tab Counter
    { id = "mcbpblocgmgfnpjjppndjkmgjaogfceg"; } # Fireshot
    { id = "kcmipingpfbohfjckomimmahknoddnke"; } # Vicinae
  ];
}
