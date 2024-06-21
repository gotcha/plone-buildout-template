#!/bin/bash
dhall --explain <<< '(./buildout.dhall).render { eggs = "collective.easyform", python = (./types.dhall).PythonVersion.Python310, plone = "6.0.11.1", setuptools = Some "69.2.0", pip = None Text, wheel = None Text, buildout = Some "3.0.1"}'
