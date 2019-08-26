# In this project, I tried mocking up an API for a product I was working on -- the main goal was to understand what the technical team needed to do, so I could understand their timelines and possibilities within each sprint.

from flask import Flask, abort
import json

# Initialising an instance of the Flask object, named suggest
suggest = Flask(__name__)

# Declaring the route of the URL for suggest GET method to be used
@suggest.route("/LIST", methods = ["GET"])

def getListOfSuggestions():
        """Get all suggestions in the list, return the values in the list"""
        
        # Declaring this dict just to simulate suggestion IDs in a database
        suggestions = [{"suggestion_id": 0, "rating": 2, "comment": "Make it faster!", "user_id": 7, "date_submitted": 1470731913.5144417}, {"suggestion_id": 1, "rating": 3, "comment": "Good but can still do more!", "user_id": 1, "date_submitted": 1470731986.0189607}, {"suggestion_id": 2, "rating": 5, "comment": "Great!", "user_id": 23, "date_submitted": 1470732018.0082424}]

        return_data = json.dumps(suggestions)
        return return_data

if __name__ == "__main__":
        suggest.run()
