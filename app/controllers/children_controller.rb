class ChildrenController < ApplicationController
  def index
    @children = Child.all

    render("child_templates/index.html.erb")
  end

  def show
    @child = Child.find(params.fetch("id_to_display"))

    render("child_templates/show.html.erb")
  end

  def new_form
    @child = Child.new

    render("child_templates/new_form.html.erb")
  end

  def create_row
    @child = Child.new

    @child.children_id = params.fetch("children_id")
    @child.children_date = params.fetch("children_date")

    if @child.valid?
      @child.save

      redirect_back(:fallback_location => "/children", :notice => "Child created successfully.")
    else
      render("child_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @child = Child.find(params.fetch("prefill_with_id"))

    render("child_templates/edit_form.html.erb")
  end

  def update_row
    @child = Child.find(params.fetch("id_to_modify"))

    @child.children_id = params.fetch("children_id")
    @child.children_date = params.fetch("children_date")

    if @child.valid?
      @child.save

      redirect_to("/children/#{@child.id}", :notice => "Child updated successfully.")
    else
      render("child_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @child = Child.find(params.fetch("id_to_remove"))

    @child.destroy

    redirect_to("/children", :notice => "Child deleted successfully.")
  end
end
