<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>
    <link rel="stylesheet" href="{{ asset('css/auth.css') }}">
</head>
<body>
    <div class="container">
        <h2>Đăng Ký</h2>
        <form method="POST" action="{{ route('register') }}">
            @csrf
            <div class="form-group">
                <label for="name">Tên</label>
                <input type="text" name="name" id="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" required>
            </div>
            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <input type="password" name="password" id="password" required>
            </div>
            <div class="form-group">
                <label for="password_confirmation">Xác nhận mật khẩu</label>
                <input type="password" name="password_confirmation" id="password_confirmation" required>
            </div>
            <button type="submit">Đăng Ký</button>
        </form>
        <p>Đã có tài khoản? <a href="{{ route('login') }}">Đăng nhập tại đây</a></p>
    </div>
</body>
</html>
