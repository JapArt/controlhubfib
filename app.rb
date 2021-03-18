# api.rb

# Add and index with some instructions on how to use the API
get '/' do
  slim :index
end

# Adding a namespace and version for the API.
post '/api/v1/fibonacci' do
  # Parse the JSON body
  request.body.rewind  # in case someone already read it
  data = JSON.parse(request.body.read)

  # Try to convert index params to integer, if not return nil
  index_param = Integer(data['index'], exception: false)


  case
  when !index_param
    status 400 
    { params: data, error: "index parameter should exists and be number "}.to_json
  
    # respond with the value of the index in params
  when index_param <= 200
    status 200
    
    # Create the recursion using memoization
    fib = Hash.new {|hash, key| hash[key] = key < 2 ? key : hash[key-1] + hash[key-2] }

    # create the response with the result
    response = {
      result: fib[index_param]
    }
  
    response.to_json
  
  # Prevent users from submitting large index value
  when index_param > 200
    status 400
    response = {
      params: data,
      error: "Index should be less than 200"
    }
  
    response.to_json
  else
    status 500
    response = {
      params: data,
      error: "Unexpected error." 
    }

    response.to_json
  end
end

