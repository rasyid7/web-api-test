*** Settings ***
Resource          ../resource.robot

*** Test Cases ***
API Search Query Test
  [Documentation]   Search programming from API and result should contain programming
  ${response}=  searchQueryChecker  Programming
  Pass Execution If   ${response}   Search value return true

API Search Page Test
  [Documentation]   Search from API with page=3 and result should on page 3
  ${searchPage}=  Set Variable    3
  ${response}=    searchPage      ${searchPage}
  Pass Execution If   ${response}==${searchPage}    Search page return same ${searchPage}

API Search pageSize Test
  [Documentation]   Search from API with pageSize=30 and result page should contains 30 items
  ${pageSize}=  Set Variable    30
  ${response}=  pageSize        ${pageSize}
  Pass Execution If   ${response}==${pageSize}      Page Size return same ${pageSize}

API Search minPrice Test
  [Documentation]   Search from API with minPrice=300000 and result page should contains item with minimum price of 300000
  ${minPrice}=  Set Variable      300000
  ${response}=  minPriceChecker   ${minPrice}
  Pass Execution If   ${response}      Minimum Price Is Pass ${minPrice}

API Search maxPrice Test
  [Documentation]   Search from API with maxPrice=300000 and result page should contains item with maximum price of 300000
  ${maxPrice}=  Set Variable      300000
  ${response}=  maxPriceChecker   ${maxPrice}
  Pass Execution If   ${response}      Maximum Price Is Pass ${maxPrice}

API Search minDuration Test
  [Documentation]   Search from API with minDuration=3 and result page should contains item with minimum duration of 3 hours
  ${minDuration}=  Set Variable   3
  ${response}=  minDuration   ${minDuration}
  Pass Execution If   ${response}>1      Minimum Duration Is Pass ${response} courses

API Search maxDuration Test
  [Documentation]   Search from API with maxDuration=3 and result page should contains item with maximum duration of 3 hours
  ${maxDuration}=  Set Variable   3
  ${response}=  maxDuration   ${maxDuration}
  Pass Execution If   ${response}>1      Maximum Duration Is Pass ${response} courses

API Search Rating Tertinggi Test
  [Documentation]   Search from API with sortBy="average_rating" and orderBy="desc" and result page should sort items from highest rating
  ${response}=  bestRatingChecker
  Pass Execution If   ${response}        Sort By Best Rating is PASS

API Search Rating Terbanyak Test
  [Documentation]   Search from API with sortBy="total_rating" and orderBy="desc" and result page should sort items from most rating
  ${response}=  totalRatingChecker
  Pass Execution If   ${response}        Sort By Most Rating is PASS

API Search UpdatedAt Test
  [Documentation]   Search from API with sortBy="updated_at" and orderBy="desc" and result page should sort items by most recent, but there's issue with the response
  ${response}=  updatedAtChecker
  Pass Execution If   ${response}        Sort By Most Update is PASS

API Search minPriceSort Test
  [Documentation]   Search from API with sortBy="price",orderBy="asc" and result page should sort items from lowest price
  ${response}=  minpriceSort  asc
  Pass Execution If   ${response}        Sort By Cheapest is PASS

API Search maxPriceSort Test
  [Documentation]   Search from API with sortBy="price",orderBy="desc" and result page should sort items from highest price
  ${response}=  maxpriceSort  desc
  Pass Execution If   ${response}        Sort By Cheapest is PASS
