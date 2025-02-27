{ lib, stdenv, fetchFromGitLab, makeWrapper, bash, fzf, fd, tmux }:

stdenv.mkDerivation {
  pname = "tmux-sessionizer";
  version = "1.0.0";

  # TODO: change this to a zsh script
  src = fetchFromGitLab {
    owner = "cole-glotfelty";
    repo = "shell-scripts";
    rev = "24bd87fb31c74dd6308fef666240af85f50b524f";
    sha256 = "0zzvydij8qm1y96asbm9pzkdm46m6ayb810r63sg847v9khyg8py";
  };

  buildInputs = [ ];
  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    ls -l
    mkdir -p $out/bin
    cp tmux-sessionizer.sh $out/bin/tmux-sessionizer
    chmod u+x $out/bin/tmux-sessionizer
    wrapProgram $out/bin/tmux-sessionizer \
      --prefix PATH : ${lib.makeBinPath [ bash fd fzf tmux ]}
  '';
  meta = with lib; {
    description = "tmux-sessionizer adapted from thePrimeagen";
    homepage = "";
    license = licenses.mit;
    maintainers = with maintainers; [ cole-glotfelty ];
    platforms = platforms.unix;

  };
}
