module ApplicationHelper
  include TweetButton

  def is_active?(page_name)
    # logger.info("Page name #{page_name}")
    # logger.info("Controller name #{params[:controller]}")
    servlet = params[:controller]
    if page_name == "users/edit" && servlet == "registrations"
      "current"
    elsif servlet == page_name
      "current" 
    elsif page_name == "admin/edit" && servlet == "devise/registrations"
      "current"
    elsif page_name == "submissions" && servlet == "submissions"
      "current"
    end
  end

  def left_arrow(text)
    raw("&larr; #{text}")
  end

  def related_articles(tag_list)
    result = ''
    tag_list.each_with_index do |tag, index|
      records = Article.related(tag)
      if records.size > 1
        result += link_to(tag, related_article_path(CGI::escape(tag))) 
      else
        result += tag
      end
      result += ", " unless (index+1 == tag_list.size)        
    end
    result[0..-1]
  end

  def facebook_like
    content_tag :iframe, nil, :src => "http://www.facebook.com/plugins/like.php?href=#{CGI::escape(request.url)}&amp;send=false&amp;layout=standard&amp;width=450&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=35&amp;appId=199420523464691", :scrolling => 'no', :frameborder => '0', :allowtransparency => true, :id => :facebook_like
  end
end