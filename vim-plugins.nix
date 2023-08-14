{ pkgs, ... }:

{
  paige = pkgs.vimUtils.buildVimPlugin {
    name = "paige";
    src = pkgs.fetchFromSourcehut {
      owner = "~leon_plickat";
      repo = "paige";
      rev = "0d72c3814da3cc01d4435deaa6168fa913c694fd";
      sha256 = "sha256-tozoGnzKEaph6TsDfWwlmgMVuoagWSt37nIvOmuZ9ec=";
    };
  };
}
