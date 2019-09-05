class Note < ApplicationRecord

  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :track,
  foreign_key: :track_id,
  class_name: :Track

end