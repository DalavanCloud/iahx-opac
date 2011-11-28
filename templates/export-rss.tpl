<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
    <channel>
        <title>{$texts.TITLE}: {$smarty.request.q}</title>
        <link>{$url}</link>
        <description>{$texts.DESCRIPTION}</description>
        {foreach from=$result->response->docs item=doc}
            {capture name=scieloLinks}
                {iahlinks scielo=$links->response->docs document=$doc->ur id=$doc->id lang=$lang}
            {/capture}
            <item>
                <title><![CDATA[{occ element=$doc->title separator=/}]]></title>
                <link>{sbtitle element=$doc type=link conf=$config}</link>
                <description>
                    <![CDATA[
                        {if isset($doc->au) }
                            {$texts.LABEL_AUTHOR}: {occ element=$doc->au separator=;}
                        {/if}
                        {if isset($doc->fo) }
                            <p>{$texts.LABEL_SOURCE}: {occ element=$doc->fo separator=;}</p>
                        {/if}
                        { if isset($doc->ab) }
                            <span class="abstract"><p>{occ element=$doc->ab separator=/}</p></span>
                        {/if}
                        { if isset($doc->mh) }
                            <p>
                                {$texts.LABEL_SUBJECT}:
                                {occ element=$doc->mh separator=;}
                            </p>
                        {/if}
                    ]]>
                </description>
                {if $doc->type == 'book'}
                <enclosure url="{$config->scielobooks->base_url}/id/{$doc->sbid}/cover/cover_thumbnail.jpeg"
                       length="-1" type="image/jpeg" />
                {else}
                <enclosure url="{$config->scielobooks->base_url}/id/{$doc->monographsbid}/cover/cover_thumbnail.jpeg"
                       length="-1" type="image/jpeg" />
                {/if}
            </item>
        {/foreach}
    </channel>
</rss>
