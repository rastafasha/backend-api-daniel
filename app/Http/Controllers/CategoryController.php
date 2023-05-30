<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $categories = Category::orderBy('created_at', 'DESC')
        ->get();

        return response()->json([
            'code' => 200,
            'status' => 'Listar todos los categories',
            'categories' => $categories,
        ], 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function categoryStore(Request $request)
    {
        return Category::create($request->all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category $category
     * @return \Illuminate\Http\Response
     */
    public function categoryShow(Category $category)
    {
        //
        // $category = Category::find($id);

        if (!$category) {
            return response()->json([
                'message' => 'Category not found.'
            ], 404);
        }

        return response()->json([
            'code' => 200,
            'status' => 'success',
            'category' => $category,
        ], 200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Category $category
     * @return \Illuminate\Http\Response
     */
    public function categoryUpdate(Request $request, $id)
    {
        try {
            DB::beginTransaction();

            $input = $request->all();
            $category = Category::find($id);
            $category->update($input);


            DB::commit();
            return response()->json([
                'code' => 200,
                'status' => 'Update category success',
                'category' => $category,
            ], 200);
        } catch (\Throwable $exception) {
            DB::rollBack();
            return response()->json([
                'message' => 'Error no update'  . $exception,
            ], 500);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Category $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        $category = Category::findOrfail($id);
        $category->name = $request->name;
        $category->update();
        return $category;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Category $category
     * @return \Illuminate\Http\Response
     */
    public function categoryDestroy(Category $category)
    {
        $this->authorize('categoryDestroy', Category::class);

        try {
            DB::beginTransaction();


            $category->delete();

            DB::commit();
            return response()->json([
                'code' => 200,
                'status' => 'Payment Method deleted',
            ], 200);
        } catch (\Throwable $exception) {
            DB::rollBack();
            return response()->json([
                'status' => 'error',
                'message' => 'Borrado fallido. Conflicto',
            ], 409);
        }
    }
}
