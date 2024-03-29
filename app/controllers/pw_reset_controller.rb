class PwResetController < ApplicationController
  skip_before_action :require_login

  public
  def index
  end

  def reset
    flash[:error] = []
    check_param
    
    unless flash[:error].length > 0 then
      result = User.find_by(mail_address: params[:mailAddress], birthday: params[:birthday])
      check_user result
    end

    if flash[:error].length > 0 then
      render action: :index
      return
    end
    nowDate = Time.new.strftime("%Y-%m-%d %H:%M:%S")
    password = [*'A'..'Z', *'a'..'z', *0..9].shuffle[0..7].join
    result.password = password
    result.password_init_flg = 1
    result.password_init_updated_at = nowDate
    result.updated_user_id = 0
    result.updated_at = nowDate
    result.save
    
    NotificationMailer.send_reset_password(result).deliver
    
    redirect_to '/pw_reset_comp'
  end

  private

  def check_param
    if params[:mailAddress].blank?
      flash[:error] << "メールアドレスを入力してください"
    end
    if params[:birthday].blank?
      flash[:error] << "生年月日を入力してください"
    end
  end

  def check_user target
    unless target then
      flash[:error] << "メールアドレスもしくは生年月日が間違っています。"
    end
  end

end
