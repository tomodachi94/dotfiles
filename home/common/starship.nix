{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      directory.substitutions = {
        "git" = " ";
      };
    };
  };
}
