<?php


namespace App\Http\Repositories;


use App\Models\Category;

class CategoryRepository
{
    function getAll(){
        return Category::orderBy('id','DESC')->get();
    }

    function findById($id){
        return Category::findOrFail($id);
    }

    function getInstance(): Category
    {
        return new Category();
    }

    function store($data)
    {
        return Category::create([
           'name' => $data['name']
        ]);
    }

    function update($category)
    {
        $category->update();
    }

    function delete($category)
    {
        $category->delete();
    }

    function search($search)
    {
        return Category::where('name','LIKE',"%$search%")->get();
    }

    function countCategories()
    {
        return Category::count();
    }
}
