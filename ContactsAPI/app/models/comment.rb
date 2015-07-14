class Comment < ActiveRecord::Base
 validates :body, presence: true
 validate :commentable_exists

 belongs_to :commentable, polymorphic: true

 def commentable_exists
   commentable_class = commentable_type.classify.constantize
   unless commentable_class.exists?(commentable_id)
     errors[:base] << "#{commentable_class} with id #{commentable_id} not found"
   end
 end
end
