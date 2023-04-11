<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $title }}</title>

    <link href="{{ url('css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ url('font-awesome/font-awesome.css') }}" rel="stylesheet">
    <link href="{{ url('css/animate.css') }}" rel="stylesheet">
    <link href="{{ url('css/style.css') }}" rel="stylesheet">
    <link href="{{ url('css/custom.css') }}" rel="stylesheet">
    <link rel="shortcut icon" href="<?=url("img/favicon.png")?>">
    <script src="{{ url('js/jquery-3.1.1.min.js') }}"></script>
    <script src="{{ url('js/bootstrap.min.js') }}"></script>
</head>

<body class="dark-bg">


    <?php print $content; ?>

    <!-- Mainly scripts -->

</body>

</html>
