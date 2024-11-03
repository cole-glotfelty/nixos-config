{ userSettings, ... }:

{
  programs.git = {
    enable = true;
    userName = "Cole Glotfelty";
    userEmail = "git@postagepaid.cc";
    aliases = {
      logg = "log --graph --pretty=tformat:'%Cred%h %Cgreen%cd %C(bold blue)%an%Creset%C(yellow)%d%Creset %s' --date=short --all";
    };
    extraConfig = {
      init.defaultBranch = "main";
          safe.directory = [ ("/home/" + userSettings.username + "/nixos-config")
                       ("/home/" + userSettings.username + "/.nixos-config/.git") ];
    };
  };
}
