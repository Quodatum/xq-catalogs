
(: 
generated from https://raw.githubusercontent.com/qt4cg/qtspecs/master/specifications/xpath-functions-40/src/function-catalog.xml 
on 2024-09-16T11:57:24.356+01:00 
:)

module namespace fn = 'http://www.w3.org/2005/xpath-functions';


(:~ 
  Returns the absolute value of $value.
  '{}
:)
declare function fn:abs($value as xs:numeric?) as xs:numeric? external;

(:~ 
  Adjusts an xs:date value to a specific timezone, or to no timezone at all; the result is the date in the target timezone that contains the starting instant of the supplied date.
  '{}
:)
declare function fn:adjust-date-to-timezone($value as xs:date?, $timezone as xs:dayTimeDuration?) as xs:date? external;

(:~ 
  Adjusts an xs:dateTime value to a specific timezone, or to no timezone at all.
  '{}
:)
declare function fn:adjust-dateTime-to-timezone($value as xs:dateTime?, $timezone as xs:dayTimeDuration?) as xs:dateTime? external;

(:~ 
  Adjusts an xs:time value to a specific timezone, or to no timezone at all.
  '{}
:)
declare function fn:adjust-time-to-timezone($value as xs:time?, $timezone as xs:dayTimeDuration?) as xs:time? external;

(:~ 
  Returns true if no two items in a supplied sequence are equal.
  '{}
:)
declare function fn:all-different($values as xs:anyAtomicType*, $collation as xs:string?) as xs:boolean external;

(:~ 
  Returns true if all items in a supplied sequence (after atomization) are equal.
  '{}
:)
declare function fn:all-equal($values as xs:anyAtomicType*, $collation as xs:string?) as xs:boolean external;

(:~ 
  Analyzes a string using a regular expression, returning an XML structure that identifies which parts of the input string matched or failed to match the regular expression, and in the case of matched substrings, which substrings matched each capturing group in the regular expression.
  '{}
:)
declare function fn:analyze-string($value as xs:string?, $pattern as xs:string, $flags as xs:string?) as element(fn:analyze-string-result) external;

(:~ 
  Makes a dynamic call on a function with an argument list supplied in the form of an array.
  '{}
:)
declare function fn:apply($function as function(*), $arguments as array(*)) as item()* external;

(:~ 
  Determines whether two atomic items are equal, under the rules used for comparing keys in a map.
  '{}
:)
declare function fn:atomic-equal($value1 as xs:anyAtomicType, $value2 as xs:anyAtomicType) as xs:boolean external;

(:~ 
  Returns a list of environment variable names that are suitable for passing to fn:environment-variable, as a (possibly empty) sequence of strings.
  '{}
:)
declare function fn:available-environment-variables() as xs:string* external;

(:~ 
  Returns the average of the values in the input sequence $values, that is, the sum of the values divided by the number of values.
  '{}
:)
declare function fn:avg($values as xs:anyAtomicType*) as xs:anyAtomicType? external;

(:~ 
  Returns the base URI of a node.
  '{}
:)
declare function fn:base-uri($node as node()?) as xs:anyURI? external;

(:~ 
  Computes the effective boolean value of the sequence $input.
  '{}
:)
declare function fn:boolean($input as item()*) as xs:boolean external;

(:~ 
  Constructs a URI from the parts provided.
  '{}
:)
declare function fn:build-uri($parts as map(*), $options as map(*)?) as xs:string external;

(:~ 
  Rounds $value upwards to a whole number.
  '{}
:)
declare function fn:ceiling($value as xs:numeric?) as xs:numeric? external;

(:~ 
  Applies a sequence of functions starting with an initial input.
  '{}
:)
declare function fn:chain($input as item()*, $functions as function(*)*) as item()* external;

(:~ 
  Returns a string containing a particular character or glyph.
  '{}
:)
declare function fn:char($value as xs:string) as xs:string external;

(:~ 
  Splits the supplied string into a sequence of single-character strings.
  '{}
:)
declare function fn:characters($value as xs:string?) as xs:string* external;

(:~ 
  Returns true if two strings are equal, considered codepoint-by-codepoint.
  '{}
:)
declare function fn:codepoint-equal($value1 as xs:string?, $value2 as xs:string?) as xs:boolean? external;

(:~ 
  Returns an xs:string whose characters have supplied codepoints.
  '{}
:)
declare function fn:codepoints-to-string($values as xs:integer*) as xs:string external;

(:~ 
  Constructs a collation URI with requested properties.
  '{}
:)
declare function fn:collation($options as map(*)) as xs:string external;

(:~ 
  Asks whether a collation URI is recognized by the implementation.
  '{}
:)
declare function fn:collation-available($collation as xs:string, $usage as xs:string) as xs:boolean external;

(:~ 
  Given a string value and a collation, generates an internal value called a collation key, with the property that the matching and ordering of collation keys reflects the matching and ordering of strings under the specified collation.
  '{}
:)
declare function fn:collation-key($value as xs:string, $collation as xs:string?) as xs:base64Binary external;

(:~ 
  Returns a sequence of items identified by a collection URI; or a default collection if no URI is supplied.
  '{}
:)
declare function fn:collection($uri as xs:string?) as item()* external;

