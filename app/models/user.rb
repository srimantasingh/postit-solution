class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_many :votes

	has_secure_password validations: false
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, on: :create, length: {minimum: 3}

	after_validation :generate_slug

	def generate_slug
		new_slug = to_slug(self.username)
		user = User.find_by slug: new_slug
		count = 2
		while user && user != self
			new_slug = append_suffix(new_slug, count)
			user = User.find_by slug: new_slug
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