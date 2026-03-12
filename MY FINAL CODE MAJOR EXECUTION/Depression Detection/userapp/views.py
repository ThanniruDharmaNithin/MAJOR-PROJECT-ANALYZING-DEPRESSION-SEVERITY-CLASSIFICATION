from django.shortcuts import render,redirect
from django.contrib import messages
import urllib.request
import urllib.parse
from django.contrib.auth import logout
from django.core.mail import send_mail
import os
import random
from django.conf import settings
from userapp.models import *
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
from io import BytesIO
from django.http import HttpResponse
import base64
from django.utils.datastructures import MultiValueDictKeyError
from django.urls import reverse
import requests
import openai

# Create your views here.

def user_logout(request):
    logout(request)
    messages.info(request, "Logout Successfully ")
    return redirect("user_login")

EMAIL_HOST_USER = os.environ.get('EMAIL_HOST_USER')
EMAIL_HOST_PASSWORD = os.environ.get('EMAIL_HOST_PASSWORD')

def sendSMS(user, otp, mobile):
    data = urllib.parse.urlencode(
        {
            "username": "Analyzing Depression Severity",
            "apikey": "56dbbdc9cea86b276f6c",
            "mobile": mobile,
            "message": f"Hello {user}, your OTP for account activation is {otp}. This message is generated from server. Thank you",
            "senderid": "Severity",
        }
    )
    data = data.encode("utf-8")
    request = urllib.request.Request("https://smslogin.co/v3/api.php?")
    f = urllib.request.urlopen(request, data)
    return f.read()

def generate_otp(length=4):
    otp = "".join(random.choices("0123456789", k=length))
    return otp

# Create your views here.

def index(request):
    return render(request,"index.html")



def about(request):
    return render(request,"about.html")




def user_login(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]
        try:
            user = User.objects.get(email=email)
            if user.password != password:
                messages.error(request, "Incorrect password.")
                return redirect("user_login")
            if user.status == "Accepted":
                if user.otp_status == "Verified":
                    request.session["user_id_after_login"] = user.pk
                    messages.success(request, "Login successful!")
                    return redirect("user_dashboard")
                else:
                    new_otp = generate_otp()
                    user.otp = new_otp
                    user.otp_status = "Not Verified"
                    user.save()
                    subject = "New OTP for Verification"
                    message = f"Your new OTP for verification is: {new_otp}"
                    from_email = settings.EMAIL_HOST_USER
                    recipient_list = [user.email]
                    send_mail(
                        subject, message, from_email, recipient_list, fail_silently=False
                    )
                    sendSMS(user.full_name, new_otp, user.phone_number)
                    messages.warning(
                        request,
                        "OTP not verified. A new OTP has been sent to your email and phone.",
                    )
                    request.session["id_for_otp_verification_user"] = user.pk
                    return redirect("user_otp")
            else:
                messages.success(request, "Your Account is Not Accepted by Admin Yet")
                return redirect("user_login")
        except User.DoesNotExist:
            messages.error(request, "No User Found.")
            return redirect("user_login")
    return render(request,"user-login.html")




def user_register(request):
    if request.method == "POST":
        full_name = request.POST.get('full_name')
        email = request.POST.get('email')
        password = request.POST.get('password') 
        phone_number = request.POST.get('phone_number')
        age = request.POST.get('age')
        address = request.POST.get('address')
        photo = request.FILES.get('photo')
        if User.objects.filter(email=email).exists():
            messages.error(request, "An account with this email already exists.")
            return redirect('user_register') 
        user = User(
            full_name=full_name,
            email=email,
            password=password, 
            phone_number=phone_number,
            age=age,
            address=address,
            photo=photo
        )
        otp = generate_otp()
        user.otp = otp
        user.save()
        subject = "OTP Verification for Account Activation"
        message = f"Hello {full_name},\n\nYour OTP for account activation is: {otp}\n\nIf you did not request this OTP, please ignore this email."
        from_email = settings.EMAIL_HOST_USER
        recipient_list = [email]
        request.session["id_for_otp_verification_user"] = user.pk
        send_mail(subject, message, from_email, recipient_list, fail_silently=False)
        if sendSMS:
            sendSMS(full_name, otp, phone_number)
        messages.success(request, "Otp is sent your mail !")
        return redirect("user_otp")
    return render(request,"user-register.html")




