class Track < ApplicationRecord


  belongs_to :album,
  foreign_key: :album_id,
  class_name: :Album

   has_one :band,
  through: :album,
  source: :band

  has_many :notes,
  foreign_key: :track_id,
  class_name: :Note

end