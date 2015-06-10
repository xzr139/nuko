RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:all) do
    FactoryGirl.reload
  end

  config.before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(create(:user))
  end
end
