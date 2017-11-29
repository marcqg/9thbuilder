json.extract! @magic, :id, :name, :medium_logo_url
json.version do
	json.extract! @magic.version, :id, :name
end 