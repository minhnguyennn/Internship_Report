# employees_controller_spec.rb
require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let(:valid_attributes) { attributes_for(:employee) }
  let(:invalid_attributes) { attributes_for(:employee, employee_name: nil) }

  describe 'PATCH #update' do
    let(:employee) { create(:employee) }

    context 'with valid parameters' do
      it 'updates the employee' do
        patch :update, params: { id: employee.id, employee: valid_attributes }
        employee.reload

        expect(employee.employee_name).to eq(valid_attributes[:employee_name])
      end

      it 'redirects to the employee show page' do
        patch :update, params: { id: employee.id, employee: valid_attributes }
        expect(response).to redirect_to(employee_path(employee))
      end
    end

    context 'with invalid parameters' do
      it 'does not update the employee' do
        patch :update, params: { id: employee.id, employee: invalid_attributes }
        employee.reload

        expect(employee.employee_name).to (invalid_attributes[:employee_name])
      end

      it 'renders the edit template' do
        patch :update, params: { id: employee.id, employee: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end
end
