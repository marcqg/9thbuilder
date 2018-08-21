json.query "Unit"
json.suggestions do
    json.array! @users, partial: 'tournament/searchs/user', as: :user
end