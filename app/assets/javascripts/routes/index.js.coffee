Blorgh.IndexRoute = Ember.Route.extend
  model: ->
    Blorgh.Post.findAll()
