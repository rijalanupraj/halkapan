$(document).ready(function () {
    $("#follow-toggle").click(function (e) {
        e.preventDefault();
        var href = this.href
        var author_follower_number = $("#author-follower-number").text();
        var currentuser_following_number = $("#currentuser-following-number").text();
        $.ajax({
            url: href,
            success: function (response) {
                if (response["following"]) {
                    $("#follow-toggle").html("Unfollow");
                    author_follower_number++;
                    currentuser_following_number++;
                } else {
                    $("#follow-toggle").html("Follow");
                    author_follower_number--;
                    currentuser_following_number--;
                }
                $("#author-follower-number").html(author_follower_number);
                $("#currentuser-following-number").html(currentuser_following_number);
            }
        })
    })
});