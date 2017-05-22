
class Manager::ManagerController < ApplicationController

  layout 'manager'

  prepend_before_action :authenticate_user!
  before_action :validate_manager
  before_action :do_set

  private

  def validate_manager
    if 'piousbox' == current_user['username'] || 'manager' == current_user['username']
      return true
    else
      redirect_to root_path
    end
  end

  def set_lists
    @tags_list = Tag.all.list
    @sites_list = Site.all.list
    @cities_list = City.all.list
    @venues_list = Venue.all.list
    @users_list = User.all.list
    
    @reports_list = Report.all.list
    @galleries_list = Gallery.all.list
    @videos_list = Video.all.list
  end

  def do_set
    @latest_changelog = File.read( Rails.root.join('changelog.txt') ).split("\n").last
    @branch = `git branch | grep -e "^*" | cut -d' ' -f 2`
  end

end
