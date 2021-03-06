#!/bin/bash


ls -l /

echo "============== ENVIRONMENT ============="
/usr/bin/env
echo "============== END ENVIRONMENT ============="

if [ -n "$REPO" -a -n "$BRANCH" ]; then
git remote rm proposed || true
git gc --auto
git remote add proposed "$REPO"
GIT_TRACE=1 GIT_CURL_VERBOSE=1 git fetch proposed
git checkout origin/master
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git merge --no-ff "proposed/$BRANCH" -m "Merge PR"

echo "Running tests for branch $BRANCH of repo $REPO"
echo "Last commits:"
git --no-pager log -2
fi

sed -i -e "s|#!/usr/bin/env python|#!/usr/bin/env python2|" pagure/hooks/files/hookrunner


export LANG="en_US.UTF-8"
py.test -n auto ${TESTCASE:-tests/}
