{ buildPythonPackage
, fetchPypi
, pkgs
, six
}:

buildPythonPackage rec {
  pname = "PySMT";
  version = "0.9.0";

  propagatedBuildInputs = [ six ];

  src = fetchPypi {
    inherit pname version;
    sha256 = "2b5ca0560eaacf1720d254f7e1f186fe344e3ea12c72e49036c47af2ab1f81ef";
  };

  # very long tests
  doCheck = false;

  # Verify import still works.
  pythonImportsCheck = [ "pysmt" ];

  meta = with pkgs.lib; {
    description = "A solver-agnostic library for SMT Formulae manipulation and solving";
    homepage = "https://github.com/pysmt/pysmt";
    license = licenses.bsd2;
    maintainers = [ maintainers.pamplemousse ];
  };
}

