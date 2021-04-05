$(document).ready(function () {
    $(".post-like-toggle").click(function (e) {
        e.preventDefault();
        var href = this.href;
        likeButton = $(this).children('i');
        likeCount = $(this).children('.like-number').text();
        var current = $(this);
        $.ajax({
            url: href,
            success: function (response) {
                if (response["isLiked"]) {
                    likeButton.removeClass('far');
                    likeButton.addClass('fa');
                    likeCount++;
                    current.children('.like-number').html(likeCount);

                } else {
                    likeButton.removeClass('fa');
                    likeButton.addClass('far');
                    likeCount--;
                    current.children('.like-number').html(likeCount);

                }
            }
        })
    })
});