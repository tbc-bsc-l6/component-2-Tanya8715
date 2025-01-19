<!-- resources/views/contact.blade.php -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Form</title>
</head>
<body>
    <h1>Contact Us</h1>

    <form method="POST" action="{{ route('contact.send') }}">
        @csrf
        <label for="name">Your Name:</label>
        <input type="text" name="name" id="name" required>

        <label for="email">Your Email:</label>
        <input type="email" name="email" id="email" required>

        <label for="message">Your Message:</label>
        <textarea name="message" id="message" required></textarea>

        <button type="submit">Send Message</button>
    </form>
</body>
</html>
