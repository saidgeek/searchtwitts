
$('document').ready(function(){

	var value = getURLParameter('value');
		$('#btnTags .btn').removeClass('btn-inverse');
	if(value != 'null'){
		$('#btnTags #'+ value).addClass('btn-inverse');
	}else{
		$('#btnTags #todos').addClass('btn-inverse');
	}
	
});

function getURLParameter(name) {
    return decodeURI(
        (RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]
    );
}