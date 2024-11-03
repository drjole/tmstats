module ChartHelper
  def line_chart(...)
    chart(:line, ...)
  end

  def time_line_chart(data, html_options = {})
    html_options.deep_merge!(
      option: {
        xAxis: {
          type: :time
        }
      }
    )
    chart(:line, data, html_options)
  end

  private

  def chart(type, data, html_options = {})
    html_options.reverse_merge!(
      data: {
        controller: "chart",
        action: "resize@window->chart#resize",
        "chart-type-value": type,
        "chart-data-value": data
      }
    )

    if html_options[:option].present?
      html_options[:data]["chart-chart-option-value"] = html_options.delete(:option).to_json
    end

    if html_options[:series].present?
      html_options[:data]["chart-series-option-value"] = html_options.delete(:series).to_json
    end

    if html_options[:timeFormat].present?
      html_options[:data]["chart-time-format-value"] = html_options.delete(:timeFormat)
    end

    content_tag(:div, "", html_options)
  end
end
