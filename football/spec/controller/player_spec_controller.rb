require "rails_helper"

RSpec.describe PlayersController, :type => :controller do
#*******************************************************************************
  describe "GET #index" do
    subject { get :index }

    it "renders the index template" do
      expect(subject).to render_template(:index)
      # expect(subject).to render_template("index")
      # expect(subject).to render_template("gadgets/index")
    end
    it "do not renders different template" do
      expect(subject).to_not render_template(:show)
    end
  end
#*******************************************************************************
  describe "GET #show" do
    player = FactoryGirl.create(:player)
    subject { get :show, :id => player.to_param }

    it "render the show template" do
      expect(subject).to render_template(:show)
      expect(subject).to render_template("show")
    end

    it "do not render different template" do
      expect(subject).to_not render_template(:index)
    end
  end
#*******************************************************************************
  describe "GET #new" do
    subject { get :new }

    it "render the new template" do
      expect(subject).to render_template(:new)
    end

    it "do not render different template" do
      expect(subject).to_not render_template(:create)
    end
  end
#*******************************************************************************
  describe "GET #edit" do
    player = FactoryGirl.create(:player)
    subject { get :edit, :id => player.id.to_param }

    it "render the edit template" do
      expect(subject).to render_template(:edit)
    end

    it "do not render different template" do
      expect(subject).to_not render_template(:update)
    end
  end
#*******************************************************************************
  describe "POST #create" do
    player = FactoryGirl.build(:player)
    subject { post :create,
                      :player => {
                          :name => player.name,
                          :shirt_number_integer => player.shirt_number_integer
                      }
            }

    it "redirects to player_url(@player)" do
      expect(subject).to redirect_to(player_url(assigns(:player)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
                                     :id => assigns(:player).id
    end

  end
#*******************************************************************************
  describe "PUT #update" do
    player = FactoryGirl.create(:player)
    subject { put :update,
                      :id => player.to_param,
                      :player => {
                          :name => player.name,
                          :shirt_number_integer => player.shirt_number_integer
                      }
            }

    it "redirects to player_url(@player)" do
      expect(subject).to redirect_to(player_url(assigns(:player)))
    end

    it "redirects_to :action => :show" do
      expect(subject).to redirect_to :action => :show,
                                     :id => assigns(:player).id
    end

  end
#*******************************************************************************
  describe "DELETE #destroy" do
    player = FactoryGirl.create(:player)
    subject { delete :destroy,
                      :id => player.to_param
            }

    it "redirects_to :action => :index" do
      expect(subject).to redirect_to :action => :index
    end
  end
end
