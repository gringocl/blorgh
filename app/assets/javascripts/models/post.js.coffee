Blorgh.Post = Ember.Object.extend({})

Blorgh.Post.reopenClass
  findAll: ->
    posts = Em.A()
    $.getJSON('/posts').then (data) ->
      $.each data.posts, (post) ->
        posts.pushObject(data)
    posts
