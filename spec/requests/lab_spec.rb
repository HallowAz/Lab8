require 'rails_helper'

RSpec.describe "Labs", type: :request do

  describe "GET /show" do
    context 'when params are not valid' do
      it "returns http status code 302" do
        get "/lab/show"
        expect(response).to have_http_status(302)
      end

      it 'initializes invalid values do' do
        get "/lab/show", params: {numb: "Hello"}
        expect(assigns(:res)).to eq(nil)
      end

      it 'initializes unpositive values do' do
        get "/lab/show", params: {numb: -45}
        expect(assigns(:res)).to eq(nil)
      end
    end

    context 'when params are correct' do
      before { get "/lab/show", params: { numb: 100 } }

      it 'retrns status code 200' do 
        expect(response).to have_http_status(200)
      end

      it 'initializes correct values do' do
        expect(assigns(:res)).to eq(['100', '101'])
      end
      
      it 'renders input template' do
        expect(response).to render_template(:show)
      end
    end
  end

  describe 'GET /' do
    before { get root_path } # перед каждым тестом делать запрос
  
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  
    it 'renders input template' do
      expect(response).to render_template(:input)
    end
  
    it 'responds with html' do
      expect(response.content_type).to match(%r{text/html})
    end
  end
end
