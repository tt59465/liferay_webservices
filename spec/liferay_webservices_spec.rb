require 'spec_helper'

describe LiferayWebservices do
                                
  before :each do
    LiferayWebservices.init
  end     
       
  context 'about configurations' do
    
    it 'should load the config file' do
      LiferayWebservices.config.should_not be_nil
      LiferayWebservices.config[:host].should_not be_nil
    end                                    
    
    it 'should load the services file' do
      LiferayWebservices.services.should_not be_nil
      LiferayWebservices.services[:user].should == "Portal_UserService"
    end
                               
    it 'should normalize host' do
      LiferayWebservices.host.match(/\/$/).should be_nil
    end
    
  end
                                                
  context 'about the client initialization' do
    include LiferayWebservices
    
    it 'should initialize a new service' do
      client = LiferayWebservices.new_client :user
      client.should_not be_nil
      client.should respond_to :get_user_by_id
    end
    
  end  
  
  context 'about method execution on clients' do
    include LiferayWebservices
    
    it 'should retrieve the result' do
      client = LiferayWebservices.new_client :user
      user = LiferayWebservices.execute(client, :get_user_by_id, :id => 10144) 
      user.user_id.to_i.should == 10144 # href_value
      user.greeting.should == "Welcome Test Test!" # common value
    end
    
    it 'should retrieve a proxy instance of client' do
      client = new_liferay_client :user
      client.proxied_class?.should be_true
      
      result = client.get_user_by_id :id => 10144
      result.should_not be_nil
      result.user_id.to_i.should == 10144
    end
    
  end
  
end














