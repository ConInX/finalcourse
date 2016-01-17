require 'rails_helper'

RSpec.describe Article, type: :model do
 
  context "测试属性的有无" do
    before do
      @article = Article.new
    end

    subject{ @article }
    # respond_to 用来判断属性有没有
    it { should respond_to(:articlename) }
    it { should respond_to(:content) }
    it { should respond_to(:coursename) }
    it { should respond_to(:name) }
    it { should respond_to(:createtime) }
    it { should respond_to(:viewtimes) }
    it { should respond_to(:answertimes) }
    it { should be_valid }
    
    
    end
end
