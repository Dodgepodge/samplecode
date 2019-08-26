# In this project, I tried mocking up an API for a product I was working on -- the main goal was to understand what the technical team needed to do, so I could understand their timelines and possibilities within each sprint.

from flask import Flask, abort
import json

# Initialising an instance of the Flask object, named suggest
suggest = Flask(__name__)

# Declaring the route of the URL for suggest GET method to be used
@suggest.route("/GET/suggestions/<int:suggestion_id>", methods = ["GET"]) # Endpoint should match an argument name

def getSuggestion(suggestion_id): 
	"""
		Get a specific suggestion from the list, using suggestion_id as the identifier
		If the suggestion_id input is invalid or does not exist, it should return an error message
	"""
	
	# Declaring this list just to simulate suggestion IDs in a database
	suggestions = [{"suggestion_id": 0, "rating": 2, "comment": "Make it faster!", "user_id": 7, "date_submitted": 1470731913.5144417}, {"suggestion_id": 1, "rating": 3, "comment": "Good but can still do more!", "user_id": 1, "date_submitted": 1470731986.0189607}, {"suggestion_id": 2, "rating": 5, "comment": "Great!", "user_id": 23, "date_submitted": 1470732018.0082424}]

	# Declaring this variable for use later
	return_comment_data = ''
	testing = None 

	return_flag = False

	# Logic for the program to get the specific suggestion_id
	for suggestion in suggestions:
		
		# TIP if <var> or if not <var> returns a boolean

		if suggestion_id == suggestion['suggestion_id']: 

			# DEBUGGING
			#print suggestion_id
			#print suggestion
			#print type(suggestion_id)
			#print suggestion['suggestion_id']
			#print type(suggestion['suggestion_id'])

			# TIP 
			# Dict objects have a method, .get, x.get(<key>,<value_if_key_is_not_found>)
			return_comment_data = suggestion["comment"]
			testing = 1

			return_flag = True

	if return_flag == False:
			
		abort (418)

	return (return_comment_data, testing)

if __name__ == "__main__":
        suggest.run()
