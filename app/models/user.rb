class User < ActiveRecord::Base
  
  has_many(:ratings,
    class_name: 'Rating',
    foreign_key: 'submitter_id'
  )
end
