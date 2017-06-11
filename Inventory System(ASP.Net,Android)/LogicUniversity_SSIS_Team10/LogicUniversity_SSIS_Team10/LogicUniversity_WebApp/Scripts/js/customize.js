$(document).ready(function () {
    var url_parts = location.href.split('/');

    var last_segment = url_parts[url_parts.length - 1];
    $('ul.navbar-nav li.active').removeClass('active')
    $('.navbar-nav a[href="' + last_segment + '"]').parents('li').addClass('active');

    $(".navbar-nav li, .navbar-nav a, .navbar-nav ul").removeAttr('style');

    $("<div> class").removeAttr("style");
    $("<ul> class").removeAttr("style");
    $("<ul> class").find("li").removeAttr("style");
});
$(function () {
    //Remove the style attributes.
    $(".navbar-nav li, .navbar-nav a, .navbar-nav ul").removeAttr('style');
});


