import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AuthorService } from 'src/app/services/admin/author.service';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';

@Component({
  selector: 'app-author-add',
  templateUrl: './author-add.component.html',
  styleUrls: ['./author-add.component.css']
})
export class AuthorAddComponent implements OnInit {

  imgSrc: string = '';
  imgFile: any;
  createAuthorForm!: FormGroup;
  constructor(
    private formbd: FormBuilder,
    private authorService: AuthorService,
    private toastr: ToastrService,
    private router: Router
  ) {

  }

  ngOnInit(): void {
    this.createAuthorForm = this.formbd.group({
      name: ['', Validators.required],
      image: ['', Validators.required],
      country: ['', Validators.required],
      birth_of_year: ['',Validators.pattern('^(1|2)?[0-9]{3}$')],
      death_of_year: ['',Validators.pattern('^(1|2)?[0-9]{3}$')],
      link_wiki: [''],
      img: ['']
    })
  }

  createAuthor() {
    let formData = new FormData();
    let data = this.createAuthorForm.value;
    formData.append('name', data.name);
    formData.append('file', this.imgFile, this.imgFile.name);
    formData.append('country', data.country);
    formData.append('birth_of_year', data.birth_of_year);
    formData.append('death_of_year', data.death_of_year);
    formData.append('link_wiki', data.link_wiki);
    this.authorService.adminCreateAuthor(formData).subscribe(
      (res) => {
        console.log(res);
        if (res.status === 'success') {
          this.router.navigate(['admin/author-list']);
          this.toastr.success('Thêm mới tác giả thành công!', 'Thông báo');
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
        this.imgSrc = e.target.result
      }
    }
  }
  get name() { return this.createAuthorForm.get('name'); }
  get image() { return this.createAuthorForm.get('image'); }
  get country() { return this.createAuthorForm.get('country'); }
  get birth_of_year() { return this.createAuthorForm.get('birth_of_year'); }
  get death_of_year() { return this.createAuthorForm.get('death_of_year'); }
}
