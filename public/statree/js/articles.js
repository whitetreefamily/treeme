$(function(){
    $(window).bind("scroll.alert", function() {
        var $this = $(this);
        if ($this.scrollTop() >= 40) {
            alert("You've scrolled 100 pixels.");
            $this.unbind("scroll.alert");
        }
    });
});