(:~ 
  Returns -1, 0, or 1, depending on whether the first value is less than, equal to, or greater than the second value.
  '{}
:)
declare function fn:compare($value1 as xs:anyAtomicType?, $value2 as xs:anyAtomicType?, $collation as xs:string?) as xs:integer? external;

(:~ 
  Returns the concatenation of the arguments, treated as sequences of strings.
  '{}
:)
declare function fn:concat($values as xs:anyAtomicType*) as xs:string external;

(:~ 
  Returns true if the string $value contains $substring as a substring, taking collations into account.
  '{}
:)
declare function fn:contains($value as xs:string?, $substring as xs:string?, $collation as xs:string?) as xs:boolean external;

(:~ 
  Determines whether one sequence contains another as a contiguous subsequence, using a supplied callback function to compare items.
  '{}
:)
declare function fn:contains-subsequence($input as item()*, $subsequence as item()*, $compare as (function(item(), item()) as xs:boolean?)?) as xs:boolean external;

(:~ 
  Determines whether or not any of the supplied strings, when tokenized at whitespace boundaries, contains the supplied token, under the rules of the supplied collation.
  '{}
:)
declare function fn:contains-token($value as xs:string*, $token as xs:string, $collation as xs:string?) as xs:boolean external;

(:~ 
  Returns the number of items in a sequence.
  '{}
:)
declare function fn:count($input as item()*) as xs:integer external;

(:~ 
  Parses CSV data supplied as a string, returning the results in the form of a sequence of arrays of strings.
  '{}
:)
declare function fn:csv-to-arrays($value as xs:string?, $options as map(*)?) as array(xs:string)* external;

(:~ 
  Parses CSV data supplied as a string, returning the results as an XML document, as described by .
  '{}
:)
declare function fn:csv-to-xml($value as xs:string?, $options as map(*)?) as element(fn:csv)? external;

(:~ 
  Returns the current date.
  '{}
:)
declare function fn:current-date() as xs:date external;

(:~ 
  Returns the current date and time (with timezone).
  '{}
:)
declare function fn:current-dateTime() as xs:dateTimeStamp external;

(:~ 
  Returns the current time.
  '{}
:)
declare function fn:current-time() as xs:time external;

(:~ 
  Returns the result of atomizing a sequence. This process flattens arrays, and replaces nodes by their typed values.
  '{}
:)
declare function fn:data($input as item()*) as xs:anyAtomicType* external;

(:~ 
  Returns an xs:dateTime value created by combining an xs:date and an xs:time.
  '{}
:)
declare function fn:dateTime($date as xs:date?, $time as xs:time?) as xs:dateTime? external;

(:~ 
  Returns the day component of an xs:date.
  '{}
:)
declare function fn:day-from-date($value as xs:date?) as xs:integer? external;

(:~ 
  Returns the day component of an xs:dateTime.
  '{}
:)
declare function fn:day-from-dateTime($value as xs:dateTime?) as xs:integer? external;

(:~ 
  Returns the number of days in a duration.
  '{}
:)
declare function fn:days-from-duration($value as xs:duration?) as xs:integer? external;

(:~ 
  Decodes URI-escaped characters in a string.
  '{}
:)
declare function fn:decode-from-uri($value as xs:string?) as xs:string external;

(:~ 
  This function assesses whether two sequences are deep-equal to each other. To be deep-equal, they must contain items that are pairwise deep-equal; and for two items to be deep-equal, they must either be atomic items that compare equal, or nodes of the same kind, with the same name, whose children are deep-equal, or maps with matching entries, or arrays with matching members.
  '{}
:)
declare function fn:deep-equal($input1 as item()*, $input2 as item()*, $options as xs:string) as xs:boolean external;

(:~ 
  Returns the value of the default collation property from the dynamic context.
  '{}
:)
declare function fn:default-collation() as xs:string external;

(:~ 
  Returns the value of the default language property from the dynamic context.
  '{}
:)
declare function fn:default-language() as xs:language external;

(:~ 
  Removes duplicate nodes and sorts the input into document order.
  '{}
:)
declare function fn:distinct-ordered-nodes($nodes as node()*) as node()* external;

(:~ 
  Returns the values that appear in a sequence, with duplicates eliminated.
  '{}
:)
declare function fn:distinct-values($values as xs:anyAtomicType*, $collation as xs:string?) as xs:anyAtomicType* external;

(:~ 
  Processes a supplied value repeatedly, continuing when some condition is false, and returning the value that satisfies the condition.
  '{}
:)
declare function fn:do-until($input as item()*, $action as function(item()*, xs:integer) as item()*, $predicate as function(item()*, xs:integer) as xs:boolean?) as item()* external;

(:~ 
  Retrieves a document using a URI supplied as an xs:string, and returns the corresponding document node.
  '{}
:)
declare function fn:doc($href as xs:string?) as document-node()? external;

(:~ 
  The function returns true if and only if the function call fn:doc($href) would return a document node.
  '{}
:)
declare function fn:doc-available($href as xs:string?) as xs:boolean external;

(:~ 
  Returns the URI of a resource where a document can be found, if available.
  '{}
:)
declare function fn:document-uri($node as node()?) as xs:anyURI? external;

(:~ 
  Returns the values that appear in a sequence more than once.
  '{}
:)
declare function fn:duplicate-values($values as xs:anyAtomicType*, $collation as xs:string?) as xs:anyAtomicType* external;

