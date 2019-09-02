module Sluggable

	extend ActiveSupport::Concern

	included do
		after_validation :generate_slug
		class_attribute :slug_column 
	end

	def generate_slug
		new_slug = to_slug(self.send(self.class.slug_column.to_sym))
		obj = self.class.find_by slug: new_slug
		count = 2
		while obj && obj != self
			new_slug = append_suffix(new_slug, count)
			obj = self.class.find_by slug: new_slug
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

	module ClassMethods
		def sluggable_column(column_name)
			self.slug_column = column_name
		end
	end

end