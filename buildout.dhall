let types = ./types.dhall

let render =
      λ(versions : types.Versions) →
        { `buildout.cfg` = ./template/buildout.cfg versions
        , `requirements.txt` = ./template/requirements.txt versions
        , Makefile = ./template/Makefile versions
        , justfile = ./template/justfile as Text
        }

in  { types, render }
