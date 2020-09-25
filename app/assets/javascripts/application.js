// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

var slideNumber = 1
var allSlide = [1, 2, 3, 4]

setInterval(toggleSlide, 8000)

//スライドを切り替える
function toggleSlide() {
    slideNumber++

    if(slideNumber > 4) {
        slideNumber = 1
    }

    //対象のスライドを表示する
    $('.slide' + slideNumber).animate({opacity: 1}, 800)
    $('.slide-dots li:nth-of-type(' + slideNumber + ')').animate({opacity: 1}, 800)

    //他のスライドはopacity: 0にする
    for(var i = 1; i <= allSlide.length; i++) {
        if(i !== slideNumber) {
            $('.slide' + i).animate({opacity: 0}, 800)
            $('.slide-dots li:nth-of-type(' + i + ')').animate({opacity: 0.5}, 800)
        }
    }
}

$('.slide-dots li').on('click', function() {
  var index = $('.slide-dots li').index(this)

  slideNumber = index
  clearInterval()
  toggleSlide()
})