(:~ 
  Returns the sequence of element nodes that have an ID value matching the value of one or more of the IDREF values supplied in $values.
  '{}
:)
declare function fn:element-with-id($values as xs:string*, $node as node()) as element()* external;

(:~ 
  Returns true if the argument is the empty sequence.
  '{}
:)
declare function fn:empty($input as item()*) as xs:boolean external;

(:~ 
  Encodes reserved characters in a string that is intended to be used in the path segment of a URI.
  '{}
:)
declare function fn:encode-for-uri($value as xs:string?) as xs:string external;

(:~ 
  Returns true if the string $value contains $substring as a trailing substring, taking collations into account.
  '{}
:)
declare function fn:ends-with($value as xs:string?, $substring as xs:string?, $collation as xs:string?) as xs:boolean external;

(:~ 
  Determines whether one sequence ends with another, using a supplied callback function to compare items.
  '{}
:)
declare function fn:ends-with-subsequence($input as item()*, $subsequence as item()*, $compare as (function(item(), item()) as xs:boolean?)?) as xs:boolean external;

(:~ 
  Returns the value of a system environment variable, if it exists.
  '{}
:)
declare function fn:environment-variable($name as xs:string) as xs:string? external;

(:~ 
  Calling the fn:error function raises an application-defined error.
  '{}
:)
declare function fn:error($code as xs:QName?, $description as xs:string?, $value as item()*) as none external;

(:~ 
  Escapes a URI in the same way that HTML user agents handle attribute values expected to contain URIs.
  '{}
:)
declare function fn:escape-html-uri($value as xs:string?) as xs:string external;

(:~ 
  Returns true if every item in the input sequence matches a supplied predicate.
  '{}
:)
declare function fn:every($input as item()*, $predicate as (function(item(), xs:integer) as xs:boolean?)?) as xs:boolean external;

(:~ 
  Returns $input if it contains exactly one item. Otherwise, raises an error.
  '{}
:)
declare function fn:exactly-one($input as item()*) as item() external;

(:~ 
  Returns true if the argument is a non-empty sequence.
  '{}
:)
declare function fn:exists($input as item()*) as xs:boolean external;

(:~ 
  Returns a string representation of an xs:QName in the format Q{uri}local.
  '{}
:)
declare function fn:expanded-QName($value as xs:QName?) as xs:string? external;

(:~ 
  Returns the xs:boolean value false.
  '{}
:)
declare function fn:false() as xs:boolean external;

(:~ 
  Returns those items from the sequence $input for which the supplied function $predicate returns true.
  '{}
:)
declare function fn:filter($input as item()*, $predicate as function(item(), xs:integer) as xs:boolean?) as item()* external;

(:~ 
  Rounds $value downwards to a whole number.
  '{}
:)
declare function fn:floor($value as xs:numeric?) as xs:numeric? external;

(:~ 
  Processes the supplied sequence from left to right, applying the supplied function repeatedly to each item in turn, together with an accumulated result value.
  '{}
:)
declare function fn:fold-left($input as item()*, $zero as item()*, $action as function(item()*, item(), xs:integer) as item()*) as item()* external;

(:~ 
  Processes the supplied sequence from right to left, applying the supplied function repeatedly to each item in turn, together with an accumulated result value.
  '{}
:)
declare function fn:fold-right($input as item()*, $zero as item()*, $action as function(item(), item()*, xs:integer) as item()*) as item()* external;

(:~ 
  Returns the last item in a sequence.
  '{}
:)
declare function fn:foot($input as item()*) as item()? external;

(:~ 
  Applies the function item $action to every item from the sequence $input in turn, returning the concatenation of the resulting sequences in order.
  '{}
:)
declare function fn:for-each($input as item()*, $action as function(item(), xs:integer) as item()*) as item()* external;

(:~ 
  Applies the function item $action to successive pairs of items taken one from $input1 and one from $input2, returning the concatenation of the resulting sequences in order.
  '{}
:)
declare function fn:for-each-pair($input1 as item()*, $input2 as item()*, $action as function(item(), item(), xs:integer) as item()*) as item()* external;

(:~ 
  Returns a string containing an xs:date value formatted for display.
  '{}
:)
declare function fn:format-date($value as xs:date?, $picture as xs:string, $language as xs:string?, $calendar as xs:string?, $place as xs:string?) as xs:string? external;

(:~ 
  Returns a string containing an xs:dateTime value formatted for display.
  '{}
:)
declare function fn:format-dateTime($value as xs:dateTime?, $picture as xs:string, $language as xs:string?, $calendar as xs:string?, $place as xs:string?) as xs:string? external;

(:~ 
  Formats an integer according to a given picture string, using the conventions of a given natural language if specified.
  '{}
:)
declare function fn:format-integer($value as xs:integer?, $picture as xs:string, $language as xs:string?) as xs:string external;

(:~ 
  Returns a string containing a number formatted according to a given picture string and decimal format.
  '{}
:)
declare function fn:format-number($value as xs:numeric?, $picture as xs:string, $options as xs:string) as xs:string external;

(:~ 
  Returns a string containing an xs:time value formatted for display.
  '{}
:)
declare function fn:format-time($value as xs:time?, $picture as xs:string, $language as xs:string?, $calendar as xs:string?, $place as xs:string?) as xs:string? external;

(:~ 
  Returns the annotations of the function item.
  '{}
:)
declare function fn:function-annotations($function as function(*)) as map(*) external;

