Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBLEM3CCQMGQEYZ5CVSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf37.google.com (mail-qv1-xf37.google.com [IPv6:2607:f8b0:4864:20::f37])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B4A3970DA
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Jun 2021 12:04:29 +0200 (CEST)
Received: by mail-qv1-xf37.google.com with SMTP id k6-20020a0cd6860000b029021936c6e8ffsf3368227qvi.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Jun 2021 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Al/1T/ACNdhYlMTgPiuUfNShNVxnCCCFdOHZTl27Yso=;
        b=BDj1b3aI+78NEYUDsEqzGolXzKqvPFIwwj4FT5HQXqsHtdjvUf8sYYWa/8QEirQ+ec
         ovQ3KO9koQiVH0fV/b3XpSylFlEaMb1P4aLQfz7lhy9aJq4hIuivVIQQtAp9UCR4qDVU
         1NMvEDVIlT5/NeEaZ8Eie7GOL/23qj0RNRBFwy+9eal3s6fZWZauLkLp4s8bGj12An1F
         BpVF6Hv99DlhZI9L02Pz2pTAYichOITwpEn9gCFF/eR0qEdQpVTL+pkxtw1imbvh0MOm
         ec5141IctchmMdZtXUf3sBUx4R2kbAfAYT9yWmXCiFN6oDfaCZg8ZNOZYhSzBQel89fx
         nMkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Al/1T/ACNdhYlMTgPiuUfNShNVxnCCCFdOHZTl27Yso=;
        b=nQosQZctZaB1ZerjaRi7P4bUqpfhJS2W6anF3eyrhq/zqhLCp2Li7aGGqeXejqwFJp
         +4dsOgxPMLrzGgQLqFRmlKDQ4Tidh+9MuGTu7DlXTiGrqLvtkBrBgUh9WW5ZcvI3H9B6
         KSjMzPPmCvPxChIkSOpA1LcU5RYsd2bl0orTJ0SXPgNibB/2yiOjUI1XJbO3/M/7h+vH
         U7G5t1Q8qmICDlRmu3is00MBbGgKeTznf9fJQ1y3GXgIHBvQ1kyXnCw9/jItzju+0Wyr
         jGJmOKnIW6CPan5s+WW4fW3Y/Udv2hZN3yg5yGwDDJA8BIDyhwGxrQMIKz5+sv1RCdEg
         79Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Al/1T/ACNdhYlMTgPiuUfNShNVxnCCCFdOHZTl27Yso=;
        b=UYWqa0zszSBjzgSQOVHCddoMVQ5UL5RBJR6sRBNvC0K/NRcmnLCDPirKcHLyRjJ8T2
         UOa3DxsLhexzRzqkgY5+Fgcav7GC7GFAbgtHD+FAiozqKyDIeZlNlllL6iPUTtaJWHjO
         aDYPSMRNsLSWStvqeuY+XCqOjzXisSVUewJmMcjll9zlkDaSswS8kReRnamTLHB/ueDy
         dLTl+IVoXtYMtu3ytgBSifQtw6fSex6HI756+9qQrUv7RPvxZycre4NrnyqeB3vzbQx5
         SOaubumGx+QzIG5efztFy47wdqXSIUD/5GuyqcTs2DPeVGnmZf5fE2toHQqVfU8+aKsB
         ULyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531DEIXBNy9lXKrOo8xAmLhf2o4eMMwC3ifojxa3GisMSwuG5pEF
	b4IDfP7DS4qXV1FckDjLTys=
X-Google-Smtp-Source: ABdhPJz0NdpWI1syol3JR8VsHrb1CuZo5NbkG9oGQDZ7TauN7/MYfqfJu8zunKTqDINk/dGJZFCTbg==
X-Received: by 2002:ae9:ef82:: with SMTP id d124mr9425516qkg.433.1622541868301;
        Tue, 01 Jun 2021 03:04:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:ea15:: with SMTP id f21ls10526728qkg.7.gmail; Tue, 01
 Jun 2021 03:04:27 -0700 (PDT)
