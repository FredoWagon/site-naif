$(document).ready(function(){
  // menu click event
  $('.menuBtn').click(function() {
    $(this).toggleClass('act');
      if($(this).hasClass('act')) {
        $('.mainMenu').addClass('act');
      }
      else {
        $('.mainMenu').removeClass('act');
      }
  });
});


document.addEventListener("turbolinks:load", function() {
  console.log("turbolinks");
  const menubb = document.querySelector('.menuBtn');
  menubb.classList.remove("act");
});
