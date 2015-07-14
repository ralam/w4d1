class Contact < ActiveRecord::Base
  validates :name, :email, :owner, presence: true
  validates_uniqueness_of :email, scope: :user_id

  belongs_to(
    :owner,
    class_name: "User",
    primary_key: :id,
    foreign_key: :user_id
  )

  has_many(
    :contact_shares,
    class_name: 'ContactShare',
    foreign_key: :contact_id,
    primary_key: :id
  )

  has_many :comments, as: :commentable

  has_many :shared_users, through: :contact_shares, source: :user
end
