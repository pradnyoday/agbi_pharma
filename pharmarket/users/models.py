from django.db import models
from django.contrib.auth.models import AbstractBaseUser,BaseUserManager
from PIL import Image




#Manager Class
class AccountsManager(BaseUserManager):
    def create_user(self,email,reg_name,password = None):
        if(not email):
            raise ValueError("Please Enter Email Address")
        if(not reg_name):
            raise ValueError('Please Enter Correct reg_name')
        user = self.model(
                email = self.normalize_email(email),
                reg_name = reg_name
            )
        
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self,email,reg_name,password):
        if(not email):
            raise ValueError("Please Enter Email Address")
        if(not reg_name):
            raise ValueError('Please Enter Correct reg_name')
        user = self.create_user(
                email = self.normalize_email(email),
                password = password,
                reg_name = reg_name,
            )
        
        user.is_admin = True
        user.is_staff = True
        user.is_superuser = True
        user.is_active = True
        user.save(using=self._db)
        return user


# Create your models here.
class account(AbstractBaseUser): 
    email = models.EmailField(max_length = 100,unique = True)
    reg_name = models.CharField(max_length = 50,unique = True)
    date_joined = models.DateTimeField(auto_now_add = True)
    last_login = models.DateTimeField(auto_now = True)
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_verified = models.BooleanField(default = True)
    role = models.IntegerField(default=1)
    city = models.CharField(max_length=50,default='abc')
    state = models.CharField(max_length=50,default='abc')
    country = models.CharField(max_length=50,default='abc')
    phone = models.CharField(max_length=20,default='9999999999')

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['reg_name']

    objects = AccountsManager()

    def __str__(self):
        return self.email
    
    def has_perm(self,perm,obj=None):
        return self.is_admin

    def has_module_perms(self,app_label):
        return True        

#new Model Profile
