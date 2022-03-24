let Version = Optional Text

let render_version =
        λ(version : Version) →
          merge { Some = λ(text : Text) → text, None = "" } version

let render_requirement =
        λ(args : { package: Text, version : Version} ) →
          merge { Some = λ(text : Text) → args.package ++ "==" ++ text, None = "" } args.version

in  { Version
    , render_version
    , render_requirement
    , Versions = { plone : Text, setuptools : Version, pip : Version, wheel : Version, buildout : Version }
    }
