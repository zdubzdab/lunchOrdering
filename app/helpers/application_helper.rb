module ApplicationHelper

  # def after_sign_in_path_for(resource)
  #   current_user.role == "admin" ? days_path : user_root_path
  # end

  # def after_sign_out_path_for(resource_or_scope)
  #   root_path
  # end

  def price_to_dolar (price)
    sprintf("$%0.02f", price)
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

end
