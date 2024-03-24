(: AZ: Sample XQuery file that goes through all chapters, filters out the chapters without (marked-up) poems,
and prints the chapter roman numeral, number of total poems and number of poems that are inside a quote.
Sorts the result by largest-to-smallest chapter. :)

declare variable $newline := "&#xa;";

let $chapters := doc("../xml/ormsby_english.xml")//chapter

for $ch in $chapters

let $ch_roman := $ch/@roman

(: AZ: Only the chapters that have at least one poem. :)
let $poems := $ch//poem
let $poem_count := $poems => count()
where $poem_count > 0

(: AZ: Sort by largest-to-smallest chapter number. This doesn't do anything right now since there should be only one
marked-up chapter with poems. :)
count $ch_num
order by $ch_num descending

let $poems_in_quotes_count := $ch//quote//poem => count()

(: AZ: Construct the sentence. :)
return concat(
$newline,
"Chapter ",
$ch_roman,
" has ",
$poems => count(),
" poems in total, ",
$poems_in_quotes_count,
" of which are inside a quote."
)
