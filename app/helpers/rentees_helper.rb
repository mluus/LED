module RenteesHelper

  def isAdmin?
    current_user.email == 'morne.luus@gmail.com' unless current_user.blank?
  end


end



