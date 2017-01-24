require 'test_helper'

class ProgramsControllerTest < ActionController::TestCase
  setup do
    @program = programs(:one)
    @program.name = "test"
    @program.description = "description"
    @program.date = Date.today
  end

  test "should get index" do
    programs = Program.all

    get :index
    assert_response :success
    assert_not_nil assigns(:programs)
  end

  test "should get new" do
    @program = Program.create
    session[:program_id] = @program.id
    @program.name = "test"
    @program.description = "description"
    @program.date = Date.today

    @program.save!

    get :new    
    assert_response :success
  end

  test "should create program" do
    @program = Program.create
    session[:program_id] = @program.id
    @program.name = "test"
    @program.description = "description"
    @program.date = Date.today

    @program.save!

    assert_difference('Program.count') do
      post :create, program: { attended_new: @program.attended_new, attended_residents: @program.attended_residents, attended_total: @program.attended_total, date: @program.date, description: @program.description, name: @program.name, partnership: @program.partnership, program_type_id: @program.program_type_id, name: @program.name, description: @program.description, date: @program.date }
    end

    assert_redirected_to program_path(assigns(:program))
  end

  # test "should show program" do
  #   get :show, id: @program
  #   assert_response :success
  # end

  test "should get edit" do
    @program = Program.create
    session[:program_id] = @program.id
    @program.name = "test"
    @program.description = "description"
    @program.date = Date.today

    @program.save!

    get :edit, id: @program
    assert_response :success
  end

  test "should update program" do
    put :update, id: @program, program: { attended_new: @program.attended_new, attended_residents: @program.attended_residents, attended_total: @program.attended_total, date: @program.date, description: @program.description, name: @program.name, partnership: @program.partnership, program_type_id: @program.program_type_id }
    assert_redirected_to program_path(assigns(:program))
  end

  test "should destroy program" do
    @program = Program.create
    session[:program_id] = @program.id
    @program.name = "test"
    @program.description = "description"
    @program.date = Date.today

    @program.save!

    assert_difference('Program.count', -1) do
      delete :destroy, id: @program
    end

    assert_redirected_to programs_path
  end
end
