(:~ 
 : This <a href="https://docs.basex.org/wiki/Module_Library">XQuery Module</a> contains annotations and functions for performing XQUnit tests.
 :
 : @author BaseX team (wiki scrape by quodatum/xq-catalogs) 
 : @see https://docs.basex.org/wiki/Unit_Module
 :)
module namespace unit = "http://basex.org/modules/unit";

(:~ 
 : Asserts that the effective boolean value of the specified <code>$test</code> is true and returns an empty sequence. Otherwise, raises an error. The <i>effective boolean value</i> of an expression can be explicitly computed by using the <code>fn:boolean</code> function.<br/>The default failure message can be overridden with the <code>$info</code> argument.
 :
 : @param $test value of type item()*
 : @return value of type empty-sequence()
 : @error unit:fail the assertion failed, or an error was raised.
 :)
declare function unit:assert($test as item()*) as empty-sequence() external;

(:~ 
 : Asserts that the effective boolean value of the specified <code>$test</code> is true and returns an empty sequence. Otherwise, raises an error. The <i>effective boolean value</i> of an expression can be explicitly computed by using the <code>fn:boolean</code> function.<br/>The default failure message can be overridden with the <code>$info</code> argument.
 :
 : @param $test value of type item()*
 : @param $info value of type item()
 : @return value of type empty-sequence()
 : @error unit:fail the assertion failed, or an error was raised.
 :)
declare function unit:assert($test as item()*, $info as item()) as empty-sequence() external;

(:~ 
 : Asserts that the specified arguments are equal according to the rules of the <a href="https://www.w3.org/TR/xpath-functions-31/#func-deep-equal"><code>fn:deep-equal</code> function</a>. Otherwise, raises an error.<br/>The default failure message can be overridden with the <code>$info</code> argument.
 :
 : @param $returned value of type item()*
 : @param $expected value of type item()*
 : @return value of type empty-sequence()
 : @error unit:fail the assertion failed, or an error was raised.
 :)
declare function unit:assert-equals($returned as item()*, $expected as item()*) as empty-sequence() external;

(:~ 
 : Asserts that the specified arguments are equal according to the rules of the <a href="https://www.w3.org/TR/xpath-functions-31/#func-deep-equal"><code>fn:deep-equal</code> function</a>. Otherwise, raises an error.<br/>The default failure message can be overridden with the <code>$info</code> argument.
 :
 : @param $returned value of type item()*
 : @param $expected value of type item()*
 : @param $info value of type item()
 : @return value of type empty-sequence()
 : @error unit:fail the assertion failed, or an error was raised.
 :)
declare function unit:assert-equals($returned as item()*, $expected as item()*, $info as item()) as empty-sequence() external;

(:~ 
 : Raises a unit error. The default failure message can be overridden with the <code>$info</code> argument.
 :
 : @return value of type empty-sequence()
 : @error unit:fail default error raised by this function.
 :)
declare function unit:fail() as empty-sequence() external;

(:~ 
 : Raises a unit error. The default failure message can be overridden with the <code>$info</code> argument.
 :
 : @param $info value of type item()
 : @return value of type empty-sequence()
 : @error unit:fail default error raised by this function.
 :)
declare function unit:fail($info as item()) as empty-sequence() external;
