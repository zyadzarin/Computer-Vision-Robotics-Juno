from flask import Flask, request, render_template
import telebot
from datetime import datetime
import pytz

# TOKENS
from dotenv import dotenv_values
config = dotenv_values('.env')
TOKEN = config['TOKEN']
CHAT_ID = config['CHAT_ID']
# TOKEN = '6055578633:AAHQEr5OElX48LvC0ghPNS2ZpEPffY9RvcA'
# CHAT_ID = '-984992834'


# INSTANCES
bot = telebot.TeleBot(TOKEN)
app = Flask(__name__)

# ENDPOINTS
@app.route('/')
def index():
    return render_template('guide.html')

@app.route('/notify', methods=['GET', 'POST'])
def send_message():
    if 'photo' in request.files:
        photo = request.files['photo']
        photo.save('saved_image.jpg')

        now = datetime.now()
        target_timezone = pytz.timezone('Asia/Shanghai')
        current_time = now.astimezone(target_timezone).strftime("%d/%m/%Y %H:%M:%S")

        if 'caption' in request.files:
            caption = f"{current_time}   {request.files['caption'].read().decode('utf-8')}"
        else:
            caption = current_time

        with open('saved_image.jpg', 'rb') as photo_file:
            bot.send_photo(chat_id=CHAT_ID, photo=photo_file, caption=caption)

        return '<h1>Notification Sent!</h1>'
    else:
        # with open('./assets/sample_image.webp', 'rb') as photo:
        #     bot.send_photo(CHAT_ID, photo, caption="Error in invoked image!")
        print('Image needed!')
        return '<h1 style="color:red">Image needed!</h1>'
    

# RUN THE APP
if __name__ == '__main__':
    app.run()

# from flask import Flask
# app = Flask(__name__)

# @app.route('/')
# def index():
#     return 'use /notify to send a notification'

# if __name__ == '__main__':
#     app.run()