#!/bin/bash
set -xe

[ -z "$(git status --porcelain)" ] || (echo "dirty working directory" && exit 1)

current_version="$(grep '^version = ' Cargo.toml | head -1 | cut -d '"' -f2)"
IFS='.' read -r major minor patch <<<"$current_version"
new_patch=$((patch + 1))
new_version="$major.$minor.$new_patch"
tag_name="v$new_version"

if [ -z "$new_version" ]; then
    echo "New version required as argument"
    exit 1
fi

echo ">>> Bumping version"
sed -i.bak "s/version = \"$current_version\"/version = \"$new_version\"/" Cargo.toml
rm Cargo.toml.bak

sleep 10

echo ">>> Commit"
git add Cargo.toml Cargo.lock
git commit -am "version $new_version"
git tag $tag_name

echo ">>> Publish"
git push
git push origin $tag_name
echo ">>> Done"
