from marshmallow import Schema, fields

# ITEM SCHEMA
class ItemSchema(Schema):
    id = fields.Str(dump_only=True)
    name = fields.Str(required=True)
    price = fields.Float(required=True)
    store_id = fields.Str(required=True)

# ITEM UPDATE SCHEMA
class ItemUpdateSchema(Schema):
    name = fields.Str()
    price = fields.Float()

#STORE SCHEMA
class StoreSchema(Schema):
    id = fields.Str(dump_only=True)
    name = fields.Str(required=True)