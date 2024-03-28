declare option saxon:output "method=html";  
declare variable $linefeed := "&#10;";  
declare variable $tab := "&#9;";     

declare variable $source := collection('../xml/?select=*.xml');
<html>
<head>
<title>Paragraphs_count</title>
</head>
<body>
<h1>Para</h1>
<table>

{
for $book in distinct-values($source//book)
let $paras := $source//book[. = $book]//para
let $parasCount := count($paras)
let $translator := $source//book[. = $book]//translator
let $author := $source//book[. = $book]//author

order by $book
return
if (.//translator) then
<tr><td>{$translator,$author}</td><td>{$parasCount}</td></tr>
else (:<tr><td>{$author}</td><td>{$parasCount}</td></tr>:) "text"
}
</table>
</body>
</html>