class CardComponent < ViewComponent::Base
  def initialize(classes: [])
    @classes = classes.join(" ")
  end
end
