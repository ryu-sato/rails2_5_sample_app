ActiveAdmin.register Ticket do
  permit_params do
    permitted = Ticket.attribute_names
  end
end