(:~ 
  Returns the arity of the function identified by a function item.
  '{}
:)
declare function fn:function-arity($function as function(*)) as xs:integer external;

(:~ 
  Returns a function item having a given name and arity, if there is one.
  '{}
:)
declare function fn:function-lookup($name as xs:QName, $arity as xs:integer) as function(*)? external;

(:~ 
  Returns the name of the function identified by a function item.
  '{}
:)
declare function fn:function-name($function as function(*)) as xs:QName? external;

(:~ 
  This function returns a string that uniquely identifies a given node.
  '{}
:)
declare function fn:generate-id($node as node()?) as xs:string external;

(:~ 
  Splits the supplied string into a sequence of single-grapheme strings.
  '{}
:)
declare function fn:graphemes($value as xs:string?) as xs:string* external;

(:~ 
  Returns true if the supplied node has one or more child nodes (of any kind).
  '{}
:)
declare function fn:has-children($node as node()?) as xs:boolean external;

(:~ 
  Returns the results of a specified hash, checksum, or cyclic redundancy check function applied to the input.
  '{}
:)
declare function fn:hash($value as xs:string, $options as map(*)?) as xs:hexBinary? external;

(:~ 
  Returns the first item in a sequence.
  '{}
:)
declare function fn:head($input as item()*) as item()? external;

(:~ 
  Returns those items from a supplied sequence that have the highest value of a sort key, where the sort key can be computed using a caller-supplied function.
  '{}
:)
declare function fn:highest($input as item()*, $collation as xs:string?, $key as function(item()) as xs:anyAtomicType*) as item()* external;

(:~ 
  Returns the hours component of an xs:dateTime.
  '{}
:)
declare function fn:hours-from-dateTime($value as xs:dateTime?) as xs:integer? external;

(:~ 
  Returns the number of hours in a duration.
  '{}
:)
declare function fn:hours-from-duration($value as xs:duration?) as xs:integer? external;

(:~ 
  Returns the hours component of an xs:time.
  '{}
:)
declare function fn:hours-from-time($value as xs:time?) as xs:integer? external;

(:~ 
  Returns the sequence of element nodes that have an ID value matching the value of one or more of the IDREF values supplied in $values.
  '{}
:)
declare function fn:id($values as xs:string*, $node as node()) as element()* external;

(:~ 
  Returns its argument value.
  '{}
:)
declare function fn:identity($input as item()*) as item()* external;

(:~ 
  Returns the sequence of element or attribute nodes with an IDREF value matching the value of one or more of the ID values supplied in $values.
  '{}
:)
declare function fn:idref($values as xs:string*, $node as node()) as node()* external;

(:~ 
  Returns the value of the implicit timezone property from the dynamic context.
  '{}
:)
declare function fn:implicit-timezone() as xs:dayTimeDuration external;

(:~ 
  Returns the in-scope namespaces of an element node, as a map.
  '{}
:)
declare function fn:in-scope-namespaces($element as element()) as xs:string external;

(:~ 
  Returns the prefixes of the in-scope namespaces for an element node.
  '{}
:)
declare function fn:in-scope-prefixes($element as element()) as xs:string* external;

(:~ 
  Returns a sequence of positive integers giving the positions within the sequence $input of items that are equal to $target.
  '{}
:)
declare function fn:index-of($input as xs:anyAtomicType*, $target as xs:anyAtomicType, $collation as xs:string?) as xs:integer* external;

(:~ 
  Returns the positions in an input sequence of items that match a supplied predicate.
  '{}
:)
declare function fn:index-where($input as item()*, $predicate as function(item(), xs:integer) as xs:boolean?) as xs:integer* external;

(:~ 
  Returns every node within the input sequence that is not an ancestor of another member of the input sequence; the nodes are returned in document order with duplicates eliminated.
  '{}
:)
declare function fn:innermost($nodes as node()*) as node()* external;

(:~ 
  Returns a sequence constructed by inserting an item or a sequence of items at a given position within an existing sequence.
  '{}
:)
declare function fn:insert-before($input as item()*, $position as xs:integer, $insert as item()*) as item()* external;

(:~ 
  Inserts a separator between adjacent items in a sequence.
  '{}
:)
declare function fn:intersperse($input as item()*, $separator as item()*) as item()* external;

(:~ 
  Creates an Invisible XML parser for a grammar.
  '{}
:)
declare function fn:invisible-xml($grammar as xs:string, $options as map(*)?) as function(xs:string) as document-node() external;

(:~ 
  Converts a string containing an IRI into a URI according to the rules of .
  '{}
:)
declare function fn:iri-to-uri($value as xs:string?) as xs:string external;

(:~ 
  Returns true if the argument is the xs:float or xs:double value NaN.
  '{}
:)
declare function fn:is-NaN($value as xs:anyAtomicType) as xs:boolean external;

(:~ 
  Returns a sequence containing the items from $input at positions defined by $at, in the order specified.
  '{}
:)
declare function fn:items-at($input as item()*, $at as xs:integer*) as item()* external;

(:~ 
  Reads an external resource containing JSON, and returns the result of parsing the resource as JSON.
  '{}
:)
declare function fn:json-doc($href as xs:string?, $options as map(*)?) as item()? external;

