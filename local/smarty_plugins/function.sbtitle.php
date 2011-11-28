<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty {sbtitle} function plugin
 *
 * Type:     function<br>
 * Name:     sbtitle<br>
 * Input:<br>
 *         - label
 *         - element
 *         - separator
 *         - class
 *
 * Examples:
 * <pre>
 * {sbtitle label=AUTOR element=$doc->au separator=; class=author}
 * </pre>
 * @version  0.1
 * @param array
 * @param Smarty
 * @return string
 */
function smarty_function_sbtitle($params, &$smarty)
{

  $conf = $params['conf'];

  $output = "";

  if ( empty($params['element']) ){ return; }
  if ( isset($params['label']) ){ $labels = $params['label']; }

  $doc = $params['element'];

  $doc_link = $conf->scielobooks->base_url ."/id/";

  if ($doc->type == 'part')
  {
    $book_sbid = $doc->monographsbid;
    $part_sbid = $doc->chapterorder;
    $doc_link  = $doc_link . "$book_sbid/$part_sbid";
  }
  else
  {
    $book_sbid = $doc->sbid;
    $doc_link  = $doc_link . $book_sbid;
  }

  if ( isset($params['type']) && $params['type'] == 'link' )
  {
    $output = $doc_link;
  } else {
    if ( isset($params['class']) )
    {
      $param_class = 'class="'.$params['class'].'"';
    }
    $output = "<div $param_class><a href=\"$doc_link\">$doc->title</a></div>";  
  }

  return $output;
}
?>
