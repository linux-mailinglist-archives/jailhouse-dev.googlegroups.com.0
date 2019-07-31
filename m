Return-Path: <jailhouse-dev+bncBCR7PPMN34DRB4OGQPVAKGQEASANBYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A32F7B748
	for <lists+jailhouse-dev@lfdr.de>; Wed, 31 Jul 2019 02:40:18 +0200 (CEST)
Received: by mail-ot1-x338.google.com with SMTP id b4sf36669664otf.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 17:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uCgteU3/wigu50MbwFidGD/p/j7JLFXTflXvSpXqZJI=;
        b=Bs8dF9QvS9mKxvu4Sd8zLEgAHbbd/5jRRXWRYbaXDKWkbcp3RlHIfJiiFrEq1I3vRh
         GVlGVUJ72ziDGyerAIQUEdGydPL/AL92F5jRhN26E9QKBKu3ab/9sa9w34u02ZycUzo/
         mVG2lyG8ZOkvaV/83r+AqVmDn2i2EvhdPH+2p5lWHjOttaWiu3nJ4hVhX/0GT5wKCEJ2
         E7cvsEKtjDfs+MEV1PA/AozWNV9f6EslktFihcHTTdbw6m3CftBV9t0lo2u3FG2oQ/H6
         M9JRAZdn8eULL1OKUc5hlylnO4nj6eKMLE8A1ixwvf7CVNWF9nV8+I+cFUdke5rpKt7h
         Xd5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uCgteU3/wigu50MbwFidGD/p/j7JLFXTflXvSpXqZJI=;
        b=K9bPtwRqFHx6HQiNd3U+d/f/4CvQeAH/bWdN1kVyOxk1SepRG0k1cuhjyUY0bo8fHe
         e21JBGuPz4Gk5S28jR2y+Ne2zrmAJwDwLSiXaLVhoqNnBx+6BrssVl8Of9VU86SxsJWP
         gnFApzwvZEzMcTdcPGrcWk3K92aP9BQEtB9X7EGgWZANIs+JAPTGqmiJUOkOfie+sEsi
         ZL4iGfdkI4XAR0uTmp26PMxtWdWqjt+h0RDwpKsUdwdhM8cxv/oXQ5+Sa1xBOZ3Dhs2M
         +zXGrKZrpUq+6f42C4wO9SAVRCSY5Ul5maxBuZCtQAVzHLorhYfYCjmpz5zgmOutkvHX
         bGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uCgteU3/wigu50MbwFidGD/p/j7JLFXTflXvSpXqZJI=;
        b=QcDCq3n9s/bY7vqU8nFfiQ+kp1f8SFLmVMSsxA0yrYmG5V6aw/qKCBKDRq3JgClWt5
         S168+EXoLVwk0jDYacOg5y5kNJIJ6DggwGizGvvGreEbWzgDDeC9LJfgG750hLwEw7N6
         FSYzhc+1tUtz6KHtz0MsdmWes9im2ihZ43JieM/4guXiXem8exLm17uhakky4Dbdz1vK
         ZitY628P/jH23neD2BDQgE4N1ZSM0ElSEsfgZGpT/NMloloeSy/gnK7nFwTppZfw7xyC
         Rzn3Qfh63qVLC8jhQh1DWYo+0voj/tjB7cJn/lZyou/LLknHMmrU5fsu4Hzx0d22XqCy
         FbcQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXnpe4rxvCs5kV3whQmNVY4HkVPtH8Sa+YUmQ0w7wiiSzIiShAX
	5b+OvqOpp0SRGVutxrSzRLw=
X-Google-Smtp-Source: APXvYqwANLmLdCiRa6B8jr8EpuzwyKUpEmjZEaI8TlhjZ6l09WOH/anfh+Do1oPh72Vz2VJAZTp63g==
X-Received: by 2002:a9d:2901:: with SMTP id d1mr68410325otb.154.1564533617443;
        Tue, 30 Jul 2019 17:40:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:71d0:: with SMTP id z16ls13169622otj.2.gmail; Tue, 30
 Jul 2019 17:40:16 -0700 (PDT)
