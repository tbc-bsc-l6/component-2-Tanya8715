@extends('layout.master')

@section('content')
<body class="g-sidenav-show bg-gray-200" style="margin: 0; padding: 0;">

  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Dashboard</li>
          </ol>
          <h6 class="font-weight-bolder mb-0">Welcome to CafeCraft</h6>  <!-- Updated navbar title -->
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center">
          </div>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->

    <!-- Full-screen Image with Title and Slogan -->
    <div style="text-align: center; margin: 0; padding: 0; position: relative;">
      <img src="{{ asset('images/background.webp') }}" alt="Beautiful coffee cup with latte art" 
           style="width: 100vw; height: 100vh; object-fit: cover; border-radius: 0;">
      <!-- CafeCraft Title without Box and moved down -->
      <h1 style="position: absolute; top: 60%; left: 50%; transform: translateX(-50%); 
                 font-size: 4rem; color: white; font-weight: bold;">
        Welcome to CafeCraft
      </h1>
      <!-- Slogan below the title -->
      <p style="position: absolute; top: 80%; left: 50%; transform: translateX(-50%); 
                font-size: 1.5rem; color: white; font-weight: lighter; margin-top: 20px;">
        Brewing moments, one cup at a time.
      </p>
    </div>

  </main>
 
</body>
@endsection

@section('js')
<script src="{{asset('assets/js/plugins/chartjs.min.js')}}"></script>
<script>
  var ctx = document.getElementById("chart-bars").getContext("2d");
</script>
@endsection
