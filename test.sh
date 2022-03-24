#!/bin/bash
dhall <<< '(./buildout.dhall).render { plone = "5.2.7", setuptools = None Text, pip = None Text, wheel = None Text, buildout = Some "3.0.0rc2"}'
