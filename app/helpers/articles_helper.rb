module ArticlesHelper
  def author_published_on(article)
    result = ""
    result += "By " + article.created_by + " on " if article.created_by     
    result += article.published_on if article.published_on
  end
  
end
