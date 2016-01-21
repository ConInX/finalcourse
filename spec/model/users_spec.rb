require 'rails_helper'

RSpec.describe User, type: :model do
 
  context "测试属性的有无" do
    before do
      @user = User.new
    end

    subject{ @user }
    # respond_to 用来判断属性有没有
    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:gendar) }
    it { should be_valid }
    
    end
end