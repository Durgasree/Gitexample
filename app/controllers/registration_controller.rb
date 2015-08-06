class RegistrationController < ApplicationController
    def index
    @people = Person.all
  end
  
  def new
    @person = Person.new
  end
  
  def create
    @person = Person.create(user_params)
    if @person.save
      redirect_to users_path
    else
      render "new"
    end
  end
  
  def show
    @person = Person.find(params[:id])
  end
  
  def edit
    @person = Person.find(params[:id])
  end
  
  def update
    @person = Person.find(params[:id])
    if @person.update(user_params)
      redirect_to users_path
    else
      render "edit"
    end
  end
  
  def destroy
    @person = Person.find(params[:id])
    redirect_to users_path
  end
  
  private 
   def user_params
      params.require(:person).permit()
    end
end