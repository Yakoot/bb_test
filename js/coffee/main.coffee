$ ->
  class MenuView extends Backbone.View

    el: $ "#menu"

    initialize: =>
      _.bindAll @, "render"
      @render()

    render: ->
      $(@el).append '<span>test</span>'

  menu_view = new MenuView