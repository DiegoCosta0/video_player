class VideoView < ApplicationRecord

  belongs_to :video, optional: true

  def self.increment()
    self.first_or_create
    self.first.increment!(:views)
  end

end
