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

.on('click', '.fa-lightbulb-o', function (e) {
  console.log('post')
  $.ajax({
                url: "http://140.138.150.52/task_manager/v2/attribute",
                
                data: {
                        service_id: 60,
                        service_secret: 'a98fa6a13fe2ba98c28fa52dabcd9acd',
                        gw_id: 101,
                        device_id: 16,
                        name: 3,
                        value: 0
                       },
                type: 'POST' 
        }).done(function(rep) {
                console.log('test')

        })


})


.on('click','.fa-arrow-left', function (e) { 
	$.ajax({
                url: "http://140.138.150.69/pantiltcontrol.cgi",
                dataType: 'jsonp',
                crossDomain: true,
                data: {
                        PanSingleMoveDegree: 5,
                        TiltSingleMoveDegree: 5,
                        PanTiltSingleMove: 3
                       },
                success: function(e){
                  console.log(e)
                }
    });
})



.on('click','.fa-arrow-right', function (e) { 
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
})


.on('click','.fa-arrow-up', function (e) {
	 $.ajax({
                url: "http://140.138.150.69/pantiltcontrol.cgi",
                dataType: 'jsonp',
                crossDomain: true,
                data: {
                        PanSingleMoveDegree: 5,
						TiltSingleMoveDegree: 5,
						PanTiltSingleMove: 1
                       },
                success: function(e){
                  console.log(e)
                }
	});
})


.on('click','.fa-arrow-down', function (e) {
     $.ajax({
                url: "http://140.138.150.69/pantiltcontrol.cgi",
                dataType: 'jsonp',
                crossDomain: true,
                data: {
                        PanSingleMoveDegree: 5,
                        TiltSingleMoveDegree: 5,
                        PanTiltSingleMove: 7
                       },
                success: function(e){
                  console.log(e)
                }
    });
});
 
 



