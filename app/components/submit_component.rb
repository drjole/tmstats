class SubmitComponent < ViewComponent::Base
  def initialize(form, text: nil)
    @form = form
    @text = text
  end
end
