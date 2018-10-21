ActiveAdmin.register NormalLogRaw do
  permit_params do
    permitted = NormalLogRaw.attribute_names
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :hostname
      f.input :raw_log, as: :file
    end
    f.actions
  end
end
