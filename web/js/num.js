
$("#add").click(function() {
var num = parseInt($("#num").val()) || 0;
$("#num").val(num + 1);
});

$("#sub").click(function() {
var num = parseInt($("#num").val()) || 0;
num = num - 1;
num = num < 1 ? 1 : num;
$("#num").val(num);
});