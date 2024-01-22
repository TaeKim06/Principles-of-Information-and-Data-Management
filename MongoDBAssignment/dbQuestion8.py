from pymongo import MongoClient
client = MongoClient()

client = MongoClient(host="localhost", port=27017)
db = client["BarBeerDrinker"]
col = db["Penna"]
empty = col.distinct("vote.timestamp")


pipe = [{
    "$unwind" : "$vote"},
    {"$group" : {"_id" : "$vote.timestamp", "count" : {"$sum" : "$vote.totalvotes"}} },
    {"$sort" : {"count" : 1}},
    {"$project": {"timestamp" : "$_id", "sumVotes" : "$count", "_id" : 0}}]



TestOutput = col.aggregate(pipeline=pipe)
# print(list(TestOutput))
# for item in TestOutput["sumVotes"]:
    # print(TestOutput)
maxDifference = 0
count = 0
holder = TestOutput.next()
prev = holder["sumVotes"]
while count < len(empty) - 1:
    holder = TestOutput.next()
    temp =  holder["sumVotes"]
    if (temp - prev) > maxDifference:
        maxDifference = (temp - prev)
        timestamp = holder["timestamp"]
    prev = temp
    # print(maxDifference)
    # print("\n")
    count += 1

print(f"The maximum difference in timestamps was: {maxDifference}")
print(f"At timestamp: {timestamp}")



