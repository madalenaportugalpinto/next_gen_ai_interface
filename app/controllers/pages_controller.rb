class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def index
    if current_user
      render 'looged_in_page'
    else
      render 'create_account_page'
    end
  end
end
