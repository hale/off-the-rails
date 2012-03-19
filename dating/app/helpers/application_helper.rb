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

end
