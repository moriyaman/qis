class @CategoryAutoComp 
  constructor: (@input_target, @add_target) ->
 
  recommend: (success_func, error_func) ->
    _add_target = @add_target
    $.ajax
      url: "/apis/category_auto_comp"
      method: "GET"
      data: { text: @input_target.val() }
      success: (data ,status) ->
        _add_target.html ''
        _add_target.append data 
      error: (data ,status) ->
        console.log 'エラーが発生しました'
