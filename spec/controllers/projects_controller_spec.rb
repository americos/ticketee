require 'spec_helper'



describe ProjectsController do
  
  before do
     @warden = OpenStruct.new
     @warden.stub!(:set_user)
     request.env['warden'] = @warden
   end

   let(:user){ User.create!(:login => "user", :password => "ticketee", :password_confirmation => "ticketee", :email => "user@ticketee.com")}
   #@user = User.create!(:login => "user", :password => "ticketee", :password_confirmation => "ticketee", :email => "user@ticketee.com")
   let(:project) { Project.create!(:name => "Ticketee") }
   #@project = Project.create!(:name => "Ticketee")
  
  it "displays an error message when asked for a missing project" do
    get :show, :id => "not-here"
    response.should redirect_to(projects_path)
    flash[:error].should eql("The project you were looking for could not be found.")
  end
end


describe "standard users" do
 
  { "new" => "get", "create" => "post", "edit" => "get", "update" => "put", "destroy" => "delete" }.each do |action, method|

    it "cannot access the #{action} action" do
      @warden.should_receive(:authenticate!).with(:scope => :user)
      controller.stub!(:current_user).and_return(@user)
      send(method, action, :id => project.id)
      response.should redirect_to(root_path)
      flash[:alert].should eql("You must be an admin to do that.")
    end
  end
end