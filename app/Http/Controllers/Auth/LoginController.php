<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function showLoginForm()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        // Xác thực thông tin đăng nhập
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        // Kiểm tra thông tin đăng nhập
        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();

            // Chuyển hướng dựa trên vai trò của người dùng
            if (Auth::user()->role == 'admin') {
                return redirect()->intended('/admin/dashboard');
            } else {
                return redirect()->intended('/user/dashboard');
            }
        }

        // Thông tin đăng nhập không chính xác
        return back()->withErrors([
            'email' => 'Thông tin đăng nhập không chính xác.',
        ]);
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        // Chuyển hướng về trang đăng nhập sau khi đăng xuất
        return redirect()->route('login');
    }
}
