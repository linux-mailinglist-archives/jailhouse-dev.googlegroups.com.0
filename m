Return-Path: <jailhouse-dev+bncBCMYJFG524BBBZME62DAMGQEPXBO5AI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3d.google.com (mail-qv1-xf3d.google.com [IPv6:2607:f8b0:4864:20::f3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C5B3B8F25
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Jul 2021 10:52:54 +0200 (CEST)
Received: by mail-qv1-xf3d.google.com with SMTP id k12-20020a0cfd6c0000b029020df9543019sf3361679qvs.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Jul 2021 01:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wcE0LTr5TE+Tfogd5FAWngHWkoVZtVNwOTuM/y80hpM=;
        b=HVLRX5FE2cwmAaw/E/cV8UQ66jiXfyvWY16AKP07/hT1aN4iV8nSd+M63dRt4iWMU0
         eLi3kKZyhK/PdkAG8WeZMlXwZAP54YiVlyiJGFE56vzhtizUTGjB0SfwXXhHztHwzuGA
         hVDCwEh6GD6AqNIXfWUqj1NrJ55QLSJbmHYEwPgruVNyLzqWnVgHS2WvHc17UgS6e73X
         gTSBI7CjYsnNBVR250FhKBKHkHcm8THItQEXDrhSKvCutr2hVdtfZFznsoHCu8V/kl4c
         7+dJ1nRUJrucha3yHdOuyFoUWIqMkQiwzwnl3oaqJoMlKLatwEnVJEYuynMmgGNQ2fT2
         fZeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wcE0LTr5TE+Tfogd5FAWngHWkoVZtVNwOTuM/y80hpM=;
        b=fiXKXFxrFwNlxcr0rBNWoYSya8hpleqKuRC6i43DAD4P97eBGDE7ppgbd0iV1LoMrr
         F4ugzs+OyjaxbILnhlfDXWn5Km+OAaXeBoygWEFKq97rhpzk9PBjZGRJ8KkQ3ePldbPy
         FtJlGizG0Rr4wSw1iMQt17EMlRIENAtjh+LYJr521EPhqm4NSxGBaU4JQd9mi/fcTFB/
         fk5h0qV2IJKQFKVE0dQQ4uXV1lAgrPKO+ffc6dK/vhsFobDfobpXgU3qCf8wKVh0moT5
         sWS04PcRMOpktPN61otM6U+p1t/EEesdG1s8sKWMvH3Wln5HLhzPUfBIZXtMQQRm0BLo
         pysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wcE0LTr5TE+Tfogd5FAWngHWkoVZtVNwOTuM/y80hpM=;
        b=ESKXXGCbBQSSIVZqd6TzHKuyflGdnkoTlymbaMmFdRESqm9H3r0bfRIadzm43p2DdY
         zK+IuHfbDxVTBiu9QviLhTNKXgju4taNw45QUIoLqI8t0F1+CcKGugHzPu0g/mFadhS8
         64TPHiP7AnJ5idxFtYoSjXrru7D0m8Oq9nURAxn8nVOr7e23+d31hEM7BWtJfa3VUest
         oQMA9KfBZml15G171SNajjaHrY8nWygImHsGqGuhXdxxnn9qhHOKWEf1wINxkhBA2SO0
         P2EqyL0xWjWdFBLNfo/ZQfoVNpC2SjxBqGLG3mIZNc6ZWLlSIZxILPPEfk5SyGWfPGAb
         Z+oQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532LBix+0GQ18MkxUHXHw2RF1RBgG3+AudmzQMftS5l3h4IZOzLZ
	U8zpoJ8WfAxSofgF8IAlMxg=
X-Google-Smtp-Source: ABdhPJzNjdMP8n5zLir3t5hdWZ2ueLztpOgEeC7rkMHAbrxwd8/fm8xKAb4ZjZ/NpkVDZ01kG9wGFg==
X-Received: by 2002:a05:620a:1a8c:: with SMTP id bl12mr12806574qkb.99.1625129573168;
        Thu, 01 Jul 2021 01:52:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4e96:: with SMTP id 22ls2483803qtp.1.gmail; Thu, 01 Jul
 2021 01:52:52 -0700 (PDT)
X-Received: by 2002:ac8:5d47:: with SMTP id g7mr35519348qtx.351.1625129572524;
        Thu, 01 Jul 2021 01:52:52 -0700 (PDT)
Date: Thu, 1 Jul 2021 01:52:52 -0700 (PDT)
From: Nikoleta Markela Iliakopoulou <nmiliakopoulou@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c1271b67-2363-4659-9835-cf54edc42630n@googlegroups.com>
In-Reply-To: <a185b8ff-0b39-4864-bbf2-ca937835ac70n@googlegroups.com>
References: <10331404-4fab-410c-ba3f-77f4ed6ccbebn@googlegroups.com>
 <a185b8ff-0b39-4864-bbf2-ca937835ac70n@googlegroups.com>
Subject: Re: install and run jailhouse on rpi4 board
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_578_432140961.1625129572029"
X-Original-Sender: nmiliakopoulou@gmail.com
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

------=_Part_578_432140961.1625129572029
Content-Type: multipart/alternative; 
	boundary="----=_Part_579_373722691.1625129572029"

------=_Part_579_373722691.1625129572029
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,=20

First of all, Ralf, Jan and =E6=9C=B1=E8=8B=A5=E5=87=A1,

thank you for your guidance concerning my issue in installing and running=
=20
jailhouse on rpi4 board.

I finally built and booted the jailhouse-enabling/5.4-rpi kernel. I=20
modified the memory regions in rpi demos and jailhouse.dts file accordingly=
.
Both the gic-inmate demo and the linux demo work just fine. Now I'm working=
=20
on booting my own customized non-root linux cell.
I'm facing some issues that I describe here ( =20
https://groups.google.com/g/jailhouse-dev/c/I1FVZZP5wzg ) .

Nikoleta
=CE=A3=CF=84=CE=B9=CF=82 =CE=A4=CE=B5=CF=84=CE=AC=CF=81=CF=84=CE=B7, 9 =CE=
=99=CE=BF=CF=85=CE=BD=CE=AF=CE=BF=CF=85 2021 =CF=83=CF=84=CE=B9=CF=82 8:47:=
34 =CF=80.=CE=BC. UTC+3, =CE=BF =CF=87=CF=81=CE=AE=CF=83=CF=84=CE=B7=CF=82=
=20
zhuzhu...@gmail.com =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:

> hello, I have an document for rpi4b board to install jailhouse with its=
=20
> own kernel, where I can change some code of jailhouse .  I try a lot and=
=20
> finally install it. But I only use deconfig of rpi4.cell for no auto tool=
s=20
> to build root cell config . What's more, unfortunately the document is in=
=20
> chinese .  If you need it , mail me.
>
> =E5=9C=A82021=E5=B9=B46=E6=9C=884=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC=
+8 =E4=B8=8B=E5=8D=886:24:49<nmiliak...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A
>
>> Dear all,=20
>>
>> I am student in ECE NTUA and I am studying Jailhouse for my diploma=20
>> thesis. So far I managed to install and run jailhouse in virtual=20
>> environment (QEMU) in x86 and use ready-to-use jailhouse images for virt=
=20
>> environment for both x86 and arm architecture. Now I am assigned to inst=
all=20
>> it on rpi4 board.=20
>>
>> I know there is this repo https://github.com/siemens/jailhouse-images=20
>> with ready to use image for rpi4, but I would like to install it manuall=
y=20
>> to explore better all the options provided, write some code on my own an=
d=20
>> test it.=20
>>
>> I have already explored the internet and this google group for further=
=20
>> information, and apart from some general guidance, I didnt find anything=
=20
>> specific/(or maybe I coudn't understand some key points).=20
>>
>>
>> I would really appreciate it if someone could give me some=20
>> advice/guidance on this subject.
>>
>> Thank you all in advance.=20
>>
>> Nikoleta Iliakopoulou
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c1271b67-2363-4659-9835-cf54edc42630n%40googlegroups.com.

------=_Part_579_373722691.1625129572029
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,&nbsp;<div><br></div><div>First of all, Ralf, Jan and&nbsp;=E6=9C=
=B1=E8=8B=A5=E5=87=A1,</div><div><br></div><div>thank you for your guidance=
 concerning my issue in installing and running jailhouse on rpi4 board.<br>=
</div><div><br></div><div>I finally built and booted the jailhouse-enabling=
/5.4-rpi kernel. I modified the memory regions in rpi demos and jailhouse.d=
ts file accordingly.</div><div>Both the gic-inmate demo and the linux&nbsp;=
demo work just fine. Now I'm working on booting my own customized non-root =
linux cell.</div><div>I'm facing some issues that I describe here (&nbsp; h=
ttps://groups.google.com/g/jailhouse-dev/c/I1FVZZP5wzg ) .</div><br><div>Ni=
koleta</div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_att=
r">=CE=A3=CF=84=CE=B9=CF=82 =CE=A4=CE=B5=CF=84=CE=AC=CF=81=CF=84=CE=B7, 9 =
=CE=99=CE=BF=CF=85=CE=BD=CE=AF=CE=BF=CF=85 2021 =CF=83=CF=84=CE=B9=CF=82 8:=
47:34 =CF=80.=CE=BC. UTC+3, =CE=BF =CF=87=CF=81=CE=AE=CF=83=CF=84=CE=B7=CF=
=82 zhuzhu...@gmail.com =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:<br/></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1=
px solid rgb(204, 204, 204); padding-left: 1ex;">hello, I have an document =
for rpi4b board to install jailhouse with its own kernel, where I can chang=
e some code of jailhouse .=C2=A0 I try a lot and finally install it. But I =
only use deconfig of rpi4.cell for no auto tools to build root cell config =
. What&#39;s more, unfortunately the document is in chinese .=C2=A0 If you =
need it , mail me.<br><br><div class=3D"gmail_quote"><div dir=3D"auto" clas=
s=3D"gmail_attr">=E5=9C=A82021=E5=B9=B46=E6=9C=884=E6=97=A5=E6=98=9F=E6=9C=
=9F=E4=BA=94 UTC+8 =E4=B8=8B=E5=8D=886:24:49&lt;<a href data-email-masked r=
el=3D"nofollow">nmiliak...@gmail.com</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Dear all,=C2=A0<div><br>=
</div><div>I am student in ECE NTUA and I am studying Jailhouse for my dipl=
oma thesis. So far I managed to install and run jailhouse in virtual enviro=
nment (QEMU) in x86 and use ready-to-use jailhouse images for virt environm=
ent for both x86 and arm architecture. Now I am assigned to install it on r=
pi4 board.=C2=A0</div><div><br></div><div>I know there is this repo=C2=A0<a=
 href=3D"https://github.com/siemens/jailhouse-images" rel=3D"nofollow" targ=
et=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Del&am=
p;q=3Dhttps://github.com/siemens/jailhouse-images&amp;source=3Dgmail&amp;us=
t=3D1625215868596000&amp;usg=3DAFQjCNEqrfYyA4hL6I497cScx1jOUGaVqg">https://=
github.com/siemens/jailhouse-images</a> with ready to use image for rpi4, b=
ut I would like to install it manually to explore better all the options pr=
ovided, write some code on my own and test it.=C2=A0</div><div><br></div><d=
iv>I have already explored the internet and this google group for further i=
nformation, and apart from some general guidance, I didnt find anything spe=
cific/(or maybe I coudn&#39;t understand some key points).=C2=A0</div><div>=
<br></div><div><br></div><div>I would really appreciate it if someone could=
 give me some advice/guidance on this subject.</div><div><br></div><div>Tha=
nk you all in advance.=C2=A0</div><div><br></div><div>Nikoleta Iliakopoulou=
</div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c1271b67-2363-4659-9835-cf54edc42630n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c1271b67-2363-4659-9835-cf54edc42630n%40googlegroups.co=
m</a>.<br />

------=_Part_579_373722691.1625129572029--

------=_Part_578_432140961.1625129572029--
