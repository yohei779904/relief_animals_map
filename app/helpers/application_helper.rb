module ApplicationHelper

  def document_title
    if @title.present?
      '#@title - Relief_animals_map'
    else
      'Relief_animals_map'
    end
  end
end

