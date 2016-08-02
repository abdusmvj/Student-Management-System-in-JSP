function getCityList(element) {
	var state = element.options[element.selectedIndex].value;
	console.log(state);
	var ajax = new XMLHttpRequest();
	
	ajax.onreadystatechange = function() {
		if(ajax.readyState == 4 && ajax.status == 200) {
			populateCityList(JSON.parse(ajax.responseText));
		}
	};
	ajax.open("GET", "get_city_list.jsp?state="+state, true);
	ajax.send();
}

function populateCityList(json) {
	var citySelectElement = document.getElementById("city");
	citySelectElement.innerHTML = '<option value="">--select city--</option>';
	for(var i = 0; i < json.length; i++) {
		var option = document.createElement("option");
		var optionText = document.createTextNode(json[i].cityName);
		option.appendChild(optionText);
		option.value = json[i].cityId; 
		citySelectElement.appendChild(option);
	}
}