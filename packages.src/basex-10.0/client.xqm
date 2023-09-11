(:~ 
 : This <a href="https://docs.basex.org/wiki/Module_Library">XQuery Module</a> contains functions to access BaseX server instances from XQuery. With this module, you can execute database commands and evaluate XQuery expressions.
 :
 : @author BaseX team (wiki scrape by quodatum/xq-catalogs) 
 : @see https://docs.basex.org/wiki/Client_Module
 :)
module namespace client = "http://basex.org/modules/client";

(:~ 
 : This function establishes a connection to a remote BaseX server, creates a new client session, and returns a session id. The parameter <code>$host</code> is the name of the database server, <code>$port</code> specifies the server port, and <code>$username</code> and <code>$password</code> represent the login data.
 :
 : @param $host value of type xs:string
 : @param $port value of type xs:integer
 : @param $username value of type xs:string
 : @param $password value of type xs:string
 : @return value of type xs:anyURI
 : @error client:connect an error occurs while creating the session (possible reasons: server not available, access denied).
 :)
declare function client:connect($host as xs:string, $port as xs:integer, $username as xs:string, $password as xs:string) as xs:anyURI external;

(:~ 
 : This function executes a <a href="https://docs.basex.org/wiki/Commands">command</a> and returns the result as a string. The parameter <code>$id</code> contains the session ID returned by <code><a href="https://docs.basex.org/wiki/Client_Module#client:connect">client:connect</a></code>. The <code>$command</code> argument represents a single command, which will be executed by the server.
 :
 : @param $id value of type xs:anyURI
 : @param $command value of type xs:string
 : @return value of type xs:string
 : @error client:error an I/O error occurs while transferring data from or to the server.
 : @error client:command an error occurs while executing a command.
 :)
declare function client:execute($id as xs:anyURI, $command as xs:string) as xs:string external;

(:~ 
 : This function returns an information string, created by the last call of <code><a href="https://docs.basex.org/wiki/Client_Module#client:execute">client:execute</a></code>. <code>$id</code> specifies the session id.
 :
 : @param $id value of type xs:anyURI
 : @return value of type xs:string
 :)
declare function client:info($id as xs:anyURI) as xs:string external;

(:~ 
 : Evaluates a query and returns the result as sequence. The parameter <code>$id</code> contains the session id returned by <code><a href="https://docs.basex.org/wiki/Client_Module#client:connect">client:connect</a></code>, and <code>$query</code> represents the query string, which will be evaluated by the server.<br/>Variables and the context item can be declared via <code>$bindings</code>. The specified keys must be QNames or strings: <ul><li>If a key is a QName, it will be directly adopted as variable name.</li><li>If a key is a string, it may be prefixed with a dollar sign. A namespace can be specified using the <a href="http://www.jclark.com/xml/xmlns.htm">Clark Notation</a>. If the specified string is empty, the value will be bound to the context item.</li></ul>
 :
 : @param $id value of type xs:anyURI
 : @param $query value of type xs:string
 : @return value of type item()*
 : @error client:error an I/O error occurs while transferring data from or to the server.
 : @error client:query an error occurs while evaluating a query, and if the original error cannot be extracted from the returned error string.
 : @error client:function function items (including maps and arrays) cannot be returned.
 :)
declare function client:query($id as xs:anyURI, $query as xs:string) as item()* external;

(:~ 
 : Evaluates a query and returns the result as sequence. The parameter <code>$id</code> contains the session id returned by <code><a href="https://docs.basex.org/wiki/Client_Module#client:connect">client:connect</a></code>, and <code>$query</code> represents the query string, which will be evaluated by the server.<br/>Variables and the context item can be declared via <code>$bindings</code>. The specified keys must be QNames or strings: <ul><li>If a key is a QName, it will be directly adopted as variable name.</li><li>If a key is a string, it may be prefixed with a dollar sign. A namespace can be specified using the <a href="http://www.jclark.com/xml/xmlns.htm">Clark Notation</a>. If the specified string is empty, the value will be bound to the context item.</li></ul>
 :
 : @param $id value of type xs:anyURI
 : @param $query value of type xs:string
 : @param $bindings value of type map(*)?
 : @return value of type item()*
 : @error client:error an I/O error occurs while transferring data from or to the server.
 : @error client:query an error occurs while evaluating a query, and if the original error cannot be extracted from the returned error string.
 : @error client:function function items (including maps and arrays) cannot be returned.
 :)
declare function client:query($id as xs:anyURI, $query as xs:string, $bindings as map(*)?) as item()* external;

(:~ 
 : This function closes a client session. <code>$id</code> specifies the session id.<br/>Opened connections will automatically be closed after the XQuery expression has been evaluated, but it is recommendable to explicitly close them with this function if you open many connections.
 :
 : @param $id value of type xs:anyURI
 : @return value of type empty-sequence()
 : @error client:error an I/O error occurs while transferring data from or to the server.
 :)
declare function client:close($id as xs:anyURI) as empty-sequence() external;
