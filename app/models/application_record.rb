# frozen_string_literal: true

# Application Record Model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_s
    "#{self.class}:#{id}"
  end
end
