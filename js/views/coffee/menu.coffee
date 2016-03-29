class PanelView extends Backbone.View

    el: "#menu"
    showTimer: null
    hideTimer: null

    showDelay: 500
    hideDelay: 500

    currentItem: null

    initialize: (data) ->
      console.log data
      @collection = new Panel data
      console.log @collection
      @render()

    render: ->
      @collection.each (item) ->
        console.log item
        @renderItem(item)
      , @


    renderItem: (item) ->
      itemView = new ItemView item
      $(@el).append itemView.render().el

    show_list: (item) =>
      @showTimer = null

      if @currentItem?
        @hide_list @currentItem
      $(item).find(".menu-list").show()
      @currentItem = item

    hide_list: (item) =>
      @hideTimer = null
      $(item).find(".menu-list").hide()
      @currentItem = null


    startTimer: (callback, target, delay) ->
      setTimeout ->
        callback(target)
      , delay

    mouseEnter: (e) ->
      target = e.currentTarget
      if @hideTimer? and @currentItem == target
        clearTimeout @hideTimer
        @hideTimer = null
      else
        @showTimer = @startTimer @show_list, target, @showDelay

    mouseLeave: (e) ->
      target = e.currentTarget
      if @showTimer?
        clearTimeout @showTimer
        @showTimer = null
      else
        @hideTimer = @startTimer @hide_list, target, @hideDelay

    events:
      'mouseenter .menu-item': 'mouseEnter'
      'mouseleave .menu-item': 'mouseLeave'


class ItemView extends Backbone.View
  tagName: 'div'
  className: 'menu-item'
  template: _.template '<div class="menu-list"></div>'
  render: ->
    $(@el).html @template()
    @



