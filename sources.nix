sourcesJson:

let
  forgejoApiHosts = [
    "git.gay"
  ];

  forgejoDirectHosts = [
    "codeberg.org"
    "git.outfoxxed.me"
  ];

  isForgejoApiHost =
    url: builtins.any (host: builtins.match ".*${host}.*" url != null) forgejoApiHosts;

  isForgejoDirectHost =
    url: builtins.any (host: builtins.match ".*${host}.*" url != null) forgejoDirectHosts;

  isGitLabHost =
    url:
    builtins.any (host: builtins.match ".*${host}.*" url != null) [
      "gitlab.com"
      "gitlab.freedesktop.org"
    ];

  parseGitUrl =
    url:
    let
      match = builtins.match "https?://([^/]+)/([^/]+)/([^/]+)(\\.git)?" url;
    in
    if match != null then
      {
        host = builtins.elemAt match 0;
        owner = builtins.elemAt match 1;
        repo = builtins.elemAt match 2;
      }
    else
      null;

in
builtins.mapAttrs (
  name: value:
  let
    src =
      if value.src.type == "github" then
        fetchTarball {
          url = "https://github.com/${value.src.owner}/${value.src.repo}/archive/${value.src.rev}.tar.gz";
          sha256 = value.src.sha256;
        }
      else if value.src.type == "git" && isForgejoApiHost value.src.url then
        let
          parsed = parseGitUrl value.src.url;
        in
        fetchTarball {
          url = "https://${parsed.host}/api/v1/repos/${parsed.owner}/${parsed.repo}/archive/${value.src.rev}.tar.gz";
          sha256 = value.src.sha256;
        }
      else if value.src.type == "git" && isForgejoDirectHost value.src.url then
        let
          parsed = parseGitUrl value.src.url;
        in
        fetchTarball {
          url = "https://${parsed.host}/${parsed.owner}/${parsed.repo}/archive/${value.src.rev}.tar.gz";
          sha256 = value.src.sha256;
        }
      else if value.src.type == "git" && isGitLabHost value.src.url then
        let
          parsed = parseGitUrl value.src.url;
        in
        fetchTarball {
          url = "https://${parsed.host}/${parsed.owner}/${parsed.repo}/-/archive/${value.src.rev}.tar.gz";
          sha256 = value.src.sha256;
        }
      else if value.src.type == "git" then
        fetchGit {
          url = value.src.url;
          rev = value.src.rev;
          shallow = true;
        }
      else
        builtins.fetchurl {
          url = value.src.url;
          sha256 = value.src.sha256;
        };
  in
  value // { inherit src; }
) sourcesJson
