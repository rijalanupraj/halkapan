$(document).ready(function () {
    $(".post-like-toggle").click(function (e) {
        e.preventDefault();
        var href = this.href;
        likeButton = $(this).children('i');
        $.ajax({
            url: href,
            success: function (response) {
                console.log(response);
                if (response["isLiked"]) {
                    likeButton.removeClass('far');
                    likeButton.addClass('fa');
                } else {
                    likeButton.removeClass('fa');
                    likeButton.addClass('far');

                }
            }
        })
    })
});