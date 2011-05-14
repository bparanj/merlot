// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
  $("#article_published_on").datepicker({ defaultDate: +7 });

});



jQuery(function() {
    jQuery('.wymeditor').wymeditor({
   		html:       "",
        stylesheet: '/javascripts/wymeditor/examples/styles.css',
        
        postInit: function(wym) {
            //render the containers box as a panel
            //and remove the span containing the '>'
            jQuery(wym._box).find(wym._options.containersSelector).remove();
            jQuery(wym._box).find(wym._options.classesSelector).remove();

        }
    });
});
