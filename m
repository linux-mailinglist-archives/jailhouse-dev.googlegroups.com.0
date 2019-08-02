Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBNOCR3VAKGQEZBHGPUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8497EA5B
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Aug 2019 04:34:30 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id d12sf28805793oic.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Aug 2019 19:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HalmdNCzw27upZu4wINsUocNPHiQgu88zUMHQd6eI3s=;
        b=Svt7k28tAJm8Vu6c6NDvmzgzOFA5UN6Oo4U3ow03TnkqtYCeWl3FaylpfWH8cbyaKY
         nGLBtsGVEXgRKyQ5U6dyadlug4HhUJ2Fq2jPDczUu5PPs5vNrykeVx6NzOOnGHO5z0Op
         OTixQ2+ooEq8kQvyj3s1JsDefIK5vkJxEGYfWhRlsu51L8oWkNo7u3vtARNmMasiReiB
         QvoKlauSh9tnMkfgQxMFhwE3C0nwoW8UO5w2nMITiGtcnPH2BhkVYfAgdiywiQQP4IWm
         PySA7sAPAYSI3YYlT/bP2PicmSNDj1fcWxjc5YEwHhCUd8+8Bp/k9IZ3zNnPpaQvqBEz
         l2wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HalmdNCzw27upZu4wINsUocNPHiQgu88zUMHQd6eI3s=;
        b=ItMONZhvpB2SgVlwoGqDS3Z8gUU7Jz1KQ3B5mMS+BSCwr3ZivO1MDk+qqi83qConXn
         VoLUMavIYTTau82LuC/7aT67FBGN7CwvKFHZvr/1D3f8nZHp0gAWXnjnnchgpgT1OkfM
         Lqln5gOvdrjcAuIfzZ4myvsPKnCeX8LnfCgfw5XY212u94UoiEZvKK/825ODWJhTLR+S
         faRMUmOCGR9ybayZU0Ao8E8EE4vB7grSpYuns6a87e9kT1exum9hWrpPX4Rqtl8ZR2vS
         YwVJzHdr5aGelOW4qPizpUGafUCh7ZTiRKUmoXvirL95J0oVN9NkHfk/mOAOiNddm4q3
         3PmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HalmdNCzw27upZu4wINsUocNPHiQgu88zUMHQd6eI3s=;
        b=IY+6hgxFzLj+izXQ0GNGzIAEPcEmKlLvasYVLFqRZkfqyyt3t0H0/j7Kdxk9c8WqZ1
         MHKk3KrTGAWhIb02BG9EqEr/KLh636IhMLdyLTg7Xaf+nmeYUEoKWy0QkPuvMGlgfjFj
         sojzvzdbxF1F7pgx2N6DuEplrSSAOUsZLUeefBGRznzBBMm0WUVwW8/W3tkCSOvBJP4p
         sen3llmsjDBAbmzKCaZyZIJV7WApt4n3jbAwHvFsASMW9bD0XMZlaa5aQq4r1JAITL0o
         xr83N7+bMkbLw8fVGUThXADPtxr9gJ330sm4FKFFNPCbK3djQfacwlPBMvjwIcG+1QcA
         9dYA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUW48KThHVFJWEgHheHirX9dED1pU9Y0tguy2A23oGewhRa/S5D
	inwqNJLXINKZF6MvycTMg5A=
X-Google-Smtp-Source: APXvYqzzFYTlVhb/Ox0g6Oak41ewUz32mfvPrRShy7EBXS1tOjSFCAWwaOblTjDvEGdwZztLmmHi1g==
X-Received: by 2002:a05:6808:4d6:: with SMTP id a22mr1265988oie.55.1564713269620;
        Thu, 01 Aug 2019 19:34:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a54:4411:: with SMTP id k17ls11559751oiw.11.gmail; Thu, 01
 Aug 2019 19:34:29 -0700 (PDT)
X-Received: by 2002:aca:5a41:: with SMTP id o62mr1296727oib.110.1564713268881;
        Thu, 01 Aug 2019 19:34:28 -0700 (PDT)
Date: Thu, 1 Aug 2019 19:34:28 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
In-Reply-To: <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
 <6abaf77f-e4a7-7a9a-2ae9-8d1d8f1388bf@siemens.com>
 <1726f6bd-680a-46ac-a7f3-937cbba84208@googlegroups.com>
 <19e76b74-6d6e-010d-952a-5a36e606091b@web.de>
 <a5b27da1-b2aa-4ce0-863f-d9503a22b886@googlegroups.com>
 <885b4c3e-8d69-e516-aff4-46f2e50cb622@web.de>
 <edf7dab3-2c32-43bb-b13b-fce8bc452418@googlegroups.com>
 <4f76dc91-7542-40b8-a0d9-eea52e1dd92a@siemens.com>
 <e5c36ed1-98a5-4a76-aca0-6589cf9c3108@googlegroups.com>
 <ef7a124c-e5e3-f61b-8ed0-aebf585c65d6@siemens.com>
 <dde1cd0e-407e-45b3-ae32-97c445100824@googlegroups.com>
 <2f6c0983-78e1-73e0-183c-3983dd757ee8@siemens.com>
 <39b83770-5562-437f-a25b-415d85dc7c3b@googlegroups.com>
 <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
 <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_553_403749091.1564713268207"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_553_403749091.1564713268207
