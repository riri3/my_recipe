//任意のタブにURLからリンクするための設定
function GethashID (hashIDName){
	if(hashIDName){
		//タブ設定
		$('.tab li').find('a').each(function() { 
			var idName = $(this).attr('href');
			if(idName == hashIDName){ 
				var parentElm = $(this).parent(); 
				$('.tab li').removeClass("active"); 
				$(parentElm).addClass("active"); 
				//表示させるエリア設定
				$(".area").removeClass("is-active"); 
				$(hashIDName).addClass("is-active"); 
			}
		});
	}
}


$('.tab a').on('click', function() {
	var idName = $(this).attr('href'); 
	GethashID (idName);
	return false;
});


// ページが読み込まれたら上記の動きをすぐに実施する
$(window).on('load', function () {
    $('.tab li:first-of-type').addClass("active");
    $('.area:first-of-type').addClass("is-active"); 
	var hashName = location.hash; 
	GethashID (hashName);
});