class Faq < ActiveRecord::Base

	belongs_to :category
	include PgSearch
	pg_search_scope :faq_search, :against => :title


end
