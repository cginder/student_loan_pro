Rails.application.routes.draw do
  # Routes for the Salary resource:

  # CREATE
  get("/salaries/new", { :controller => "salaries", :action => "new_form" })
  post("/create_salary", { :controller => "salaries", :action => "create_row" })

  # READ
  get("/salaries", { :controller => "salaries", :action => "index" })
  get("/salaries/:id_to_display", { :controller => "salaries", :action => "show" })

  # UPDATE
  get("/salaries/:prefill_with_id/edit", { :controller => "salaries", :action => "edit_form" })
  post("/update_salary/:id_to_modify", { :controller => "salaries", :action => "update_row" })

  # DELETE
  get("/delete_salary/:id_to_remove", { :controller => "salaries", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
