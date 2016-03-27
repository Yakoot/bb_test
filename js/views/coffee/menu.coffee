$ ->
  class MenuView extends Backbone.View
      el: $ "#menu"
      timer: null
      currentItem: null

      initialize: ->
        @render()

      render: =>
        $.get "templates/menu.html", (data) =>
          template = _.template(data)
          $(@el).html template()
        , "html"

      show_list: (item) =>
        $(item).find(".menu-list").show()
        @hide_list @currentItem if @currentItem?
        @currentItem = item

      hide_list: (item) ->
        $(item).find(".menu-list").hide()
        @currentItem = null

      startTimer: (callback, target) ->
        clearTimeout @timer if @timer?
        @timer = setTimeout ->
          callback(target)
        , 500

      mouseEnter: (e) ->
        target = e.target

        @startTimer @show_list, target

      mouseLeave: (e) ->
        target = e.target

        @startTimer @hide_list, target

      events:
        'mouseenter .menu-item': 'mouseEnter'
        'mouseleave .menu-item': 'mouseLeave'


  menuView = new MenuView


