
if (typeof NProgress != 'undefined') {
    $(document).on('page:fetch',   function() { NProgress.set(0.3); });
    $(document).on('page:change',  function() { NProgress.done(); });
    $(document).on('page:restore', function() { NProgress.remove(); });
}
$(document).ready(function(){
    $('body').on('click','.edit_review_button', function () {
    	var selector = $('#edit_review');
    	if(selector.is(':visible')){
    		selector.hide();
	  		selector.siblings('pre').show();
    	}else{
		  	selector.show();
		  	selector.siblings('pre').hide();
    	}
	})
    $('body').on('click','.edit_review_cancle', function () {
    	$('#edit_review').hide();
  		$('#edit_review').siblings('pre').show();
	})
    $('body').on('submit','form.edit_review', function () {
    	$('#edit_review button[type="submit"]').attr('disabled','disabled').html('<i class="fa fa-spinner fa-spin fa-fw"></i> Đang xử lý...');
	})
    $('body').on('submit','form.new_review', function () {
    	$('#review_submit').attr('disabled','disabled');
	})
	$('body').on('mouseenter','#check_in_book_delete',function(){
		$(this).html('<i class="glyphicon glyphicon-remove"></i> Chưa đọc')
	}).on('mouseleave','#check_in_book_delete',function(){
		$(this).html('<i class="glyphicon glyphicon-ok"></i> Đã đọc')
	})
	
    $('body').on('submit','#check_in_book_form', function () {
    	$(this).find('button').attr('disabled','disabled');
    	$(this).find('i.fa-spinner').show();
    })
    $.each($('textarea[data-autoresize]'), function() {
	    var offset = this.offsetHeight - this.clientHeight,
	    	height_default = this.offsetHeight;
	    var resizeTextarea = function(el) {
			if( !$.trim($(el).val()) ){
				
	    	console.log(!$.trim($(el).val()));
				$(el).css({'height': height_default});
				console.log($(el));
			}
	        $(el).css('height', el.scrollHeight + offset);
	    };
	    $(this).on('focusout',function(){ resizeTextarea(this); });
	    $(this).on('keyup input', function() { resizeTextarea(this); }).removeAttr('data-autoresize');
	});
	var books = new Bloodhound({
	  	datumTokenizer: Bloodhound.tokenizers.obj.whitespace('title'),
	  	queryTokenizer: Bloodhound.tokenizers.whitespace,
	  	remote: {
	    	url: '/book/autocomplete?query=%QUERY',
	    	wildcard: '%QUERY'
	  	}
	});

	$('#book_search').typeahead({
		  // hint: true,
		  highlight: true,
		  // minLength: 1,
		},
		{
		  name: 'books',
		  display: 'title',
		  source: books,
		  templates: {
		  	empty: [
		      '<div class="empty-message">',
		        'Không tìm thấy gợi ý nào',
		      '</div>'
		    ].join('\n'),
		    suggestion: Handlebars.compile('<a href="{{url}}"><div><img src="{{thumb_img}}" width="25" /><p>{{title}}</p></div></a>')
		  }
	});
});
