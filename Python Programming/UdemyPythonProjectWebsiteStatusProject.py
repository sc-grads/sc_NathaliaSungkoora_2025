#WEBSITE STATUS PROJECT (SECTION 15)

from datetime import datetime
import asyncio
from asyncio import Future
import requests
from requests import Response

# Async function to check the status of a website
async def check_status(url: str) -> dict[str, int | str]:

    # Record the start time for the request
    start_time = datetime.now()
    # Making a synchronous request in an async context using asyncio.to_thread
    response = await asyncio.to_thread(requests.get, url, None)
    # Record the end time after the request completes
    end_time = datetime.now()

     # Return the result as a dictionary
    return { 'website': url,
            'status': response.status_code,
            'start_time': start_time.strftime('%H:%M:%S'),
            'end_time': end_time.strftime('%H:%M:%S')
        }


# Main async function
async def main()-> None:
    print('Fetching results: ')

    tasks: Future = asyncio.gather(
        check_status('https://www.google.com'),
        check_status('https://www.apple.com'),
        check_status('https://www.bing.com'),
        check_status('https://www.youtube.com'),
        check_status('https:lol'),
        return_exceptions=True
        )
        

    # Awaiting the tasks to complete    
    results: list[dict] = await tasks
    print(results)

# Displaying results of each check
    for result in results:
        print(result)

# Running the async program
if __name__ == '__main__':
    asyncio.run(main())

