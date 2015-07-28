# vagrant-lambda

AWS Lambda like environment with Fedora since Amazon Linux is cumbersome to export.

Published as
## install

    brew update && brew cask update
    brew cask install --force vagrant virtualbox

## use

    vagrant up

## publish

    brew install jq
    git submodule update --init

    vagrant package

    atlas-publish/publish.sh TOKEN matti lambda TODO.TODO.TODO
