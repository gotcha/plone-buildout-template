#!/bin/bash
dhall <<< '(./buildout.dhall).render { plone = "4.3.19", setuptools = None Text, buildout = Some "3.0.0a1" }'
