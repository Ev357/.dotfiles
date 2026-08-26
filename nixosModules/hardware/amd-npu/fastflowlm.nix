{
  fastflowlm,
  fetchFromGitHub,
}:
fastflowlm.overrideAttrs (oldAttrs: rec {
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "FastFlowLM";
    repo = "FastFlowLM";
    rev = "v${version}";
    hash = "sha256-Je9MVidDwVHdeT+U4gwVi1O6zFLXPpZK+onC/kaElUo=";
    fetchSubmodules = true;
  };

  postPatch = builtins.replaceStrings ["--replace-fail"] ["--replace-quiet"] oldAttrs.postPatch;
})
