{ config, pkgs, ... }:
let 
    frontend = pkgs.buildNpmPackage {
        pname = "frontend";
        version = "0.0.1";
        src = /home/david/Davidspilde/frontend;
        npmDepsHash = "";
        buildPhase = "npm run build";
        installPhase = ''
            mkdir -p $out
            cp -r dist/* $out/
        '';
    };
in
{
    systemd.services.frontend = {
        description = "Frontend server";
        wantedBy =  [ "multi-user.target" ];

        serviceConfig = {
            ExecStart = "${pkgs.nodePackages.serve}/bin/serve -s ${frontend} -l tcp://127.0.0.1:3000";
            Restart = "always";
            User = "nginx";
        };
    };
}