#!/bin/sh

# Update npm to better handle peer dependencies
npm install -g npm@latest

mkdir -p $PREFIX/share/vega-lite-cli
pushd $PREFIX/share/vega-lite-cli
npm install --save vega-lite@$PKG_VERSION

pushd $PREFIX/bin
for cmd in vl2pdf vl2png vl2svg vl2vg
do
    ln -s ../share/vega-lite-cli/node_modules/vega-lite/bin/$cmd .
done

cp $PREFIX/share/vega-lite-cli/node_modules/vega-lite/LICENSE $SRC_DIR
