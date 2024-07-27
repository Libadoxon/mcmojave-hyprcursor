{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "mcmojave-hyprcursor";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "libadoxon";
    repo = "mcmojave-hyprcursor";
    rev = "d2c0e6802f0ed1e7c638bb27b5aa8587b578d083";
    sha256 = "sha256-ArUX5qlqAXUqcRqHz4QxXy3KgkfasTPA/Qwf6D2kV0U=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/icons/mcmojave-hyprcursor
    cp -R . $out/share/icons/mcmojave-hyprcursor/

    runHook postInstall
  '';

  meta = with lib; {
    description = "The McMojave cursor theme ported to hyprcusor";
    downloadPage = "https://github.com/ndom91/mcmojave-hyprcursor/releases";
    homepage = "https://rosepinetheme.com/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ libadoxon ];
  };
})
