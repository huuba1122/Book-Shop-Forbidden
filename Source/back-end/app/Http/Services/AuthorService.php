<?php


namespace App\Http\Services;


use App\Http\Repositories\AuthorRepository;

class AuthorService
{
    protected $authorRepo;
    public function __construct(AuthorRepository $categoryRepository)
    {
        $this->authorRepo = $categoryRepository;
    }

    function getAll(){
        return $this->authorRepo->getAll();
    }

    function findById($id)
    {
        return $this->authorRepo->findById($id);
    }

    function store($data)
    {
        return $this->authorRepo->store($data);
    }

    function updateQuantity($quantity, $id){
        $category = $this->authorRepo->findById($id);
        $category->quantity = $quantity;
        $this->authorRepo->update($category);
    }

    function update($data, $id)
    {
        $category = $this->authorRepo->findById($id);
        $category->name = $data['name'];
        $this->authorRepo->update($category);
    }

    function delete($id)
    {
        $category = $this->authorRepo->findById($id);
        $this->authorRepo->delete($category);
    }
}