def user_otp(request):
    otp_user_id = request.session.get("id_for_otp_verification_user")
    if not otp_user_id:
        messages.error(request, "No OTP session found. Please try again.")
        return redirect("user_register")
    if request.method == "POST":
        entered_otp = "".join(
            [
                request.POST["first"],
                request.POST["second"],
                request.POST["third"],
                request.POST["fourth"],
            ]
        )
        try:
            user = User.objects.get(id=otp_user_id)
        except User.DoesNotExist:
            messages.error(request, "User not found. Please try again.")
            return redirect("user_register")
        if user.otp == entered_otp:
            user.otp_status = "Verified"
            user.save()
            messages.success(request, "OTP verification successful!")
            return redirect("user_login")
        else:
            messages.error(request, "Incorrect OTP. Please try again.")
            return redirect("user_otp")
    return render(request,"user-otp.html")








def admin_login(request):
    if request.method == "POST":
        username = request.POST.get('name')
        password = request.POST.get('password')
        if username == 'GCET' and password == 'b16':
            messages.success(request, 'Login Successful')
            return redirect('admin_dashboard')
        else:
            messages.error(request, 'Invalid details !')
            return redirect('admin_login')
    return render(request,"admin-login.html")



def contact(request):
    return render(request,"contact.html")





def user_dashboard(request):
    return render(request,"user-dashboard.html")



def phq_detection(request):
    if request.method == "POST":
        ques1 = int(request.POST.get('radio1'))
        ques2 = int(request.POST.get('radio2'))
        ques3 = int(request.POST.get('radio3'))
        ques4 = int(request.POST.get('radio4'))
        ques5 = int(request.POST.get('radio5'))
        ques6 = int(request.POST.get('radio6'))
        ques7 = int(request.POST.get('radio7'))
        ques8 = int(request.POST.get('radio8'))
        ques9 = int(request.POST.get('radio9'))
        health_score = ques1 + ques2 + ques3 + ques4 + ques5 + ques6 + ques7 + ques8 + ques9
        
        if 0 <= health_score <= 4:
            depression_severity = 'Minimal depression'
        elif 5 <= health_score <= 9:
            depression_severity = 'Mild depression'
        elif 10 <= health_score <= 14:
            depression_severity = 'Moderate depression'
        elif 15 <= health_score <= 19:
            depression_severity = 'Moderately severe depression'
        else:
            depression_severity = 'Severe depression'
        
        result_message = f'Your score from this PHQ test is {health_score} and Your depression stage is: {depression_severity}'
        messages.success(request, result_message)
        
        if health_score > 4:
            suggestion_message = (
                "Suggestions for You: Speak with a mental health professional or counselor, "
                "maintain a regular routine of exercise and good sleep, stay connected with supportive "
                "friends and family, practice mindfulness or relaxation techniques like deep breathing, "
                "and if you ever feel unsafe or suicidal, please reach out to emergency services immediately."
            )
            messages.info(request, suggestion_message)
        
        print(health_score, "this is the health score and depression_severity is:", depression_severity)
        return redirect('phq_detection')
    
    return render(request, "phq_detection.html")




from django.http import JsonResponse
from django.shortcuts import render


import re
from nltk.stem import WordNetLemmatizer
import pickle    

import nltk
nltk.download('wordnet')



wo = WordNetLemmatizer()

def preprocess(data):
    # Preprocess
    a = re.sub('[^a-zA-Z]', ' ', data)
    a = a.lower()
    a = a.split()
    a = [wo.lemmatize(word) for word in a]
    a = ' '.join(a)
    return a

tfidf_vectorizer = pickle.load(open('text_models/vectorizer.pkl', 'rb'))
text_model = pickle.load(open('text_models/prediction.pkl', 'rb'))


