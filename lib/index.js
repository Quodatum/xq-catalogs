// loads processor list and can build namespace object for items on list

import { readFileSync } from "fs";

var lastns=null;

function processor(name) {
    if(lastns && lastns.name=== name) return lastns;
    const processors = loadjson("./processors.json");
    const ns = {};
    if (processors.hasOwnProperty(name)) {
        //console.time("namespaces: "+name)
        const mods = processors[name].modules;

        mods.forEach( function (uri) {
            const mod = loadjson(uri);
            //console.log("procmod: ",uri)
            loadpackage(ns, mod);
        });
        //console.timeEnd("namespaces: "+name)
    };
    lastns={
        name: name,
        namespaces: ns
    };
    return lastns
};

function names() {
    const processors = loadjson("./processors.json");
    return Object.keys(processors);
};

// for every namespace key in package create module entry in namespaces
function loadpackage(namespaces, pkg) {
    for (const [ns, value] of Object.entries(pkg)) {
        //   if (namespaces.hasOwnProperty(ns)) console.log("existing: " + ns);
        namespaces[ns] = value;
    }
};

// path  relative to run location
// https://github.com/eslint/eslint/discussions/15305#discussioncomment-2400923
function loadjson(path) {
    const fileUrl = new URL(path, import.meta.url);
    return JSON.parse(readFileSync(fileUrl));
};

export { names, processor };
