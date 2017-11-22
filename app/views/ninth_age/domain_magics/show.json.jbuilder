json.extract! @magic, :id, :name, :medium_logo_url, :version
json.spells do
	json.array! @spells, partial: 'ninth_age/domain_magic_spells/domain_magic_spell', as: :magic_spell
end 