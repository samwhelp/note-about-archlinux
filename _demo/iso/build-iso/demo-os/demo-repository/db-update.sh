#!/usr/bin/env bash

repo_name="demo-os"

cd x86_64

rm -f ${repo_name}.*

repo-add -n -R ${repo_name}.db.tar.gz *.pkg.tar.zst
#repo-add -n -R demo-os.db.tar.gz *.pkg.tar.zst

cd "$OLDPWD"
