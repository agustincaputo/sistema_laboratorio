<!DOCTYPE html>
<html lang="es">

<head>
    @include('commons.header')
</head>

<body>
  <header>    
    @include('bars.navbar')
    @include('bars.sidebar')
  </header>
  
  <main class="pt-5 mx-lg-5">
      <br><br>
      <div class="container">
        @yield('content')
      </div>
  </main>
    
  <footer class="page-footer text-center font-small primary-color-dark darken-2 mt-4 wow fadeIn">
  </footer>
@include('commons.footer')

</body>

</html>

