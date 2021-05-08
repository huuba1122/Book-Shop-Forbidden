import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthorService } from 'src/app/services/admin/author.service';
import { environment } from 'src/environments/environment.prod';
import { Author } from '../author' ;
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-author-edit',
  templateUrl: './author-edit.component.html',
  styleUrls: ['./author-edit.component.css']
})
export class AuthorEditComponent implements OnInit {

  id!: number;
  updateAuthorForm!: FormGroup
  author:Author = {};
  imgFile: any;
  imgSrc = '';
  isShowOleImage = true;
  image_path = environment.image_url;
  constructor(
    private routeActive: ActivatedRoute,
    private authorService: AuthorService,
    private formBd: FormBuilder,
    private router: Router,
    private toastr: ToastrService,
  ) {}

  ngOnInit(): void {
    this.getAuthor();
    this.updateAuthorForm = this.formBd.group({
      name: ['', Validators.required],
      image: [''],
      country: ['', Validators.required],
      birth_of_year: ['', Validators.pattern('^(1|2)?[0-9]{3}$')],
      death_of_year: ['',Validators.pattern('^(1|2)?[0-9]{3}$')
    ],
      link_wiki: ['']
    })
  }

  getAuthor() {
    this.id = +this.routeActive.snapshot.paramMap.get("id")!;
    this.authorService.adminGetAuthor(this.id).subscribe(
      res => {
        this.author = res;
        this.updateAuthorForm.patchValue({
          name: this.author.name,
          country: this.author.country,
          birth_of_year: this.author.birth_of_year,
          death_of_year: this.author.death_of_year,
          link_wiki: this.author.link_wiki
        })
      }
    )
  }

  updateAuthor() {
    let formData = new FormData();
    let data = this.updateAuthorForm.value;
    // console.log(data);
    formData.append('name', data.name);
    formData.append('file', this.imgFile);
    formData.append('country', data.country);
    formData.append('birth_of_year', data.birth_of_year);
    formData.append('death_of_year', data.death_of_year);
    formData.append('link_wiki', data.link_wiki);
    // console.log(formData.get('file'));
    this.authorService.adminUpdateAuthor(formData, this.id).subscribe(
      (res) => {
        console.log(res);
        if (res.status === 'success') {
          this.router.navigate(['admin/author-list']);
          this.toastr.success('Cập nhật tác giả thành công!', 'Thông báo');
        }
      }
    )
  }

  onImageChange(e: any) {
    const reader = new FileReader();
    if (e.target.files.length && e.target.files) {
      this.imgFile = e.target.files[0];
      // const file = e.target.files[0];

      reader.readAsDataURL(e.target.files[0]);
      reader.onload = (e: any) => {
        this.imgSrc = e.target.result;
        this.isShowOleImage = false;
      }
    }
  }
  get name() { return this.updateAuthorForm.get('name'); }
  get image() { return this.updateAuthorForm.get('image'); }
  get country() { return this.updateAuthorForm.get('country'); }
  get birth_of_year() { return this.updateAuthorForm.get('birth_of_year'); }
  get death_of_year() { return this.updateAuthorForm.get('death_of_year'); }

}
