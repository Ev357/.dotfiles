{
  services.tdarr = {
    group = "media";
    dataDir = "/data/ssd/services/tdarr";

    extraReadWritePaths = [
      "/data/ssd/services/tdarr/cache"
      "/data/hdd/movies"
    ];

    npmCacheDir = "/data/ssd/services/tdarr/npm-cache";

    nodes.sophie-node = {
      enable = true;
      workers.transcodeGPU = 1;
      environmentFile = "/data/ssd/services/tdarr/node-env";
    };
  };
}
