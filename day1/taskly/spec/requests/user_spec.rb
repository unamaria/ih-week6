require 'rails_helper'

RSpec.describe "Users", type: :request do
	before do
		10.times do |index|
			user = User.create name: "Name #{index}", email: "#{index}@d.com"
			5.times do |time|
				Task.create name: "task #{time} for user #{user.id}", completion: nil, user_id: user.id
			end 
		end	
	end

	describe "GET /users" do
		it "returns all users" do
			get users_path(format: :json)
			data = JSON.parse(response.body)
			
			expect(response).to have_http_status(200)
			expect(data.length).to eq(10)
		end
	end

	describe "GET /users/:id" do 
		it "embeds user tasks count" do 
			get user_path(User.last, format: :json)
			data = JSON.parse(response.body)

			expect(response).to have_http_status(200)
			expect(data['task_count']).to eq(5)
		end

		it "returns 404 when user doesn't exist" do

			# expect do # this needs find instead of find_by
			# 	get user_path(438)
			# end.to raise_error ActiveRecord::RecordNotFound

			expect(response).to have_http_status(404)
		end

		it "doesn't expose user id" do
			get user_path(User.last, format: :json)
			data = JSON.parse(response.body)

			expect(response).to have_http_status(200)
			expect(data['id']).to eq(nil)
		end
	end

end