import requests

api_url = "https://skillacademy.com/skillacademy/discovery/search"
HEADERS = {'Content-Type': 'application/json'}

def getParams(page=1,pageSize=20,searchQuery="kerja",minPrice=0,maxPrice=999999999,minDuration=0,maxDuration=999999999,sortBy='',orderBy='',marketType=2):
    data = {"page":page,"pageSize":pageSize,"searchQuery":searchQuery,"minPrice":minPrice,"maxPrice":maxPrice,"minDuration":minDuration,"maxDuration":maxDuration,"sortBy":sortBy,"orderBy":orderBy,"marketType":marketType}
    return data

def _searchQuery(search):
    data = getParams(searchQuery=search)
    response = requests.get(api_url, headers=HEADERS, params=data).json()
    return response

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
