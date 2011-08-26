#= require 'tiny_mce/jquery.tinymce'
jQuery ->
  $('form').live 'humpyard:form:submit', ->
    if typeof(tinyMCE) == 'object'
      tinyMCE.triggerSave()