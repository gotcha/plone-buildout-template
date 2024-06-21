{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = [ pkgs.git pkgs.dhall pkgs.just pkgs.gawk];

  # https://devenv.sh/scripts/
  scripts.hello.exec = "just --list";

  enterShell = ''
    git --version
    DHALL_VERSION=$(dhall --version)
    echo "dhall version $DHALL_VERSION"
    JUST_VERSION=$(just --version | awk '{ print $2}')
    echo "just version $JUST_VERSION"
    hello
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep "2.42.0"
  '';

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/languages/
  # languages.nix.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
