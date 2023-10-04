"use strict";
// loads processor list and can build namespace object for items on list
Object.defineProperty(exports, "__esModule", { value: true });
exports.library = exports.profiles = void 0;
var fs_1 = require("fs");
// cache last used
var lastName = "";
var lastNS = {};
function library(name) {
    if (lastName === name) {
        return lastNS;
    }
    var profile = loadjson("./profiles.json").find(function (e) { return e.id === name; });
    var ns = {};
    if (profile) {
        //console.time("namespaces: "+name)
        var mods = profile.modules;
        mods.forEach(function (uri) {
            var mod = loadjson(uri);
            //console.log("procmod: ",uri)
            loadpackage(ns, mod);
        });
        //console.timeEnd("namespaces: "+name)
    }
    ;
    lastNS = ns;
    lastName = name;
    return ns;
}
exports.library = library;
;
function profiles() {
    return loadjson("./profiles.json");
}
exports.profiles = profiles;
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
