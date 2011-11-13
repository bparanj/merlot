desc "Give the cached slug for a given article title"
task :slug => :environment do
  article = Article.find_by_title(ENV['title'])
  puts article.cached_slug
  system "open 'http://localhost:3000/articles/best-credit-card-worth-the-annual-fee'"
end