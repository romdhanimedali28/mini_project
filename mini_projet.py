import RPi.GPIO as GPIO
import time
import pyrebase
import cv2
import numpy as np
import face_recognition
import os 
config = {
  "apiKey": "AIzaSyD5GzGZicqkrJO9Wca1u3tIU3t7nCrCljs",
  "authDomain": "watchful-gear-370209.firebaseapp.com",
  "databaseURL": "https://watchful-gear-370209-default-rtdb.firebaseio.com",
  "projectId": "watchful-gear-370209",
  "storageBucket": "watchful-gear-370209.appspot.com",
  "messagingSenderId": "884698929499",
  "appId": "1:884698929499:web:b8760e6bb5f3b47519227e"
}

def testface():
	path = 'person'
	images = []
	classNames = []
	personsList = os.listdir(path)
	for cl in personsList:
		curPersonn = cv2.imread(f'{path}/{cl}')
		images.append(curPersonn)
		classNames.append(os.path.splitext(cl)[0])
	print(classNames)

	def findEncodeings(image):
		encodeList = []
		for img in images:
			img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
			encode = face_recognition.face_encodings(img)[0]
			encodeList.append(encode)
		return encodeList

	encodeListKnown = findEncodeings(images)
	print('Encoding Complete.')
	cap = cv2.VideoCapture(0)
	while True:
		_, img = cap.read()
		imgS = cv2.resize(img, (0,0), None, 0.25, 0.25)
		imgS = cv2.cvtColor(imgS, cv2.COLOR_BGR2RGB)
		faceCurentFrame = face_recognition.face_locations(imgS)
		encodeCurentFrame = face_recognition.face_encodings(imgS, faceCurentFrame)
		for encodeface, faceLoc in zip(encodeCurentFrame, faceCurentFrame):
			matches = face_recognition.compare_faces(encodeListKnown, encodeface)
			faceDis = face_recognition.face_distance(encodeListKnown, encodeface)
			matchIndex = np.argmin(faceDis)
			name =""
			print(faceDis)
			if faceDis < 0.5 :
				name = classNames[matchIndex]
			else :
				name = "unKnow"
			print(name)
			y1, x2, y2, x1 = faceLoc
			y1, x2, y2, x1 = y1*4, x2*4, y2*4, x1*4
			cv2.rectangle(img, (x1, y1), (x2, y2), (0,0,255), 2)
			cv2.rectangle(img, (x1,y2-35), (x2,y2), (0,0,255), cv2.FILLED)
			cv2.putText(img, name, (x1+6, y2-6), cv2.FONT_HERSHEY_COMPLEX, 1, (255,255,255), 2)
		cv2.imshow('Face Recogntion', img)
		cv2.waitKey(1)  
firebase = pyrebase.initialize_app(config)
database= firebase.database()
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
TRIG = 22
ECHO = 27
GPIO.setup(TRIG,GPIO.OUT)
GPIO.setup(ECHO,GPIO.IN)
GPIO.output(TRIG, False)
print ('Waiting a few seconds for the sensor to settle')
time.sleep(2)
GPIO.output(TRIG, True)
time.sleep(0.00001)
GPIO.output(TRIG, False)
while True:
	print ('Waiting For Sensor To Settle')
	time.sleep(2)
	GPIO.output(TRIG,True)
	time.sleep(0.00001)
	GPIO.output(TRIG,False)
	while GPIO.input(ECHO)==0:
		debut_Impulsion=time.time()
	while GPIO.input(ECHO)==1:
		fin_Impulsion=time.time()	
	distance= round((fin_Impulsion-debut_Impulsion)*340*100/2,2)
	print(distance)
	if(distance < 20):
		database.child("data/open").set(1)
		testface()	
	else:
		database.child("data/open").set(0)			
	
	
	
