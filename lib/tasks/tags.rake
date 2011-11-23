desc "Generate a list of links for all articles related to a given tag"
task :tag_it => :environment do
 tags = Article.find_by_sql("select name from tags;")
 tags.each do |tag|
   articles = Article.related(CGI.unescape(tag.name))
   if articles.blank?
     
   else
      p "http://www.creditcardslogic.com/related/#{CGI.escape(tag.name)}"  
   end
 end
end