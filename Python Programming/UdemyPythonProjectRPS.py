#ROCK, PAPER, SCISSORS PROJECT
import random
import sys

print('Welcome to RPS!')
moves = {'rock': '🪨', 'paper': '📃', 'scissors': '✂️'}
valid_moves = list(moves.keys())

while True:
    user_move = input('rock, paper, or scissors? >> ').lower()

    if user_move == 'exit':
        print('Thanks for playing!')
        sys.exit()

    if user_move not in valid_moves:
        print('Invalid move...')
        continue

    ai_move = random.choice(valid_moves)

    print('------')
    print(f'You: {moves[user_move]}')
    print(f'AI: {moves[ai_move]}')
    print('------')

    if user_move == ai_move:
        print('It is a tie!')
    elif user_move == 'rock' and ai_move == 'scissors':
        print('You win!')
    elif user_move == 'scissors' and ai_move == 'paper':
        print('You win!')
    elif user_move == 'paper' and ai_move == 'rock':
        print('You win!')
    else:
        print('AI wins...')
