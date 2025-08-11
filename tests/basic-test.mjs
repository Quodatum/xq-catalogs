// smoke test
import assert from "assert";
import {profiles,library} from "../index.js";

const plist=profiles();
//console.log("processors: ",plist);
assert.ok(plist.length>0);

const ns=library("basex-10");
const keys=Object.keys(ns);
assert.equal(keys.length,50,"Expected namespaces");
const fn=ns["http://www.w3.org/2005/xpath-functions"].functions;
assert.ok(fn["http://www.w3.org/2005/xpath-functions#put#3"],"put#3")
