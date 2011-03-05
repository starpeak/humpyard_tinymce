$(function(){
  $('form').live('humpyard:form:submit', function(e){
    if(typeof(tinyMCE) == 'object'){
      tinyMCE.triggerSave();
    }
  });
});