(:~ 
  Parses a string supplied in the form of a JSON text, returning the results in the form of an XML document node.
  '{}
:)
declare function fn:json-to-xml($value as xs:string?, $options as map(*)?) as document-node()? external;

(:~ 
  Returns the label associated with a labeled item, as a map.
  '{}
:)
declare function fn:label($input as item()?) as map(xs:string, item()*)? external;

(:~ 
  This function tests whether the language of $node, or the context value if the second argument is omitted, as specified by xml:lang attributes is the same as, or is a sublanguage of, the language specified by $language.
  '{}
:)
declare function fn:lang($language as xs:string?, $node as node()) as xs:boolean external;

(:~ 
  Returns the context size from the dynamic context.
  '{}
:)
declare function fn:last() as xs:integer external;

(:~ 
  Provides access to the public functions and global variables of a dynamically loaded XQuery library module.
  '{}
:)
declare function fn:load-xquery-module($module-uri as xs:string, $options as map(*)?) as map(*) external;

(:~ 
  Returns the local part of the name of $node as an xs:string that is either the zero-length string, or has the lexical form of an xs:NCName.
  '{}
:)
declare function fn:local-name($node as node()?) as xs:string external;

(:~ 
  Returns the local part of the supplied QName.
  '{}
:)
declare function fn:local-name-from-QName($value as xs:QName?) as xs:NCName? external;

(:~ 
  Converts a string to lower case.
  '{}
:)
declare function fn:lower-case($value as xs:string?) as xs:string external;

(:~ 
  Returns those items from a supplied sequence that have the lowest value of a sort key, where the sort key can be computed using a caller-supplied function.
  '{}
:)
declare function fn:lowest($input as item()*, $collation as xs:string?, $key as function(item()) as xs:anyAtomicType*) as item()* external;

(:~ 
  Returns true if the supplied string matches a given regular expression.
  '{}
:)
declare function fn:matches($value as xs:string?, $pattern as xs:string, $flags as xs:string?) as xs:boolean external;

(:~ 
  Returns a value that is equal to the highest value appearing in the input sequence.
  '{}
:)
declare function fn:max($values as xs:anyAtomicType*, $collation as xs:string?) as xs:anyAtomicType? external;

(:~ 
  Outputs trace information and discards the result.
  '{}
:)
declare function fn:message($input as item()*, $label as xs:string?) as empty-sequence() external;

(:~ 
  Returns a value that is equal to the lowest value appearing in the input sequence.
  '{}
:)
declare function fn:min($values as xs:anyAtomicType*, $collation as xs:string?) as xs:anyAtomicType? external;

(:~ 
  Returns the minute component of an xs:dateTime.
  '{}
:)
declare function fn:minutes-from-dateTime($value as xs:dateTime?) as xs:integer? external;

(:~ 
  Returns the number of minutes in a duration.
  '{}
:)
declare function fn:minutes-from-duration($value as xs:duration?) as xs:integer? external;

(:~ 
  Returns the minutes component of an xs:time.
  '{}
:)
declare function fn:minutes-from-time($value as xs:time?) as xs:integer? external;

(:~ 
  Returns the month component of an xs:date.
  '{}
:)
declare function fn:month-from-date($value as xs:date?) as xs:integer? external;

(:~ 
  Returns the month component of an xs:dateTime.
  '{}
:)
declare function fn:month-from-dateTime($value as xs:dateTime?) as xs:integer? external;

(:~ 
  Returns the number of months in a duration.
  '{}
:)
declare function fn:months-from-duration($value as xs:duration?) as xs:integer? external;

(:~ 
  Returns the name of a node, as an xs:string that is either the zero-length string, or has the lexical form of an xs:QName.
  '{}
:)
declare function fn:name($node as node()?) as xs:string external;

(:~ 
  Returns the namespace URI part of the name of $node, as an xs:anyURI value.
  '{}
:)
declare function fn:namespace-uri($node as node()?) as xs:anyURI external;

(:~ 
  Returns the namespace URI of one of the in-scope namespaces for $element, identified by its namespace prefix.
  '{}
:)
declare function fn:namespace-uri-for-prefix($value as xs:string, $element as element()) as xs:anyURI? external;

(:~ 
  Returns the namespace URI part of the supplied QName.
  '{}
:)
declare function fn:namespace-uri-from-QName($value as xs:QName?) as xs:anyURI? external;

(:~ 
  Returns true for an element that is nilled.
  '{}
:)
declare function fn:nilled($node as node()?) as xs:boolean? external;

(:~ 
  Returns the name of a node, as an xs:QName.
  '{}
:)
declare function fn:node-name($node as node()?) as xs:QName? external;

(:~ 
  Returns $value with leading and trailing whitespace removed, and sequences of internal whitespace reduced to a single space character.
  '{}
:)
declare function fn:normalize-space($value as xs:string?) as xs:string external;

(:~ 
  Returns $value after applying Unicode normalization.
  '{}
:)
declare function fn:normalize-unicode($value as xs:string?, $form as xs:string?) as xs:string external;

(:~ 
  Returns true if the effective boolean value of $input is false, or false if it is true.
  '{}
:)
declare function fn:not($input as item()*) as xs:boolean external;

(:~ 
  Returns the value indicated by $value or, if $value is not specified, the context value after atomization, converted to an xs:double.
  '{}
:)
declare function fn:number($value as xs:anyAtomicType?) as xs:double external;

