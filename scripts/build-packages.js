'use strict';
// generate  package  json file for each processor from xqm files in dir
var processors = {
    'basex-9': { 'src': 'packages.src/basex-9.7' },
    'basex-10': { 'src': 'packages.src/basex-10.0' },
    'xpath-3.1': { 'src': 'packages.src/xpath-3.1' }
};

var out = 'packages/';

var path = require('path');
var fs = require('fs');
var ffs = require('final-fs');

var XQLint = require('@quodatum/xqlint').XQLint;

var getFiles = function (p) {
    p = path.resolve(path.normalize(p));
    var files = [];
    if (fs.statSync(p).isFile()) {
        files.push(p);
    } else {
        var list = ffs.readdirRecursiveSync(p, true, p);
        list.forEach(function (file) {
            if (file.endsWith('.xqm'))  {
                files.push(file);
            }
        });
    }
    return files;
};

// return object with keys of known namespaces and values of the xqdoc
function importMods(files) {
    var result = {};
    files.forEach(function (file) {
        console.log("processing..", file);
        const lintOpts={ styleCheck: false, fileName: file }
        var linter = new XQLint(fs.readFileSync(file, 'utf-8'), lintOpts);
        var syntaxError = linter.hasSyntaxError();
        if (syntaxError) {
            console.log("ERR: ", linter.getMarkers()[0].message);
        } else {
            const xqdoc = linter.getXQDoc(false);
            xqdoc.functions=keyed(xqdoc.functions);
            xqdoc.variables=keyed(xqdoc.variables);;
            const extras={"type":"module","override": true};
            result[xqdoc.ns] ={...xqdoc,...extras};
            console.log(xqdoc.ns);
           // console.log(xqdoc);
        }
    });
    return result;
};

function keyed(arr){
 const obj={};
 arr.forEach(f=>obj[f.key]=f);
 return obj;
};

Object.keys(processors).forEach(function (proc) {
    const src = processors[proc].src;
    var files = getFiles(src)
    var xx = structuredClone(importMods(files));
    console.log(Object.keys(xx));
    fs.writeFileSync(out + proc + ".json", JSON.stringify(xx, undefined, 1));

});
