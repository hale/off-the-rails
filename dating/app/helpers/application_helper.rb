module ApplicationHelper

  def title
    base_title = "Off the Rails Dating App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end


end
