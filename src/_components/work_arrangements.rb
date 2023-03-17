class WorkArrangements < Bridgetown::Component
  def initialize(work_arrangements:)
    @site = Bridgetown::Current.site

    @work_arrangements = work_arrangements.map do |work_arrangement|
      site.data.work_arrangements[work_arrangement]
    end
  end
end
