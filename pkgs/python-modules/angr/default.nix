{ ailment
, archinfo
, buildPythonPackage
, cachetools
, capstone
, cffi
, claripy
, cle
, cooldict
, dpkt
, fetchFromGitHub
, GitPython
, isPy3k
, itanium_demangler
, mulpyplexer
, networkx
, pkgs
, progressbar2
, protobuf
, psutil
, pycparser
, pyvex
, rpyc
, unicorn
, sortedcontainers
}:

buildPythonPackage rec {
  pname = "angr";
  version = "8.20.7.27";
  disabled = !isPy3k;

  propagatedBuildInputs = [
    ailment
    archinfo
    cachetools
    capstone
    cffi
    claripy
    cle
		cooldict
    dpkt
    GitPython
    itanium_demangler
    mulpyplexer
    networkx
    progressbar2
    protobuf
    psutil
    pycparser
    pyvex
    rpyc
    unicorn
    sortedcontainers
  ];

  src = fetchFromGitHub {
    owner = "angr";
    repo = pname;
    rev = "4c28f99a4d39fe26223d1963cf8c31f766b384aa";
    sha256 = "14596i2ivnp8jqrsah45igsya9g4cyrxfxz8x7sqdvkl08mhwjjw";
  };

  setupPyBuildFlags = [
    "--plat-name x86_64-linux"
  ];

  # Many tests are broken.
  doCheck = false;

  # Verify imports still work.
  pythonImportsCheck = [ "angr" ];

  meta = with pkgs.lib; {
    description = "A powerful and user-friendly binary analysis platform";
    homepage = "https://angr.io/";
    license = licenses.bsd2;
    maintainers = [ maintainers.pamplemousse ];
  };
}
