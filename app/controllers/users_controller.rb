class UsersController < ApplicationController
  def index

    matching_users=User.all
    @list_of_users = matching_users.order({:username => :asc})
    render ({:template => "user_templates/index.html.erb"})
  end

def show

url_username=params.fetch("path_username")
 matching_users= User.where ({:username => url_username })
 @the_user=matching_users.at(0)

  render({:template => "user_templates/show.html.erb"})
end

def create
  user = User.new
  user.username = params.fetch("input_username")
  user.save
  
  redirect_to("/users/#{user.username}")
end



end
