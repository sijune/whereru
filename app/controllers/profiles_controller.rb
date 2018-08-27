class ProfilesController < ApplicationController
    before_action :set_profile, only: [:show, :edit, :update]
    before_action :write_profile, except: [:new, :create] 
    
    def new
      @category = 64
      redirect_to edit_profile_url unless current_user.profile.nil?
    	@profile = Profile.new
    end
    
    def create
    	@category = 64
    	@profile = Profile.new(profile_params)
    	@profile.user = current_user
    	if @profile.save
    		redirect_to my_profile_url
    	else
    		render 'new'
    	end
    end
    
    def show
    	@category = 64
    end
    
    def edit
      @category = 64
    end
    
    def update
      if @profile.update(profile_params)
    	redirect_to my_profile_url 
      else
    	render 'edit' 
      end	
    end
    
    private
    def set_profile
    	@profile = current_user.profile
    end
    
    def profile_params
    	params.require(:profile).permit(:name, :address, :mobile, :birth)
    end
    
    def write_profile
    	redirect_to new_profile_url if current_user.profile.nil?
    end
end
