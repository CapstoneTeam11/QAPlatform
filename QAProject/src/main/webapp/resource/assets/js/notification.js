/**
 * Created by khangtnse60992 on 6/27/2015.
 */
$(document).ready(function () {

function getNotificationDiv(senderName,content,href,avatar) {
    var notificationDiv = '<li class="notification-li">' +
        '<a href="'+ href +'">' +
        '<div class="notification-all">' +
        '<div style="min-width: 40px;">' +
        '<img src="'+avatar+'" class="mail-avatar">' +
        '<span class="notification-user">' + senderName +
        '<span class="notification-action">' + content +
        '</span></span></div></div></a></li>'
    return notificationDiv;
}
function getEmptyNotificationDiv() {
    var notificationDiv = '<li class="notification-li">' +
        '<a>' +
        '<div class="notification-all">' +
        '<div style="min-width: 40px;">' +
        '<span class="notification-action">You dont have any notification'
    '</span></span></div></div></a></li>'
    return notificationDiv;
}
var userId =$('#userIdFlag').val()
$.ajax({
    type : "GET",
    url : '/notification/unview/'+userId,
    success : function(data) {
        var numberView = data;
        if(data > 0) {
            $('#countNotifi').html(data);
        }
}
})

$('#notifiDropdown').click(function(e) {
    if(($(e.currentTarget).attr('aria-expanded'))=='false') {
        var url = '/notification/'+userId;
        $.ajax({
            type : "GET",
            url : url,
            success : function(data) {
                var notification = new Array();
                notification = data;
                if(notification.length > 0) {
                    for(var i = 0 ; i < notification.length ; i++) {
                        var divAppend = getNotificationDiv(notification[i].senderDisplayName,notification[i].content,notification[i].href,notification[i].senderAvatar)
                        $('#notificationAppend').append(divAppend);
                    }
                } else {
                    var divAppend = getEmptyNotificationDiv();
                    $('#notificationAppend').append(divAppend);
                }

            }
        })
    } else {
        $('#countNotifi').html("");
        $('#notificationAppend').empty();
        var url = '/notification/setview/' + userId;
        $.ajax({
            type: "POST",
            url: url,
            success: function (data) {
                if(data!='OK') {
                    console.log("Error");
                }
            }
        })
    }

})
})
$(document).on('click', function(e) {
    if($(e.currentTarget).attr('id')!='notifiDropdown') {
        if($('#notificationAppend').children().length > 0) {
            $('#countNotifi').html("");
            $('#notificationAppend').empty();
            var url = '/notification/setview/' + userId;
            $.ajax({
                type: "POST",
                url: url,
                success: function (data) {
                    if(data!='OK') {
                        console.log("Error");
                    }
                }
            })
    }
}
});