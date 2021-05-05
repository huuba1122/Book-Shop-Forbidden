import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AuthorService } from 'src/app/services/admin/author.service';

@Component({
  selector: 'app-author-add',
  templateUrl: './author-add.component.html',
  styleUrls: ['./author-add.component.css']
})
export class AuthorAddComponent implements OnInit {

  imgFile: string = '';
  createAuthorForm: FormGroup;
  constructor(
    private formbd: FormBuilder,
    private authorService: AuthorService
  ) {
    this.createAuthorForm = this.formbd.group({
      name: ['', Validators.required],
      image: ['', Validators.required],
      country: ['', Validators.required],
      birth_death: [''],
      link_wiki: [''],
      fileSource: ['']
    })
  }

  ngOnInit(): void {
  }

  createAuthor() {
    console.log(this.createAuthorForm.value);
    let data = this.createAuthorForm.value;
    this.authorService.adminCreateAuthor(data).subscribe(
      (res) => {
        console.log(res);
      }
    )
  }

  onImageChange(e: any) {
    console.log(e.target.files);
    // console.log(e.target.files);
    const reader = new FileReader();

    if (e.target.files.length && e.target.files) {
      // console.log(e.target.files[0]);
      // const [file] = e.target.file;
      const file = e.target.files[0];
      this.createAuthorForm.patchValue({
        fileSource: file
      });
      reader.readAsDataURL(e.target.files[0]);

      reader.onload = (e: any) => {
        this.imgFile = e.target.result
      }
    }
  }

}
