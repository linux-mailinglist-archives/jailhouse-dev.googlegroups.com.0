Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBG4RYHTAKGQEJGQV5YQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D7614CDF
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 16:45:49 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id v13sf345738oie.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aB9cN+nx/UfGy8zKGvEyH5CS0UJfRHJdktNZVtAmJTY=;
        b=e44rM8Aohgdla0fhrQMMhu4SZo+u3VVpwIvPvP7tlxgYUWo0nJye0JJRlXBf1KQZh0
         tWnSiX+r/lXL8RzdLEhbdZM4iRhQ7YxILh5kGLDVBK/OdgR1QuidJZNqoxjtQHD+h9QX
         l5az2PxAgRKYPhw0BJhwAp9ZyJjQlg7qpSqa8jYwmvTcKVVwSTXyWkce1i1sN8e5Q9+b
         Forvl6RTayC8+1wmoBHnS6aWeZM5HDmL3mjSfI11ChotL4U8OWkJVxOrznvM3JGb6OhR
         0UraFjND6JLI2l5knpQ9r0Xa2NW7oMG9eaoPp0rZYy5KSjGEC+4laYHprU5E08oHHSyX
         W8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aB9cN+nx/UfGy8zKGvEyH5CS0UJfRHJdktNZVtAmJTY=;
        b=Mrx5mus9YP3UUUCz0Wu8MjVwRRu1jirI2UrI8bpR2GzqNCFLLGVTmL8KGCKFeOOl80
         qt5Falwud7Dri9FEEjZzIrIhMyDUrwaWYZsaom5tc88EqkP08ewXl/XJCNPLrPRaZVdv
         buClEU3if9LxWl73OBDfsuy0blR30VMgnk+92lDAKlhAGDy+hET1Q7Aa+UePNzLqWdW6
         pytC27eB5zo5N7Fo/JgbR6zpjRZVNZtjymhLERFqs+JApFgYNIHkBJxXIOCnClTI6seS
         xAr58akhsDGw5nlvl3GXljCpBaMDWoJ4ejn9Br/fLaWdYNwRof5co3sO5V7VaiPuULao
         rPyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXLiY7YnYx611hrimvuQeVUJfzSixo9J/JiBPJ5o2CRbaCRgvfF
	IqCP3IVIjCzgMPpebc25aYA=
X-Google-Smtp-Source: APXvYqxx+hJyD1S5m+tJepnSk8j+VzWfgYoaeWdbZjz9xn1itEc9d+jzier8WSaSGCwHVFnrPTUY3w==
X-Received: by 2002:a9d:7b45:: with SMTP id f5mr3900227oto.32.1557153947936;
        Mon, 06 May 2019 07:45:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4f1a:: with SMTP id d26ls2158754otl.10.gmail; Mon, 06
 May 2019 07:45:47 -0700 (PDT)
X-Received: by 2002:a05:6830:140d:: with SMTP id v13mr18306565otp.293.1557153947087;
        Mon, 06 May 2019 07:45:47 -0700 (PDT)
Date: Mon, 6 May 2019 07:45:46 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c65a990c-77f8-4289-9133-30092a03178d@googlegroups.com>
In-Reply-To: <20190506104344.33303fdc@md1za8fc.ad001.siemens.net>
References: <62e83024-118e-4109-ab5e-330bec67389f@googlegroups.com>
 <20190506104344.33303fdc@md1za8fc.ad001.siemens.net>
Subject: Re: [PATCH] Scripts: Fix for Parsing DMAR Region under Reserved
 Section
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1962_2101072858.1557153946374"
X-Original-Sender: hkurumahmut84@hotmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_1962_2101072858.1557153946374
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henning,

I am not a python expert. But it works because list is a mutable type.

https://stackoverflow.com/questions/986006/how-do-i-pass-a-variable-by-refe=
rence/986145#986145

Some Link content:

Arguments are passed by assignment. The rationale behind this is two fold:

the parameter passed in is actually a reference to an object (but the refer=
ence is passed by value)
some data types are mutable, but others aren't
So:

If you pass a mutable object into a method, the method gets a reference to =
that same object and you can mutate it to your heart's delight, but if you =
rebind the reference in the method, the outer scope will know nothing about=
 it, and after you're done, the outer reference will still point at the ori=
ginal object.

If you pass an immutable object to a method, you still can't rebind the out=
er reference, and you can't even mutate the object.

To make it even more clear, let's have some examples.

List - a mutable type
Let's try to modify the list that was passed to a method:

def try_to_change_list_contents(the_list):
    print('got', the_list)
    the_list.append('four')
    print('changed to', the_list)

outer_list =3D ['one', 'two', 'three']

print('before, outer_list =3D', outer_list)
try_to_change_list_contents(outer_list)
print('after, outer_list =3D', outer_list)
Output:

before, outer_list =3D ['one', 'two', 'three']
got ['one', 'two', 'three']
changed to ['one', 'two', 'three', 'four']
after, outer_list =3D ['one', 'two', 'three', 'four']
Since the parameter passed in is a reference to outer_list, not a copy of i=
t, we can use the mutating list methods to change it and have the changes r=
eflected in the outer scope.


HAKKI

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1962_2101072858.1557153946374--
