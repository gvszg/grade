class Check < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  belongs_to :checkable, polymorphic: true

  validates_uniqueness_of :creator, scope: [:checkable_id, :checkable_type]
end