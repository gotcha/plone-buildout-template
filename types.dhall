let Version = λ(t : Text) → Some t

in  { Version
    , Versions =
        { plone : Text, setuptools : Optional Text, buildout : Optional Text }
    , render_version =
        λ(version : Optional Text) →
          merge { Some = λ(text : Text) → text, None = "" } version
    }
