<?php


namespace App\Http\Repositories;


use App\Models\Author;

class AuthorRepository
{
  function getAll()
  {
      return Author::orderBy('id', 'DESC')->get();
  }
  function findById($id)
  {
      return Author::findOrFail($id);
  }

  function store($author)
  {
      $author->save();
  }
  function delete($author)
  {
      $author->delete();
  }

  function update($author)
  {
      $author->update();
  }

  function search($search)
  {
      return Author::where('name','LIKE',"%$search%")->get();
  }

  function countAuthors()
  {
      return Author::count();
  }

  function getTenAuthor()
    {
        return Author::orderBy('id', 'DESC')
               ->take(10)
               ->get();
    }
}
