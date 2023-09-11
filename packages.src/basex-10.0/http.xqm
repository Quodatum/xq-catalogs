(:~ 
 : This <a href="https://docs.basex.org/wiki/Module_Library">XQuery Module</a> contains a single function to send HTTP requests and handle HTTP responses. The function <code>send-request</code> is based on the <a href="http://expath.org/spec/http-client">EXPath HTTP Client Module</a>. It gives full control over the available request and response parameters. For simple GET requests, the <a href="https://docs.basex.org/wiki/Fetch_Module">Fetch Module</a> may be sufficient.
 :
 : @author BaseX team (wiki scrape by quodatum/xq-catalogs) 
 : @see https://docs.basex.org/wiki/HTTP_Client_Module
 :)
module namespace http = "http://expath.org/ns/http-client";
declare namespace experr = "http://expath.org/ns/error";

(:~ 
 : Sends an HTTP request and interprets the corresponding response: <ul><li><code>$request</code> contains an <code>&lt;http:request/&gt;</code> element with a <code>method</code> attribute, an <code>href</code> attribute with the target URI, and optional header and body elements.</li><li>The request is either sent to the URI of the <code>$href</code> argument or (if empty) to the URI supplied via the <code>href</code> attribute.</li><li>In addition to the attributes of the official specification, <code>csv</code>, <code>json</code>, <code>html</code> and <code>text</code> attributes can be supplied to define how to convert the response body (see <a href="https://docs.basex.org/wiki/HTTP_Client_Module#Response_Conversion">Response Conversion</a> for an example).</li></ul> <p>Notes: </p> <ul><li>Both basic and digest authentication is supported.</li><li>While the contents of the request can be supplied as child of the <code>http:body</code> element, it is faster and safer to pass them on via the third argument.</li><li>Certificate verification can be globally disabled via the <code><a href="https://docs.basex.org/wiki/Options#IGNORECERT">IGNORECERT</a></code> option.</li><li>For further information, please check out the <a href="http://expath.org/spec/http-client">EXPath</a> specification.</li></ul>
 :
 : @param $request value of type element(http:request)?
 : @return value of type item()+
 : @error experr:HC0001 an HTTP error occurred.
 : @error experr:HC0002 error parsing the entity content as XML or HTML.
 : @error experr:HC0003 with a multipart response, the override-media-type must be either a multipart media type or application/octet-stream.
 : @error experr:HC0004 the src attribute on the body element is mutually exclusive with all other attribute (except the media-type).
 : @error experr:HC0005 the request element is not valid.
 : @error experr:HC0006 a timeout occurred waiting for the response.
 :)
declare function http:send-request($request as element(http:request)?) as item()+ external;

(:~ 
 : Sends an HTTP request and interprets the corresponding response: <ul><li><code>$request</code> contains an <code>&lt;http:request/&gt;</code> element with a <code>method</code> attribute, an <code>href</code> attribute with the target URI, and optional header and body elements.</li><li>The request is either sent to the URI of the <code>$href</code> argument or (if empty) to the URI supplied via the <code>href</code> attribute.</li><li>In addition to the attributes of the official specification, <code>csv</code>, <code>json</code>, <code>html</code> and <code>text</code> attributes can be supplied to define how to convert the response body (see <a href="https://docs.basex.org/wiki/HTTP_Client_Module#Response_Conversion">Response Conversion</a> for an example).</li></ul> <p>Notes: </p> <ul><li>Both basic and digest authentication is supported.</li><li>While the contents of the request can be supplied as child of the <code>http:body</code> element, it is faster and safer to pass them on via the third argument.</li><li>Certificate verification can be globally disabled via the <code><a href="https://docs.basex.org/wiki/Options#IGNORECERT">IGNORECERT</a></code> option.</li><li>For further information, please check out the <a href="http://expath.org/spec/http-client">EXPath</a> specification.</li></ul>
 :
 : @param $request value of type element(http:request)?
 : @param $href value of type xs:string?
 : @return value of type item()+
 : @error experr:HC0001 an HTTP error occurred.
 : @error experr:HC0002 error parsing the entity content as XML or HTML.
 : @error experr:HC0003 with a multipart response, the override-media-type must be either a multipart media type or application/octet-stream.
 : @error experr:HC0004 the src attribute on the body element is mutually exclusive with all other attribute (except the media-type).
 : @error experr:HC0005 the request element is not valid.
 : @error experr:HC0006 a timeout occurred waiting for the response.
 :)
declare function http:send-request($request as element(http:request)?, $href as xs:string?) as item()+ external;

(:~ 
 : Sends an HTTP request and interprets the corresponding response: <ul><li><code>$request</code> contains an <code>&lt;http:request/&gt;</code> element with a <code>method</code> attribute, an <code>href</code> attribute with the target URI, and optional header and body elements.</li><li>The request is either sent to the URI of the <code>$href</code> argument or (if empty) to the URI supplied via the <code>href</code> attribute.</li><li>In addition to the attributes of the official specification, <code>csv</code>, <code>json</code>, <code>html</code> and <code>text</code> attributes can be supplied to define how to convert the response body (see <a href="https://docs.basex.org/wiki/HTTP_Client_Module#Response_Conversion">Response Conversion</a> for an example).</li></ul> <p>Notes: </p> <ul><li>Both basic and digest authentication is supported.</li><li>While the contents of the request can be supplied as child of the <code>http:body</code> element, it is faster and safer to pass them on via the third argument.</li><li>Certificate verification can be globally disabled via the <code><a href="https://docs.basex.org/wiki/Options#IGNORECERT">IGNORECERT</a></code> option.</li><li>For further information, please check out the <a href="http://expath.org/spec/http-client">EXPath</a> specification.</li></ul>
 :
 : @param $request value of type element(http:request)?
 : @param $href value of type xs:string?
 : @param $bodies value of type item()*
 : @return value of type item()+
 : @error experr:HC0001 an HTTP error occurred.
 : @error experr:HC0002 error parsing the entity content as XML or HTML.
 : @error experr:HC0003 with a multipart response, the override-media-type must be either a multipart media type or application/octet-stream.
 : @error experr:HC0004 the src attribute on the body element is mutually exclusive with all other attribute (except the media-type).
 : @error experr:HC0005 the request element is not valid.
 : @error experr:HC0006 a timeout occurred waiting for the response.
 :)
declare function http:send-request($request as element(http:request)?, $href as xs:string?, $bodies as item()*) as item()+ external;
