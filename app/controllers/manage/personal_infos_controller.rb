class Manage::PersonalInfosController < Manage::MainController
    before_filter :find_personal_info
    before_filter :login_required
    def edit
    end
    def update
       @personal_info.update_attributes(params[:personal_info])
       @personal_info.save
       redirect_to edit_manage_personal_info_path
    end
    private
    def find_personal_info
      if PersonalInfo.find(:first).nil?
          PersonalInfo.create()
      else
        @personal_info = PersonalInfo.find(:first)
      end
    end
end
