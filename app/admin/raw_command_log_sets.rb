ActiveAdmin.register RawCommandLogSet do
  permit_params do
    permitted = RawCommandLogSet.attribute_names
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :hostname
      f.input :is_normal, as: :hidden, input_html: { value: true }
      f.input :raw_log, as: :file
    end
    f.actions
  end
end
