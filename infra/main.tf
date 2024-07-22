#create bucket to store website
resource "google_storage_bucket" "website" {
    name = "test_bucket-20072024-asde"
    location = "asia"
}

#object need to be public. this bucket only for html. set bucket to public
resource "google_storage_object_access_control" "public_rule" {
    object = google_storage_bucket_object.static_site_src.name
    bucket = google_storage_bucket.website.name
    role = "READER"
    entity = "allUsers"
}

#upload html file to bucket
resource "google_storage_bucket_object" "static_site_src" {
    name   = "index.html"
    #bucket below taking name from row 4
    bucket = google_storage_bucket.website.name
    source = "../website/index.html"
}

