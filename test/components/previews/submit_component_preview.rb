class SubmitComponentPreview < ViewComponent::Preview
  def default
    render(SubmitComponent.new)
  end
end
