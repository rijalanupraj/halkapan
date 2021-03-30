$('.confirm-delete-post').click(function (e) {
    e.preventDefault();
    result = confirm('Are you sure you want to delete this?',"No","Yes Delete");
    if (result == true) {
        $('.delete-post-form').submit();
    }
});