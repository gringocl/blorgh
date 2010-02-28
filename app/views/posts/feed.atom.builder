atom_feed do |feed|
  feed.title("A Blorgh")
  feed.updated(@posts.first.created_at)

  for post in @posts
    feed.entry(post) do |entry|
      entry.title(post.title)
      entry.content(post.text, :type => 'html')

      entry.author do |author|
        author.name(post.user.to_s)
      end
    end
  end
end
