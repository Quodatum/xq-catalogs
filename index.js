"use strict";
// loads processor list and can build namespace object for items on list
var __assign = (this && this.__assign) || function () {
    __assign = Object.assign || function(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
                t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.profiles = profiles;
exports.library = library;
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
;
function profiles() {
    return loadjson("./profiles.json");
}
;
// update namespaces with pkg 
function loadpackage(namespaces, pkg) {
    //for every namespace key in package create module entry in namespaces
    for (var _i = 0, _a = Object.entries(pkg); _i < _a.length; _i++) {
        var _b = _a[_i], ns = _b[0], value = _b[1];
        var cur = namespaces[ns];
        if (cur) {
            //console.log("namespace already exists")
            var merge = {
                variables: __assign(__assign({}, cur.variables), value.variables),
                functions: __assign(__assign({}, cur.functions), value.functions)
            };
            namespaces[ns] = __assign(__assign({}, cur), merge);
        }
        else {
            namespaces[ns] = value;
        }
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
