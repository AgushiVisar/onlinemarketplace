<!DOCTYPE html>
<html>

<head>
	<title>Login Form</title>

</head>

<body>

	<form>
		<div class="imgcontainer">
			<img src="img_avatar2.png" alt="Avatar" class="avatar">
		</div>

		<label for="username">Username:</label>
		<input type="text" placeholder="youremail@email.com" name="username " required>

		<label for="password">Password:</label>
		<input type="password" placeholder="Password" name="password " required>

		<label for="rememberMe">Remember me:</label>
		<input type="checkbox" id="rememberMe" name="rememberMe"><br><br>

		<button
			style="background-color: rgb(50, 50, 244); color: white; font-size: auto; height: 7%; width: 290px;margin:5px"
			onclick="login()">Login</button>

		<span style="margin:70px ;color: #385898;cursor:  pointer;text-decoration: underline; "
			onclick="forgotPassword()">Forgotten password?</span>


		<pre>   ------------------------------------   </pre>

		<button type="button" ; onclick="signup()">Create new account</button>


	</form>

	<script src="login.js"></script>
</body>

</html>

<style>

	imgcontainer {
		text-align: center;
		margin: 24px 0 12px 0;
		

	}

	img.avatar {
		height: auto;
		height: auto;
		width: 40%;
		border-radius: 50%;
		margin: 5px 0px 30px 80px;
	}

	.container {
		padding: 30px;
	}

	body {
		font-family: Arial, sans-serif;
		background-color:white;
	}

	form {
		margin: auto;
		width: 50%;
		padding: 10px;
		border: 1px solid #ccc;
		border-radius: 10px;
		height: 500px;
		width: 300px;
		background-color: white;
		box-shadow: 8px 8px 20px rgb(128, 128, 128);
		margin:65px auto;
        max-width: 300px;
	}

	input[type=text],
	input[type=password] {
		margin: 30px;
		width: 100%;
		padding: 12px 20px;
		margin: 10px 0;
		box-sizing: border-box;
		border: 2px solid #ccc;
		border-radius: 4px;
	}

	button[type=button] {
		background-color: rgb(133, 175, 74);
		color: white;
		padding: 10px 60px;
		margin: 8px 30px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		display: flex;
		justify-content: center;

	}

	button[type=button]:hover {
		background-color: rgb(49, 139, 73);
	}

	.error {
		color: red;
	}
</style>
<script>
	// Connect to MySQL database
	const mysql = require('mysql');

	const connection = mysql.createConnection({
		host: 'localhost',
		user: 'root',
		password: 'password',
		database: 'mydatabase'
	});

	connection.connect((err) => {
		if (err) throw err;
		console.log('Connected!');
	});

	function login() {
		// Retrieve username and password from the form
		let username = document.getElementById("username").value;
		let password = document.getElementById("password").value;

		// Check if username and password are valid
		connection.query(`SELECT * FROM users WHERE username = '${username}' AND password = '${password}'`, (err, result) => {
			if (err) throw err;
			if (result.length > 0) {
				// If "Remember Me" is checked, save the username and password in localStorage
				if (document.getElementById("rememberMe").checked) {
					localStorage.setItem("username", username);
					localStorage.setItem("password", password);
				}
				// Redirect to the home page
				window.location.href = "home.html";
			} else {
				// If username and/or password are invalid, display an error message
				document.getElementById("error").innerHTML = "Invalid username and/or password.";
			}
		});
	}

	function signup() {
		// Redirect to the sign up page
		window.location.href = "signup.html";
	}

	function forgotPassword() {
		// Redirect to the forgot password page
		window.location.href = "forgotpassword.html";
	}

// On page load, check if "Remember Me" was checked on

</script>
