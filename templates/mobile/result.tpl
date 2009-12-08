{if $result eq ''}
	<div class="noResults">
		{$texts.COLLECTION_UNAVAILABLE}
	</div>
{elseif isset($result->response->connection_problem)}
	<div class="noResults">
		{$texts.CONNECTION_ERROR}
	</div>
{elseif $numFound eq '0'}
	<div class="noResults">
		{$texts.NO_RESULTS}
	</div>
{/if}

<div class="totalResults">
    {$texts.RESULTS}&#160;
    <strong>{$pagination.from}-{$pagination.to}</strong> de <strong>{$pagination.total|number_format:0:",":"."}</strong>
</div>


<div class="resultSet">
    {if $detail == '1'}
        {include file="$media/result-detail.tpl"}
    {else}
        {include file="$media/result-doc.tpl"}
    {/if}

    {include file="$media/result-navigation.tpl"}
</div>

