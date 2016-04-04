class SliderView extends Backbone.View

  @container: $(".slider-container")

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

  moveLeft: ->
    @container
      .css 'left': -@slideWidth
      .find(".slider-item:last")
      .prependTo(@container)
      .parent()
      .animate {'left': 0}, 500

  moveRight: ->
    @container.animate {left: -@slideWidth}, 500, () =>
      @container.find(".slider-item:first")
        .appendTo(@container)
        .parent()
        .css 'left': 0

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


    
