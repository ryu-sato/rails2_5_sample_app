ActiveAdmin.register RawLog do
  permit_params do
    permitted = RawLog.attribute_names
  end
end
