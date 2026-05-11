### WORKING WITH JSON DATA FROM GITHUB
This process started off with creating a synthetic dataset using the Mockaroo data generator for my dataset.
This is exported as a JSON file.
 
After creating the JSON file:
- It is uploaded to a public GitHub repository, and the raw GitHub link is accessed from GitHub.
- The Python requests library is then used to extract/read the JSON data from the raw GitHub link.
- The extracted JSON data is converted into a well-structured DataFrame, and the final output saved as a well-structured CSV file.
 
### Extracting Data from DummyJSON API Endpoints using Python requests library
Products endpoint
https://dummyjson.com/products 
Carts endpoint
https://dummyjson.com/carts 
 
For each endpoint:
- A request has been sent using Python to get the data.
- The JSON response has been extracted, converted into a well-structured DataFrame, and saved as a CSV file.
 
