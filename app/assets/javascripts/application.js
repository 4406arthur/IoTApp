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
//= require bootstrap/colorpicker
//= require bootstrap/datepicker

//= require bootstrap/load-image.min
//= require bootstrap/image-gallery.min
//= require turbolinks
//= require_tree .


$(function()
{
    $('.cmd').hide();
    $('#plant_wall_id').hide();
});

$(document)
.on('click', '.list-group-item-info', function (e) {   
    $(this).find('.cmd').show();
    //$(this).insertAfter($('<div>ghcgfhnffh</div>').slideIn());
})


.on('click', '.on', function (e) {

    var $thisBtn = $(this)
        $thisDeviceId= $thisBtn.data("device-id")
        $thisDeviceGw= $thisBtn.data("device-gw")
    console.log('power on')
    console.log('device_id= '+$thisDeviceId + ' gw_id = ' + $thisDeviceGw)

    $.ajax({
                url: "http://140.138.150.52/task_manager/v2/attribute",             
                data: {
                        service_id: 60,
                        service_secret: 'a98fa6a13fe2ba98c28fa52dabcd9acd',
                        gw_id: $thisDeviceGw ,
                        device_id: $thisDeviceId,
                        name: 3,
                        value: 1
                       },
                type: 'POST' 
        }).done(function(rep) {
                console.log('power on')

        });
})

.on('click', '.off', function (e) {
    var $thisBtn = $(this)
        $thisDeviceId= $thisBtn.data("device-id")
        $thisDeviceGw= $thisBtn.data("device-gw")
        console.log('power off')
        console.log('device_id= '+$thisDeviceId + ' gw_id = ' + $thisDeviceGw)
        $.ajax({
                url: "http://140.138.150.52/task_manager/v2/attribute",             
                data: {
                        service_id: 60,
                        service_secret: 'a98fa6a13fe2ba98c28fa52dabcd9acd',
                        gw_id: $thisDeviceGw,
                        device_id: $thisDeviceId,
                        name: 3,
                        value: 0
                       },
                type: 'POST' 
        }).done(function(rep) {
                console.log('power off')

        });
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
 