X-Received: by 2002:a05:620a:15e3:: with SMTP id p3mr21069659qkm.115.1622541867737;
        Tue, 01 Jun 2021 03:04:27 -0700 (PDT)
Date: Tue, 1 Jun 2021 03:04:27 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f572fb5e-9d0a-4b8d-abc5-7aab1590aa58n@googlegroups.com>
In-Reply-To: <a829b501-b59d-d9f6-531b-6ad07667d2a7@siemens.com>
References: <31493abc-ae9a-42d9-996c-edf630f2456dn@googlegroups.com>
 <a829b501-b59d-d9f6-531b-6ad07667d2a7@siemens.com>
Subject: Re: The right configuration to partition pci device into inmate for
 QEMU
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1368_1313751605.1622541867132"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_1368_1313751605.1622541867132
Content-Type: multipart/alternative; 
	boundary="----=_Part_1369_426199910.1622541867132"

------=_Part_1369_426199910.1622541867132
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1.  about  Invalid PCI MMCONFIG write, device 02:00:0, reg:110, size:4"
I don't know why show this when use original  .c configuration.
After I added this, it  doesn't  show error.  I don't know why.
 {
 .phys_start =3D 0xb0000000,//mmconfig
 .virt_start =3D 0xb0000000,
 .size =3D 0x10000000,
 .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
},

2.  about qemu version
The qemu on  ubuntu 18.04 default is 2.11.1 =EF=BC=8C it run failed.    The=
 network=20
card e1000e  will go down after ifup  eth1.
I change to qemu-6.0.0 , it sucess. Maybe qemu-4.2.1 is also ok.=20


=E5=9C=A82021=E5=B9=B46=E6=9C=881=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8=
 =E4=B8=8A=E5=8D=881:49:08<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A

> On 31.05.21 07:00, along li wrote:
> > When I run  qemu demo. try to partition pci device into inmate.
> > I failed.
> >=20
> > After some lone time trying , I sucess.
> > The PCI device  e1000e  is partitioned into inmate and ping sucess in
> > inmate.
> > what the defference is:
> > 1. I  add this into root.c(qemu-x86.c) and  qemu-linux-demo.c
> > {
> > .phys_start =3D 0xb0000000,//mmconfig
> > .virt_start =3D 0xb0000000,
> > .size =3D 0x10000000,
> > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> > },
>
> This is wrong, "jailhouse config check" should also complain. You will
> eventually loose interrupts or get even worse behaviour.
>
> > or It will show   "Invalid PCI MMCONFIG write, device 02:00:0, reg:110,
> > size:4"
> >=20
>
> You need to address the root cause: The guest tries to access a PCI
> config registers, likely related to PCI capability that has no write
> permission in your config yet. See also the good-old Jailhouse tutorial.
>
> >=20
> > 2. use qemu-6.0 to run the qemu demo.
> > When use qemu -2..11.1 to run the demo the network  card cann't run=20
> sucess.
> > It  turns off  after I turn  on it use  ifconfig  up  command.
> >=20
> > well, may it help someone.  whe to try the qemu demo for pci partition.
> >=20
>
> I'm on 4.2.1 to 6.0 here, those seem to have no issue with changing
> resource layout. Possibly, we have to lift the lower version boundary by
> now, though.
>
> Can you be more specific in regards to what didn't work? Did you try to
> compare if /proc/iomem in the root cell is comparable across those qemu
> versions?
>
> Jan
>
> --=20
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f572fb5e-9d0a-4b8d-abc5-7aab1590aa58n%40googlegroups.com.

------=_Part_1369_426199910.1622541867132
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1.&nbsp; about&nbsp; Invalid PCI MMCONFIG write, device 02:00:0, reg:110,&n=
bsp;size:4"<br>I don't know why show this when use original&nbsp; .c config=
uration.<div>After I added this, it&nbsp; doesn't&nbsp; show error.&nbsp; I=
 don't know why.</div><div>&nbsp;{<br>&nbsp;.phys_start =3D 0xb0000000,//mm=
