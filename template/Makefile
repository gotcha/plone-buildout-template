let types = ../types.dhall in

\(versions : types.Versions) ->

''
bin/instance: bin/buildout buildout.cfg
	bin/buildout -Nv
	touch bin/instance

bin/pip:
	python${types.render_python versions.python} -m venv .

bin/uv: bin/pip
	bin/pip install uv

bin/buildout: bin/uv requirements.txt
	bin/uv pip install -r requirements.txt
	touch bin/buildout

GIT_DIFF=git diff && test -z $$(git ls-files -o) || printf "\nUntracked files\n\n" git ls-files -o

update:
	@git st >/dev/null 2>&1 || (echo "Not a git checkout" && false)
	@test -z "$$(git status --porcelain)" || (echo "Working space not clean" && false)
	@dhall --no-cache --file .dhall/init.dhall > /dev/null
	dhall to-directory-tree --file .dhall/init.dhall --output .

check: update
	@test -z "$$($(GIT_DIFF))"  \
		|| ($(GIT_DIFF) && \
		    git clean -fd >/dev/null 2>&1 && \
		    git checkout . >/dev/null 2>&1 && \
		    echo "Need to update" && false)
''
