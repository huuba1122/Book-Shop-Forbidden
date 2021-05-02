<?php

namespace Database\Seeders;

use App\Models\Author;
use Illuminate\Database\Seeder;

class AuthorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $author = new Author();
        $author->name = 'Victor Hugo';
        $author->birth_death = '1802-1885';
        $author->country = 'France';
        $author->link_wiki = 'https://en.wikipedia.org/wiki/Victor_Hugo';
        $author->image = 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Victor_Hugo_by_%C3%89tienne_Carjat_1876_-_full.jpg/220px-Victor_Hugo_by_%C3%89tienne_Carjat_1876_-_full.jpg';
        $author->save();

        $author = new Author();
        $author->name = 'Emily Bronte';
        $author->birth_death = '1818-1848';
        $author->country = 'England';
        $author->link_wiki = 'https://en.wikipedia.org/wiki/Emily_Bront%C3%AB';
        $author->image = 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Emily_Bront%C3%AB_by_Patrick_Branwell_Bront%C3%AB_restored.jpg/220px-Emily_Bront%C3%AB_by_Patrick_Branwell_Bront%C3%AB_restored.jpg';
        $author->save();

        $author = new Author();
        $author->name = 'Margaret Mitchell';
        $author->birth_death = '1900-1949';
        $author->country = 'U.S';
        $author->link_wiki = 'https://en.wikipedia.org/wiki/Margaret_Mitchell';
        $author->image = 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Margaret_Mitchell_NYWTS.jpg/220px-Margaret_Mitchell_NYWTS.jpg   ';
        $author->save();

        $author = new Author();
        $author->name = 'Thạch Lam';
        $author->birth_death = '1910-1942';
        $author->country = 'Vietnam';
        $author->link_wiki = 'https://vi.wikipedia.org/wiki/Th%E1%BA%A1ch_Lam';
        $author->image = 'https://vanhocsaigon.com/wp-content/uploads/2020/07/Thach-Lam-VHSAIGON.jpg';
        $author->save();

        $author = new Author();
        $author->name = 'Ngô Tất Tố';
        $author->birth_death = '1894-1954';
        $author->country = 'Vietnam';
        $author->link_wiki = 'https://vi.wikipedia.org/wiki/Ng%C3%B4_T%E1%BA%A5t_T%E1%BB%91';
        $author->image = 'https://upload.wikimedia.org/wikipedia/vi/thumb/9/92/NgoTatTo.jpg/175px-NgoTatTo.jpg';
        $author->save();
    }
}
