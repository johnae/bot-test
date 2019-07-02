## To generate the buildkite json, run this on the command line:
##
## nix eval -f .buildkite/pipeline.nix --json steps

with import <insanepkgs> { };
with builtins;
with lib;
with buildkite-pipeline;

{

  steps = pipeline ([

    (step ":pipeline: Thing" {
      agents = { queue = "linux"; };
      command = ''
        nix-shell .buildkite/build.nix --run strict-bash <<'NIXSH'
          echo +++ Doing thing
          sleep 5
        NIXSH
      '';
    })

  ]);
}