X-Received: by 2002:a9d:5a16:: with SMTP id v22mr65542014oth.150.1564533616584;
        Tue, 30 Jul 2019 17:40:16 -0700 (PDT)
Date: Tue, 30 Jul 2019 17:40:15 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
In-Reply-To: <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
 <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
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
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_9421_1712931568.1564533615909"
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

------=_Part_9421_1712931568.1564533615909
Content-Type: multipart/alternative; 
	boundary="----=_Part_9422_1034315846.1564533615909"

------=_Part_9422_1034315846.1564533615909
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Other thing i forgot was that on Ultrascale+ the RAM finishes at 2GB=20
(0x80000000), so i moved the memory region to 0x60000000, with a different=
=20
size to not overlap any other memory region.

/* RAM */ {
.phys_start =3D 0x60000000,
.virt_start =3D 0x60000000,
.size =3D 0x1bef0000, //must be page size aligned
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
JAILHOUSE_MEM_DMA,
},

But now it gives me the error on ramdisk_address:

Traceback (most recent call last):
  File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 831, in=20
<module>
    cell.load(args.initrd.read(), arch.ramdisk_address())
  File "/usr/local/lib/python2.7/dist-packages/pyjailhouse/cell.py", line=
=20
44, in load
    fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)
IOError: [Errno 22] Invalid argument



ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 18:00:59 UTC+1, Jan Kiszka es=
creveu:
>
> On 30.07.19 17:54, Jo=C3=A3o Reis wrote:=20
> > Ok, so i realized i was declaring, on non root cell, a memory region=20
> that=20
> > belonged to non-reserved memory from root cell(3fd00000-5fffffff :=20
> System RAM).=20
> > I've changed the memory region to reserved memory (address 0x90000000),=
=20
> because=20
> > on u-boot the memory reservation argument is mem=3D1536M, which equals =
to=20
> top=20
> > address 0x5fffffff.=20
> >=20
> > /* RAM */ {=20
> > .phys_start =3D 0x90000000,=20
> > .virt_start =3D 0x90000000,=20
> > .size =3D 0x20000000, =20
> > .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=20
> > JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |=20
> > JAILHOUSE_MEM_DMA,=20
> > },=20
>
> Do you also still have a small region at guest virtual address 0, to put=
=20
> the=20
> loader there?=20
>
> >=20
> > After issuing "jailhouse cell linux ultra96-linux-demo2.cell Image -d=
=20
> > inmate-zynqmp.dtb -i rootfs.cpio -c "console=3DttyS0, 115200" -k 4"=20
> >=20
> > The following error appears:=20
> >=20
> > [   82.987144] Created Jailhouse cell "non-root"=20
> > Cell "non-root" can be loaded=20
> >=20
> > Traceback (most recent call last):=20
> >   File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 826, i=
n=20
> <module>=20
> >     cell.load(open(linux_loader, mode=3D'rb').read(),=20
> arch.loader_address())=20
> >   File "/usr/local/lib/python2.7/dist-packages/pyjailhouse/cell.py",=20
> line 44, in=20
> > load=20
> >     fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)=20
> > IOError: [Errno 22] Invalid argument=20
>
> Does the hypervisor report that "Cell "XXX" can be loaded"? Then the erro=
r=20
> is=20
> reported by the driver module, load_image(). And I would bet on a missing=
=20
> region=20
> at address 0.=20
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
jailhouse-dev/12a82b12-b9bd-4258-87fb-9525f4bb648a%40googlegroups.com.

