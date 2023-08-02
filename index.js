"use strict";
// loads processor list and can build namespace object for items on list
Object.defineProperty(exports, "__esModule", { value: true });
exports.processor = exports.names = void 0;
var fs_1 = require("fs");
var lastns = null;
function processor(name) {
    if (lastns && lastns.name === name)
        return lastns;
    var processors = loadjson("./processors.json");
    var ns = {};
    if (processors.hasOwnProperty(name)) {
        //console.time("namespaces: "+name)
        var mods = processors[name].modules;
        mods.forEach(function (uri) {
            var mod = loadjson(uri);
            //console.log("procmod: ",uri)
            loadpackage(ns, mod);
        });
        //console.timeEnd("namespaces: "+name)
    }
    ;
    lastns = {
        name: name,
        namespaces: ns
    };
    return lastns;
}
exports.processor = processor;
;
function names() {
    var processors = loadjson("./processors.json");
    return Object.keys(processors);
}
exports.names = names;
;
// for every namespace key in package create module entry in namespaces
function loadpackage(namespaces, pkg) {
    for (var _i = 0, _a = Object.entries(pkg); _i < _a.length; _i++) {
        var _b = _a[_i], ns = _b[0], value = _b[1];
        //   if (namespaces.hasOwnProperty(ns)) console.log("existing: " + ns);
        namespaces[ns] = value;
    }
}
;
// path  relative to run location
// https://github.com/eslint/eslint/discussions/15305#discussioncomment-2400923
function loadjson(path) {
    var p = __dirname + "/" + path;
    return JSON.parse((0, fs_1.readFileSync)(p, 'utf8'));
}
;
