<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="{{route('dashboard')}}">
        <span class="ms-1 font-weight-bold text-white">CafeCraft</span>
      </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
      @php
        $currentRoute = \Route::currentRouteName();
      @endphp
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link text-white @if($currentRoute == "dashboard") active @endif" href="{{route('dashboard')}}">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">dashboard</i>
            </div>
            <span class="nav-link-text ms-1">Dashboard</span>
          </a>
        </li>
       
        
        <li class="nav-item">
          <a class="nav-link text-white @if(\Request::route()->getName() == "product") active @endif" href="{{route('product')}}">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">inventory_2</i>
            </div>
            <span class="nav-link-text ms-1">Product</span>
          </a>
        </li>
       
       
        <li class="nav-item">
          <a class="nav-link text-white " href="{{route('logout')}}">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">logout</i>
            </div>
            <span class="nav-link-text ms-1">Logout</span>
          </a>
        </li>
      </ul>
    </div>
  </aside>