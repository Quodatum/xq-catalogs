// smoke test
import assert from "assert";
import {names,library} from "../index.js";

const plist=names();
console.log("processors: ",plist);
assert.ok(plist.length>0);

const ns=library("basex-10");
const keys=Object.keys(ns);
console.log(keys, keys.length);
console.time("loop: ")
for (var i = 0; i < 1000; i++) {
    const ns=library("basex-10");
};
console.timeEnd("loop: ")