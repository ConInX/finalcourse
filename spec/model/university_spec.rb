require 'rails_helper'

RSpec.describe University, type: :model do
 
  context "测试属性的有无" do
    before do
      @university = University.new
    end

    subject{ @university }
    # respond_to 用来判断属性有没有
    it { should respond_to(:universityname) }
    it { should respond_to(:location) }
    it { should be_valid }
    
    
    end
end