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


# SCHEMA FOR BASIC TAG DATA
class PlainTagSchema(Schema):
    id = fields.Int(dump_only=True)
    name = fields.Str()

# ITEM SCHEMA WITH STORE RELATION
class ItemSchema(PlainItemSchema):
    store_id = fields.Int(required=True, load_only=True)
    store = fields.Nested(PlainStoreSchema(), dump_only=True)
    tags = fields.List(fields.Nested(PlainTagSchema()), dump_only=True) #added Tags

# SCHEMA FOR UPDATING ITEM
class ItemUpdateSchema(Schema):
    name = fields.Str()
    price = fields.Float()
    store_id = fields.Int()

# STORE SCHEMA WITH ITEM LIST
class StoreSchema(PlainStoreSchema):
    items = fields.List(fields.Nested(PlainItemSchema()), dump_only=True)
    tags = fields.List(fields.Nested(PlainTagSchema()), dump_only=True)


# TAG SCHEMA
class TagSchema(PlainTagSchema):
    store_id = fields.Int(load_only=True)
    items = fields.List(fields.Nested(PlainItemSchema()), dump_only=True)
    store = fields.Nested(PlainStoreSchema(), dump_only=True)    

# TAG AND ITEM SCHEMA
class TagAndItemSchema(Schema):
    message = fields.Str()
    item = fields.Nested(ItemSchema)
    tag = fields.Nested(TagSchema)    

# USER SCHEMA
class UserSchema(Schema):
    id = fields.Int(dump_only=True)
    username = fields.Str(required=True)
    password = fields.Str(required=True, load_only=True)
