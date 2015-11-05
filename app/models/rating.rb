class Rating < ActiveRecord::Base

  belongs_to(:submitter,
    class_name: 'User',
    foreign_key: :submitter_id
  )
end
