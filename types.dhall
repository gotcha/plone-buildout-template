let Version = Optional Text

let PythonVersion = < Python27 | Python37 | Python38 | Python39 | Python310 | Python311 | Python312 | Python313 >

let Versions =
        { eggs : Text
        , python : PythonVersion
        , plone : Text
        , setuptools : Version
        , pip : Version
        , wheel : Version
        , buildout : Version
        }

let render_python =
      λ(version : PythonVersion) →
        merge
          { Python27 = "2.7"
          , Python37 = "3.7"
          , Python38 = "3.8"
          , Python39 = "3.9"
          , Python310 = "3.10"
          , Python311 = "3.11"
          , Python312 = "3.12"
          , Python313 = "3.13"
          }
          version

let render_version =
      λ(version : Version) →
        merge { Some = λ(text : Text) → text, None = "" } version

let render_requirement =
      λ(args : { package : Text, version : Version }) →
        merge
          { Some = λ(text : Text) → args.package ++ "==" ++ text, None = "" }
          args.version

in  { Version
    , PythonVersion
    , Versions
    , render_python
    , render_version
    , render_requirement
    }
