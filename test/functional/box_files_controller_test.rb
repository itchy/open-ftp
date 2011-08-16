# require 'test_helper'
# 
# class BoxFilesControllerTest < ActionController::TestCase
#   setup do
#     @box_file = box_files(:one)
#   end
# 
#   test "should get index" do
#     get :index
#     assert_response :success
#     assert_not_nil assigns(:box_files)
#   end
# 
#   test "should get new" do
#     get :new
#     assert_response :success
#   end
# 
#   test "should create box_file" do
#     assert_difference('BoxFile.count') do
#       post :create, box_file: @box_file.attributes
#     end
# 
#     assert_redirected_to box_file_path(assigns(:box_file))
#   end
# 
#   test "should show box_file" do
#     get :show, id: @box_file.to_param
#     assert_response :success
#   end
# 
#   test "should get edit" do
#     get :edit, id: @box_file.to_param
#     assert_response :success
#   end
# 
#   test "should update box_file" do
#     put :update, id: @box_file.to_param, box_file: @box_file.attributes
#     assert_redirected_to box_file_path(assigns(:box_file))
#   end
# 
#   test "should destroy box_file" do
#     assert_difference('BoxFile.count', -1) do
#       delete :destroy, id: @box_file.to_param
#     end
# 
#     assert_redirected_to box_files_path
#   end
# end
