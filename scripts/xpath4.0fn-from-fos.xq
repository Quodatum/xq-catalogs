(:~ generate xqm from function-catalog 
@author andy bunce 2023-08-15
:)
import module namespace  xfos='urn:quodatum:xqcatalog/fos' at 'fos-helper.xqm';
declare namespace fos="http://www.w3.org/xpath-functions/spec/namespace";

declare variable $uri:="https://raw.githubusercontent.com/qt4cg/qtspecs/master/specifications/xpath-functions-40/src/function-catalog.xml";

declare variable $catalog:=fetch:doc($uri);
declare variable $dest:="../packages.src/xpath-4.0/xpath4.0-fn.xqm"=>file:resolve-path(file:base-dir());

xfos:generate-xqm($catalog)=>xfos:save($dest)
