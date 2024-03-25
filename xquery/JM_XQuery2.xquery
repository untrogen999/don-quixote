declare default element namespace "http://www.tei-c.org/ns/1.0";
declare option saxon:output "method=text";
declare variable $newline := "&#xa;";
declare variable $tab := "&#9;"; 

(:the following 3 i tried to see if if they would run:)
(:collection('data/')//TEI//chapter/title =>string-join("&#xa;") :)
(:collection('data/')//TEI/book/language:)
(:let $chapters := collection('data/')//TEI:)

(:This is a very simple way I am trying to get the thing to run but I am coming up with errors:)
(:I will continue working on it :)
let $chapters := doc("../xml/cervantes_saavedra_SPAN.xml")//chapter
return $chapters
