class SliderView extends Backbone.View

  @timer: null

  template: _.template """
    <div class="slider-wrapper">
      <div class="slider navigate left"></div>
      <div class="slider middle">
        <div class="slider-container"></div>
      </div>
      <div class="slider navigate right"></div>
    </div>
  """

  initialize: () ->
    @collection = new Slider
    @render()
    @container = $(".slider-container")
    @slideWidth = @container.parent().outerWidth() / 2
    @go()

  moveLeft: ->
    if not @container.is(':animated')
      if @timer?
        clearTimeout @timer
        @timer = null
      @container
        .css 'left': -@slideWidth
        .find(".slider-item:last")
        .prependTo(@container)
        .parent()
        .animate {'left': 0}, 1000
      @go()

  moveRight: =>
    if not @container.is(':animated')
      if @timer?
        clearTimeout @timer
        @timer = null
      @container.animate {left: -@slideWidth}, 1000, () =>
        @container.find(".slider-item:first")
          .appendTo(@container)
          .parent()
          .css 'left': 0
      @go()

  go: ->
    @timer = setInterval @moveRight, 5000


  render: ->
    $(@el).html @template
    @collection.fetch
      data:
        type: 'slider'
      success: (data) =>
        data.each (item) =>
          @renderItem(item)
        , @

  renderItem: (item) ->
    sliderItemView = new SliderItemView
      model: item
    @container.append sliderItemView.render().el

  events:
    "click .right" : "moveRight"
    "click .left" : "moveLeft"



class SliderItemView extends Backbone.View

  tagName: 'div'
  className: 'slider-item'
  template: _.template """
    <img src="images/<%= img %>">
  """


  render: ->
    $(@el).html @template @model.toJSON()
    @


    
