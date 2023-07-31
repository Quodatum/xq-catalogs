// smoke test
import assert from "assert";
import {names,processor} from "../lib/index.js";

const plist=names();
console.log("processors: ",plist);
assert.ok(plist.length>0);

const ns=processor("basex-10");
const keys=Object.keys(ns.namespaces);
console.log(keys);
