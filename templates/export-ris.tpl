{foreach from=$result->response->docs item=doc}
{if $doc->type == 'book'}
TY  - BOOK
{else}
TY  - CHAP
{/if}
TI  - {$doc->title}
{foreach item=au from=$doc->author}
AU  - {$au}
{/foreach}
{foreach item=ab from=$doc->synopsis}
AB  - {$ab}
{/foreach}
PB  - {$doc->publisher}
{if $doc->isbn}
SN  - {$doc->isbn}
{/if}
{if $doc->year}
PY  - {$doc->year}
{/if}
{if $doc->language}
LA  - {$doc->language}
{/if}
ER  -

{/foreach}
