# @quodatum/xq-catalogs

XQuery namespace and module library definitions as JSON. 

[npm](https://www.npmjs.com/package/@quodatum/xq-catalogs)
## API
### profiles()
returns array of Profiles defined in profiles.json.
```json
[
   {
      "id": "basex-10",
      "description": "BaseX 10.6 features",
      "modules": [
         "packages/basex-static-namespaces.json",
         "packages/xpath-3.1.json",
         "packages/basex-10.6.json"
      ]
   },
   {
      "id": "basex-9",
      "description": "BaseX 9.7 features",
      "modules": [
         "packages/basex-static-namespaces.json",
         "packages/xpath-3.1.json",
         "packages/basex-9.7.json"
      ]
   },
  ...
]
```

### library(profile)
returns object describing namespaces and modules available for processor

This is the xqdoc like format where var/fns are objects. Format subject to change, something like..
```json
"http://basex.org": {
        "description": "BaseX Annotations, Pragmas, …",
        "prefixes": [
            "basex"
        ],
        "type": "declare"
    },
...
"http://basex.org/modules/admin": {
  "ns": "http://basex.org/modules/admin",
  "prefixes": [
   "admin"
  ],
  "namespaces": [],
  "variables": {},
  "functions": {
   "http://basex.org/modules/admin#logs#0": {
    "name": "logs",
    "uri": "http://basex.org/modules/admin",
    "key": "http://basex.org/modules/admin#logs#0",
    "params": [],
    "type": "element(file)*",
    "description": " Returns <a href=\"https://web.archive.org/web/20220623230943/https://docs.basex.org/web/20220623231027/https://docs.basex.org/wiki/Logging\">Logging</a> data compiled by the database or HTTP server: <ul> <li>If no argument is specified, a list of all log files will be returned, including the file size and date.</li> <li>If a <code>$date</code> is specified, the contents of a single log file will be returned.</li> <li>If <code>$merge</code> is set to true, related log entries will be merged. Please note that the merge might not be 100% successful, as log entries may be ambiguous.</li> </ul>"
   },
```
## Dev notes
`index.ts` is source. `tsc` is used to compile to into a "commonjs" module for now.

### sources files
The npm script `wiki-scrape` creates stub xqm files below `packages.src` from the BaseX wiki.

