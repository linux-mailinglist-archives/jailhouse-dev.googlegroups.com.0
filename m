Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBPWQQHVAKGQEXX653RQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADBD7ACEF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 17:54:40 +0200 (CEST)
Received: by mail-oi1-x23f.google.com with SMTP id a198sf24993925oii.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jul 2019 08:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=frsUI+76NobTYVWCZg2zfWz90ZIuRGh85uffI5OLLeM=;
        b=KUQoZBALo02z0Z1Uy/S4UhvPD/6mxaFygnIehClmUxdY7aXhzZgmO+RYlR1Z5fcePd
         4Ie/gQZhPqDOSjXppHiHAhG/0Yz5qtVr8+OnI8yg4AZhcoxOIdebdJKET7k04VYLFCfV
         yMOO7MD13XqGiZgQXDXX7A9/0p+e8u00xWpPjq5leeRdpuXBj9jXTGTbk/yU09YF1Ufj
         HIZp14gEMzUttoGweodQAJxIeI7LXvyDmgnzVVxfr+kvKDmN6sfBIBtRjAW4BRA1RU+T
         XOWJTPbgsUVg1aqbnrWjguU2KsCBiPmxO1Ni4ISSSev7XHlmQpBqz8ksvRbcoJriwpvU
         ONdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=frsUI+76NobTYVWCZg2zfWz90ZIuRGh85uffI5OLLeM=;
        b=NShIQ8KvZqnbAKr1GUO5PDW0HIA6yt5FVUmqOePJILhVla+ksUY/DN5dpmdg7CuZsH
         nwBvF4h8GGdCf7MjABFnwjcwBk7vW+UsKMuhJvzQrY91cw6hwbThncMmDbDkOQynFNqG
         zYJ9RW1dFcbHwGcSJIPZ2gxh88eZ4MavqmfZ7zJoRH0CqylVrc+u1vCyYrZOcfBikm45
         jnRNdSSWdPXIpsa31DSD4XlfxmDbr3O1IDyW5iAeFaYQTMXl7HjnPuMIuu4J2/y/CUZU
         9tdDA4wVoUfQsKPAQfZII+4ShUemuA7xGvBJgVAKYpjkOhlLMjc0DKhuzkCBHaOX4YHw
         kSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=frsUI+76NobTYVWCZg2zfWz90ZIuRGh85uffI5OLLeM=;
        b=Aw2ZehJVkxzah+Em/OaOvI5ux6dM0EU5+4qmlDI2upX12+9UYmE2yG1s08ChpH7xIP
         Xhpfg99u1gSiBh+R326dD/WmcDSXcBrzkTkPjvMJNO7OMJePOwXcHpBdh0OrWqdEpjQM
         hAdAXSoqxsEHrBNRCCglvVgNEWBbv8UbPL0vkeb2NGoAnQvy5N9qLIiZJSXAvsotV94k
         hGczw8U5mlOJJ1N6H3Hit6/lnj6KdeZVWVBG1bJjzSc4uYFcMut7lPiBY+zuf40VW3yu
         R3R6XNR3YIk2pba7kfDaiioPxWHB1jpdigoWE+IHrNEkIySAfO/9oTvWVnfDQVxYqOCF
         Tptg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVpvQNIYTl9amHQaLCH1IZwuP/95L5j2K+iVBYlVsWtzysoy4DC
	6hLwZakeed0FI1C+mCKaWpE=
X-Google-Smtp-Source: APXvYqwhN5NoP6KLIVa8GiEvnZ9SUj6cJ+39I1xwCJiv/UDaa9OY4/bPErs6wMqMla/0ioQC0ZED8A==
X-Received: by 2002:aca:210f:: with SMTP id 15mr55195714oiz.24.1564502079081;
        Tue, 30 Jul 2019 08:54:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6c1a:: with SMTP id f26ls12568274otq.4.gmail; Tue, 30
 Jul 2019 08:54:38 -0700 (PDT)
X-Received: by 2002:a05:6830:1209:: with SMTP id r9mr18692794otp.128.1564502077830;
        Tue, 30 Jul 2019 08:54:37 -0700 (PDT)
Date: Tue, 30 Jul 2019 08:54:37 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
In-Reply-To: <94e3009c-aa34-e8f1-b503-d3a8b138d9a9@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
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
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_9253_1947637825.1564502077142"
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

------=_Part_9253_1947637825.1564502077142
Content-Type: multipart/alternative; 
	boundary="----=_Part_9254_1835831939.1564502077142"

