class Album < ApplicationRecord
validates :title, presence: true
validates :band_id, presence: true

belongs_to :band,
foreign_key: :band_id,
class_name: :Band

has_many :tracks,
foreign_key: :album_id,
class_name: :Track


end