{ render =
    λ(versions : (./types.dhall).Versions) →
      { `buildout.cfg` = ./template/buildout.cfg versions
      , `requirements.txt` = ./template/requirements.txt versions
      , `Makefile` = ./template/Makefile versions
      , justfile = ./template/justfile as Text
      }
}