------=_Part_9254_1835831939.1564502077142
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, so i realized i was declaring, on non root cell, a memory region that=
=20
belonged to non-reserved memory from root cell (3fd00000-5fffffff : System=
=20
RAM).
I've changed the memory region to reserved memory (address 0x90000000),=20
because on u-boot the memory reservation argument is mem=3D1536M, which=20
equals to top address 0x5fffffff.

/* RAM */ {
.phys_start =3D 0x90000000,
.virt_start =3D 0x90000000,
.size =3D 0x20000000,=20
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
JAILHOUSE_MEM_DMA,
},

After issuing "jailhouse cell linux ultra96-linux-demo2.cell Image -d=20
inmate-zynqmp.dtb -i rootfs.cpio -c "console=3DttyS0, 115200" -k 4"

The following error appears:

[   82.987144] Created Jailhouse cell "non-root"
Cell "non-root" can be loaded

Traceback (most recent call last):
  File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 826, in=20
<module>
    cell.load(open(linux_loader, mode=3D'rb').read(), arch.loader_address()=
)
  File "/usr/local/lib/python2.7/dist-packages/pyjailhouse/cell.py", line=
=20
44, in load
    fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)
IOError: [Errno 22] Invalid argument
root@xilinx-ultra96-reva-2018_2:~# \00

ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 14:35:04 UTC+1, Jan Kiszka es=
creveu:
>
> On 30.07.19 14:55, Jo=C3=A3o Reis wrote:=20
> > The rest of the dump is:=20
> >=20
> > "Parking CPU 1 (Cell: "root")"=20
>
> Exactly. So the problem is with the root cell, not the non-root one. Chec=
k=20
> what=20
> I wrote regarding memory reservation.=20
>
> Jan=20
>
> >=20
> > ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 13:30:47 UTC+1, Jan Kiszk=
a escreveu:=20
> >=20
> >     On 30.07.19 12:32, Jo=C3=A3o Reis wrote:=20
> >     > This problem is still related to non root cell, when i issue=20
> jailhouse=20
> >     cell linux.=20
> >     >=20
> >=20
> >     Which CPU & cell is stopped according to the output?=20
> >     Your dump is missing the line "Stopped CPU x (Cell: XXX)".=20
> >=20
> >     Jan=20
> >=20
> >     > ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 06:39:59 UTC+1, Jan=
 Kiszka=20
> escreveu:=20
> >     >=20
> >     >     On 30.07.19 04:18, Jo=C3=A3o Reis wrote:=20
> >     >     > Ok, that's it. But now, another error related to that memor=
y=20
> region=20
> >     appears:=20
> >     >     >=20
> >     >     > FATAL: instruction abort at 0x4fffe1d0=20
> >     >     > FATAL: forbidden access (exception class 0x20)=20
> >     >     > Cell state before exception:=20
> >     >     >  pc: ffffff80080971d0   lr: ffffff8008768e14 spsr: 600001c5=
 =20
