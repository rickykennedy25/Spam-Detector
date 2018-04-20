import json

fo = open("tweets1.txt","r")

hasil = json.load(fo)
results = hasil

data=[]
for x in results :
    tweets ={"username":"","tweet":"","link":"","profile_image_url":""}
    
    id = str(x["id"])

    links = "https://twitter.com/"+x["user"]["screen_name"]+"/status/"+id
    
    tweets["username"] = x["user"]["screen_name"] 

    tweets["tweet"] = x["text"]
    
    tweets["link"] = links

    tweets["profile_image_url"] = x["user"]["profile_image_url"]
    
    data.append(tweets)
    print(links)
    print(tweets["username"])
    print(tweets["tweet"].replace("\n", "\\n"))
    print(tweets["profile_image_url"])

#print(json.dumps(data))