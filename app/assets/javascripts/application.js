// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_nested_form
//= require_self

import 'babel-polyfill';
import 'bootstrap-sass';
import 'bootstrap-datepicker';
import 'jquery-drawer';
import 'jquery-ujs';


import $ from 'jquery';

import './posts';
import './static_pages';

(function(){

  // datepicker
  var today = new Date;
  today.setYear(today.getFullYear() - 1);
  var last_year = today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();

  $('.datepicker_today').datepicker({format:'yyyy-mm-dd'}).datepicker('setDate','today');
  $('.datepicker_last_year').datepicker({format:'yyyy-mm-dd'}).datepicker('setDate', last_year);
  $('.datepicker').datepicker({format:'yyyy-mm-dd'});
  
  // drawer
  $('.drawer').drawer();

})(jQuery);

(function(){
  $('#search_body')
    .on('show.bs.collapse', function() { //< 折り畳み開く処理
      $('a[href="#' + this.id + '"]').find('i.fa-angle-down')
        .removeClass('fa-angle-down').addClass('fa-angle-up');
    })
    .on('hide.bs.collapse', function() { //< 折り畳み閉じる処理
      $('a[href="#' + this.id + '"]').find('i.fa-angle-up')
        .removeClass('fa-angle-up').addClass('fa-angle-down');
    });
  $('#sidebar').hover(
    function(e){
      $(this).attr('class', 'expand');
      $('.sidebar-list-item-test span').css('diplay', 'inline-block');
    },
    function(e){
      $(this).attr('class', '');
    }
  );
})(jQuery);
