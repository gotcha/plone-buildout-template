#!/bin/bash
dhall --explain <<< '(./buildout.dhall).render { python = (./types.dhall).PythonVersion.Python37, plone = "5.2.7", setuptools = None Text, pip = None Text, wheel = None Text, buildout = Some "3.0.0rc2"}'
