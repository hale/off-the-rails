module ApplicationHelper

  def title
    base_title = "Coitus Cupid"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def banner
    image_tag("banner.png", :alt => "Coitus Cupid")
  end

  def error_messages_for(object)
    render(:partial => 'shared/error_messages', :locals => {:object => object})
  end
end
