declare option saxon:output "method=text";  
declare variable $linefeed := "&#10;";  
declare variable $tab := "&#9;";     

declare variable $source := collection('../xml/?select=*.xml');
(: let $paras := $source//para
let $parasCount := $paras=>count()
return $parasCount  :)

(: declare variable $source := collection('../xml/?select=*.xml');  :)
(:  where $paras=>count()  :)
 for $book in distinct-values($source//book)
let $paras := $source//book[. = $book]//para
let $parasCount := count($paras)
order by $book
return $parasCount  

(: I tried to figure out why my text is in red but I tried many things but it didnt work, I hope you can help me figue out what I did wrong in class on monday. Thanks :)