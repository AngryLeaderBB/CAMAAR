require 'rails_helper'
require 'json'

RSpec.describe SurveysController, type: :controller do

  describe "GET #index" do
    before(:each) do
      @fake_results = [instance_double('Survey'), instance_double('Survey')]
    end

    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    it 'teste do brabo' do
      allow(Survey).to receive(:all).and_return(@fake_results)
      get :index
      expect(assigns(:surveys)).to eq(@fake_results)
    end

    it "esta retornando todos os surveys" do
      allow(Survey).to receive(:all).and_return(@fake_results)

      get :index
      expected_output = @fake_results.map { |element| element.as_json }
      output = (JSON.parse(response.body))

      expect(output).to eq(expected_output)
    end
  end


  # describe 'method show' do
  #
  #   it 'should call the Model method that finds by id' do
  #     expect(Survey).to receive(:find).with('1')
  #     get :show, params: { id: '1' }
  #   end
  #
  #
  #   it 'should render the right Json' do
  #     json_txt = 	'{
  #       "id": "1",
  #       "name": "Questionário Funcionario",
  # 	    "description": "this is a test survey",
  # 	    "role_id": 2,
  # 	    "expiration_date": "Thu, 21 Jun 2028 12:15:50 -0300",
  # 	    "semester": "2021/2"
  #     }'
  #
  #
  #     survey = Survey.new(JSON.parse(json_txt))
  #     allow(Survey).to receive(:find).with('1').and_return(survey)
  #
  #     get :show, params: { id: '1' }
  #     expect(response.body).to eq("{\"id\":1,\"name\":\"Questionário Funcionario\",\"description\":\"this is a test survey\",\"expiration_date\":\"2028-06-21T15:15:50.000Z\",\"semester\":\"2021/2\",\"survey_questions\":[]}")
  #   end
  #
  #   it 'should have status 200' do
  #     json_txt = 	'{
  #       "id": "1",
  #       "name": "Questionário Funcionario",
  # 	    "description": "this is a test survey",
  # 	    "role_id": 2,
  # 	    "expiration_date": "Thu, 21 Jun 2028 12:15:50 -0300",
  # 	    "semester": "2021/2"
  #     }'
  #
  #
  #     survey = Survey.new(JSON.parse(json_txt))
  #     allow(Survey).to receive(:find).with('1').and_return(survey)
  #
  #     get :show, params: { id: '1' }
  #     expect(response).to have_http_status(200)
  #   end
  #
  # end
end