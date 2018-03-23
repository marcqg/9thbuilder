class AddTimePaintList < ActiveRecord::Migration[5.0]
  def change

  	add_column :paint_paint_lists, :created_at, :datetime, default: nil, null: true
  	add_column :paint_paint_lists, :updated_at, :datetime, default: nil, null: true

  	Paint::PaintList.all.each do |list|
  		list.created_at = list.paint_list_units.map(&:created_at).min
  		list.updated_at = list.paint_list_units.map(&:updated_at).max

  		list.save!
  	end

  	Paint::PaintList.where(:created_at => nil).each do |list|
  		list.created_at = DateTime.now
  		list.save!
  	end
  	Paint::PaintList.where(:updated_at => nil).each do |list|
  		list.updated_at = DateTime.now
  		list.save!
  	end
  	
  	change_column :paint_paint_lists, :created_at, :datetime, default: nil, null: false
  	change_column :paint_paint_lists, :updated_at, :datetime, default: nil, null: false
  end
end
