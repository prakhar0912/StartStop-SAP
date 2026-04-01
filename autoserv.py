
# using flask_restful 
from flask import Flask, jsonify, request 
from flask_restful import Resource, Api
import subprocess
  
# creating the flask app 
app = Flask(__name__) 
# creating an API object 
api = Api(app) 
  
# making a class for a particular resource 
# the get, post methods correspond to get and post requests 
# they are automatically mapped by flask_restful. 
# other methods include put, delete, etc. 
class Hello(Resource): 
  
    # corresponds to the GET request. 
    # this function is called whenever there 
    # is a GET request for this resource 
    def get(self): 
        
        return jsonify({'message': 'hello world'}) 
  
    # Corresponds to POST request 
    def post(self): 
          
        data = request.get_json()     # status code 
        return jsonify({'data': data}), 201
  
  
# another resource to calculate the square of a number 
class Run(Resource): 
  
    def get(self): 
        query = request.args.to_dict(flat=False)
        print(query)
        print("app.sh "+query['sector'][0] + " " + query['action'][0])
        output = subprocess.check_output("app.sh "+query['sector'][0] + " " + query['action'][0], shell=True)
        print(output)
        return jsonify({"message": output}) 
  
  
# adding the defined resources along with their corresponding urls 
api.add_resource(Hello, '/') 
api.add_resource(Run, '/run') 
  
  
# driver function 
if __name__ == '__main__': 
  
    app.run(debug = True, port=8080) 