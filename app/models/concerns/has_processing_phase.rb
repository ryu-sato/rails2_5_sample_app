module HasProcessingPhase
  extend ActiveSupport::Concern

  included do
    VALID_PHASES = %w(parsed_and_no_unused_values removed_flow_values)
    validates :phase, inclusion: { in: VALID_PHASES }

    scope :parsed_and_no_unused_values, -> {
      where(phase: :parsed_and_no_unused_values)
    }

    scope :removed_flow_values, -> {
      where(phase: :removed_flow_values)
    }

    def diff_set_of_parsed_and_no_unused_values
      parsed_and_no_unused_values&.first
    end

    def diff_set_of_removed_flow_values
      removed_flow_values&.first
    end
  end
end
