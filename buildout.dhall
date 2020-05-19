let Versions = (./types.dhall).Versions

in  { render =
        λ(versions : Versions) →
          { `buildout.cfg` = ./template/buildout.cfg versions
          , Makefile = ./template/Makefile as Text
          , justfile = ./template/justfile as Text
          }
    }
