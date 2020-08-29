{ archinfo
, bitstring
, cffi
, buildPythonPackage
, future
, fetchPypi
, pkgs
}:

buildPythonPackage rec {
  pname = "pyvex";
  version = "8.20.7.27";

  propagatedBuildInputs = [ archinfo bitstring cffi future ];

  setupPyBuildFlags = [
    "--plat-name x86_64-linux"
  ];

  src = fetchPypi {
    inherit pname version;
    sha256 = "2cd2de1572e3252bc1165d9713960e5694fe87fa32aa8aa03eac818c22a8919c";
  };

  # Very long tests.
  doCheck = false;

  # Verify import still works.
  pythonImportsCheck = [ "pyvex" ];

  meta = with pkgs.lib; {
    description = "Python bindings for Valgrind's VEX IR";
    homepage = "https://github.com/angr/pyvex";
    license = licenses.bsd2;
    maintainers = [ maintainers.pamplemousse ];
  };
}
