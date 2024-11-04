class ModalComponent < ViewComponent::Base
  renders_one :body
  renders_one :opener

  def initialize(id:)
    @id = id
  end
end
