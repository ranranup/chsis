$(document).ready(function(){
    $.getJSON('assets/json/nation.json',function(data){
        for(var i in data) {
            $('#nation').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        }
    });
    $.getJSON('assets/json/period.json',function(data){
        for(var i in data) {
            $('#period').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        }
    });
    $.getJSON('assets/json/marriage.json',function(data){
        for(var i in data) {
            $('#marriage').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        }
    });
     $.getJSON('assets/json/diseaseHistory.json',function(data){
        for(var i in data) {
            $('#diseaseHistory').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        }
    });
});
