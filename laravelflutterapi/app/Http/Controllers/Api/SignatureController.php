<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SignatureController extends Controller
{
    public function __invoke(Request $request, $id)
    {
        $user = User::find($id);

        $data = $request->all();

        $user->update($data);

        return $user;
    }
}
