class Vote < ActiveRecord::Base
	#belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
	belongs_to :user
	#belongs_to :comment
	#belongs_to :post
	belongs_to :voteable, polymorphic: true

	#validates_uniqueness_of :creator, scope: [:voteable_id, :voteable_type]
	validates_uniqueness_of :user, scope: :voteable #- this also works
end