ActiveAdmin.register UnitCategory do
  menu parent: 'Units'

  permit_params :name, :min_quota, :max_quota, :max_duplicate
end
