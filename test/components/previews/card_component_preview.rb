class CardComponentPreview < ViewComponent::Preview
  def default
    render(CardComponent.new) do
      tag.span "Hello", class: "text-white"
    end
  end
end