>    EL1=20
> >     >     >  sp: ffffff8008e73ea0  esr: 20 1 0000086=20
> >     >     >  x0: ffffffc04d2b7a00   x1: ffffffc04cff6000   x2:=20
> 0000000000000000=20
> >     >     >  x3: ffffff8008768de0   x4: 0000000000000015   x5:=20
> 00ffffffffffffff=20
> >     >     >  x6: 0000000029382596   x7: 0000000000000f94   x8:=20
> ffffffc04ff79404=20
> >     >     >  x9: 00000000000007df  x10: ffffffc04ff793e4  x11:=20
> 0000000000001dd8=20
> >     >     > x12: 0000000000000000  x13: 00000000000094e5  x14:=20
> 071c71c71c71c71c=20
> >     >     > x15: ffffff8008e78000  x16: ffffff800819b1e8  x17:=20
> 0000007fa7da3718=20
> >     >     > x18: ffffffc04ff7a460  x19: ffffffc04cff6000  x20:=20
> ffffffc04cff6018=20
> >     >     > x21: ffffffc04d2b7a00  x22: 0000000000000000  x23:=20
> ffffffc04cff6000=20
> >     >     > x24: 00000009ed76160a  x25: ffffffc04cff6000  x26:=20
> ffffff8008e82100=20
> >     >     > x27: 0000000000000400  x28: 0000000000df0018  x29:=20
> ffffff8008e73ea0=20
> >     >     >=20
> >     >     > The error happens in an address within the memory region i=
=20
> want to=20
> >     put the=20
> >     >     Linux=20
> >     >     > images (3fd00000-5fffffff : System RAM), and that i declare=
d=20
> on the=20
> >     config=20
> >     >     file.=20
> >     >=20
> >     >     Which cell raises this error (you cut off that information)?=
=20
> If it is=20
> >     the root=20
> >     >     cell, it may lack LOADABLE rights for the region. If it=20
> happens after=20
> >     loading,=20
> >     >     you forgot to reserve that memory via "mem=3D" or dtb=20
> reservations.=20
> >     >=20
> >     >     Jan=20
> >     >=20
> >     >     --=20
> >     >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> >     >     Corporate Competence Center Embedded Linux=20
> >     >=20
> >     > --=20
> >     > You received this message because you are subscribed to the Googl=
e=20
> Groups=20
> >     > "Jailhouse" group.=20
> >     > To unsubscribe from this group and stop receiving emails from it,=
=20
> send an=20
> >     email=20
> >     > to jailho...@googlegroups.com <javascript:>=20
> >     > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>=
=20
> <javascript:>>.=20
> >     > To view this discussion on the web visit=20
> >     >=20
> >    =20
> https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-9=
7c445100824%40googlegroups.com=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-9=
7c445100824%40googlegroups.com>=20
>
> >=20
> >     >=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-9=
7c445100824%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-9=
7c445100824%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.=20
>
> >=20
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> Groups=20
> > "Jailhouse" group.=20
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> an email=20
> > to jailho...@googlegroups.com <javascript:>=20
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com <javascript:>>.=20
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/39b83770-5562-437f-a25b-4=
15d85dc7c3b%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/39b83770-5562-437f-a25b-4=
15d85dc7c3b%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
>
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
jailhouse-dev/43d8fdde-153f-40ec-8974-4388efab8315%40googlegroups.com.

