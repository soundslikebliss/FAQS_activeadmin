class AddIdToFaq < ActiveRecord::Migration
  def change
  	add_column :faqs, :category_id, :integer
  end
end
