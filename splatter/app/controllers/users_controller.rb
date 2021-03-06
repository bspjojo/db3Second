class UsersController < ApplicationController
  before_filter :set_headers

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params(params[:user]))

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params(params[:user]))
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end


  # GET /users/splatts/1
  # GET /users/splatts/1.json
  def splatts
    @user = User.find(params[:id])

    render json: @user.splatts
  end

  #show who this user follows
  #GET /users/follows/1
  #GET /users/follows/1.json
  def show_follows 
    @user = User.find(params[:id])
    
    render json: @user.follows
  end

  #show who follows this user
  #GET /users/followed_by/1
  #GET /users/followed_by/1.json
  def show_followers
    @user = User.find(params[:id])

    render json: @user.followed_by
  end

  #user follows another user
  #POST /users/follows
  #POST /users/follows
  def add_follows
    @userOne = User.find(params[:id])
    @userTwo = User.find(params[:follows_id])

    @userOne.follows << @userTwo

    head :no_content
  end

  #deletes a follower from user1.followed_by
  #DELETE /users/follows/1/2
  #DELETE /users/follows/1/2.json
  def delete_follows 
    @userOne = User.find(params[:id])
    @userTwo = User.find(params[:follows_id])
    
    @userOne.follows.delete(@userTwo)

    head :no_content
  end

  #shows splattfeed for a particular user(shows splatts by the people they follow)
  #GET /users/splatts-feed/1
  def splatts_feed
    @feed = Splatt.find_by_sql("select * from follows join Splatts on follows.followed_id = Splatts.user_id where follows.follower_id = #{params[:id]} order by Splatts.created_at DESC")


  end

private

  def user_params(params)
    params.permit(:email, :password, :name, :blurb)
  end

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
  end
#end of file
end
