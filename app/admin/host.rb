ActiveAdmin.register Host do
  permit_params do
    permitted = Host.attribute_names
  end
end
