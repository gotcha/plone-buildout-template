bin/instance: bin/buildout buildout.cfg
	bin/buildout -Nv
	touch bin/instance

bin/pip:
	virtualenv .

bin/buildout: bin/pip
	bin/pip install zc.buildout==3.0.0a1
	touch bin/buildout
