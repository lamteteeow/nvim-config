def maxProfit(prices):
    """
    :type prices: List[int]
    :rtype: int
    """
    low = min(prices)
    low_id = prices.index(low)
    if low_id + 1== len(prices): 
        return 0
    max_after = max(prices[low_id+1:])
    if max_after - low < 0:
        return 0
    else:
        return max_after - low

print(maxProfit( [7,6,4,3,1] ))
print("what is the max profit")

# def checkVersion():
#     with file("version.txt") as f:
