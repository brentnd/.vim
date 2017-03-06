#!/bin/bash
#update all the submodules in bundle
git submodule init
git submodule update
git submodule foreach 'git fetch origin; git checkout $(git rev-parse --abbrev-ref HEAD); git reset --hard origin/$(git rev-parse --abbrev-ref HEAD); git submodule update --recursive; git clean -dfx'



#update and build YouCompletMe
cd bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer --tern-completer
echo "copying tern project file to ~"
cp ./.tern-project ~/

