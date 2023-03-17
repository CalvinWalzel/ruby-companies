class Badges::Stack < Bridgetown::Component
  def initialize(stack:)
    @site = Bridgetown::Current.site

    @id = stack
    @label, @klasses = stack_attributes
  end

  private

  def stack_attributes
    stacks_data = site.data.stacks[@id] || site.data.stacks["default"]

    label = stacks_data["label"] || titleize(@id)
    klasses = stacks_data["klasses"] || ""

    [label, klasses]
  end
end
