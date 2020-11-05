class Video < ApplicationRecord

  belongs_to :user, optional: true
  has_many :video_views, dependent: :destroy

  validates_presence_of :name, :url
  validates :url, format: URI::regexp(%w[http https])

end
