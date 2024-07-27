{
  lib,
  stdenv,
  hyprcursor,
}:
stdenv.mkDerivation {
  pname = "mcmojave-hyprcursor";
  version = "0.1";
  src = ../.;

  nativeBuildInputs = [ hyprcursor.packages.${stdenv.hostPlatform.system}.hyprcursor ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/icons/mcmojave-hyprcursor
    hyprcursor-util --create $src -o $out/share/icons/mcmojave-hyprcursor/

    runHook postInstall
  '';

  meta = with lib; {
    description = "The McMojave cursor theme ported to hyprcusor";
    downloadPage = "https://github.com/ndom91/mcmojave-hyprcursor/releases";
    homepage = "https://rosepinetheme.com/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ libadoxon ];
  };
}
