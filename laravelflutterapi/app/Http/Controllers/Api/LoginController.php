<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function __invoke(Request $request)
    {
        $user = User::where('email', $request->email)
        ->firstOrFail();

        if ($user)
        {
            if (Hash::check($request->password, $user->password))
            {
                return $user;
            }
        }

        return response()->json(['error' => 'Not Found'], 404);

    }
}
