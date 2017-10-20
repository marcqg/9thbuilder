json.extract! @magic, :id, :name, :medium_logo_url, :version
json.spells do
	json.array! @spells, partial: 'ninth_age/magic_spells/magic_spell', as: :magic_spell
end 