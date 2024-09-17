(:~ 
tools for processing XPath spec function-catalog.xml files
@author Andy Bunce
@version 0.1
:)
module namespace  xfos='urn:quodatum:xqcatalog/fos';
declare namespace fos="http://www.w3.org/xpath-functions/spec/namespace";

(:~ generate XQ module with function defs from fos :)
declare function xfos:generate-xqm($catalog as document-node()) as xs:string
{
let $x:=
        for $f in $catalog//fos:function[@prefix="fn"]
        order by lower-case($f/@name)
        return   $f/fos:signatures/fos:proto!xfos:declare(.)
return ``[
(: 
generated from `{ base-uri($catalog) }` 
on `{ current-dateTime() }` 
:)

module namespace fn = 'http://www.w3.org/2005/xpath-functions';

`{string-join($x) }`
]``
};

declare function xfos:declare($proto as element(fos:proto))
as xs:string
{ 
  (: skip variadic ie fn:concat  :)
  let $args:=$proto/fos:arg[not(contains(@name,'...'))]!``[$`{ @name}` as `{ 
    xfos:type( @type) 
    }`]``=>string-join(", ")
  return  ``[
(:~ 
  `{ normalize-space( $proto/../../fos:summary/*) }`
  '{}
:)
declare function fn:`{ $proto/@name }`(`{ $args }`) as `{ 
  xfos:type($proto/@return-type) 
  }` external;
]``
};

(: type declarations fixup xpath 4 changes  for 3.1 compatability:)
declare function xfos:type($type as item()?)
as xs:string{
  switch(true())
  case empty($type) 
       return "map(*)"  (: a record? :)
  case contains($type,"|") 
       return "xs:string"
  case starts-with($type,"enum") 
       return "xs:string"
  case starts-with($type,"record") 
       return "map(*)"
  default 
      return let $t:=replace($type,"element\(\*:[a-z]*\)","element(*)")
             return replace($t,"(fn\()","function(") (: fn shortcut:)
};

declare %updating function xfos:save($data as item(), $dest as xs:string)
{
file:write-text($dest,$data)
};