------=_Part_9254_1835831939.1564502077142
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, so i realized i was declaring, on non root cell,=C2=A0=
a memory region that belonged to non-reserved memory from root cell<font co=
lor=3D"#000000"> (3fd00000-5fffffff : System RAM).</font><div>I&#39;ve chan=
ged the memory region to reserved memory (address 0x90000000), because on u=
-boot the memory reservation argument is mem=3D1536M, which equals to top a=
ddress 0x5fffffff.</div><div><br></div><div><div>/* RAM */ {</div><div><spa=
n style=3D"white-space:pre">			</span>.phys_start =3D 0x90000000,</div><div=
><span style=3D"white-space:pre">			</span>.virt_start =3D 0x90000000,</div=
><div><span style=3D"white-space:pre">			</span>.size =3D 0x20000000,=C2=A0=
</div><div><span style=3D"white-space:pre">			</span>.flags =3D JAILHOUSE_M=
EM_READ | JAILHOUSE_MEM_WRITE |</div><div><span style=3D"white-space:pre">	=
			</span>JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |</div><div><span =
style=3D"white-space:pre">				</span>JAILHOUSE_MEM_DMA,</div><div><span sty=
le=3D"white-space:pre">		</span>},</div></div><div><br></div><div>After iss=
uing &quot;jailhouse cell linux ultra96-linux-demo2.cell Image -d inmate-zy=
nqmp.dtb -i rootfs.cpio -c &quot;console=3DttyS0, 115200&quot; -k 4&quot;</=
div><div><br></div><div>The following error appears:</div><div><br></div><d=
iv><div>[=C2=A0 =C2=A082.987144] Created Jailhouse cell &quot;non-root&quot=
;</div><div>Cell &quot;non-root&quot; can be loaded</div><div><br></div><di=
v>Traceback (most recent call last):</div><div>=C2=A0 File &quot;/usr/local=
/libexec/jailhouse/jailhouse-cell-linux&quot;, line 826, in &lt;module&gt;<=
/div><div>=C2=A0 =C2=A0 cell.load(open(linux_loader, mode=3D&#39;rb&#39;).r=
ead(), arch.loader_address())</div><div>=C2=A0 File &quot;/usr/local/lib/py=
thon2.7/dist-packages/pyjailhouse/cell.py&quot;, line 44, in load</div><div=
>=C2=A0 =C2=A0 fcntl.ioctl(self.dev, self.JAILHOUSE_CELL_LOAD, load)</div><=
div>IOError: [Errno 22] Invalid argument</div><div>root@xilinx-ultra96-reva=
-2018_2:~# \00</div><br>ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 14:35=
:04 UTC+1, Jan Kiszka escreveu:<blockquote class=3D"gmail_quote" style=3D"m=
argin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;"=
>On 30.07.19 14:55, Jo=C3=A3o Reis wrote:
<br>&gt; The rest of the dump is:
<br>&gt;=20
<br>&gt; &quot;Parking CPU 1 (Cell: &quot;root&quot;)&quot;
<br>
<br>Exactly. So the problem is with the root cell, not the non-root one. Ch=
eck what
<br>I wrote regarding memory reservation.
<br>
<br>Jan
<br>
<br>&gt;=20
<br>&gt; ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 13:30:47 UTC+1, Jan =
Kiszka escreveu:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 30.07.19 12:32, Jo=C3=A3o Reis wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; This problem is still related to non root cell,=
 when i issue jailhouse
<br>&gt; =C2=A0 =C2=A0 cell linux.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Which CPU &amp; cell is stopped according to the out=
put?
<br>&gt; =C2=A0 =C2=A0 Your dump is missing the line &quot;Stopped CPU x (C=
ell: XXX)&quot;.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Jan
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt; ter=C3=A7a-feira, 30 de Julho de 2019 =C3=A0s 0=
6:39:59 UTC+1, Jan Kiszka escreveu:
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 On 30.07.19 04:18, Jo=C3=A3o Reis=
 wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; Ok, that&#39;s it. But now, =
another error related to that memory region
<br>&gt; =C2=A0 =C2=A0 appears:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; FATAL: instruction abort at =
0x4fffe1d0
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; FATAL: forbidden access (exc=
eption class 0x20)
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; Cell state before exception:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0pc: ffffff80080971d0=
=C2=A0 =C2=A0lr: ffffff8008768e14 spsr: 600001c5=C2=A0 =C2=A0 =C2=A0EL1
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0sp: ffffff8008e73ea0=
=C2=A0 esr: 20 1 0000086
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0x0: ffffffc04d2b7a00=
=C2=A0 =C2=A0x1: ffffffc04cff6000=C2=A0 =C2=A0x2: 0000000000000000
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0x3: ffffff8008768de0=
=C2=A0 =C2=A0x4: 0000000000000015=C2=A0 =C2=A0x5: 00ffffffffffffff
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0x6: 0000000029382596=
=C2=A0 =C2=A0x7: 0000000000000f94=C2=A0 =C2=A0x8: ffffffc04ff79404
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; =C2=A0x9: 00000000000007df=
=C2=A0 x10: ffffffc04ff793e4=C2=A0 x11: 0000000000001dd8
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; x12: 0000000000000000=C2=A0 =
x13: 00000000000094e5=C2=A0 x14: 071c71c71c71c71c
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; x15: ffffff8008e78000=C2=A0 =
x16: ffffff800819b1e8=C2=A0 x17: 0000007fa7da3718
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; x18: ffffffc04ff7a460=C2=A0 =
x19: ffffffc04cff6000=C2=A0 x20: ffffffc04cff6018
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; x21: ffffffc04d2b7a00=C2=A0 =
x22: 0000000000000000=C2=A0 x23: ffffffc04cff6000
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; x24: 00000009ed76160a=C2=A0 =
x25: ffffffc04cff6000=C2=A0 x26: ffffff8008e82100
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; x27: 0000000000000400=C2=A0 =
x28: 0000000000df0018=C2=A0 x29: ffffff8008e73ea0
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; The error happens in an addr=
ess within the memory region i want to
<br>&gt; =C2=A0 =C2=A0 put the
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Linux
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; images (3fd00000-5fffffff : =
System RAM), and that i declared on the
<br>&gt; =C2=A0 =C2=A0 config
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 file.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Which cell raises this error (you=
 cut off that information)? If it is
<br>&gt; =C2=A0 =C2=A0 the root
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 cell, it may lack LOADABLE rights=
 for the region. If it happens after
<br>&gt; =C2=A0 =C2=A0 loading,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 you forgot to reserve that memory=
 via &quot;mem=3D&quot; or dtb reservations.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Jan
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 --
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Siemens AG, Corporate Technology,=
 CT RDA IOT SES-DE
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Corporate Competence Center Embed=
ded Linux
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; --
<br>&gt; =C2=A0 =C2=A0 &gt; You received this message because you are subsc=
ribed to the Google Groups
<br>&gt; =C2=A0 =C2=A0 &gt; &quot;Jailhouse&quot; group.
<br>&gt; =C2=A0 =C2=A0 &gt; To unsubscribe from this group and stop receivi=
ng emails from it, send an
<br>&gt; =C2=A0 =C2=A0 email
<br>&gt; =C2=A0 =C2=A0 &gt; to <a>jailho...@googlegroups.com</a> &lt;javasc=
ript:&gt;
<br>&gt; =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"javascript:" target=3D"_b=
lank" gdf-obfuscated-mailto=3D"MQ1ycWChCgAJ" rel=3D"nofollow" onmousedown=
=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D=
&#39;javascript:&#39;;return true;">jailhouse-dev+<wbr>unsubscribe@googlegr=
oups.com</a> &lt;javascript:&gt;&gt;.
<br>&gt; =C2=A0 =C2=A0 &gt; To view this discussion on the web visit
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 <a href=3D"https://groups.google.com/d/msgid/jailhou=
se-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40googlegroups.com" target=3D"_=
blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://groups.goog=
le.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40googleg=
roups.com&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.goo=
gle.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40google=
groups.com&#39;;return true;">https://groups.google.com/d/<wbr>msgid/jailho=
use-dev/dde1cd0e-<wbr>407e-45b3-ae32-97c445100824%<wbr>40googlegroups.com</=
a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://groups=
.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40go=
oglegroups.com&#39;;return true;" onclick=3D"this.href=3D&#39;https://group=
s.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40g=
ooglegroups.com&#39;;return true;">https://groups.google.com/d/<wbr>msgid/j=
ailhouse-dev/dde1cd0e-<wbr>407e-45b3-ae32-97c445100824%<wbr>40googlegroups.=
com</a>&gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40googlegroups.com?utm_medi=
um=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmo=
usedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev=
/dde1cd0e-407e-45b3-ae32-97c445100824%40googlegroups.com?utm_medium\x3demai=
l\x26utm_source\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;ht=
tps://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-97c44=
5100824%40googlegroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;=
;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/dde1cd0=
e-<wbr>407e-45b3-ae32-97c445100824%<wbr>40googlegroups.com?utm_medium=3D<wb=
r>email&amp;utm_source=3Dfooter</a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/dde1cd0e-407e-45b3-ae32-97c445100824%40googlegroups.com?utm_medi=
um=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmo=
usedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev=
/dde1cd0e-407e-45b3-ae32-97c445100824%40googlegroups.com?utm_medium\x3demai=
l\x26utm_source\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;ht=
tps://groups.google.com/d/msgid/jailhouse-dev/dde1cd0e-407e-45b3-ae32-97c44=
5100824%40googlegroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;=
;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/dde1cd0=
e-<wbr>407e-45b3-ae32-97c445100824%<wbr>40googlegroups.com?utm_medium=3D<wb=
r>email&amp;utm_source=3Dfooter</a>&gt;&gt;.
<br>&gt;=20
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
 Groups
<br>&gt; &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send an email
<br>&gt; to <a href=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailto=
=3D"MQ1ycWChCgAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return =
true;">jailho...@<wbr>googlegroups.com</a>
<br>&gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfuscate=
d-mailto=3D"MQ1ycWChCgAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;=
javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;=
;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/39b8377=
0-5562-437f-a25b-415d85dc7c3b%40googlegroups.com" target=3D"_blank" rel=3D"=
nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid=
/jailhouse-dev/39b83770-5562-437f-a25b-415d85dc7c3b%40googlegroups.com&#39;=
;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/39b83770-5562-437f-a25b-415d85dc7c3b%40googlegroups.com&#39=
;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/39b837=
70-<wbr>5562-437f-a25b-415d85dc7c3b%<wbr>40googlegroups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/39b=
83770-5562-437f-a25b-415d85dc7c3b%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/39b83770-5562=
-437f-a25b-415d85dc7c3b%40googlegroups.com?utm_medium\x3demail\x26utm_sourc=
e\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.g=
oogle.com/d/msgid/jailhouse-dev/39b83770-5562-437f-a25b-415d85dc7c3b%40goog=
legroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;"=
>https://groups.google.com/d/<wbr>msgid/jailhouse-dev/39b83770-<wbr>5562-43=
7f-a25b-415d85dc7c3b%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;ut=
m_source=3Dfooter</a>&gt;.
<br>
<br>--=20
<br>Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/43d8fdde-153f-40ec-8974-4388efab8315%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/43d8fdde-153f-40ec-8974-4388efab8315%40googlegroups.com<=
/a>.<br />

------=_Part_9254_1835831939.1564502077142--

------=_Part_9253_1947637825.1564502077142--
