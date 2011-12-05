atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @articles.each do |article|
    next if article.updated_at.blank?

    feed.entry(article) do |entry|
      entry.url articles_url(article)
      entry.title article.title
      entry.content article.content, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(article.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

    end
  end
end