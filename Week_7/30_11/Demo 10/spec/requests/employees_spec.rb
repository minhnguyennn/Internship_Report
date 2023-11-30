require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let(:valid_attributes) { attributes_for(:employee) }
  let(:invalid_attributes) { attributes_for(:employee, employee_name: nil) }
  let(:employee) { create(:employee) }

  describe 'PATCH #update' do
    context 'with valid parameters' do
      before do
        patch :update, params: { id: employee.id, employee: valid_attributes }
        employee.reload
      end

      it 'updates the employee' do
        expect(employee.employee_name).to eq(valid_attributes[:employee_name])
      end

      it 'redirects to the employee show page' do
        expect(response).to redirect_to(employee_path(employee))
      end
    end

    context 'with invalid parameters' do
      before do
        patch :update, params: { id: employee.id, employee: invalid_attributes }
        employee.reload
      end

      it 'does not update the employee' do
        expect(employee.employee_name).not_to eq(invalid_attributes[:employee_name])
      end

      it 'renders the edit template' do
        expect(response).to have_http_status(:redirect)
        expect(response.body).to have_css("a[href='#{response.header['Location']}']")
        expect(response).to redirect_to(edit_employee_path(employee))
      end
    end
  end

  describe 'POST #destroy' do
    context 'with valid parameters' do
      before do
        post :destroy, params: { id: employee.id }
      end

      it 'returns a redirect response when destroying an employee' do
        expect(response).to have_http_status(:redirect)
      end

      it 'redirects to root path when destroying an employee' do
        expect(response).to redirect_to(root_path)
      end

      it 'sets a flash error when destroying an employee' do
        expect(flash[:errors]).to be_present
      end
    end

    context 'with invalid parameters' do
      # Add tests for invalid parameters if needed
    end
  end
end
