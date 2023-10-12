<?php

namespace App\Http\Controllers\Api;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return User::latest('id')->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->all();

        $user = User::create($data);

        return $user;
    }

    /**
     * Display the specified resource.
     */
    public function show(User $user)
    {
        return $user;
    }

    /**
     * Display the specified resource.
     */
    public function photo(Request $request, User $user)
    {
        if ($request->hasFile('photo'))
        {
            // Dapatkan fail daripada field fail_sokongan borang permohonan
            $file = $request->file('photo');

            // Simpan fail yang diupload ke dalam folder dokumen
            // yang akan dicipta dalam folder public/uploaded.
            // Seterusnya dapatkan dapatkan nama baru file yang telah diupload
            // function ->store('nama_folder', 'nama_disks_dalam_filesystem.php')
            $namaBaruFile = $file->store('photos', 'public_uploaded');

            // Simpan nama baru fail sokongan yang diupload ke dalam table permohonan
            $data['photo'] = asset('uploaded') . '/' . $namaBaruFile;

            $user->update($data);

            return response()->json([
                'message' => 'Fail berjaya dimuatnaik'
            ], 200);
        }

        return response()->json([
            'message' => $request->all()
        ], 400);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $user)
    {
        $data = $request->except('password');

        if ($request->has('password') && $request->filled('password'))
        {
            $data['password'] = $request->input('password');
        }

        $user->update($data);

        return $user;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $user)
    {
        $user->delete();

        return response()->json([
            'message' => 'Rekod berjaya dihapuskan'
        ], 204);
    }

  public function search(Request $request)
  {
        $result = User::select('name',  DB::raw('CAST(id AS CHAR) as user_id'))->get();
        // Cast id to user_id to avoid integer problem in flutterflow dropdown

        return $result;
  }












}
