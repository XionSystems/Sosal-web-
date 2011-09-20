window.log=function(){log.history=log.history||[];log.history.push(arguments);if(this.console){arguments.callee=arguments.callee.caller;var a=[].slice.call(arguments);(typeof console.log==="object"?log.apply.call(console.log,console,a):console.log.apply(console,a))}};
(function(b){function c(){}for(var d="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,timeStamp,profile,profileEnd,time,timeEnd,trace,warn".split(","),a;a=d.pop();){b[a]=b[a]||c}})((function(){try
{console.log();return window.console;}catch(err){return window.console={};}})());

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

jQuery.fn.favicons=function(c){var b=jQuery.extend({classname:"favicon",service:"http://g.etfv.co/__URL__"},c);return this.each(function(){var a=$(this),d=b.service.replace("__URL__",a.attr("href")).replace("__DOMAIN__",a.attr("href").replace("http://","").replace("https://",""));a.css("background-image","url("+d+")").addClass(b.classname)})};



