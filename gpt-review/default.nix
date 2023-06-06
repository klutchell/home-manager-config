{ lib, buildPythonPackage, fetchFromGitHub, flit, flit_core, python }:

buildPythonPackage rec {
  pname = "gpt-review";
  version = "0.9.4";

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = pname;
    rev = version;
    sha256 = "sha256-hN+NOIZqxiR88tXQ1HOdcjNuzQ6kIrKNBRYFid23WvQ=";
  };

  nativeBuildInputs = [ flit ];

  buildPhase = ''
    flit build
  '';

  installPhase = ''
    # flit install --deps=none --destdir=$out/${python.sitePackages}
    # flit install --destdir=$out
    flit install
  '';

  meta = with lib; {
    description = "Your package description";
    homepage = "https://github.com/your-username/your-package";
    license = licenses.mit;  # Replace with the package's actual license
  };
}
