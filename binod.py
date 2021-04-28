import requests
import datetime
import time
import sys

# URL to the form you want to fill. formResponse should be used instead of viewform
url = 'https://docs.google.com/forms/u/2/d/e/1FAIpQLSdLgq-kC4FJR3Lzy5aSVJlWLCl3wPQKrPuLSq9IUphqP6CExg/formResponse'


def get_values():
    """It returns a list of different form data to be submitted by send_attendance method.
    subjects_time is a dictionary with Day as keys and time and subjects in a list as values.
    value_list is a list of lectures' subject and time of current_day."""

    values_list = []

    contacts =[]
    ins = open( "google.txt", "r")
    for line in ins:
        number_strings = line.split() # Split the line on runs of whitespace
        # numbers = [int(n) for n in number_strings] # Convert to integers
        contacts.append(number_strings) # Add the "row" to your list.

    for i in contacts:
        '''keys are the value of 'name' element of the '''
        values = {
            # Class Code
            "entry.540990633": i[0]+" "+i[1],
            # Name

            'entry.5072671': i[2],

            # comfort
            'entry.21673923': "Yes",

            # ever had online before
            'entry.341765341': 'No',

            # fruit
            'entry.1085917811': 'Yes',

            # updatedfeatures
            # Aggregate marks
            'entry.421448635': 'SMS notification',
            'entry.421448635': 'Suggestions to the student',
            'entry.421448635': 'Result Analytics',
            
            #position
            "entry.1592897087": "No",

            # comfort
            "entry.1395616192": "Yes",
            
            # detailed
            "entry.1327226986": "No",

            # feedback
            'entry.1647261792': '',
        }

        values_list.append(values)

    return values_list


def send_attendance(url, data):
    """It takes google form url which is to be submitted and also data which is a list of data to be submitted in the form iteratively."""

    for d in data:
        try:
            requests.post(url, data=d)
            print("Form Submitted.")
            time.sleep(2)
        except:
            print("Error Occured!")


final_data = get_values()

send_attendance(url, final_data)