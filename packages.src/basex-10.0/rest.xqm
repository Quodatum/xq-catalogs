(:~ 
 : This <a href="https://docs.basex.org/wiki/Module_Library">XQuery Module</a> contains helper functions for the <a href="https://docs.basex.org/wiki/RESTXQ">RESTXQ</a> API, some of which are defined in the <a href="http://exquery.github.io/exquery/exquery-restxq-specification/restxq-1.0-specification.html">RESTXQ Draft</a>.
 :
 : @author BaseX team (wiki scrape by quodatum/xq-catalogs) 
 : @see https://docs.basex.org/wiki/RESTXQ_Module
 :)
module namespace rest = "http://exquery.org/ns/restxq";
declare namespace wadl = "http://wadl.dev.java.net/2009/02";

(:~ 
 : Returns the implementation-defined base URI of the resource function.
 :
 : @return value of type xs:anyURI
 :)
declare function rest:base-uri() as xs:anyURI external;

(:~ 
 : Returns the complete URI that addresses the Resource Function. This is the result of <code><a href="https://docs.basex.org/wiki/RESTXQ_Module#rest:base-uri">rest:base-uri</a></code> appended with the path from the path annotation of the resource function.
 :
 : @return value of type xs:anyURI
 :)
declare function rest:uri() as xs:anyURI external;

(:~ 
 : Returns a <a href="https://www.w3.org/Submission/wadl">WADL description</a> of all available REST services.
 :
 : @return value of type element(wadl:application)
 :)
declare function rest:wadl() as element(wadl:application) external;

(:~ 
 : Initializes the RESTXQ module cache: <ul><li>By default, the cache will be discarded, and all modules will be parsed and cached again.</li><li>If <code>$update</code> is enabled, the background caching behavior is simulated (see <code><a href="https://docs.basex.org/wiki/Options#PARSERESTXQ">PARSERESTXQ</a></code>): Only updated modules will be parsed.</li><li>This function should be called if new RESTXQ code is deployed at runtime.</li></ul>
 :
 : @return value of type empty-sequence()
 :)
declare function rest:init() as empty-sequence() external;

(:~ 
 : Initializes the RESTXQ module cache: <ul><li>By default, the cache will be discarded, and all modules will be parsed and cached again.</li><li>If <code>$update</code> is enabled, the background caching behavior is simulated (see <code><a href="https://docs.basex.org/wiki/Options#PARSERESTXQ">PARSERESTXQ</a></code>): Only updated modules will be parsed.</li><li>This function should be called if new RESTXQ code is deployed at runtime.</li></ul>
 :
 : @param $update value of type xs:boolean?
 : @return value of type empty-sequence()
 :)
declare function rest:init($update as xs:boolean?) as empty-sequence() external;
