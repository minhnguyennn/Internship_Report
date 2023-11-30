# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :set_employee_params, only: %i[show edit update destroy]

  def index
    # @employees = Employee.all

    # @pagy, @employees = pagy(Employee.all)

    # Test trang bị tràn
    # page_out_of_bounds = 20
    # @pagy, @employees = pagy(Employee.all, items: 10, page: page_out_of_bounds)

    @q = Employee.ransack(search_params)

    employees = @q.result(distinct: true)

    @pagy, @employees = pagy(employees)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)

    if @employee.valid?
      # EmployeeMailer.with(employee: @employee).welcome_email.deliver_later
      flash[:errors] = 'Employee Created Successfully'
      redirect_to employees_path
    else
      flash[:errors] = @employee.errors.full_messages
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @employee.update(employee_params)
      flash[:errors] = 'Employee Updated Successfully'
      redirect_to employee_path(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path
    end
  end

  def destroy
    if @employee.delete
      flash[:errors] = 'Employee Deleted Successfully'
      redirect_to root_path(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to destroy_employee_path
    end
  end

  private

  def set_employee_params
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:employee_name, :gender, :avatar, :email, { hobbies: [] },
                                     addresses_attributes: %i[id house_number society_name area city _destroy])
  end

  def search_params
    params.fetch(:query, {}).permit(:employee_name_cont, :s, :created_at_gt, :created_at_lt,
                                    :employee_name_or_hobbies_cont)
  end
end