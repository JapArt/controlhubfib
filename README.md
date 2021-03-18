# Super blazing fast Fibonacci API.

As this is a very simple API I decided to use Sinatra.

Before start, I researched some algorithms to get the result you requested, the Fibonacci sequence is very resource heavy and my goal was to achieve a simple and efficient solution. Some quick searches and some blogs gave me the idea to use a Hash. Honestly I wasn't considering them in the first place. I came across with different solutions but the most efficient one was this:

``ruby
  fib = Hash.new {|hash, key| hash[key] = key < 2 ? key : hash[key-1] + hash[key-2] }
  fib[number]
``


This simple function uses recursion and memoization to get the results, so is super effective and fast.

The next thing was to just create a simple Sinatra app and add an index page for instructions.

At this point, I only needed to create the REST API with their corresponding POST action, error handling, and response. I follow the corresponding response codes and request types that should be in the response depending on the error or success.

[HTTP Status Codes](https://restfulapi.net/http-status-codes/)

I namespaced the routes in /api and /v1 for versioning. In case we need to update the API in the future.

I took the time to deploy it on heroku. You can try it live here: [Super blazing fast Fibonacci API](https://juancontrolhub.herokuapp.com)

It was a fun project, honestly, I didn't remember many things but a quick search pointed me in the right direction.

Please don’t hesitate to reach out if you have additional questions for me! I look forward to having another conversation with you soon.
Thank you for the opportunity and I hope to meet you soon!


Best regards,

Juan Artau