<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>{{ Voyager::setting('site.title') }}</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
  <link rel="icon" type="image/x-icon" href="{{ Voyager::image(setting('site.logo')) }}">

  <!-- Google Web Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

  <!-- Icon Font Stylesheet -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

  {{-- Custom CSS --}}
  @yield('css')
  <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>

  <!-- Libraries Stylesheet -->
  <link href="{{ asset('lib/lightbox/css/lightbox.min.css') }}" rel="stylesheet">
  <link href="{{ asset('lib/owlcarousel/assets/owl.carousel.min.css') }}" rel="stylesheet">


  <!-- Customized Bootstrap Stylesheet -->
  <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">

  <!-- Template Stylesheet -->
  <link href="{{ asset('css/style.css') }}" rel="stylesheet">
</head>

<body>
  <!-- Spinner Start -->
  <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
  </div>
  <!-- Spinner End -->


  <!-- Navbar start -->
  <div class="container-fluid fixed-top">
    <div class="container topbar bg-primary d-none d-lg-block">
      <div class="d-flex justify-content-between">
        <div class="top-info ps-2">
          <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">{{ Voyager::setting('site.location') }}</a></small>
          <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">{{ Voyager::setting('site.email') }}</a></small>
        </div>
        <div class="top-link pe-2">
          <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
          <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
          <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
        </div>
      </div>
    </div>
    <div class="container px-0">
      <nav class="navbar navbar-light bg-white navbar-expand-xl">
        <a href="{{ route('shop.view') }}" class="navbar-brand">
          <h1 class="text-primary display-6">{{ Voyager::setting('site.title') }}</h1>
        </a>
        <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
          <span class="fa fa-bars text-primary"></span>
        </button>
        <div class="collapse navbar-collapse bg-white justify-content-end" id="navbarCollapse">
          <div class="d-flex m-3 me-0">
            <a href="{{ route('cart') }}" class="position-relative me-4 my-auto">
              <i class="fa fa-shopping-bag fa-2x"></i>
              <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;" x-text="$store.cart.count" x-data></span>
            </a>
            <a href="#" class="my-auto">
              <i class="fas fa-user fa-2x"></i>
            </a>
          </div>
        </div>
      </nav>
    </div>
  </div>
  <!-- Navbar End -->

  @yield('content')

  <!-- Copyright Start -->
  <div class="container-fluid copyright bg-dark py-4">
    <div class="container">
      <div class="row">
        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
          <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>{{ Voyager::setting('site.title') }}</a>, All right
            reserved.</span>
        </div>
      </div>
    </div>
  </div>
  <!-- Copyright End -->



  <!-- Back to Top -->
  <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>


  <!-- JavaScript Libraries -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="{{ asset('lib/easing/easing.min.js') }}"></script>
  <script src="{{ asset('lib/waypoints/waypoints.min.js') }}"></script>
  <script src="{{ asset('lib/lightbox/js/lightbox.min.js') }}"></script>
  <script src="{{ asset('lib/owlcarousel/owl.carousel.min.js') }}"></script>

  <!-- Template Javascript -->
  <script src="{{ asset('js/main.js') }}"></script>

  <script>
    document.addEventListener('alpine:init', () => {
      Alpine.store('cart', {
        productsInCart: []
        , count: 0
        , init() {
          this.update();
        },

        update() {
          this.productsInCart = JSON.parse(localStorage.getItem('productsInCart')) || [];
          this.count = this.productsInCart.reduce((total, product) => total + product.count, 0);
          console.log('run');
          console.log(this.count);
        }
      })
    })

  </script>

  @yield('js')
</body>

</html>
