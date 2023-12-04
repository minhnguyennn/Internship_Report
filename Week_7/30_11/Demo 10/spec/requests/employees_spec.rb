require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let(:valid_attributes) { attributes_for(:employee) }
  let(:invalid_attributes) { attributes_for(:employee, employee_name: nil) }
  let(:employee) { create(:employee) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @employees with all employees' do
      employees = create_list(:employee, 2)
      get :index
      expect(assigns(:employees)).to match_array(employees)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: employee.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get :show, params: { id: employee.id }
      expect(response).to render_template(:show)
    end

    it 'assigns the requested employee as @employee' do
      get :show, params: { id: employee.id }
      expect(assigns(:employee)).to eq(employee)
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      get :edit, params: { id: employee.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      get :edit, params: { id:employee.id }
      expect(response).to render_template(:edit)
    end

    it 'assigns the requestedemployee as employee' do
      get :edit, params: { id:employee.id }
      expect(assigns(:employee)).to eq(employee)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      before do
        post :create, params: { employee: FactoryBot.attributes_for(:employee) }
      end

      it 'creates a new employee' do
        expect {
          post :create, params: { employee: FactoryBot.attributes_for(:employee) }
        }.to change(Employee, :count).by(1)
      end

      it 'redirects to the created employee' do
        expect(response).to redirect_to(employees_path)
      end

      it 'sets flash message for successful creation' do
        expect(flash[:errors]).to eq('Employee Created Successfully')
      end
    end

    context 'with invalid parameters' do
      before do
        post :create, params: { employee: { employee_name: nil } }
      end

      it 'does not create a new employee' do
        expect {
          post :create, params: { employee: { employee_name: nil } }
        }.to_not change(Employee, :count)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'sets flash message with errors' do
        expect(flash[:errors]).to be_present
      end
    end
  end

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

    
  end
end
