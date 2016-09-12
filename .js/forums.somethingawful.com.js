//hides user avatars
$('dd.title').css({'opacity':'0'});
$('dd.title').hover(function() {
	$(this).css({'opacity':'100'})
}, function() {
	$(this).css({'opacity':'0'})
});

//compiles a list of keys for all the youtube videos posted on a page
jQuery(document).ready(function($){
	var url_array = $(".youtube-player").map(function() {
		return youtube_parser($(this).attr("src"));
	})
	url_array = $.unique(url_array)

	var ytdl_query = ""
	url_array.each(function(i, val) {
		if (val)
			ytdl_query = ytdl_query + val + " "
	})

	console.log(ytdl_query)
});

function youtube_parser(url){
    var match = url.match(/^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/);
    return (match&&match[7].length==11)?match[7]:false;
}