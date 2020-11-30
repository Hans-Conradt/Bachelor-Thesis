class HomeController < ApplicationController
#   def home
#     if user_signed_in? == false
#       redirect_to new_user_session_path
#     elsif current_user.position == 'executive'
#       redirect_to executive_index_path
#     elsif current_user.position == ('manager' || 'analyst')
#       redirect_to managers_index_path
#     elsif current_user.position == 'operations_staff'
#       redirect_to operations_staff_index_path
#     end
#   end
# end


  def home
    if user_signed_in? == false
      redirect_to new_user_session_path
    elsif current_user.role == 'process'
      redirect_to process_index_path
    elsif current_user.role == 'production'
      redirect_to production_index_path
    elsif current_user.role == 'business'
      redirect_to business_index_path
    end
  end

end
