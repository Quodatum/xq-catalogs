(:~ generate xqm from function-catalog 
@author andy bunce 2023-08-15
:)
declare namespace fos="http://www.w3.org/xpath-functions/spec/namespace";

declare variable $uri:="https://raw.githubusercontent.com/w3c/qtspecs/master/specifications/xpath-functions-31/src/function-catalog.xml";
declare variable $catalog:=fetch:xml($uri);
declare variable $dest:="../packages.src/xpath-3.1/xpath3.1-fn.xqm"=>file:resolve-path(file:base-dir());

declare function local:xqm($catalog) as xs:string
{
let $x:=
        for $f in $catalog//fos:function[@prefix="fn"]
        order by lower-case($f/@name)
        return   $f/fos:signatures/fos:proto!local:declare(.)
return ``[
(: generated from xpath-3.1\function-catalog.xml  `{ current-dateTime() }` :)

module namespace fn = 'http://www.w3.org/2005/xpath-functions';

`{string-join($x) }`
]``
};


declare function local:declare($proto as element(fos:proto))
as xs:string
{ 
  (: skip variadic ie fn:concat  :)
  let $args:=$proto/fos:arg[not(contains(@name,'...'))]!``[$`{ @name}` as `{ @type }`]``=>string-join(", ")
  return  ``[
(:~ 
  `{ normalize-space( $proto/../../fos:summary/*) }`
:)
declare function fn:`{ $proto/@name }`(`{ $args }`) as `{ $proto/@return-type }` external;
]``
};

$dest=>file:write-text(local:xqm($catalog))