Content-Type: multipart/alternative; 
	boundary="----=_Part_554_1661427829.1564713268207"

------=_Part_554_1661427829.1564713268207
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The value of arch.ramdisk_address() is 2062893056, converted to hexadecimal=
=20
is 0x7AF54000, which is within the newly added RAM memory region that=20
begins at address 0x60000000.

quarta-feira, 31 de Julho de 2019 =C3=A0s 07:22:32 UTC+1, Jan Kiszka escrev=
eu:
>
> On 31.07.19 02:40, Jo=C3=A3o Reis wrote:=20
> > Other thing i forgot was that on Ultrascale+ the RAM finishes at 2GB=20
> > (0x80000000), so i moved the memory region to 0x60000000, with a=20
> different size=20
> > to not overlap any other memory region.=20
> >=20
> > /* RAM */ {=20
> > .phys_start =3D 0x60000000,=20
> > .virt_start =3D 0x60000000,=20
> > .size =3D 0x1bef0000, //must be page size aligned=20
> > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
> > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |=20
> > JAILHOUSE_MEM_DMA,=20
> > },=20
> >=20
> > But now it gives me the error on ramdisk_address:=20
> >=20
> > Traceback (most recent call last):=20
> >   File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 831, i=
n=20
> <module>=20
> >     cell.load(args.initrd.read(), arch.ramdisk_address())=20
> >   File "/usr/local/lib/python2.7/dist-packages/pyjailhouse/cell.py",=20
> line 44, in=20
> > load=20
> >     fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)=20
> > IOError: [Errno 22] Invalid argument=20
> >=20
>
> To make this a bit more systematic, I would recommend you to instrument=
=20
> the=20
> code, dump this address e.g., and match against what you think you=20
> configured.=20
>
> Jan=20
>
> --=20
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> Corporate Competence Center Embedded Linux=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com.

------=_Part_554_1661427829.1564713268207
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The value of arch.ramdisk_address() is=C2=A02062893056, co=
nverted to hexadecimal is 0x7AF54000, which is within the newly added RAM m=
emory region that begins at address 0x60000000.<br><br>quarta-feira, 31 de =
Julho de 2019 =C3=A0s 07:22:32 UTC+1, Jan Kiszka escreveu:<blockquote class=
=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #cc=
c solid;padding-left: 1ex;">On 31.07.19 02:40, Jo=C3=A3o Reis wrote:
<br>&gt; Other thing i forgot was that on Ultrascale+ the RAM finishes at 2=
GB
<br>&gt; (0x80000000), so i moved the memory region to 0x60000000, with a d=
ifferent size
<br>&gt; to not overlap any other memory region.
<br>&gt;=20
<br>&gt; /* RAM */ {
<br>&gt; .phys_start =3D 0x60000000,
<br>&gt; .virt_start =3D 0x60000000,
<br>&gt; .size =3D 0x1bef0000, //must be page size aligned
<br>&gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
<br>&gt; JAILHOUSE_MEM_DMA,
<br>&gt; },
<br>&gt;=20
<br>&gt; But now it gives me the error on ramdisk_address:
<br>&gt;=20
<br>&gt; Traceback (most recent call last):
<br>&gt; =C2=A0 File &quot;/usr/local/libexec/jailhouse/<wbr>jailhouse-cell=
-linux&quot;, line 831, in &lt;module&gt;
<br>&gt; =C2=A0 =C2=A0 cell.load(args.initrd.read(), arch.ramdisk_address()=
)
<br>&gt; =C2=A0 File &quot;/usr/local/lib/python2.7/<wbr>dist-packages/pyja=
ilhouse/<wbr>cell.py&quot;, line 44, in
<br>&gt; load
<br>&gt; =C2=A0 =C2=A0 fcntl.ioctl(<a href=3D"http://self.dev" target=3D"_b=
lank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.co=
m/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNH9=
hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;" onclick=3D"this.href=3D&#39;h=
ttp://www.google.com/url?q\x3dhttp%3A%2F%2Fself.dev\x26sa\x3dD\x26sntz\x3d1=
\x26usg\x3dAFQjCNH9hLWbeS0NEb_1KzthAtPBQE9BRg&#39;;return true;">self.dev</=
a>, self.JAILHOUSE_CELL_LOAD, load)
<br>&gt; IOError: [Errno 22] Invalid argument
<br>&gt;=20
<br>
<br>To make this a bit more systematic, I would recommend you to instrument=
 the
<br>code, dump this address e.g., and match against what you think you conf=
igured.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c%40googlegroups.com<=
/a>.<br />

------=_Part_554_1661427829.1564713268207--

------=_Part_553_403749091.1564713268207--
