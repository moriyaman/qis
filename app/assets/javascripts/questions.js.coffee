# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  auto_comp_input_target = $('#category_name')
  auto_comp_add_target = $('.category_name_box')
  auto_comp_box = $('.category_name_box')

  auto_comp = new CategoryAutoComp(auto_comp_input_target, auto_comp_add_target)
  
  $('#category_name').keyup(->
    auto_comp_box.css('display', 'block')
    auto_comp.recommend()
  )

  $(document).on 'click', '.js-category_auto_comp', () ->
    $('#question_category_id').val $(this).attr('data-id')
    auto_comp_input_target.val $(this).text()
    auto_comp_box.css('display', 'none')

