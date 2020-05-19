let versions = ./versions.dhall

    in  { `buildout.cfg` = (./template/buildout.cfg) versions
        , Makefile = ./template/Makefile as Text
        , justfile = ./template/justfile as Text
        }