def text_detection(request):
    if request.method == "POST":
        user_message = request.POST.get('message')
        print("User message:", user_message)
        
        processed_text = preprocess(user_message)
        vectorized_text = tfidf_vectorizer.transform([processed_text])
        
        prediction = text_model.predict(vectorized_text)
        
        if prediction[0] == 1:
            result = "Depression Detected"
        else:
            result = "No Depression Detected"
        
        return JsonResponse({'response': result})
    
    return render(request, "text_detection.html")



import os
import base64
import numpy as np
from collections import Counter
from django.conf import settings
from django.shortcuts import render
from keras.preprocessing.image import img_to_array
from tensorflow.keras.models import load_model
from tensorflow.keras.applications.mobilenet_v2 import preprocess_input

# For frame extraction
import cv2
from PIL import Image

# Load your model once
model = load_model('mobilnet.h5')

# Emotion class dictionary
class_dict = {
    0: 'angry',
    1: 'disgust',
    2: 'fear',
    3: 'happy',
    4: 'neutral',
    5: 'sad',
    6: 'surprise'
}

def live_detection(request):
    context = {}
    if request.method == 'POST':
        video_data = request.POST.get('video_data')
        user_text = request.POST.get('user_text')  # Get user input text
        if video_data:
            # Decode base64 video data
            header, video_str = video_data.split(';base64,')
            video_bytes = base64.b64decode(video_str)
            
            # Save the video locally
            save_dir = os.path.join(settings.MEDIA_ROOT, 'captured_videos')
            if not os.path.exists(save_dir):
                os.makedirs(save_dir)
            video_filename = 'captured_video.webm'
            file_path = os.path.join(save_dir, video_filename)
            with open(file_path, 'wb') as f:
                f.write(video_bytes)
            print(f"Video saved at: {file_path}")

            # Process the video: extract frames and run predictions
            cap = cv2.VideoCapture(file_path)
            frame_predictions = []
            while True:
                ret, frame = cap.read()
                if not ret:
                    break
                # Convert frame from BGR to RGB and resize
                frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                pil_image = Image.fromarray(frame)
                pil_image = pil_image.resize((224, 224))
                # Preprocess frame for model prediction
                img_array = img_to_array(pil_image)
                img_array = np.expand_dims(img_array, axis=0)
                img_array = preprocess_input(img_array)
                # Get prediction for the frame
                prediction = model.predict(img_array)
                predicted_index = np.argmax(prediction)
                frame_predictions.append(predicted_index)
            cap.release()
            
            # Aggregate predictions across frames (majority vote)
            if frame_predictions:
                most_common = Counter(frame_predictions).most_common(1)[0][0]
                predicted_emotion = class_dict[most_common]
            else:
                predicted_emotion = "unknown"

            print(f"Predicted Emotion: {predicted_emotion}")
            print(f"User Text: {user_text}")
            
            # Pass results to the template context
            context['predicted_emotion'] = predicted_emotion
            context['user_text'] = user_text

    return render(request, "live_detection.html", context)





# user-profile Function
def profile(req):
    user_id = req.session["user_id_after_login"]
    user = User.objects.get(pk = user_id)
    if req.method == 'POST':
        user_name = req.POST.get('userName')
        user_age = req.POST.get('userAge')
        user_phone = req.POST.get('userPhNum')
        user_email = req.POST.get('userEmail')
        user_address = req.POST.get("userAddress")
        password = req.POST.get("password")
        # user_img = request.POST.get("userimg")

        user.full_name = user_name
        user.age = user_age
        user.address = user_address
        user.phone_number = user_phone
        user.password = password

        if len(req.FILES) != 0:
            image = req.FILES['profilepic']
            user.photo = image
            user.full_name = user_name
            user.age = user_age
            user.password = password
            user.save()
        else:
            user.full_name = user_name
            user.age = user_age
            user.password = password
            user.save()
        # print(user_name, user_age, user_phone, user_email, user_address)
    context = {"i":user}
    return render(req, 'user-profile.html', context)
