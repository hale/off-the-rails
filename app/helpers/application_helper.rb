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

  def logo
    image_tag("logo.png", :alt => "Coitus Cupid")
  end

  def error_messages_for(object)
    render(:partial => 'shared/error_messages', :locals => {:object => object})
  end

  # This safely handles leap years.
  def age(dob)
    return '' if dob.nil?
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  # bad code that was in the view, moved here to be refactored at some point. 
  # Should not rely on the model or user timeline. Gets the latest tweet for a user
  def tweet(user)
    # if the user doesn't have twitter, display a placeholder message
    return "Ask #{user.name} to set up twitter!" if user.twitter.blank?
    
    # fetch the latest tweet. TODO: caching
    begin
      Twitter.user_timeline(user.twitter).first.text 
    rescue Exception
      'Twitter is currently unavailable'
    end
  end

  # parses mardkwon formatted text into HTML
  def markdown(text)
    return '' if text.nil?
    
    options = [ :no_images => true,
                :filter_html => true,
                :safe_links_only => true,
                :hard_wrap => true
              ]

    renderer = Redcarpet::Render::HTML.new(*options)
    Redcarpet::Markdown.new( renderer, :no_intra_emphasis => true).render( text ).html_safe
  end

end
