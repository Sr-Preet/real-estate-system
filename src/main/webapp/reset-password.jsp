<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #e9ecef;
        }

        .container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
        }

        input[type="password"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
        }

        button {
            background-color: #3498db;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #2980b9;
        }

        .error-message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Reset Password</h1>
    <form action="reset-password" method="post">
        <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
        <label for="newPassword">New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required>
        <button type="submit">Reset Password</button>
    </form>
</body>
</html>
