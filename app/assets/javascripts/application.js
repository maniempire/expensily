// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function($) {

	$("#dateselect").datepicker();

	$(".fancybox").fancybox({
		'frameWidth': 680,
		'frameHeight':495,
		'overlayShow':true,
		'hideOnContentClick':false,
		'type':'iframe'
	});

	$("#category_text_input").hide();

	$("#expense_category_id").live("change", function() {

		var category_value = $(this).find('option:selected').text(); 

		if(category_value == "Others") {
			$("#category_text_input").show();
		}

	});
	
	$("#month_wise_expense").live("change", function() {
		
		selected_month = $(this).find('option:selected').text(); 
	
	if(selected_month != "Select a Month"){
	
		$.ajax({
			beforeSend: function(request) {
				request.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
			},
			type: "POST",
			url: '/get_monthwise_expenses',
			data: 'expense_month=' + selected_month,
			success: function( response ) {
			}
		});
		
	}
		return false;
		
	});
	
	
	$("#category_wise_expense").live("change", function() {
		
		selected_category = $(this).find('option:selected').val(); 
	
	if(selected_category != "Select a Category"){
	
		$.ajax({
			beforeSend: function(request) {
				request.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
			},
			type: "POST",
			url: '/get_categorywise_expenses',
			data: 'expense_category=' + selected_category,
			success: function( response ) {
			}
		});
		
	}
		return false;
		
	});
	
	
	


});