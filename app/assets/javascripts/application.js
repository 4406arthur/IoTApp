// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

function myFunction(action, method, input) {
    "use strict";
    var form;
    form = $('<form />', {
        action: action,
        method: method,
        style: 'display: none;'
    });
    if (typeof input !== 'undefined') {
        $.each(input, function (name, value) {
            $('<input />', {
                type: 'hidden',
                name: name,
                value: value
            }).appendTo(form);
        });
    }
    form.appendTo('body').submit();
};


$(function()
 {
 	$('.cmd').hide();
 });


$(document)
.on('click', '.list-group-item-info', function (e) {   
    $(this).find('.cmd').toggle(600);
    //$(this).insertAfter($('<div>ghcgfhnffh</div>').slideIn());
})


.on('click','.fa-arrow-left', function (e) { 
	myFunction('http://140.138.150.69/pantiltcontrol.cgi','post',{
	PanSingleMoveDegree: 5,
	TiltSingleMoveDegree: 5,
	PanTiltSingleMove: 3})
})



.on('click','.fa-arrow-right', function (e) { 
	myFunction('http://140.138.150.69/pantiltcontrol.cgi','post',{
	PanSingleMoveDegree: 5,
	TiltSingleMoveDegree: 5,
	PanTiltSingleMove: 5})
})


.on('click','.fa-arrow-up', function (e) {
	 $.ajax({
                url: "http://140.138.150.69/pantiltcontrol.cgi",
                dataType: 'jsonp',
                crossDomain: true,
                data: {
                        PanSingleMoveDegree: 5,
						TiltSingleMoveDegree: 5,
						PanTiltSingleMove: 5
                       },
                success: function(e){
                  console.log(e)
                }
	});
});
 
 



