class Authentication < ActiveRecord::Base


  private
  def authentication_params
    params.require(:authentication).permit(:user_id, :provider, :uid)
  end
end
