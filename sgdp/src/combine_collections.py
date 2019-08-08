import arvados
import arvados.collection
api = arvados.api()
project_uuid = "su92l-uuid-project"
collection_uuids = ["su92l-collection1", "su92l-collection2"]
combined_manifest = ""
for u in collection_uuids:
    c = api.collections().get(uuid=u).execute()
    combined_manifest += c["manifest_text"]
newcol = arvados.collection.Collection(combined_manifest)
newcol.save_new(name="Simons Diversity Data", owner_uuid=project_uuid)
