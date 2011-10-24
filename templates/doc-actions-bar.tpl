
{if $doc->db eq 'DECS'}
    <div class="text_abstract">
        <a href="#" onclick="javascript:refineByIndex('{$doc->ti_pt[0]}','mh')"><img src="./image/common/viewFullText.gif" alt="Full Text" /></a><!-- TODO trans -->
        <a href="#" onclick="javascript:refineByIndex('{$doc->ti_pt[0]}','mh')">{$texts.SEARCH_USING_TERMINOLOGY}</a>
    </div>

{else}

    {capture name=fulltextlinks}
         {iahlinks scielo=$links->response->docs document=$doc->ur id=$doc->id lang=$lang la_text=$doc->la la_abstract=$doc->la_ab}
    {/capture}

    <div style="display: none;" class="linkBox boxContent" id="linkBox_{$doc->id}">
        <div class="showBox">
            {$smarty.capture.fulltextlinks}
        </div>
        <span class="arrowBox"></span>
    </div>

    {* mostra linha com links para resumo e texto completo disponiveis para scielo *}
    {if $scieloLinkList|@count > 0}
        <div class="text_abstract">
            {if $scieloLinkList|@count > 1}
                <a href="#" onclick="showhideLayers('linkBox_{$doc->id}'); return false;">
                    <img src="./image/common/icon_scielo.gif" alt="SciELO" />
                </a>
            {else}
                <a href="{$scieloLinkList[0]}" target="_blank">
                    <img src="./image/common/icon_scielo.gif" alt="SciELO" />
                </a>
            {/if}
            {$abstractFulltextList}
        </div>
    {/if}

    {* mostra linha com resumo e texto completo informadas no documento *}
    {if  $scieloLinkList|@count == 0 AND ($doc->ab|@count > 0 OR $fulltextLinkList|@count > 0)}
        <div class="text_abstract">
            <a name="abs"><img src="./image/common/viewFullText.gif" alt="Full Text" /></a>
            {if  $doc->ab|@count > 0}
                <span>
                    <a href="resources/{$doc->id}">{$texts.ABSTRACT_IN}
                    {if  $doc->la_ab neq ''}
                        {occ element=$doc->la_ab translation=$texts suffix=LANG_ separator=| text_transform=lowercase}</a>
                    {else}
                        {occ element=$doc->la translation=$texts suffix=LANG_ separator=| text_transform=lowercase}</a>
                    {/if}
                </span>
            {/if}
            {if $fulltextLinkList|@count > 1}
                <span>
                    <a href="#" onclick="showhideLayers('linkBox_{$doc->id}'); return false;">
                        &#160;{$texts.FULLTEXT_IN}
                        {occ element=$doc->la translation=$texts suffix=LANG_ separator=| text_transform=lowercase}
                    </a>
                </span>
            {elseif $fulltextLinkList|@count > 0}
                <span>
                    <a href="{$fulltextLinkList[0]}" target="_blank">
                    &#160;{$texts.FULLTEXT_IN}
                        {occ element=$doc->la translation=$texts suffix=LANG_ separator=| text_transform=lowercase}
                    </a>
                </span>
            {/if}
        </div>
    {/if}

    <div class="print">
        <a href="index.php?q=%2Bid:(%22{$doc->id}%22)&amp;lang={$lang}&amp;printMode=true">
            <img src="./image/common/icon_print.gif" alt="{$texts.PRINT}" />
            &#160;<span>{$texts.PRINT}</span>
        </a>
    </div>
    {if $doc->db|contains:"MEDLINE" or $doc->services|@contains:"SCAD"}
        <div class="scad">
            <a href="{$config->photocopy_url}&lang={$lang}&db={$doc->db}&ident={$refID}">
                <img src="./image/common/icon_scad.gif" alt="{$texts.PHOTOCOPY}"/>
                &#160;<span>{$texts.PHOTOCOPY}</span>
            </a>
        </div>
    {/if}

    {if isset($smarty.cookies.userTK)}
        <div class="scielo">
                <a href="#">
                    <img src="./image/common/icon_addToFolder.gif" alt="{$texts.ADD_TO_COLLECTION}" />
                    &#160;<span>{$texts.ADD_TO_COLLECTION}</span>
                </a>
        </div>
    {/if}

{/if}
