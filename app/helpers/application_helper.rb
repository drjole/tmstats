module ApplicationHelper
  def icon(name)
    tag.i class: "bi bi-#{name}"
  end

  def sort_link(text, column)
    same_column = (params[:sort] == column.to_s)
    text = "#{text} #{icon((params[:dir] == "asc") ? "arrow-up" : "arrow-down")}" if same_column
    dir = (same_column && params[:dir] == "desc") ? "asc" : "desc"
    link_to text.html_safe, url_for(params.permit(:sort, :dir).merge(sort: column, dir: dir))
  end
end
