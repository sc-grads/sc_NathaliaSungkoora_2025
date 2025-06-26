import uuid
from flask import Flask, request
from db import items, stores

app = Flask(__name__)


#First Flask Function Endpoint/ Definition
#GET REQUEST
@app.get("/store") #Endpoint-> http://127.0.0.1:5000/store
def get_stores(): #Function associated with endpoint
    return {"stores":list(stores.values())}

#POST REQUEST: NEW STORE
@app.post("/store")
def create_store():
    store_data = request.get_json()
    store_id = uuid.uuid4().hex
    store = {**store_data, "id": store_id}
    stores[store_id]= store
    return store, 201

#POST REQUEST: CREATE NEW ITEMS IN STORE
@app.post("/item")
def create_item():
    item_data = request.get_json()
    if item_data["store_id"] not in stores:
        return {"message": "Store not found"}, 404
    
    item_id = uuid.uuid4().hex
    item = {**item_data, "id": item_id}
    items[item_id]= item
    return item, 201


#Added: GET ALL ITEMS: Returns LIST
@app.get("/item")
def get_all_items():
    return{"items": list(items.values())}

#GET REQUEST: GET STORE ID
@app.get("/store/<string:store_id>")
def get_store(store_id):
    try:
        return stores[store_id]
    except KeyError:
     return {"message": "Store not found"}, 404

#GET REQUEST: GET ITEMS FROM STORE
@app.get("/item/<string:item_id>")
def get_item(item_id):
   try:
        return items["item_id"]
   except KeyError:
    return {"message": "Item not found"}, 404
