{if isset($smarty.request.debug)}
	{debug}
{/if}

{foreach from=$result->response->docs item=doc name=doclist}

	{assign var=refID value=$doc->id|regex_replace:"/.*-/":""}

<div class="resultSet">
   <div id="{$doc->id}" class="record">
   	<div class="yourSelectionCheck">
		<a onclick="markUnmark(this.firstChild,'{$doc->id}');"><img src="./image/common/box_unselected.gif" state="u" alt="{$texts.MARK_DOCUMENT}" title="{$texts.MARK_DOCUMENT}" /></a>
	</div>
	<div class="position">
		{$smarty.foreach.doclist.index+$pagination.from}.
	</div>

	<div class="data">

		<!-- title -->
		<h3>
            <a href="resources/{$doc->id}">
                {occ element=$doc->ti separator=/}
            </a>
		</h3>

        <!-- tipo do registro -->
        {occ element=$doc->type label='Tipo do registro'}
        <br/>
        <!-- resumo -->
        {occ element=$doc->ab label='Resumo'}

		<!-- author -->
		{occ element=$doc->au separator=; class=author}

		<!-- source -->
		{occ  element=$doc->fo separator=; class=source}

		<!-- database -->
		<span>ID:</span> {$doc->id}
        {occ label=$texts.LABEL_LANG element=$doc->la separator=; translation=$texts suffix=LANG_}

        <!-- metadados da monografia -->
        {jstr element=$doc->mono_struct class=monographic-part}

        {occ element=$doc->am_ti_pt separator="<br/>" class="part-titles"}

	</div>
	<div class="spacer"></div>

	<div class="user-actions">
        {include file="doc-actions-bar.tpl"}

		<div class="bookmark">
			<!-- AddThis Button BEGIN -->
			<script type="text/javascript">addthis_pub  = 'bvs.regional';</script>
			<a href="http://www.addthis.com/bookmark.php" onmouseover="return addthis_open(this, '', '[URL]', '[TITLE]')" onmouseout="addthis_close()" onclick="return addthis_sendto()"><img src="http://s9.addthis.com/button1-bm.gif" width="125" height="16" border="0" alt="" /></a>
			<script type="text/javascript" src="http://s7.addthis.com/js/152/addthis_widget.js"></script>
			<!-- AddThis Button END -->
		</div>

		<div class="export">
			<a href="index.php?output=ris&site={$site}&col={$col}&lang={$lang}&q={$q_escaped}">
				<img src="./image/common/icon_page_go.gif"/>
				&#160;<span>{$texts.EXPORT_CITATION}</span>
			</a>
		</div>

	</div>
   </div>
</div>
{/foreach}

