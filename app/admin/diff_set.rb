ActiveAdmin.register DiffSet do
  permit_params do
    permitted = DiffSet.attribute_names
  end
end
