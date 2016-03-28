$ ->
  class MenuView extends Backbone.View

      showTimer: null
      hideTimer: null

      showDelay: 300
      hideDelay: 300

      currentItem: null

      initialize: ->
        @render()

      render: =>
        $.get "templates/menu.html", (data) =>
          template = _.template(data)
          $(@el).html template()
        , "html"

      show_list: (item) =>
        @showTimer = null
#        if @currentItem?
#          @hide_list @currentItem
#        @currentItem = item
        console.log "show list, showtimer = " + @showTimer
        $(item).find(".menu-list").show()




      hide_list: (item) ->
        @hideTimer = null
        console.log "hidelist"
        $(item).find(".menu-list").hide()


      startTimer: (callback, target, delay) ->
        setTimeout ->
          callback(target)
        , delay

      mouseEnter: (e) =>
        console.log "enter. showtimer = " + @showTimer + ", hideTimer = " + @hideTimer
        target = e.target
        if @hideTimer?
          clearTimeout @hideTimer
          @hideTimer = null
          return
        @showTimer = @startTimer @show_list, target, @showDelay


      mouseLeave: (e) =>
        console.log "leave. showtimer = " + @showTimer + ", hideTimer = " + @hideTimer
        target = e.target
        if @showTimer?
          clearTimeout @showTimer
          @showTimer = null
        else
          console.log "leave else"
          @hideTimer = @startTimer @hide_list, target, @hideDelay
          console.log "leave else" + @hideTimer



      events:
        'mouseenter .menu-item': 'mouseEnter'
        'mouseleave .menu-item': 'mouseLeave'


  menuView = new MenuView({el: "#menu"})


