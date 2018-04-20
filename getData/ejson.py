import json

def sanitize(text):
    text = text.replace("\n", "\\n")
    text = text.replace("\"", "\\\"")
    return text

fo = open("tweets1.txt","r")

hasil = json.load(fo)
results = hasil

for x in results :
    tweets ={"username":"","tweet":"","link":"","profile_image_url":""}
    
    id = str(x["id"])
    links = "https://twitter.com/"+x["user"]["screen_name"]+"/status/"+id
    tweets["username"] = x["user"]["screen_name"] 
    tweets["tweet"] = x["text"]
    tweets["profile_image_url"] = x["user"]["profile_image_url"]
    
    print(sanitize(links))
    print(sanitize(tweets["username"]))
    print(sanitize(tweets["tweet"]))
    print(sanitize(tweets["profile_image_url"]))