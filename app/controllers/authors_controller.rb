class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update]
  before_action :logged_in?, except: [:new, :create]

  def index
    @authors = Author.all
  end

  def edit
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to sessions_log_in_path, notice: "Registered!"
    else
      redirect_to sign_up_path, notice: "All fields are required."
    end
  end

  def update
    if @author.update(author_params)
      redirect_to @author, notice: 'Author was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:email, :name, :password)
  end
end