config<br>&nbsp;.virt_start =3D 0xb0000000,<br>&nbsp;.size =3D 0x10000000,<=
br>&nbsp;.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<br>},<br></di=
v><div><br></div><div>2.&nbsp; about qemu version</div><div>The qemu on&nbs=
p; ubuntu 18.04 default is 2.11.1 =EF=BC=8C it run failed.&nbsp; &nbsp; The=
 network card e1000e&nbsp; will go down after ifup&nbsp; eth1.</div><div>I =
change to qemu-6.0.0 , it sucess. Maybe qemu-4.2.1 is also ok.&nbsp;</div><=
div><br></div><div><br></div><div class=3D"gmail_quote"><div dir=3D"auto" c=
lass=3D"gmail_attr">=E5=9C=A82021=E5=B9=B46=E6=9C=881=E6=97=A5=E6=98=9F=E6=
=9C=9F=E4=BA=8C UTC+8 =E4=B8=8A=E5=8D=881:49:08&lt;j.kiszka...@gmail.com> =
=E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); paddi=
ng-left: 1ex;">On 31.05.21 07:00, along li wrote:
<br>&gt; When I run=C2=A0 qemu demo. try to partition pci device into inmat=
e.
<br>&gt; I failed.
<br>&gt;=20
<br>&gt; After some lone time trying , I sucess.
<br>&gt; The PCI device=C2=A0=C2=A0e1000e=C2=A0 is partitioned into inmate =
and ping sucess in
<br>&gt; inmate.
<br>&gt; what the defference is:
<br>&gt; 1. I=C2=A0 add this into root.c(qemu-x86.c) and=C2=A0 qemu-linux-d=
emo.c
<br>&gt; {
<br>&gt; .phys_start =3D 0xb0000000,//mmconfig
<br>&gt; .virt_start =3D 0xb0000000,
<br>&gt; .size =3D 0x10000000,
<br>&gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt; },
<br>
<br>This is wrong, &quot;jailhouse config check&quot; should also complain.=
 You will
<br>eventually loose interrupts or get even worse behaviour.
<br>
<br>&gt; or It will show=C2=A0 =C2=A0&quot;Invalid PCI MMCONFIG write, devi=
ce 02:00:0, reg:110,
<br>&gt; size:4&quot;
<br>&gt;=20
<br>
<br>You need to address the root cause: The guest tries to access a PCI
<br>config registers, likely related to PCI capability that has no write
<br>permission in your config yet. See also the good-old Jailhouse tutorial=
.
<br>
<br>&gt;=20
<br>&gt; 2. use qemu-6.0 to run the qemu demo.
<br>&gt; When use qemu -2..11.1 to run the demo the network=C2=A0 card cann=
&#39;t run sucess.
<br>&gt; It=C2=A0 turns off=C2=A0 after I=C2=A0turn=C2=A0 on it use=C2=A0 i=
fconfig=C2=A0 up=C2=A0 command.
<br>&gt;=20
<br>&gt; well, may it help someone.=C2=A0 whe to try the qemu demo for pci =
partition.
<br>&gt;=20
<br>
<br>I&#39;m on 4.2.1 to 6.0 here, those seem to have no issue with changing
<br>resource layout. Possibly, we have to lift the lower version boundary b=
y
<br>now, though.
<br>
<br>Can you be more specific in regards to what didn&#39;t work? Did you tr=
y to
<br>compare if /proc/iomem in the root cell is comparable across those qemu
<br>versions?
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
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
om/d/msgid/jailhouse-dev/f572fb5e-9d0a-4b8d-abc5-7aab1590aa58n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f572fb5e-9d0a-4b8d-abc5-7aab1590aa58n%40googlegroups.co=
m</a>.<br />

------=_Part_1369_426199910.1622541867132--

------=_Part_1368_1313751605.1622541867132--
