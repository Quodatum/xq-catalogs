// loads processor list and can build namespace object for items on list

import { readFileSync } from "fs";
// Will contain trailing slash
// const __dirname = new URL('.', import.meta.url).pathname;

type  Processor ={
    name:string,
    namespaces:object
};
var lastns:Processor|null=null;

function processor(name:string):Processor {
    if(lastns && lastns.name=== name) return lastns;
    const processors = loadjson("./processors.json");
    const ns = {};
    if (processors.hasOwnProperty(name)) {
        //console.time("namespaces: "+name)
        const mods = processors[name].modules;

        mods.forEach( function (uri:string) {
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

function names() :string[]{
    const processors = loadjson("./processors.json");
    return Object.keys(processors);
};

// for every namespace key in package create module entry in namespaces
function loadpackage(namespaces:{[key: string]:{}}, pkg:{}) {
    for (const [ns, value] of  (Object.entries(pkg) as [string, any][])) {
        //   if (namespaces.hasOwnProperty(ns)) console.log("existing: " + ns);
        namespaces[ns] = value;
    }
};

// path  relative to run location
// https://github.com/eslint/eslint/discussions/15305#discussioncomment-2400923
function loadjson(path:string) {
    const p = __dirname + "/" + path;
    return JSON.parse(readFileSync(p, 'utf8'));
};

export { names, processor };
