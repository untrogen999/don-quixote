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
<tr><th>Author or Translator</th><th>No. of Paragraphs</th></tr>
{
for $book in distinct-values($source//book)
let $paras := $source//book[. = $book]//para
let $parasCount := count($paras)
let $translator := $source//book[. = $book]//translator
let $author := $source//book[. = $book]//author

order by $book
return
if (.//book[. = $book]//language!string-length() > 1)
then
<tr><td>{$author}</td><td>{$parasCount}</td></tr>
else <tr><td>{$translator}</td><td>{$parasCount}</td></tr>
}
</table>
</body>
</html>