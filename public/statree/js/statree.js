//= require rails.validations
//= require bootstrap
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require drowup
//= require_tree


$(document).ready(function() {
    if ($('.pagination').length) {
        $(window).scroll(function() {
            var url = $('.pagination .next_page').attr('href');
            if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 20) {
                $('.pagination').text("Please Wait...");
                return $.getScript(url);
            }
        });
        return $(window).scroll();
    }
});