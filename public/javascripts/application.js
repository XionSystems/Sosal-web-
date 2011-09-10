// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Home page dashboard tabs
$(function() {
	$( "#tabs" ).tabs().find( ".ui-tabs-nav" ).sortable({ axis: "x" });
});

// Turns link nav below user pic diff colors
$(function(){
		$(".quick_links_li").hover(function(){
			$(this).css({
				"background-color":"#F5F5F5",
				"cursor":"pointer"
			});
		}, function(){
			var resetCSS = {
				"background-color":"",
				"cursor":""
			}
			$(this).css(resetCSS);
		});
	});

// Shows the edit profile pic link 
$(function(){
		$(".profile_pic").hover(function(){
			$(".edit_profile_pic").css({
				"display":"block"
			});
		}, function(){
			var resetEdit = {
				"display":"none"
			}
			$(".edit_profile_pic").css(resetEdit);
		});
	});

// Tabs for show page
$(function() {
		$( "#tabs_user" ).tabs().find( ".ui-tabs-nav" ).sortable({ axis: "x" });
	});

// Tabs for storage page
$(function() {
		$( "#tabs_storage" ).tabs().find( ".ui-tabs-nav" ).sortable({ axis: "x" });
	});
// Shows how many characters user has inputed into status textarea
$(function(){
			$(".count_box").keyup(function(){
				var box=$(this).val();
				var count= 50 - box.length;

				if(box.length <= 400){
					$('.running_count').html("Words: " + count);
				}
				else
				{
					event.preventDefault();
				}
				return false;
			});

	});

$(function() {
	$( "#user_birthday" ).datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange: '1950:2011'
	});
});

// Adds underline effect to text in new album button
$(function(){
		$("#blurt_button").hover(function(){
			$(this).css({"text-decoration":"underline"});
		}, function(){
			var resetUnderln = { "text-decoration":"none"}
			$(this).css(resetUnderln);
		});
	});
// For the new album popup window
	var popupStatus = 0;

	function loadPopup(){
	if(popupStatus==0){
		$(".backgroundPopup").css({
			"opacity": "0.7"
		});
		$(".backgroundPopup").fadeIn("fast");
		$(".popupPicture").fadeIn("fast");
		popupStatus = 1;
		}
	}

	function disablePopup(){
	if(popupStatus==1){
		$(".backgroundPopup").fadeOut("slow");
		$(".popupPicture").fadeOut("slow");
		popupStatus = 0;
		}
	}

	function centerPopup(){
		var windowWidth = document.documentElement.clientWidth;
		var windowHeight = document.documentElement.clientHeight;
		var popupHeight = $(".popupPicture").height();
		var popupWidth = $(".popupPicture").width();
		$(".popupPicture").css({
			"position": "absolute",
			"top": windowHeight/2-popupHeight/2,
			"left": windowWidth/2-popupWidth/2
		});

		$(".backgroundPopup").css({
			"height": windowHeight
		});

	}

	$(function(){
		$("#blurt_button").click(function(){
			centerPopup();
			loadPopup();
		});

		$(".popupContactClose").click(function(){
			disablePopup();
		});

		$(".backgroundPopup").click(function(){
			disablePopup();
		});

		$(document).keypress(function(e){
			if(e.keyCode==27 && popupStatus==1){
				disablePopup();
			}
		});

	});
// To make photo array sortable
	$(function(){
		$(".portfolio_albums li").sortable();
		$(".portfolio_albums li").disableSelection();
	});