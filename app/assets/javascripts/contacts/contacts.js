$(document).ready(function() {
  $("#company a.add_fields").
    data("association-insertion-position", 'before').
    data("association-insertion-node", 'this');

  $('#company').bind('cocoon:after-insert',
     function() {
       $("#company_from_list").hide();
       $("#company a.add_fields").hide();
     });
  $('#company').bind("cocoon:after-remove",
     function() {
       $("#company_from_list").show();
       $("#company a.add_fields").show();
     });
});
