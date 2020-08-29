{ buildPythonPackage
, fetchPypi
, pkgs
}:

buildPythonPackage rec {
  pname = "minidump";
  version = "0.0.13";

  src = fetchPypi {
    inherit pname version;
    sha256 = "2d5161afa459506200a62d9b8a78e6cccab325567dbc1b3058b58bdca787b3ab";
  };

  # No tests.
  doCheck = false;

  # Verify import still works.
  pythonImportsCheck = [ "minidump" ];

  meta = with pkgs.lib; {
    description = "Python library to parse and read Microsoft minidump file format";
    homepage = "https://github.com/skelsec/minidump";
    license = licenses.bsd2;
    maintainers = [ maintainers.pamplemousse ];
  };
}
