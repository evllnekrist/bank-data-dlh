<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Traits\PushLog;
use App\Models\User;
use App\Models\Usergroup;
use App\Models\Role;
use App\Models\Option;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;

class RegisteredUserController extends Controller
{
    use PushLog;
    private $readable_name    = 'Pengguna'; 

    public function index()
    {
        $data['user_groups'] = UserGroup::orderBy('id','desc')->get();
        $data['roles'] = Role::orderBy('id','desc')->get();
        $data['active_status'] = Option::where('type','ACTIVE_STATUS')->get();
        return view('auth.register-list',$data);
    }
    // -------------------------------------- CALLED BY AJAX ---------------------------- start
      public function get_list(Request $request)
      {
        $filter['equal']  = ['role_id','user_group_id','is_enabled'];
        $filter['search'] = ['name','email'];
        return $this->get_list_common($request, 'User', $filter, ['role_attr','user_group_attr']);
      }
      public function post_delete($id)
      {
          try {
            $output = User::where('id', $id)->delete();
            $output_final = array('status'=>true, 'message'=>'Berhasil menghapus data', 'data'=>$output);;
          } catch (Exception $e) {
            $output_final = array('status'=>false, 'message'=>$e->getMessage(), 'data'=>null);
          }
          $this->LogRequest('Hapus '.$this->readable_name,$id,$output_final);
          return json_encode($output_final);
      }
    // -------------------------------------- CALLED BY AJAX ---------------------------- end
    
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        $data['user_groups'] = UserGroup::orderBy('id','desc')->get();
        $data['roles'] = Role::orderBy('id','desc')->get();
        return view('auth.register',$data);
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'role_id' => ['required'],
            'user_group_id' => ['required'],
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        $user = User::create([
            'role_id'       => $request->role_id,
            'user_group_id' => $request->user_group_id,
            'name'          => $request->name,
            'email'         => $request->email,
            'password'      => Hash::make($request->password),
        ]);

        event(new Registered($user));

        $request->request->remove('password');
        $request->request->remove('password_confirmation');
        $this->LogRequest('Tambah '.$this->readable_name,$request,$user);

        // // AUTO LOGIN:
        // Auth::login($user); 
        // return redirect(RouteServiceProvider::HOME);
        // // BACK TO USER LIST:
        return redirect(route('user'));
    }
}
