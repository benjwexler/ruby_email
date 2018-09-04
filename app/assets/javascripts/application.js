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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require jquery
//= require jquery_ujs

function loadSearch(){
    $(document).ready(function() {
        $('#example').DataTable();
    } );
}

// $(document).ready(function() {
//     $('#example').DataTable();
// } );

$( document ).on('turbolinks:load', function() {
    console.log("It works on each visit!");
    loadSearch()
  })

//   $(document).on('page:load', function(){

//     $(document).on('click', 'allStudents', function() {

//         console.log("modal Restarted");
  
//       $('#myModal').modal();
  
//     });
  
//   });

// let allStudents = document.getElementById("allStudents")

// allStudents.addEventListener("click", loadSearch())



// var ready;
// ready = function() {

//     $('#example').DataTable();

// };

// $(document).ready(ready);
// $(document).on('page:load', ready);
