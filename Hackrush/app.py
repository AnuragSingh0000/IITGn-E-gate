from flask import Flask, render_template, request
from flask_mysqldb import MySQL
import qrcode
import io
import base64
import mysql.connector

app = Flask(__name__)

# Configure MySQL connection
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '#PASSWORD'
app.config['MYSQL_DB'] = 'iitgn'

# Initialize MySQL
ursql = MySQL(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/visitor', methods=['GET', 'POST'])
def visitor():
    if request.method == 'POST':
        # Retrieve form data
        full_name = request.form['fullName']
        place = request.form['place']
        age = request.form['age']
        phone_Number = request.form['phoneNumber']
        email = request.form['email']
        date_Of_Visit = request.form['dateOfVisit']
        date_Of_Leaving = request.form['dateOfLeaving']
        student_name = request.form['studentName']
        relationship = request.form['relationship']
        student_email = request.form['studentEmail']
        student_roll = request.form['rollNumber']
        student_Phone_number = request.form['studentPhoneNumber']
        
        

        # Verify student name in the iitgn database
        cursor = ursql.connection.cursor()
        cursor.execute("SELECT * FROM email WHERE emailid = %s", (student_email,))
        student_data = cursor.fetchone()
        
        if student_data:
            try:
                # If student name is found, add visitor information to the 'vis' table
                cursor.execute("INSERT INTO visit (visitor_name, place, age, phone_Number, email, date_Of_Visit, date_Of_Leaving, student_name, relationship, student_email, student_roll, student_Phone_number) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (full_name, place, age, phone_Number, email, date_Of_Visit, date_Of_Leaving, student_name, relationship, student_email, student_roll, student_Phone_number))
                ursql.connection.commit()
                cursor.close()

                # Generate QR code
                # Generate QR code
                qr_data = f"Full Name: {full_name}\n"
                qr_data += f"Place: {place}\n"
                qr_data += f"Age: {age}\n"
                qr_data += f"Phone Number: {phone_Number}\n"
                qr_data += f"Email: {email}\n"
                qr_data += f"Date of Visit: {date_Of_Visit}\n"
                qr_data += f"Date of Leaving: {date_Of_Leaving}\n"
                qr_data += f"Student Name: {student_name}\n"
                qr_data += f"Relationship: {relationship}\n"
                qr_data += f"Student Email: {student_email}\n"
                qr_data += f"Student Roll Number: {student_roll}\n"
                qr_data += f"Student Phone Number: {student_Phone_number}"
                qr_img = qrcode.make(qr_data)

                # Save QR code image to a BytesIO object
                qr_img_bytes = io.BytesIO()
                qr_img.save(qr_img_bytes, format='PNG')
                qr_img_bytes.seek(0)

                # Convert BytesIO object to base64-encoded string
                qr_img_base64 = base64.b64encode(qr_img_bytes.read()).decode()

                # Pass QR code image data to the template
                return render_template('qr_code.html', qr_img_base64=qr_img_base64)
            except Exception as e:
                return 'An error occurred while adding visitor information.'
        else:
            cursor.close()
            return 'Student name not found in the database'
    
    return render_template('visitor.html')

@app.route('/submit', methods=['POST'])
def submit():
    return visitor()



@app.route('/resident', methods=['GET', 'POST'])
def resident():
    if request.method == 'POST':
        student_email = request.form['email']

        # Verify student name in the iitgn database
        cursor = ursql.connection.cursor()
        cursor.execute("SELECT * FROM email WHERE emailid = %s", (student_email,))
        student_data = cursor.fetchone()
        
        if student_data:
            qr_data = f"Email: {student_email}\n"
            qr_img = qrcode.make(qr_data)

            qr_img_bytes = io.BytesIO()
            qr_img.save(qr_img_bytes, format='PNG')
            qr_img_bytes.seek(0)

            # Convert BytesIO object to base64-encoded string
            qr_img_base64 = base64.b64encode(qr_img_bytes.read()).decode()

            # Pass QR code image data to the template
            return render_template('qr_code.html', qr_img_base64=qr_img_base64)
        else:
            cursor.close()
            return 'Student name not found in the database'
    return render_template('resident.html')

@app.route('/generate_qr', methods=['POST'])
def generate_qr():
    return resident()

@app.route('/security-guard', methods=['GET', 'POST'])
def security_guard():
    if request.method == 'POST':
        # Retrieve form data
        email = request.form['email']
        password = request.form['password']

        # Verify student name in the iitgn database
        cursor = ursql.connection.cursor()
        cursor.execute("SELECT * FROM guard WHERE email = %s AND password = %s", (email, password))
        guard = cursor.fetchone()
        
        if guard:
            return render_template('choose.html')
        else:
            cursor.close()
            return "Guard Not Found"
           
    return render_template('security-guard.html')

# @app.route('/choose', methods=['POST'])
# def QR_Scanner():
#     return render_template('scanner.html')

# @app.route('/display', methods=['POST'])
# def display_table():
#     return render_template('display_table.html')

@app.route('/login', methods=['POST'])
def login():
    return security_guard()

@app.route('/scanner', methods=['GET'])
def scanner():
    try:
        # Connect to the database
        cursor = ursql.connection.cursor()

        # Query the MySQL table
        cursor.execute("SELECT * FROM vis")

        # Fetch all rows from the query result
        data = cursor.fetchall()

        # Close the cursor
        cursor.close()

        # Pass the data to the template and render it
        return render_template('scanner.html', data=data)
    except Exception as e:
        # Handle any errors that may occur during database operations
        return f"An error occurred: {str(e)}"

# Configure MySQL connection
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="#PASSWORD",
    database="iitgn"
)

# Create cursor
mycursor = mydb.cursor()
@app.route('/display')
def display_table():
    # Execute SQL query to fetch data from the database
    mycursor.execute("SELECT * FROM visit")
    # Fetch all rows
    rows = mycursor.fetchall()
    # Render HTML template with fetched data
    return render_template('display_table.html', rows=rows)

if __name__ == '__main__':
    app.run(debug=True)
