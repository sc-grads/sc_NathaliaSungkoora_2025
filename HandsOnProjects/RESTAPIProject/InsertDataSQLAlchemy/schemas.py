from marshmallow import Schema, fields

# SCHEMA FOR BASIC ITEM DATA
class PlainItemSchema(Schema):
    id = fields.Int(dump_only=True)
    name = fields.Str(required=True)
    price = fields.Float(required=True)

# SCHEMA FOR BASIC STORE DATA
class PlainStoreSchema(Schema):
    id = fields.Int(dump_only=True)
    name = fields.Str()

# ITEM SCHEMA WITH STORE RELATION
class ItemSchema(PlainItemSchema):
    store_id = fields.Int(required=True, load_only=True)
    store = fields.Nested(PlainStoreSchema(), dump_only=True)

# SCHEMA FOR UPDATING ITEM
class ItemUpdateSchema(Schema):
    name = fields.Str()
    price = fields.Float()

# STORE SCHEMA WITH ITEM LIST
class StoreSchema(PlainStoreSchema):
    items = fields.List(fields.Nested(PlainItemSchema()), dump_only=True)