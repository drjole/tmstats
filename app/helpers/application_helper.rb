module ApplicationHelper
  def icon(name)
    tag.i class: "bi bi-#{name}"
  end
end
