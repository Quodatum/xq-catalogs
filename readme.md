# @quodatum/xq-catalogs

XQuery namespace and module library definitions as JSON. 

## API
### names()
returns string array of processor names.

Currently just:
* basex-9
* basex-10

### library(processor)
returns object describing namespaces and modules available for processor

Format subject to change, something like..
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
