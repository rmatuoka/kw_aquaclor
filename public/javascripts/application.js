// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

changeSelects = function (id1, id2) { 
   $('#' + id1).live('change', function() { 
     var estado = $('#' + id1 + ' :selected').val(); 
     if(estado == "") estado="0"; 
     $.get('/onde_encontrar/popula_cidades?estado=' + estado, function(data){ 
         $("#" + id2).html(data); 
     }) 
     return false; 
   }); 
 }