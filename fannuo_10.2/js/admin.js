//后台js
$(function(){
	$('#left').waypoint({
		handler: function(direction) {
			if (direction == 'down') {
				$(this.element).addClass('leftfixed');
			} else {
				$(this.element).removeClass('leftfixed');
			}
		}
	});
});
function check_all(obj, cName) {
	var checkboxs = document.getElementsByName(cName);
	for (var i = 0; i < checkboxs.length; i++) {
		checkboxs[i].checked = obj.checked;
	}
}
