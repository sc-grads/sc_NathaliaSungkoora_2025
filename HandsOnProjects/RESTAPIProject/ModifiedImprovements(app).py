import uuid
from flask import Flask, request
from flask_smorest import abort
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
    if "name" not in store_data:
        abort(
            400,
            message="Bad request. Ensure 'name' is included in the JSON payload.",
        )
    for store in stores.values():
        if store_data["name"] == store["name"]:
            abort(400, message=f"Store already exists.")

    store_id = uuid.uuid4().hex
    store = {**store_data, "id": store_id}
    stores[store_id] = store

    return store, 201

#POST REQUEST: CREATE NEW ITEMS IN STORE
@app.post("/item")
def create_item():
    item_data = request.get_json()
    if (
        "price" not in item_data
        or "store_id" not in item_data
        or "name" not in item_data
    ):
        abort(
            400,
            message="Bad request. Ensure 'price', 'store_id', and 'name' are included in the JSON payload.",
        )
    for item in items.values():
    # Use .get("store_id") to avoid KeyError if 'store_id' missing in old items
        if (
        item_data["name"] == item.get("name")
        and item_data["store_id"] == item.get("store_id")
    ):
            abort(400, message=f"Item already exists.")

    
    if item_data["store_id"] not in stores:
        abort(404, message="Store not found.")
    
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
     abort(404, message="Store not found.")

#GET REQUEST: GET ITEMS FROM STORE
@app.get("/item/<string:item_id>")
def get_item(item_id):
   try:
        return items[item_id]
   except KeyError:
    abort(404, message="Item not found.")



#DELETE ITEMS
@app.delete("/item/<string:item_id>")
def delete_item(item_id):
    try:
        del items[item_id]
        return {"message": "Item deleted."}
    except KeyError:
        abort(404, message="Item not found.")