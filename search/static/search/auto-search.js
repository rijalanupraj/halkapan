$(document).ready(function () {
    var searchForm = $(".search-form")
    var searchInput = searchForm.find("[name='q']")
    var typingTimer;
    var typingInterval = 1500;
    var searchButton = searchForm.find("[type='submit']");


    searchInput.keyup(function (event) {
        clearTimeout(typingTimer);
        typingTimer = setTimeout(performSearch, typingInterval);
    })

    searchInput.keydown(function (event) {
        clearTimeout(typingTimer)
    })

    function displaySpinner() {
        searchButton.addClass("disabled")
        searchButton.html("<i class='fa fa-spin fa-spinner'></i>")
    }

    function performSearch() {
        displaySpinner();
        var query = searchInput.val();
        window.location.href = '/search?q=' + query;
    }
})