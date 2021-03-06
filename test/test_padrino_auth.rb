require File.expand_path('../helper', __FILE__)

Account = Character

describe "Padrino::Auth" do
  before do
    mock_app do
      enable :sessions
      register Padrino::Login
      register Padrino::Access
      get(:robot_area){ 'robot_area' }
      set_access :robots, :allow => :robot_area
    end
  end

  it 'should login and access play nicely together' do
    get '/robot_area'
    assert_equal 302, status

    post '/login', :email => :bender, :password => 'BBR'
    get '/robot_area'
    assert_equal 200, status

    post '/login', :email => :leela, :password => 'TL'
    get '/robot_area'
    assert_equal 403, status
  end

  it 'should fail if the order is wrong' do
    whine = capture_io do
      mock_app do
        register Padrino::Access
        register Padrino::Login
      end
    end
    assert_match /must be registered before/, whine.to_s
  end
end
