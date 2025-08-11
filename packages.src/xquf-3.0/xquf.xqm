(: functions from https://www.w3.org/TR/xquery-update-30 :)

module namespace fn = 'http://www.w3.org/2005/xpath-functions';

(:~ The fn:put function stores a document or element to the location specified by $uri. This function is normally invoked to create a resource on an external storage system such as a file system or a database. :)
declare function fn:put($node as node(), $uri as xs:string) as empty-sequence() external;

declare function fn:put($node as node(), $uri as xs:string, $params as element(output:serialization-parameters)?) as empty-sequence() external;

