from flask import Flask, request

app = Flask(__name__)

stores = [
    {
        "name": "My Store",
        "items": [
            {
                "name": "Chair",
                "price": 15.99
            }
        ]
    }
]

#First Flask Function Endpoint/ Definition
#GET REQUEST
@app.get("/store") #Endpoint-> http://127.0.0.1:5000/store
def get_stores(): #Function associated with endpoint
    return {"stores": stores}

#POST REQUEST: NEW STORE
@app.post("/store")
def create_store():
          request_data = request.get_json()
          new_store = {"name": request_data["name"], "items": []}
          stores.append(new_store)
          return new_store, 201

#POST REQUEST: CREATE NEW ITEMS IN STORE
@app.post("/store/<string:name>/item")
def create_item(name):
    request_data = request.get_json()
    for store in stores:
        if store["name"] == name:
            new_item = {"name": request_data["name"], "price": request_data["price"]}
            store["items"].append(new_item)
            return new_item, 201
    return {"message": "Store not found"}, 404 #ERROR MESSAGE IF STORE NOT FOUND


#GET REQUEST: GET STORE NAME
@app.get("/store/<string:name>")
def get_store(name):
    for store in stores:
        if store["name"] == name:
            return store
    return {"message": "Store not found"}, 404

#GET REQUEST: GET ITEMS OF A SPECIFIC STORE
@app.get("/store/<string:name>/item")
def get_item_in_store(name):
    for store in stores:
        if store["name"] == name:
            return {"items": store["items"]}
    return {"message": "Store not found"}, 404
