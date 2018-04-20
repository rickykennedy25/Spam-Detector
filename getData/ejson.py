import json

fo = open("tweets1.txt","r")

hasil = json.load(fo)
results = hasil

for x in results :
    print (x["text"])
    print (x["user"]["screen_name"])
    id = str(x["id"])
    link = "https://twitter.com/"+x["user"]["screen_name"]+"/status/"+id
    print (link)
    linkpicture = (x["user"]["profile_image_url"])
    print (linkpicture)
    print ("\n")
