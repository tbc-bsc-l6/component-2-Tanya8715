@extends('layout.master')
@section('content')
<body class="bg-gray-200">
  <main class="main-content mt-0">
    <div class="page-header align-items-start min-vh-100" style="background-image: url('{{ asset('images/backgroundimage.jpg') }}');">
      <span class="mask bg-gradient-dark opacity-6"></span>
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-4 col-md-8 col-12 mx-auto">
            <div class="card z-index-0 fadeIn3 fadeInBottom" style="background-color: #f5f5dc; border-radius: 10px;">
              <div class="card-header p-4 text-center" style="background-color: transparent; border-bottom: none;">
                <h4 class="text-dark font-weight-bold mt-2 mb-0">Sign in</h4>
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
                <form role="form" class="text-start" method="POST" action="{{ route('login') }}">
                  @csrf
                  <!-- Email Field -->
                  <label class="form-label">Email</label>
                  <div class="input-group input-group-outline mb-4">
                    <input type="email" class="form-control" name="email" autocomplete="off" required>
                  </div>

                  <!-- Password Field -->
                  <label class="form-label">Password</label>
                  <div class="input-group input-group-outline mb-4">
                    <input type="password" class="form-control" name="password" required>
                  </div>

                  <!-- Remember Me Checkbox -->
                  <div class="form-check form-switch d-flex align-items-center mb-3">
                    <input class="form-check-input" type="checkbox" id="rememberMe" name="remember" checked>
                    <label class="form-check-label mb-0 ms-3" for="rememberMe">Remember me</label>
                  </div>

                  <!-- Sign In Button -->
                  <div class="text-center">
                    <button type="submit" class="btn w-100 my-4 mb-2" style="background-color: #d7b98e; color: #3b2d1f; font-weight: bold;">Sign in</button>
                  </div>
                </form>

                <!-- Register Link -->
                <div class="text-center">
                  <p class="mt-4 mb-0" style="color: #5f4b3b;">Don't have an account? 
                    <a href="{{ route('register') }}" style="color: #c49770; font-weight: bold;">Register here</a>
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
