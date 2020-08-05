{ lib, pkgs, fetchFromGitHub }:

let
  mkRustPlatform = pkgs.callPackage ./mk-rust-platform.nix {};

  rustPlatform = mkRustPlatform {
    date = "2020-07-16";
    channel = "stable";
  };
in

rustPlatform.buildRustPackage rec {
  pname = "speedread-rs";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "mhuesch";
    repo = pname;
    rev = "8eb4605ba7fbf33775667037e39dbf07def2b4f8";
    sha256 = "0128p206nx5w23mgvsly9cbd32p9inray79q33j0s4gn9r59cqsa";
  };

  cargoSha256 = "17q6y5hggs5z8lyd6xvlfka243k7kmc1fpw9wr52dnn1cc1dklq7";

  meta = with lib; {
    description = "Rust spritz clone";
    homepage = "https://github.com/mhuesch/speedread-rs/";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
