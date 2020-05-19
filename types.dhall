let Version = Optional Text

in  { Version
    , Versions = { plone : Text, setuptools : Version, buildout : Version }
    , render_version =
        λ(version : Version) →
          merge { Some = λ(text : Text) → text, None = "" } version
    }
