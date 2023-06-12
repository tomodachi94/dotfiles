{ environment, config, pkgs, lib, tomodachi94, ... }:
{
  imports = [
    tomodachi94.homeManagerModules.git-credential-oauth
  ];

  git-credential-oauth = {
      enable = true;
      enableGitCredentialHandler = true;
      package = pkgs.git-credential-oauth;
    };
}
