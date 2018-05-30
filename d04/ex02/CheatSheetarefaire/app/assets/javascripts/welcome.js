$(document).ready(function(){
    $('.table-striped').DataTable();
});
$(document).on('page:fetch', function(){
    $('.table-striped').DataTable();
});