------=_Part_9422_1034315846.1564533615909
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Other thing i forgot was that on Ultrascale+ the RAM finis=
hes at 2GB (0x80000000), so i moved the memory region to 0x60000000, with a=
 different size to not overlap any other memory region.<br><br><div>/* RAM =
*/ {</div><div><span style=3D"white-space:pre">			</span>.phys_start =3D 0x=
60000000,</div><div><span style=3D"white-space:pre">			</span>.virt_start =
=3D 0x60000000,</div><div><span style=3D"white-space:pre">			</span>.size =
=3D 0x1bef0000, //must be page size aligned</div><div><span style=3D"white-=
space:pre">			</span>.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<=
/div><div><span style=3D"white-space:pre">				</span>JAILHOUSE_MEM_EXECUTE =
| JAILHOUSE_MEM_LOADABLE |</div><div><span style=3D"white-space:pre">				</=
span>JAILHOUSE_MEM_DMA,</div><div><span style=3D"white-space:pre">		</span>=
},</div><div><br></div><div>But now it gives me the error on ramdisk_addres=
s:</div><div><br></div><div><div>Traceback (most recent call last):</div><d=
iv>=C2=A0 File &quot;/usr/local/libexec/jailhouse/jailhouse-cell-linux&quot=
;, line 831, in &lt;module&gt;</div><div>=C2=A0 =C2=A0 cell.load(args.initr=
d.read(), arch.ramdisk_address())</div><div>=C2=A0 File &quot;/usr/local/li=
b/python2.7/dist-packages/pyjailhouse/cell.py&quot;, line 44, in load</div>=
<div>=C2=A0 =C2=A0 fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)</d=
iv><div>IOError: [Errno 22] Invalid argument</div></div><div><br></div><div=
><br></div><br>ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 18:00:59 UTC+1=
, Jan Kiszka escreveu:<blockquote class=3D"gmail_quote" style=3D"margin: 0;=
margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 30.07=
.19 17:54, Jo=C3=A3o Reis wrote:
<br>&gt; Ok, so i realized i was declaring, on non root cell,=C2=A0a memory=
 region that
<br>&gt; belonged to non-reserved memory from root cell(3fd00000-5fffffff :=
 System RAM).
<br>&gt; I&#39;ve changed the memory region to reserved memory (address 0x9=
0000000), because
<br>&gt; on u-boot the memory reservation argument is mem=3D1536M, which eq=
uals to top
<br>&gt; address 0x5fffffff.
<br>&gt;=20
<br>&gt; /* RAM */ {
<br>&gt; .phys_start =3D 0x90000000,
<br>&gt; .virt_start =3D 0x90000000,
<br>&gt; .size =3D 0x20000000,=C2=A0
<br>&gt; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
<br>&gt; JAILHOUSE_MEM_DMA,
<br>&gt; },
<br>
<br>Do you also still have a small region at guest virtual address 0, to pu=
t the
<br>loader there?
<br>
<br>&gt;=20
<br>&gt; After issuing &quot;jailhouse cell linux ultra96-linux-demo2.cell =
Image -d
<br>&gt; inmate-zynqmp.dtb -i rootfs.cpio -c &quot;console=3DttyS0, 115200&=
quot; -k 4&quot;
<br>&gt;=20
<br>&gt; The following error appears:
<br>&gt;=20
<br>&gt; [=C2=A0 =C2=A082.987144] Created Jailhouse cell &quot;non-root&quo=
t;
<br>&gt; Cell &quot;non-root&quot; can be loaded
<br>&gt;=20
<br>&gt; Traceback (most recent call last):
<br>&gt; =C2=A0 File &quot;/usr/local/libexec/jailhouse/<wbr>jailhouse-cell=
-linux&quot;, line 826, in &lt;module&gt;
<br>&gt; =C2=A0 =C2=A0 cell.load(open(linux_loader, mode=3D&#39;rb&#39;).re=
ad(), arch.loader_address())
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
<br>
<br>Does the hypervisor report that &quot;Cell &quot;XXX&quot; can be loade=
d&quot;? Then the error is
<br>reported by the driver module, load_image(). And I would bet on a missi=
ng region
<br>at address 0.
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
om/d/msgid/jailhouse-dev/12a82b12-b9bd-4258-87fb-9525f4bb648a%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/12a82b12-b9bd-4258-87fb-9525f4bb648a%40googlegroups.com<=
/a>.<br />

------=_Part_9422_1034315846.1564533615909--

------=_Part_9421_1712931568.1564533615909--