(:~ 
  Returns $input if it contains one or more items. Otherwise, raises an error.
  '{}
:)
declare function fn:one-or-more($input as item()*) as item()+ external;

(:~ 
  Returns a function whose effect is to apply a supplied binary operator to two arguments.
  '{}
:)
declare function fn:op($operator as xs:string) as function(item()*, item()*) as item()* external;

(:~ 
  Returns every node within the input sequence that has no ancestor that is itself a member of the input sequence; the nodes are returned in document order with duplicates eliminated.
  '{}
:)
declare function fn:outermost($nodes as node()*) as node()* external;

(:~ 
  Parses CSV data supplied as a string, returning the results in the form of a record containing information about the names in the header, as well as the data itself.
  '{}
:)
declare function fn:parse-csv($value as xs:string?, $options as map(*)?) as map(*) external;

(:~ 
  This function takes as input an HTML document represented as a string, and returns the document node at the root of an XDM tree representing the parsed document.
  '{}
:)
declare function fn:parse-html($html as xs:string, $options as map(*)) as document-node(element(*))? external;

(:~ 
  Parses a string containing the date and time in IETF format, returning the corresponding xs:dateTime value.
  '{}
:)
declare function fn:parse-ietf-date($value as xs:string?) as xs:dateTime? external;

(:~ 
  Converts a string to an integer, recognizing any radix in the range 2 to 36.
  '{}
:)
declare function fn:parse-integer($value as xs:string?, $radix as xs:integer?) as xs:integer? external;

(:~ 
  Parses a string supplied in the form of a JSON text, returning the results typically in the form of a map or array.
  '{}
:)
declare function fn:parse-json($value as xs:string?, $options as map(*)?) as item()? external;

(:~ 
  Returns an xs:QName value formed by parsing an EQName.
  '{}
:)
declare function fn:parse-QName($value as xs:string?) as xs:QName? external;

(:~ 
  Parses the URI provided and returns a map of its parts.
  '{}
:)
declare function fn:parse-uri($value as xs:string?, $options as map(*)?) as map(*) external;

(:~ 
  This function takes as input an XML document represented as a string, and returns the document node at the root of an XDM tree representing the parsed document.
  '{}
:)
declare function fn:parse-xml($value as xs:string?, $options as map(*)?) as document-node(element(*))? external;

(:~ 
  This function takes as input an XML external entity represented as a string, and returns the document node at the root of an XDM tree representing the parsed document fragment.
  '{}
:)
declare function fn:parse-xml-fragment($value as xs:string?, $options as map(*)?) as document-node()? external;

(:~ 
  Partitions a sequence of items into a sequence of non-empty arrays containing the same items, starting a new partition when a supplied condition is true.
  '{}
:)
declare function fn:partition($input as item()*, $split-when as function(item()*, item(), xs:integer) as xs:boolean?) as array(item())* external;

(:~ 
  Returns a path expression that can be used to select the supplied node relative to the root of its containing document.
  '{}
:)
declare function fn:path($node as node()?) as xs:string? external;

(:~ 
  Adapts a map or array so that retrieval operations retain additional information.
  '{}
:)
declare function fn:pin($input as xs:string) as xs:string external;

(:~ 
  Returns the context position from the dynamic context.
  '{}
:)
declare function fn:position() as xs:integer external;

(:~ 
  Returns the prefix component of the supplied QName.
  '{}
:)
declare function fn:prefix-from-QName($value as xs:QName?) as xs:NCName? external;

(:~ 
  Returns an xs:QName value formed using a supplied namespace URI and lexical QName.
  '{}
:)
declare function fn:QName($uri as xs:string?, $qname as xs:string) as xs:QName external;

(:~ 
  Returns a random number generator, which can be used to generate sequences of random numbers.
  '{}
:)
declare function fn:random-number-generator($seed as xs:anyAtomicType?) as map(*) external;

(:~ 
  Returns a new sequence containing all the items of $input except those at specified positions.
  '{}
:)
declare function fn:remove($input as item()*, $positions as xs:integer*) as item()* external;

(:~ 
  Returns a string produced from the input string by replacing any substrings that match a given regular expression with a supplied replacement string, provided either literally, or by invoking a supplied function.
  '{}
:)
declare function fn:replace($value as xs:string?, $pattern as xs:string, $replacement as xs:string?, $flags as xs:string?, $action as (function(xs:untypedAtomic, xs:untypedAtomic*) as item()?)?) as xs:string external;

(:~ 
  Produces multiple copies of a sequence.
  '{}
:)
declare function fn:replicate($input as item()*, $count as xs:nonNegativeInteger) as item()* external;

(:~ 
  Returns an xs:QName value (that is, an expanded-QName) by taking an xs:string that has the lexical form of an xs:QName (a string in the form "prefix:local-name" or "local-name") and resolving it using the in-scope namespaces for a given element.
  '{}
:)
declare function fn:resolve-QName($value as xs:string?, $element as element()) as xs:QName? external;

(:~ 
  Resolves a relative IRI reference against an absolute IRI.
  '{}
:)
declare function fn:resolve-uri($href as xs:string?, $base as xs:string?) as xs:anyURI? external;

(:~ 
  Reverses the order of items in a sequence.
  '{}
:)
declare function fn:reverse($input as item()*) as item()* external;

