#!/bin/bash
set -xe

[ -z "$(git status --porcelain)" ] || (echo "dirty working directory" && exit 1)

current_version="$(grep '^version = ' Cargo.toml | head -1 | cut -d '"' -f2)"
new_version="$1"
new_version_num="${new_version#"v"}"

if [ -z "$new_version" ]; then
    echo "New version required as argument"
    exit 1
fi

echo ">>> Bumping version"
sed -i.bak "s/version = \"$current_version\"/version = \"$new_version_num\"/" Cargo.toml
rm Cargo.toml.bak

sleep 5

echo ">>> Commit"
git add Cargo.toml Cargo.lock
git commit -am "version $new_version"
git tag $new_version

echo ">>> Publish"
git push
git push origin $new_version
