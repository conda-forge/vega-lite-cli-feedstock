#!/bin/sh

# Update npm to better handle peer dependencies
npm install -g npm@latest

mkdir -p $PREFIX/share/vega-lite-cli
pushd $PREFIX/share/vega-lite-cli
yarn global add install-peerdeps
yarn add vega-lite@$PKG_VERSION
yarn add vega@^5.22.0


pushd $PREFIX/bin
for cmd in vl2pdf vl2png vl2svg vl2vg
do
    ln -s ../share/vega-lite-cli/node_modules/vega-lite/bin/$cmd .
done

cp $PREFIX/share/vega-lite-cli/node_modules/vega-lite/LICENSE $SRC_DIR
