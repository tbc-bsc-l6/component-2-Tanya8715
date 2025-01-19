<footer class="footer py-4">
  <div class="container-fluid">
    <div class="d-flex justify-content-between">
        
        <!-- Contact Info Section -->
        <div style="width: 45%;">
          <h5>Contact Information</h5>
          <p><strong>Address:</strong> Kathmandu, Nepal</p>
          <p><strong>Email:</strong> example@example.com</p>
          <p><strong>Phone:</strong> +977 123456789</p>

          <!-- Contact Form -->
          <form id="contactForm" method="POST" action="send-email.php">
            <div class="mb-3">
              <label for="name" class="form-label">Your Name</label>
              <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Your Email</label>
              <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
              <label for="message" class="form-label">Your Message</label>
              <textarea class="form-control" id="message" name="message" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Send</button>
          </form>
        </div>

        <!-- Google Map Embed (Moved to the right side) -->
        <div style="width: 45%;">
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3560.698736007761!2d85.32401971507334!3d27.717245982800794!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb19342b098063%3A0x4b19d63d4f1a6c39!2sKathmandu!5e0!3m2!1sen!2snp!4v1674398254517!5m2!1sen!2snp"
            width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"
            referrerpolicy="no-referrer-when-downgrade">
          </iframe>
        </div>
    </div>
  </div>
</footer>
