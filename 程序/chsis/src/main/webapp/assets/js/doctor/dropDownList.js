$(document).ready(function(){
    //下拉菜单
    $.getJSON('assets/json/title.json',function(data){
        for(var i in data) {
            $('#title').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        }
    });
    $.getJSON('assets/json/diploma.json',function(data){
        for(var i in data) {
            $('#diploma').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        }
    });
});
