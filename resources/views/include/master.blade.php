<!DOCTYPE html>
<html>

<head>

    <title>@yield('title','Inventory')</title>

    @include('include.header')
    <style>
        .select2 {

            width: 100% !important;
        }
    </style>
</head>

<body class="theme-teal" onload="loaded()">
    <!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="preloader">
                <div class="spinner-layer pl-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
            <p>Por favor espera...</p>
        </div>
    </div>
    <!-- #END# Page Loader -->
    <!-- Top Bar -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="javascript:void(0);" class="bars"></a>
                <a class="navbar-brand" href="{{ url('/') }}" title=""><img class="img-fluid" src="{{ url('images/logo.png') }}" alt=" logo" style="height: 40px;"></a>
            </div>
        </div>
    </nav>
    <!-- #Top Bar -->
    <section>

        @include('include.sidebar')


        <section class="content">
            <div id="inventory" class="container-fluid">
                <div class="block-header">
                    <h2>@yield('page-title')</h2>
                </div>

                <!-- Widgets -->

                @yield('content')

            </div>
        </section>

        @include('include.footer')

        <script type="text/javascript">
            var base_url = "{{ url('/').'/' }}";
        </script>

        <script type="text/javascript">
            function loaded() {
                var segment3 = '{{ Request::segment(1) }}';
                var current_url = base_url + segment3;
                $('a[href="' + current_url + '"]').parents('.ml-menu').siblings('a').addClass('toggled');
                $('a[href="' + current_url + '"]').parents('.ml-menu').css('display', 'block');
            }
        </script>


        @stack('script')


</body>

</html>