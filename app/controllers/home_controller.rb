class HomeController < ApplicationController
  def index
    @userLogged = (current_student || current_professor)
  end
end
