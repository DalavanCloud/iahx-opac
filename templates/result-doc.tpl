{if isset($smarty.request.debug)}
	{debug}
{/if}

{foreach from=$result->response->docs item=doc name=doclist}

    {if $doc->type == 'book'}
        {assign var=doc_id value=$doc->sbid}
    {else}
        {assign var=doc_id value=$doc->sbid}
    {/if}    

<div id="{$doc_id}" class="record bookDetail searchResult">

	<div class="yourSelectionCheck">
		<a onclick="markUnmark(this.firstChild,'{$doc_id}');"><img src="./image/common/box_unselected.gif" state="u" alt="{$texts.MARK_DOCUMENT}" title="{$texts.MARK_DOCUMENT}" /></a>
	</div>
	<div class="position">
		{$smarty.foreach.doclist.index+$pagination.from}.
	</div>

    <div class="thumb">
        {if $doc->type == 'book'}
          <img src="{$config->scielobooks->base_url}/id/{$doc->sbid}/cover/cover_thumbnail.jpeg"/>
        {else}
          <img src="{$config->scielobooks->base_url}/id/{$doc->monographsbid}/cover/cover_thumbnail.jpeg"/>
        {/if}
    </div>    

    <div class="details">
        {sbtitle element=$doc class=title conf=$config}
        {occ element=$doc->book_title class=bookTitle label="Parte do livro"}
        <div class="isbn">(ISBN:{$doc->isbn})</div>
        {occ element=$doc->author separator=; class=author}
        <div class="publisher">
            {occ element=$doc->publisher separator=; span=true label=Editora}
        </div>
        <div class="language">
            {occ label=$texts.LABEL_LANG element=$doc->language separator=; translation=$texts suffix=LANG_}
        </div>
        {occ  element=$doc->year separator=; class=year label=Ano}
        {occ element=$doc->synopsis class="summary" label='Resumo'}
    </div>

	<div class="spacer"></div>

   	<!-- div class="user-actions">
        {include file="doc-actions-bar.tpl"}
    </div -->

</div>
{/foreach}

