DynamicSitemaps::Sitemap.draw do
  
  # default per_page is 50.000 which is the specified maximum.
  # per_page 10

  url root_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  
  new_page!
  
  Article.all.each do |article|
    url article_url(article), :last_mod => article.updated_at, :change_freq => 'monthly', :priority => 0.8
  end

  new_page!
  
  autogenerate  :articles,
                :last_mod => :updated_at,
                :change_freq => 'weekly',
                :priority => 0.8
                  
end