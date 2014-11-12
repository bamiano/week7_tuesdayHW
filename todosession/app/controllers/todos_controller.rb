class TodosController < ApplicationController
  def index
  	@todos = session[:todos] ||= []
  end

  def create
  	slappityslapslap = params.require(:task)
  	puts slappityslapslap
  	redirect_to todos_path
  	session[:todos] << slappityslapslap
  end

  def destroy
  	session[:todos] = []
  	redirect_to todos_path
  end
end


