---
Title : Account Recovery Service
Description : The Account Recovery Service allows you to reset your
Xandr password or retrieve your
Xandr username.
---


# Account Recovery Service



The Account Recovery Service allows you to reset your
Xandr password or retrieve your
Xandr username.
 


## Reset Your Password

If you cannot log in to Xandr's bidder API due
to a forgotten password, follow the steps below to reset your password.

**Step 1. Create a JSON-formatted file including your username**

``` pre
$ cat reset_password_1
{
    "account-recovery": {
        "username" : "USERNAME"
    }
}
```

**Step 2. POST the file to the account recovery service**

``` pre
$ curl -X POST -d @reset_password_1 'https://api.adnxs.com/account-recovery'
{
    "response": {
        "status": "OK",
        "dbg_info": {
            ...
        }
    }
}
```

**Step 3. Check your email**

The previous step triggers the system to send an email to the address
associated with the username in the JSON-formatted file. The email
includes the token that you will use in the next step. Note that the
token is valid for 16 hours.



Note: If you don't receive an email,
the username in the file may not be valid. Check the username for
accuracy and try again. If you have forgotten your username, see
<a href="account-recovery-service.html#ID-00000fc0__retrieve"
class="xref">Retrieve Your Username</a> below.



**Step 4. Create a JSON-formatted file including your new password and
token**

``` pre
$ cat reset_password_2
{
    "account-recovery": {
        "password": "NEW_PASSWORD",
        "token": "TOKEN_FROM_EMAIL"
    }
}
```

**Guidelines for creating your password**

When creating your password, please create a complex password with the
following:

- 10 or more characters
- 64 or fewer characters
- At least one capital letter (A–Z)
- At least one lowercase letter (a–z)
- At least one digit (0–9)
- At least one special character (such as \#, $, ? %, &)

**Step 5. PUT the file to the account recovery service**

This resets your password and sends a confirmation email to the address
associated with your username. Once you receive the confirmation email,
you can log in to the API with your username and new password. See <a
href="https://docs.xandr.com/bundle/xandr-bidders/page/authentication-service.html"
class="xref" target="_blank">Authentication Service</a> for guidance.

``` pre
$ curl -X PUT -d @reset_password_2 'https://api.adnxs.com/account-recovery'
{
    "response": {
        "status": "OK",
        "dbg_info": {
            ...
        }
    }
}
```



<div id="ID-00000fc0__retrieve" >

## Retrieve Your Username

If you cannot log in to the API due to a forgotten username, follow the
steps below to retrieve your username.

**Step 1. Create a JSON-formatted file including your email address**

``` pre
$ cat retrieve_username
{
    "account-recovery": {
        "email" : "EMAIL_ADDRESS"
    }
}
```

**Step 2. POST the file to the account recovery service**

``` pre
$ curl -X POST -d @retrieve_username 'https://api.adnxs.com/account-recovery'
{
    "response": {
        "status": "OK",
        "dbg_info": {
            ... 
        }
    }
}
```

**Step 3. Check your email**

The previous step triggers the system to send an email to the address
specified in the file. The email includes the username(s) that are
associated with the email address. Once you receive the email, you can
log in to the API with your username and new password. See <a
href="https://docs.xandr.com/bundle/xandr-bidders/page/authentication-service.html"
class="xref" target="_blank">Authentication Service</a> for guidance.



Note: If you don't receive an email,
the email address or host URL in the file may not be valid. Check the
values for accuracy and try again.







## Related Topics

- <a href="authentication-service.html" class="xref">Authentication
  Service</a>
- <a href="user-service.html" class="xref">User Service</a>