(:~ 
  Returns the root of the tree to which $node belongs. This will usually, but not necessarily, be a document node.
  '{}
:)
declare function fn:root($node as node()?) as node()? external;

(:~ 
  Rounds a value to a specified number of decimal places, with control over how the rounding takes place.
  '{}
:)
declare function fn:round($value as xs:numeric?, $precision as xs:integer?, $mode as xs:string) as xs:numeric? external;

(:~ 
  Rounds a value to a specified number of decimal places, rounding to make the last digit even if two such values are equally near.
  '{}
:)
declare function fn:round-half-to-even($value as xs:numeric?, $precision as xs:integer?) as xs:numeric? external;

(:~ 
  Produces the complete (ordered) sequence of all partial results from every new value the accumulator is assigned to during the evaluation of fn:fold-left.
  '{}
:)
declare function fn:scan-left($input as item()*, $zero as item()*, $action as function(item()*, item()) as item()*) as array(*)* external;

(:~ 
  Produces the complete (ordered) sequence of all partial results from every new value the accumulator is assigned to during the evaluation of fn:fold-right.
  '{}
:)
declare function fn:scan-right($input as item()*, $zero as item()*, $action as function(item()*, item()) as item()*) as array(*)* external;

(:~ 
  Returns an xs:dayTimeDuration whose length is a given number of seconds.
  '{}
:)
declare function fn:seconds($value as xs:decimal?) as xs:dayTimeDuration? external;

(:~ 
  Returns the seconds component of an xs:dateTime.
  '{}
:)
declare function fn:seconds-from-dateTime($value as xs:dateTime?) as xs:decimal? external;

(:~ 
  Returns the number of seconds in a duration.
  '{}
:)
declare function fn:seconds-from-duration($value as xs:duration?) as xs:decimal? external;

(:~ 
  Returns the seconds component of an xs:time.
  '{}
:)
declare function fn:seconds-from-time($value as xs:time?) as xs:decimal? external;

(:~ 
  This function serializes the supplied input sequence $input as described in , returning the serialized representation of the sequence as a string.
  '{}
:)
declare function fn:serialize($input as item()*, $options as xs:string) as xs:string external;

(:~ 
  Returns a sequence containing selected items from a supplied input sequence based on their position.
  '{}
:)
declare function fn:slice($input as item()*, $start as xs:integer?, $end as xs:integer?, $step as xs:integer?) as item()* external;

(:~ 
  Returns true if at least one item in the input sequence matches a supplied predicate.
  '{}
:)
declare function fn:some($input as item()*, $predicate as (function(item(), xs:integer) as xs:boolean?)?) as xs:boolean external;

(:~ 
  Sorts a supplied sequence, based on the value of a number of sort keys supplied as functions.
  '{}
:)
declare function fn:sort($input as item()*, $collations as xs:string*, $keys as (function(item()) as xs:anyAtomicType*)*, $orders as xs:string) as item()* external;

(:~ 
  Sorts a supplied sequence, according to the order induced by the supplied comparator functions.
  '{}
:)
declare function fn:sort-with($input as item()*, $comparators as (function(item(), item()) as xs:integer)*) as item()* external;

(:~ 
  Returns implementation-dependent information about the current state of execution.
  '{}
:)
declare function fn:stack-trace() as xs:string external;

(:~ 
  Returns true if the string $value contains $substring as a leading substring, taking collations into account.
  '{}
:)
declare function fn:starts-with($value as xs:string?, $substring as xs:string?, $collation as xs:string?) as xs:boolean external;

(:~ 
  Determines whether one sequence starts with another, using a supplied callback function to compare items.
  '{}
:)
declare function fn:starts-with-subsequence($input as item()*, $subsequence as item()*, $compare as (function(item(), item()) as xs:boolean?)?) as xs:boolean external;

(:~ 
  This function returns the value of the executable base URI property from the dynamic context.
  '{}
:)
declare function fn:static-base-uri() as xs:anyURI? external;

(:~ 
  Returns the value of $value represented as an xs:string.
  '{}
:)
declare function fn:string($value as item()?) as xs:string external;

(:~ 
  Returns a string created by concatenating the items in a sequence, with a defined separator between adjacent items.
  '{}
:)
declare function fn:string-join($values as xs:anyAtomicType*, $separator as xs:string?) as xs:string external;

(:~ 
  Returns the number of characters in a string.
  '{}
:)
declare function fn:string-length($value as xs:string?) as xs:integer external;

(:~ 
  Returns the sequence of codepoints that constitute an xs:string value.
  '{}
:)
declare function fn:string-to-codepoints($value as xs:string?) as xs:integer* external;

(:~ 
  Returns the contiguous sequence of items in $input beginning at the position indicated by $start and continuing for the number of items indicated by $length.
  '{}
:)
declare function fn:subsequence($input as item()*, $start as xs:double, $length as xs:double?) as item()* external;

(:~ 
  Returns a contiguous sequence of items from $input, with the start and end points located by applying predicates.
  '{}
:)
declare function fn:subsequence-where($input as item()*, $from as (function(item(), xs:integer) as xs:boolean?)?, $to as (function(item(), xs:integer) as xs:boolean?)?) as item()* external;

(:~ 
  Returns the part of $value beginning at the position indicated by $start and continuing for the number of characters indicated by $length.
  '{}
:)
declare function fn:substring($value as xs:string?, $start as xs:double, $length as xs:double?) as xs:string external;

