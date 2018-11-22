class SalariesController < ApplicationController
  def index
    @q = Salary.ransack(params[:q])
    @salaries = @q.result(:distinct => true).page(params[:page]).per(10)

    render("salary_templates/index.html.erb")
  end

  def show
    @salary = Salary.find(params.fetch("id_to_display"))

    render("salary_templates/show.html.erb")
  end

  def new_form
    @salary = Salary.new

    render("salary_templates/new_form.html.erb")
  end

  def create_row
    @salary = Salary.new

    @salary.monthly_wage = params.fetch("monthly_wage")
    @salary.monthly_benefits = params.fetch("monthly_benefits")
    @salary.month_id = params.fetch("month_id")

    if @salary.valid?
      @salary.save

      redirect_back(:fallback_location => "/salaries", :notice => "Salary created successfully.")
    else
      render("salary_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @salary = Salary.find(params.fetch("prefill_with_id"))

    render("salary_templates/edit_form.html.erb")
  end

  def update_row
    @salary = Salary.find(params.fetch("id_to_modify"))

    @salary.monthly_wage = params.fetch("monthly_wage")
    @salary.monthly_benefits = params.fetch("monthly_benefits")
    @salary.month_id = params.fetch("month_id")

    if @salary.valid?
      @salary.save

      redirect_to("/salaries/#{@salary.id}", :notice => "Salary updated successfully.")
    else
      render("salary_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @salary = Salary.find(params.fetch("id_to_remove"))

    @salary.destroy

    redirect_to("/salaries", :notice => "Salary deleted successfully.")
  end
end
