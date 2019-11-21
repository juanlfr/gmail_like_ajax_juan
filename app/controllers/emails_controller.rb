class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.create(object: Faker::Lorem.words, body: Faker::Lorem.paragraph)
    flash[:notice] = "Email recived"
    respond_to do |format|
      format.html { redirect_to root_path}
      format.js {}
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      format.html { redirect_to root_path}
      format.js {}
    end

  
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path}
      format.js {}
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path}
      format.js {}
    end

  end

end