(:~ 
  Returns the part of $value that follows the first occurrence of $substring, taking collations into account.
  '{}
:)
declare function fn:substring-after($value as xs:string?, $substring as xs:string?, $collation as xs:string?) as xs:string external;

(:~ 
  Returns the part of $value that precedes the first occurrence of $substring, taking collations into account.
  '{}
:)
declare function fn:substring-before($value as xs:string?, $substring as xs:string?, $collation as xs:string?) as xs:string external;

(:~ 
  Returns a value obtained by adding together the values in $values.
  '{}
:)
declare function fn:sum($values as xs:anyAtomicType*, $zero as xs:anyAtomicType?) as xs:anyAtomicType? external;

(:~ 
  Returns all but the first item in a sequence.
  '{}
:)
declare function fn:tail($input as item()*) as item()* external;

(:~ 
  Returns the timezone component of an xs:date.
  '{}
:)
declare function fn:timezone-from-date($value as xs:date?) as xs:dayTimeDuration? external;

(:~ 
  Returns the timezone component of an xs:dateTime.
  '{}
:)
declare function fn:timezone-from-dateTime($value as xs:dateTime?) as xs:dayTimeDuration? external;

(:~ 
  Returns the timezone component of an xs:time.
  '{}
:)
declare function fn:timezone-from-time($value as xs:time?) as xs:dayTimeDuration? external;

(:~ 
  Returns a sequence of strings constructed by splitting the input wherever a separator is found; the separator is any substring that matches a given regular expression.
  '{}
:)
declare function fn:tokenize($value as xs:string?, $pattern as xs:string?, $flags as xs:string?) as xs:string* external;

(:~ 
  Provides an execution trace intended to be used in debugging queries.
  '{}
:)
declare function fn:trace($input as item()*, $label as xs:string?) as item()* external;

(:~ 
  Invokes a transformation using a dynamically loaded XSLT stylesheet.
  '{}
:)
declare function fn:transform($options as map(*)) as map(*) external;

(:~ 
  Returns all the nodes reachable from a given start node by applying a supplied function repeatedly.
  '{}
:)
declare function fn:transitive-closure($node as node()?, $step as function(node()) as node()*) as node()* external;

(:~ 
  Returns $value modified by replacing or removing individual characters.
  '{}
:)
declare function fn:translate($value as xs:string?, $replace as xs:string, $with as xs:string) as xs:string external;

(:~ 
  Returns the xs:boolean value true.
  '{}
:)
declare function fn:true() as xs:boolean external;

(:~ 
  Returns all but the last item in a sequence.
  '{}
:)
declare function fn:trunk($input as item()*) as item()* external;

(:~ 
  Returns a dateTime value for a Unix time.
  '{}
:)
declare function fn:unix-time($value as xs:integer?) as xs:dateTimeStamp external;

(:~ 
  Returns the items of $input in an implementation-dependent order.
  '{}
:)
declare function fn:unordered($input as item()*) as item()* external;

(:~ 
  The fn:unparsed-text function reads an external resource (for example, a file) and returns a string representation of the resource.
  '{}
:)
declare function fn:unparsed-text($href as xs:string?, $options as xs:string) as xs:string? external;

(:~ 
  Allows an application to determine whether a call on fn:unparsed-text with particular arguments would succeed.
  '{}
:)
declare function fn:unparsed-text-available($href as xs:string?, $options as xs:string) as xs:boolean external;

(:~ 
  The fn:unparsed-text-lines function reads an external resource (for example, a file) and returns its contents as a sequence of strings, one for each line of text in the string representation of the resource.
  '{}
:)
declare function fn:unparsed-text-lines($href as xs:string?, $options as xs:string) as xs:string* external;

(:~ 
  Converts a string to upper case.
  '{}
:)
declare function fn:upper-case($value as xs:string?) as xs:string external;

(:~ 
  Returns a sequence of xs:anyURI values representing the URIs in a URI collection.
  '{}
:)
declare function fn:uri-collection($uri as xs:string?) as xs:anyURI* external;

(:~ 
  Absorbs the argument.
  '{}
:)
declare function fn:void($input as item()*) as empty-sequence() external;

(:~ 
  Processes a supplied value repeatedly, continuing while some condition remains true, and returning the first value that does not satisfy the condition.
  '{}
:)
declare function fn:while-do($input as item()*, $predicate as function(item()*, xs:integer) as xs:boolean?, $action as function(item()*, xs:integer) as item()*) as item()* external;

(:~ 
  Converts an XML tree, whose format corresponds to the XML representation of JSON defined in this specification, into a string conforming to the JSON grammar.
  '{}
:)
declare function fn:xml-to-json($node as node()?, $options as map(*)?) as xs:string? external;

(:~ 
  Returns the year component of an xs:date.
  '{}
:)
declare function fn:year-from-date($value as xs:date?) as xs:integer? external;

(:~ 
  Returns the year component of an xs:dateTime.
  '{}
:)
declare function fn:year-from-dateTime($value as xs:dateTime?) as xs:integer? external;

(:~ 
  Returns the number of years in a duration.
  '{}
:)
declare function fn:years-from-duration($value as xs:duration?) as xs:integer? external;

(:~ 
  Returns input if it contains zero or one items. Otherwise, raises an error.
  '{}
:)
declare function fn:zero-or-one($input as item()*) as item()? external;

