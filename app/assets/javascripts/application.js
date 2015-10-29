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
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require chosen_v1.4.2/chosen.jquery.min
//= require bootstrap-datepicker
//= require jQuery-Mask-Plugin-1.13.4/dist/jquery.mask.js
//= require_self

(function(){
   $(document).on("page:change", function(){
       $("select").chosen();

       $('input.time').mask('00:00');

       $("input.checkbox-week").click(function(){
               if ($(this).is(":checked")){
                   $(this).next("div.checkbox-week").show(800);
               } else {
                   $(this).next("div.checkbox-week").hide(800);
               }
       });
   });
})();
