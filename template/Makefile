bin/instance: bin/buildout buildout.cfg
	bin/buildout -Nv
	touch bin/instance

bin/pip:
	virtualenv .

bin/buildout: bin/pip
	bin/pip install zc.buildout==3.0.0a1
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
