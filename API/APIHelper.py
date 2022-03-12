import requests
from datetime import datetime

# Data Test
# data = [1,2,3,4,5]
# data = [5,4,3,2,1]

api_url = "https://skillacademy.com/skillacademy/discovery/search"
HEADERS = {'Content-Type': 'application/json'}

def getParams(page=1,pageSize=20,searchQuery="kerja",minPrice=0,maxPrice=999999999,minDuration=0,maxDuration=999999999,sortBy='',orderBy='',marketType=2):
    data = {"page":page,"pageSize":pageSize,"searchQuery":searchQuery,"minPrice":minPrice,"maxPrice":maxPrice,"minDuration":minDuration,"maxDuration":maxDuration,"sortBy":sortBy,"orderBy":orderBy,"marketType":marketType}
    return data

def _searchQuery(search):
    data = getParams(searchQuery=search)
    response = requests.get(api_url, headers=HEADERS, params=data).json()
    return response

def _minPrice(minPrice):
    data = getParams(minPrice=minPrice)
    response = requests.get(api_url, headers=HEADERS, params=data).json()
    return response['data']['data']

def _maxPrice(maxPrice):
    data = getParams(maxPrice=maxPrice)
    response = requests.get(api_url, headers=HEADERS, params=data).json()
    return response['data']['data']

def _bestRating():
    data = getParams(sortBy="average_rating",orderBy="desc")
    response = requests.get(api_url, headers=HEADERS, params=data).json()
    return response['data']['data']

def _totalRating():
    data = getParams(sortBy="total_rating",orderBy="desc")
    response = requests.get(api_url, headers=HEADERS, params=data).json()
    return response['data']['data']

def _updatedAt():
    data = getParams(sortBy="updated_at",orderBy="desc")
    response = requests.get(api_url, headers=HEADERS, params=data).json()
    return response['data']['data']

def _priceSort(orderBy):
    data = getParams(sortBy="price",orderBy=orderBy)
    response = requests.get(api_url, headers=HEADERS, params=data).json()
    return response['data']['data']

def searchQueryChecker(search):
    data = _searchQuery(search)
    try:
        data = data['data']['data'][0]['courseName'].lower()
        if search.lower() in data:
            return True
        else:
            return False
    except:
        print("Data is empty")

def searchPage(numberPage):
    data = getParams(page=numberPage)
    response = requests.get(api_url, headers=HEADERS, params=data).json()
    return response['data']['page']

def pageSize(pageSize):
    data = getParams(pageSize=pageSize)
    response = requests.get(api_url, headers=HEADERS, params=data).json()
    return response['data']['pageSize']

def minPriceChecker(minPrice):
    data = _minPrice(minPrice)
    result = []
    for d in data:
        price = int(d['price'])
        if price < minPrice:
            result.append("No")
    if "No" in result:
        return False
    else:
        return True

def maxPriceChecker(maxPrice):
    data = _maxPrice(maxPrice)
    result = []
    for d in data:
        price = int(d['price'])
        if price > maxPrice:
            result.append("No")
    if "No" in result:
        return False
    else:
        return True

def minDuration(minDuration):
    data = getParams(minDuration=minDuration)
    response = requests.get(api_url, headers=HEADERS, params=data).json()
    return response['data']['totalCourse']

def maxDuration(maxDuration):
    data = getParams(maxDuration=maxDuration)
    response = requests.get(api_url, headers=HEADERS, params=data).json()
    return response['data']['totalCourse']

def bestRatingChecker():
    data = _bestRating()
    beforeRating = 5
    result = []
    for d in data:
        rating = int(d['rating'])
        if beforeRating == rating:
            result.append("Yes")
        elif beforeRating > rating:
            result.append("Yes")
        else:
            result.append("No")
        beforeRating = rating
    if "No" in result:
        return False
    else:
        return True

def totalRatingChecker():
    data = _totalRating()
    beforeRating = 999999999
    result = []
    for d in data:
        rating = int(d['totalRating'])
        if beforeRating > rating:
            result.append("Yes")
        else:
            result.append("No")
        beforeRating = rating
    if "No" in result:
        return False
    else:
        return True

def updatedAtChecker():
    data = _updatedAt()
    initaltime = datetime.strptime("0001-01-01 00:00:00", "%Y-%m-%d %H:%M:%S")
    result = []
    for d in data:
        time = str(d['updatedAt']).split(" +")[0]
        time = datetime.strptime(time, "%Y-%m-%d %H:%M:%S")
        if initaltime >= time: #this should be > instead of >= . UpdatedAt value from API return same.
            result.append("Yes")
        else:
            result.append("No")
        initaltime = time
    if "No" in result:
        return False
    else:
        return True

def minpriceSort(orderBy):
    data = _priceSort(orderBy)
    initialPrice = 0
    result = []
    for d in data:
        price = int(d['price'])
        if initialPrice < price:
            result.append("Yes")
        else:
            result.append("No")
        initialPrice = price
    if "No" in result:
        return False
    else:
        return True

def maxpriceSort(orderBy):
    data = _priceSort(orderBy)
    initialPrice = 999999999
    result = []
    for d in data:
        price = int(d['price'])
        if initialPrice < price:
            result.append("Yes")
        else:
            result.append("No")
        initialPrice = price
    if "No" in result:
        return False
    else:
        return True

if __name__ == '__main__':
    val = maxPriceChecker(300000)
    print(val)
