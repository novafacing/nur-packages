{ buildPythonPackage
, fetchFromGitHub
, isPy3k
, nose
, nose2
, pkgs
}:

buildPythonPackage rec {
  pname = "archinfo";
  version = "8.20.7.27";
  disabled = !isPy3k;

  src = fetchFromGitHub {
    owner = "angr";
    repo = pname;
    rev = "b0262c8c14c17dedd6de547ef3c75168b05b8655";
    sha256 = "1nsm1vhc8pk8kxdq0p0sgd19sgg0p8zfk6pcq0czds9i1hdhgca4";
  };

  checkInputs = [ nose nose2 ];
  checkPhase = ''
    nose2 -s tests/
  '';

  meta = with pkgs.lib; {
    description = "A collection of classes that contain architecture-specific information";
    homepage = "https://github.com/angr/archinfo";
    license = licenses.bsd2;
    maintainers = [ maintainers.pamplemousse ];
  };
}
