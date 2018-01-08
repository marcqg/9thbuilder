json.extract! ninth_age_magic_item, :id, :name, :description, :magic_item_category_id, :army_id, :value_points, :override_id, :is_multiple, :type_figurine, :type_target, :type_duration, :max, :is_dominant
json.version do
	json.extract! ninth_age_magic_item.version, :id, :name
end 
