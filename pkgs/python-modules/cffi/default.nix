{ buildPythonPackage
, fetchPypi
, pkgs
}:

buildPythonPackage rec {
  pname = "cffi";
  version = "1.14.2";

  propagatedBuildInputs = [
    pkgs.python37Packages.pycparser
    pkgs.libffi
  ];

  src = fetchPypi {
    inherit pname version;
    sha256 = "06x95h9mpc1mnim685g65zrn7vfrqmgqnjwq6m01bhpj1bak93xf";
  };

  # No tests.
  doCheck = false;

  # Verify import still works.
  pythonImportsCheck = [ "cffi" ];

  meta = with pkgs.lib; {
    description = "Foreign Function Interface for Python calling C code.";
    homepage = "https://pypi.org/project/cffi";
    license = licenses.bsd2;
    maintainers = [ ];
  };
}
