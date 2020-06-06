module ApplicationHelper

  def page_title
    title = 'Relief Animals Map'
    title = @page_title + " | " + title if @page_title
    title
  end
end

