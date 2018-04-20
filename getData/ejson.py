import json

fo = open("tweets1.txt","r")

hasil = json.load(fo)
results = hasil

data=[]
for x in results :
    tweets ={'username':'','tweet':'','link':'','profile_image_url':''}
    
    id = str(x["id"])
    links = "https://twitter.com/"+x["user"]["screen_name"]+"/status/"+id
    
    tweets["username"] = x["user"]["screen_name"] 
    # print (tweets["username"])

    tweets["tweet"] = x["text"]
    # print (tweets["tweet"])
    
    tweets["link"] = links
    # print (tweets["link"])

    tweets["profile_image_url"] = x["user"]["profile_image_url"]
    # print (tweets["profile_image_url"])
    
    # print (x["text"])
    # print (x["user"]["screen_name"])
    # print (link)
    # linkpicture = (x["user"]["profile_image_url"])
    # print (linkpicture)
    print (tweets)
    data.append(tweets)
    print ("\n")
