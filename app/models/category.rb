class Category < ActiveRecord::Base
	has_many :post_categories
	has_many :posts, :through => :post_categories

	validates :name, presence: true
	after_validation :generate_slug

	def to_param
		self.slug
	end

	def generate_slug
		new_slug = to_slug(self.name)
		category = Category.find_by slug: new_slug
		count = 2
		while category && category != self
			new_slug = append_suffix(new_slug, count)
			category = Post.find_by slug: new_slug
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
end