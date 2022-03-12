*** Settings ***
Resource          ../resource.robot

*** Test Cases ***
API Search Query Test
  ${response}=  searchQueryChecker  Programming
  Pass Execution If   ${response}   Search value return true

API Search Page Test
  ${searchPage}=  Set Variable    3
  ${response}=    searchPage      ${searchPage}
  Pass Execution If   ${response}==${searchPage}    Search page return same ${searchPage}

API Search pageSize Test
  ${pageSize}=  Set Variable    30
  ${response}=  pageSize        ${pageSize}
  Pass Execution If   ${response}==${pageSize}      Page Size return same ${pageSize}

API Search minPrice Test
  ${minPrice}=  Set Variable      300000
  ${response}=  minPriceChecker   ${minPrice}
  Pass Execution If   ${response}      Minimum Price Is Pass ${minPrice}

API Search maxPrice Test
  ${maxPrice}=  Set Variable      300000
  ${response}=  maxPriceChecker   ${maxPrice}
  Pass Execution If   ${response}      Maximum Price Is Pass ${maxPrice}

API Search minDuration Test
  ${minDuration}=  Set Variable   3
  ${response}=  minDuration   ${minDuration}
  Pass Execution If   ${response}>1      Minimum Duration Is Pass ${response} courses

API Search maxDuration Test
  ${maxDuration}=  Set Variable   3
  ${response}=  maxDuration   ${maxDuration}
  Pass Execution If   ${response}>1      Maximum Duration Is Pass ${response} courses

API Search Rating Tertinggi Test
  ${response}=  bestRatingChecker
  Pass Execution If   ${response}        Sort By Best Rating is PASS

API Search Rating Terbanyak Test
  ${response}=  totalRatingChecker
  Pass Execution If   ${response}        Sort By Most Rating is PASS

API Search UpdatedAt Test
  ${response}=  updatedAtChecker
  Pass Execution If   ${response}        Sort By Most Update is PASS

API Search minPriceSort Test
  ${response}=  priceSort  asc
  Pass Execution If   ${response}        Sort By Cheapest is PASS
