module Api::V1::Swagger::TopicsController
	class << self
		def included(base)
			base.include Swagger::Blocks

			base.send(:swagger_path, '/topics') do
				operation :get do
					key :summary, 'Get All Topics'
					key :description, 'Returns all topics'
					key :operationId, 'findTopics'
					key :tags, [
						'topic'
					]
					parameter do
						key :name, :page
						key :in, :query
						key :description, 'Pagination of the topics'
						key :required, false
						key :type, :integer
						key :format, :int64
					end
					response 200 do
						key :description, 'topic response'
						schema do
							key :'$ref', :Topic
						end
					end
				end

				operation :post do
					key :summary, 'creates a topic'
					key :operationId, 'createTopic'
					key :tags, [
						'topic'
					]
					request_body do
						key :description, 'Create a new topic'
						key :required, true
            content 'application/json' do
						  schema do
							  key :'$ref', :TopicInput
						  end
            end
					end
					response 200 do
						key :description, 'topic response'
						schema do
							key :'$ref', :Topic
						end
					end
				end
			end
		end
	end
end
