# ASYNC IO (SECTION 15)

#-----------------------------------------------------------------
# GETTING STARTED
# import asyncio
# from datetime import datetime

# # Async function to simulate data fetching
# async def fetch_data(input_data: str) -> dict:
#     print('Fetching data...')

#     # Record start time
#     start_time = datetime.now()

#     # Simulate delay
#     await asyncio.sleep(3)

#     # Record end time
#     end_time = datetime.now()

#     # Print confirmation
#     print('Data retrieved.')

#     # Return fetched data as dictionary
#     return {
#         'input': input_data,
#         'start_time': start_time.strftime('%H:%M:%S'),
#         'end_time': end_time.strftime('%H:%M:%S')
#     }

# # Main async function
# async def main():
#     # Creating tasks
#     task1 = asyncio.create_task(fetch_data('1'))
#     task2 = asyncio.create_task(fetch_data('2'))

#     # Awaiting tasks
#     data1 = await task1
#     data2 = await task2

#     # Displaying results
#     print(f'Data 1: {data1}')
#     #Output: Data 1: {'input': '1', 'start_time': '01:39:02', 'end_time': '01:39:05'
#     print(f'Data 2: {data2}')
#     # Output: Data 2: {'input': '2', 'start_time': '01:39:02', 'end_time': '01:39:05'} 

# # Running the async program
# if __name__ == '__main__':
#     asyncio.run(main())


#-----------------------------------------------------------------
# TASKS   
# import asyncio
# from asyncio import Task
# from datetime import datetime

# # Async function to simulate data fetching
# async def fetch_data(input_data: str, delay: int) -> dict:
#     print(f'Fetching data for {input_data}...')

#     # Record start time
#     start_time = datetime.now()

#     # Simulate delay
#     await asyncio.sleep(delay)

#     # Record end time
#     end_time = datetime.now()

#     # Print confirmation
#     print(f'Data retrieved for {input_data}.')

#     # Return fetched data as dictionary
#     return {
#         'input': input_data,
#         'start_time': start_time.strftime('%H:%M:%S'),
#         'end_time': end_time.strftime('%H:%M:%S')
#     }

# # Main async function
# async def main():
#     try:
#         # Creating tasks
#         task1 = asyncio.create_task(fetch_data('1', 3))
#         task2 = asyncio.create_task(fetch_data('2', 10))

#         # Demonstrating task cancellation
#         await asyncio.sleep(1)  # Wait 1 second before canceling
#         print('Running other code...')
#         task2.cancel(msg='Took too long...')

#         # Handling cancellation with try-except
#         try:
#             data1 = await task1
#             data2 = await task2
#         except asyncio.CancelledError:
#             print('Task 2 was cancelled.')

#         # Displaying results
#         print(f'Data 1: {data1}')

#     except Exception as e:
#         print(f'An error occurred: {e}')

# # Running the async program
# if __name__ == '__main__':
#     asyncio.run(main())


#-----------------------------------------------------------------
# GATHER
# import asyncio
# from datetime import datetime

# # Async function to simulate data fetching
# async def fetch_data(input_data: str, delay: int, fail: bool = False) -> dict:
#     print(f'Fetching data for {input_data}...')

#     # Record the start time for the task
#     start_time = datetime.now()

#     # Simulate failure if 'fail' is set to True
#     if fail:
#         raise Exception(f'Task {input_data} failed.')

#     # Simulate a delay to mimic an API request
#     await asyncio.sleep(delay)

#     # Record the end time after the task completes
#     end_time = datetime.now()

#     # Print confirmation that data was retrieved
#     print(f'Data retrieved for {input_data}.')

#     # Return fetched data as a dictionary containing input, start, and end times
#     return {
#         'input': input_data,
#         'start_time': start_time.strftime('%H:%M:%S'),
#         'end_time': end_time.strftime('%H:%M:%S')
#     }

# # Main async function using GATHER
# async def main() -> None:
#     try:
#         tasks = await asyncio.gather(
#             fetch_data('1', 2),
#             fetch_data('2', 4),
#             fetch_data('3', 3, fail=True),
#             fetch_data('4', 1),
#             return_exceptions=True
#         )

#         print('\nResults:')
#         for result in tasks:
#             if isinstance(result, Exception):
#                 print(f'Error: {result}')
#             else:
#                 print(result)

#     except Exception as e:
#         print(f'An unexpected error occurred in main: {e}')

# if __name__ == '__main__':
#     asyncio.run(main())



#----------------------------------------------------------------------------