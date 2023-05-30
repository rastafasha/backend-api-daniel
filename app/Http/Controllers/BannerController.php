<?php

namespace App\Http\Controllers;

use App\Models\Banner;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Str;

class BannerController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $banners = Banner::get();

        return response()->json([
            'code' => 200,
            'status' => 'List banners',
            'banners' => $banners,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function bannerStore(Request $request)
    {

        return Banner::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function bannerShow(Banner $banner)
    {

        if (!$banner) {
            return response()->json([
                'message' => 'Post not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'banner' => $banner,
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function bannerUpdate(Request $request, $id)
    {
        $banner = Banner::findOrfail($id);
        $banner->title = $request->title;
        $banner->description = $request->description;
        $banner->url = $request->url;
        $banner->target = $request->target;
        $banner->gotBoton = $request->gotBoton;
        $banner->botonName = $request->botonName;
        $banner->status = $request->status;
        if(!empty($banner->image)){

            $banner->update();

        }else{
           $banner->image = $request->image;
        }
        $banner->update();
        return $banner;
    }

    public function bannerUpdateStatus(Request $request, $id)
    {
        $banner = Banner::findOrfail($id);
        $banner->status = $request->status;
        $banner->update();
        return $banner;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {

        $banner =  Banner::where('id', $id)->first();

        if(!empty($banner)){

             // borrar
             $banner->delete();
             // devolver respuesta
             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'banner' => $banner
             ];
         }else{
             $data = [
                 'code' => 404,
                 'status' => 'error',
                 'message' => 'el banner no existe'
             ];
         }

         return response()->json($data, $data['code']);
    }



    /**
     * @param UploadedFile $file
     * @return string
     */
    protected function generateFileName(UploadedFile $file): string {
        $extension = $file->getClientOriginalExtension();
        $fullName = $file->getClientOriginalName();
        $pathFileName = trim(pathinfo($fullName, PATHINFO_FILENAME));
        $secureMaxName = substr(Str::slug($pathFileName), 0, 90);
        return sprintf('%s-%s.%s', $secureMaxName, now()->timestamp, $extension);
    }




    public function upload(Request $request)
     {


         // recoger la imagen de la peticion
         $image = $request->file('file0');
         // validar la imagen
         $validate = \Validator::make($request->all(),[
             'file0' => 'required|image|mimes:jpg,jpeg,png,gif'
         ]);
         //guardar la imagen en un disco
         if(!$image || $validate->fails()){
             $data = [
                 'code' => 400,
                 'status' => 'error',
                 'message' => 'Error al subir la imagen'
             ];
         }else{



            $extension = $image->getClientOriginalExtension();
            $image_name = $image->getClientOriginalName();
            $pathFileName = trim(pathinfo($image_name, PATHINFO_FILENAME));
            $secureMaxName = substr(Str::slug($image_name), 0, 90);
            $image_name = now().$secureMaxName.'.'.$extension;

             \Storage::disk('banners')->put($image_name, \File::get($image));

             $data = [
                 'code' => 200,
                 'status' => 'success',
                 'image' => $image_name
             ];

         }

         return response()->json($data, $data['code']);// devuelve un objeto json
     }

     public function getImage($filename)
     {

         //comprobar si existe la imagen
         $isset = \Storage::disk('banners')->exists($filename);
         if ($isset) {
             $file = \Storage::disk('banners')->get($filename);
             return new Response($file, 200);
         } else {
             $data = array(
                 'status' => 'error',
                 'code' => 404,
                 'mesaje' => 'Imagen no existe',
             );

             return response()->json($data, $data['code']);
         }

     }

     public function deleteFotoBanner($id)
     {
         $banner = Banner::findOrFail($id);
         \Storage::delete('banners/' . $banner->image);
         $banner->image = '';
         $banner->save();
         return response()->json([
             'data' => $post,
             'msg' => [
                 'summary' => 'Archivo eliminado',
                 'detail' => '',
                 'code' => ''
             ]
         ]);
     }


}
