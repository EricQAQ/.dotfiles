brew uninstall --force --ignore-dependencies python python2 python2.7 python3 python3.6 > /dev/null 2>&1
brew install python@2 python@3 > /dev/null 2>&1
echo; for x in python python2 python3; do 
which $x; readlink $(which $x); $x --version; echo; done
