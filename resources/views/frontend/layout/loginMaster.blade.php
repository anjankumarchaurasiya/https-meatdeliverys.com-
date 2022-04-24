<!DOCTYPE html>
<html lang="en">

	<head>
		@php
			$company = \App\CompanySetting::first(['name','favicon']);
		@endphp
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, shrink-to-fit=9">
		<title> {{$company->name}}  | @yield('title') </title>
		
		<!-- Favicon Icon -->
		<link rel="icon" type="image/png" href="{{ url('images/upload/'.$company->favicon) }}">
		
		<!-- Stylesheets -->
		<link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&display=swap" rel="stylesheet">
		<link href="{{ asset('frontend/css/unicons.css') }}" rel='stylesheet'>
		<link href="{{ asset('frontend/css/style.css') }}" rel="stylesheet">
		<link href="{{ asset('frontend/css/responsive.css') }}" rel="stylesheet">
		<link href="{{ asset('frontend/css/night-mode.css') }}" rel="stylesheet">
		
		<!-- Vendor Stylesheets -->
        <link href="{{ asset('frontend/css/all.min.css') }}" rel="stylesheet">
		<link href="{{ asset('frontend/css/bootstrap.min.css') }}" rel="stylesheet">
		<link href="{{ asset('frontend/css/semantic.min.css') }}" rel="stylesheet">
		
	</head>

<body>
<!-- start per-loader -->
<div class="loader-container">
	<div class="loader-ripple">
		<div></div>
		<div></div>
	</div>
</div>
<!-- end per-loader -->
	@yield('content')

	<!-- Javascripts -->
    <script src="{{ asset('frontend/js/jquery-3.3.1.min.js') }}"></script>
	<script src="{{ asset('frontend/js/bootstrap.bundle.min.js') }}"></script>
	<script src="{{ asset('frontend/js/custom.js') }}"></script>
	<script src="{{ asset('frontend/js/night-mode.js') }}"></script>
	<script src="{{ asset('frontend/js/frontend.js') }}"></script>
	
</body>
</html>