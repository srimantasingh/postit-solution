class Post < ActiveRecord::Base
	belongs_to :user
	#belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
	has_many :comments
	has_many :post_categories
	has_many :categories, :through => :post_categories
	has_many :votes, as: :voteable

	validates :title, presence: true, length: {minimum: 5}
	validates :url, presence: true
	validates :description, presence: true

	after_validation :generate_slug
	
	def total_votes
		self.up_votes - self.down_votes
	end

	def up_votes
		self.votes.where(vote: true).size 
	end

	def down_votes
		self.votes.where(vote: false).size
	end

	def generate_slug
		new_slug = to_slug(self.title)
		post = Post.find_by slug: new_slug
		count = 2
		while post && post != self
			new_slug = append_suffix(new_slug, count)
			post = Post.find_by slug: new_slug
			count += 1
		end
		self.slug = new_slug.downcase
	end

	def append_suffix(new_slug, count)
		if new_slug.split('-').last.to_i != 0
			return new_slug.split('-').slice(0...-1).join('-') + "-" + count.to_s
		else
			return new_slug + "-" + count.to_s
		end
	end

	def to_slug(name)
		str = name.strip
		str.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
		str.gsub! /-+/, "-"
		str.downcase
	end

	def to_param
		self.slug
	end


end