(function($){
    $.slideShow = function(selector, settings){
        // settings
        var config = {
            'delay': 2000,
            'fadeSpeed': 6000
        };
        if ( settings ){$.extend(config, settings);}
 
        // variables
        var obj = $(selector);
        var img = obj.children('img');
        var count = img.length;
        var i = 0;
 
        // show first image
        img.eq(0).show();
 
        // run slideshow
        setInterval(function(){
            img.eq(i).fadeOut(config.fadeSpeed);
            i = ( i+1 == count ) ? 0 : i+1;
            img.eq(i).fadeIn(config.fadeSpeed);
        }, config.delay);
 
        return this;
    };
})(jQuery);
