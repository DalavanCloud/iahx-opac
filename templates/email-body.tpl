<table width="100%">

{foreach from=$result->response->docs item=doc name=doclist}
<tr>

    <td width="20%">
        {if $doc->type == 'book'}
          <img src="{$config->scielobooks->base_url}/id/{$doc->sbid}/cover/cover_thumbnail.jpeg"/>
        {else}
          <img src="{$config->scielobooks->base_url}/id/{$doc->monographsbid}/cover/cover_thumbnail.jpeg"/>
        {/if}
    </td>    

    <td>
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
    </td>

</tr>
{/foreach}

</table>
