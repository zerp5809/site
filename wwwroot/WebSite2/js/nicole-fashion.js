!function ($) {
$(function(){
  // Fix for dropdowns on mobile devices for bootstrap bug https://github.com/twitter/bootstrap/issues/4550
  $('body').on('touchstart.dropdown', '.dropdown-menu', function (e) { 
	  e.stopPropagation(); 
  });
  $(document).on('click','.dropdown-menu a',function(){
	  document.location = $(this).attr('href');
  });
})
}(window.jQuery)
