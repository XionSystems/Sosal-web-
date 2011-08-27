// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
	$( "#user_birthday" ).datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange: '1950:2011'
	});
});