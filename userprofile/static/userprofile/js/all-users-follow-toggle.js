$(document).ready(function () {
    $(".follow-toggle").click(function (e) {
        e.preventDefault();
        var href = this.href
        var parent = $(this).parent(".card");
        var author_follower_selector = parent.find(".author-followers-number");
        var author_followers_number = author_follower_selector.text();
        var currentuser_following_number = $("#currentuser-following-number").text();
        var thisElement = $(this);
        $.ajax({
            url: href,
            success: function (response) {
                if (response["following"]) {
                    thisElement.html("Unfollow");
                    author_followers_number++;
                    currentuser_following_number++;
                } else {
                    thisElement.html("Follow");
                    author_followers_number--;
                    currentuser_following_number--;
                }
                author_follower_selector.html(author_followers_number);
                $("#currentuser-following-number").html(currentuser_following_number);
            }
        })
    })
});