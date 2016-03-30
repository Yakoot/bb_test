class PanelView extends Backbone.View

  showTimer: null
  hideTimer: null

  showDelay: 500
  hideDelay: 500

  currentItem: null

  initialize: () ->
    @collection = new Panel
    @render()

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

  render: ->
    @collection.fetch
      data:
        type: 'menu'
      success: (data) =>
        data.each (item) =>
          @renderItem(item)
        , @


  renderItem: (item) ->
    itemView = new ItemView
      model: item
    $(@el).append itemView.render().el


class ItemView extends Backbone.View
  tagName: 'div'
  className: 'menu-item'
  template: _.template '<span><%= name %></span><div class="menu-list">' +
    '<% if (typeof(values) !== "undefined") { %>' +
    '<% _.each(values, function(value) { %>' +
    '<div class="menu-list-item"><%= value %></div>' +
    '<% }); %>' +
    '<% } %></div>'


  render: ->
    $(@el).html @template @model.toJSON()
    @



