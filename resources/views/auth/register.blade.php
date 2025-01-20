@extends('layout.master')

@section('content')
<body class="bg-gray-200">
  <main class="main-content min-vh-100" style="height: 100vh;">
    <div class="page-header align-items-start min-vh-100" style="background-image: url('{{ asset('images/backgroundimage.jpg') }}');">
      <span class="mask bg-gradient-dark opacity-6"></span>
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-4 col-md-8 col-12 mx-auto">
            <div class="card z-index-0 fadeIn3 fadeInBottom" style="background-color: #f5f5dc; border-radius: 10px;">
              <div class="card-header p-4 text-center" style="background-color: transparent; border-bottom: none;">
                <h4 class="text-dark font-weight-bold mt-2 mb-0">Registration Page</h4>
              </div>
              <div class="card-body">
                @if(\Session::has('error'))
                  <div class="alert alert-danger alert-dismissible text-white" role="alert">
                    <span class="text-sm">{{\Session::get('error')}}</span>
                    <button type="button" class="btn-close text-lg py-3 opacity-10" data-bs-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                @endif
                <form role="form" class="text-start" method="POST" action="{{ route('register') }}">
                  @csrf

                  <!-- Name Field -->
                  <label class="form-label">Full Name</label>
                  <div class="input-group input-group-outline mb-4">
                    <input type="text" class="form-control" name="name" value="{{ old('name') }}" required>
                  </div>

                  <!-- Email Field -->
                  <label class="form-label">Email</label>
                  <div class="input-group input-group-outline mb-4">
                    <input type="email" class="form-control" name="email" value="{{ old('email') }}" required>
                  </div>

                  <!-- Password Field -->
                  <label class="form-label">Password</label>
                  <div class="input-group input-group-outline mb-4">
                    <input type="password" class="form-control" name="password" required>
                  </div>

                  <!-- Confirm Password Field -->
                  <label class="form-label">Confirm Password</label>
                  <div class="input-group input-group-outline mb-4">
                    <input type="password" class="form-control" name="password_confirmation" required>
                  </div>

                  <!-- Terms and Conditions Checkbox -->
                  <div class="form-check form-switch d-flex align-items-center mb-3">
                    <input class="form-check-input" type="checkbox" id="terms" required>
                    <label class="form-check-label mb-0 ms-3" for="terms">I agree to the terms and conditions</label>
                  </div>

                  <!-- Register Button -->
                  <div class="text-center">
                    <button type="submit" class="btn w-100 my-4 mb-2" style="background-color: #d7b98e; color: #3b2d1f; font-weight: bold;">Register</button>
                  </div>
                </form>
                <div class="text-center">
                  <p class="mt-4 mb-0" style="color: #5f4b3b;">Already have an account? 
                    <a href="{{ route('login') }}" style="color: #c49770; font-weight: bold;">Sign in here</a>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
</body>
@endsection
