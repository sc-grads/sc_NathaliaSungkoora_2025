#NOTES PROJECT (SECTION 14)


from dataclasses import dataclass, field
from uuid import uuid4, UUID

# Note data class
@dataclass
class Note:
    id: UUID = field(init=False)  # Unique note ID
    title: str                  # Note title
    body: str                   # Note content

    def __post_init__(self)->None:
        self.id = uuid4()  # Generate unique ID

# Note-taking app class
class NoteApp:
    def __init__(self, author: str, notes: list[Note] | None=None) -> None:
        self.author = author

        if notes is None:
            self._notes =[]
        else:
            self._notes =notes #Underscore_ means variable should not be used outside class.
        
        self.display_instructions()

    @staticmethod
    def display_instructions() -> None:
        print('Welcome to the Notes!')
        print('Here are the commands: ')
        print('1 - Add a new note')
        print('2 - Edit a note')
        print('3 - Delete a note')
        print('4 - Display all notes')

#Defining the functionality
    def add_note(self) -> None:
        title: str = input('Title: ')
        body: str = input('Body: ')
        
        
        note: Note = Note(title, body)
        self._notes.append(note)
        print('Note was added.')

#Functionality that allows you to edit a note
    def edit_note(self) -> None:
        print('Which note would you like to edit?')
        self.show_notes()

        try:
            note_index: int = int(input('Index: ')) -1
            current: Note = self._notes[note_index]

            new_title: str = input('New title: ')
            new_body: str = input('New body: ')

            current.title = new_title
            current.body = new_body
            print('Note was updated')
        except IndexError: 
            print('Please select a valid note index...')
            self._edit_note()
        except ValueError:
            print('Index cannot be empty...')   
            print('Aborting operation.')  

#Functionality that allows you to delete a note
    def delete_note(self) -> None:
        print('Which note would you like to delete?')
        self.show_notes()

        try:
           note_index: int = int(input('Index: ')) -1
           del self._notes[note_index]
           print('Note was deleted!')  
            
        except IndexError: 
            print('Please select a valid note index...')
            self._delete_note()
        except ValueError:
            print('Index cannot be empty...')   
            print('Aborting operation.')  

#Functionality that allows you to show a note
    def show_notes(self) -> None:
        if not self._notes:
            print('No notes...')
            return
        for i, note in enumerate(self._notes, start=1):
            print(f'[{i}] {note.title}: {note.body}')
            
    def _select_option(self, user_input: str)-> None:
        if user_input not in ['1', '2', '3', '4']:
            print('Please pick a valid option')
            return

        if user_input == '1':
            self._add_note()
        elif user_input == '2':    
            self._edit_note()
        elif user_input == '3':    
            self._delete_note()
        elif user_input == '4':    
            self._show_notes()       

    def run_app(self)-> None:  
        while True:
            user_input: str = input('You: ')
            self._select_option(user_input)



# Main section
def main() -> None:
    sample_notes: list [Note] = [Note(title='Title1', body='Hello there, Bob!'),
                                 Note(title='Title2', body='More text!')]
    
    note_app: NoteApp =NoteApp(author='Bob', notes=sample_notes)
    note_app.run_app()

if __name__ == '__main__':
    main()


