{
  programs.bat = {
    enable = true;
    # Source: https://github.com/chrisgrieser/.config/blob/main/bat/config#L13-L14
    # show percentage indicator
    config = {
      pager = "less -RF --long-prompt +Gg";
    };
  };
}
