Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBVU45TUQKGQEOWAQXFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E02B76BA4
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 16:29:44 +0200 (CEST)
Received: by mail-oi1-x23a.google.com with SMTP id w123sf21170481oie.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 07:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BcBM6DgSCd5T2Ee1Wxqe5eOdsMhOufxTTXmfw421f6E=;
        b=ntpgo3YheJ20PatuG+rQXoXA8o84BFZjWyMP/DzB33+yerzTy4sLogjT+tjnklvSLW
         OEvXoXtVtEUWgV5t7rOOvgFafrSunEEKwCrdHxHcHsGna9Ptq5Boa5QldNd/Cy6fIeoO
         2SOS4syBQ4XOxbj3m0HxvZZJKTsyRyL1nOhm3504q3STQbL0pfZbXXbHg5yyXVR4PN6O
         dMJu4N8RgXlpTEqAKUQXB/sC9H/qeWqnEL+30i/nIl2Zw8k3oByQmISeBNnVXdiFXQ23
         phDeeaIVzoaPIVrkpfWGkQSM3EB9sqNX3BDhvuGdmY1ACa//hF2CtENcbesQqQrlJOdc
         +cFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BcBM6DgSCd5T2Ee1Wxqe5eOdsMhOufxTTXmfw421f6E=;
        b=mSwAfd6ZPX3j+pVieo5kLd92I6Ifof9xGnOIiSmZWLV2VXAZDo5gZoS49F1rPC9zbC
         ak7FPR9unsGITk3rHP3M6MOSWgSm+FYSA75fAdGYOvQhj8ztkazk2c4v770wFSa4js4B
         5rCgIxu9GGV+XR0CArC4MB85hVgfb7VOykBXH2I16m5+rINhs0SKCs3aNwHRzD8M6yTa
         3U5+dXGaUZLrvCgQwVVXCnFsIa9XAChmnSLw1A2n9yykCrf8MzbpkOkTB301pM5lqW7f
         IAxYcqlT0YlJGDv5VeGf7QcWQWqgPfLfRo08XRjHgPNdW/Zs3/x5B0FeoG3vsOEw3R//
         VVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BcBM6DgSCd5T2Ee1Wxqe5eOdsMhOufxTTXmfw421f6E=;
        b=sKbbRgZ8YZ0y/clwDuvZ6QrQE7agzG/6CHS0x7xkBRyIeR937VbtdRIqXS4+ILi7L6
         6DfDcfzubH6fHzDx03YjWntDDs7tqT6r/OE3kTU+gN5/qO6pNlrYQHfpLQrkm91pUfN7
         I3nGjtxZu6MWcSJ0A5CIjhIyW/aRo1bXoDcr2SKhUvc5SGyuKdnpLMyGfY4AqZj7F72E
         8HptMbTNByp5YAyHIW9t+YqBmDmn7lGKEIWRwg/uthIhvgBlUuCmq2fWd7vq0YyUUrpQ
         YGJjoSxkJIWnEz/4Jas+md4J7oCRuHeIEBzD47y112uIupj0IwRELW9vnkJuVtPCBQk5
         2j7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXBL+1hyWKtJNjXtlYasCxoZ14MA00myCCZjPqgctTIN650r2uu
	dD+A8/HTTC7WJRoPOCNx4GQ=
X-Google-Smtp-Source: APXvYqxQ5nv92BbDGGH0xnDi29gq+knZuTl7pf6u5BCnCC+YrOo/FA6BOuSJIGMWXa71tA2waTa1rA==
X-Received: by 2002:aca:4d88:: with SMTP id a130mr45852427oib.167.1564151383061;
        Fri, 26 Jul 2019 07:29:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:47d2:: with SMTP id u201ls7424057oia.2.gmail; Fri, 26
 Jul 2019 07:29:42 -0700 (PDT)
X-Received: by 2002:aca:574e:: with SMTP id l75mr45018437oib.2.1564151382174;
        Fri, 26 Jul 2019 07:29:42 -0700 (PDT)
Date: Fri, 26 Jul 2019 07:29:41 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
In-Reply-To: <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7300_1953384863.1564151381462"
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

------=_Part_7300_1953384863.1564151381462
Content-Type: multipart/alternative; 
	boundary="----=_Part_7301_673966262.1564151381462"

------=_Part_7301_673966262.1564151381462
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, i've reduced the size of the linux image to 550MB and the rootfs.cpio=
=20
to 540MB, but now the output prints "No space found to load all images". I=
=20
have a memory region with size of 0x3bff0000 (~1GB) and another with=20
0x24000000 (~600MB).

quinta-feira, 25 de Julho de 2019 =C3=A0s 16:21:07 UTC+1, Jan Kiszka escrev=
eu:
>
> On 25.07.19 14:53, Jo=C3=A3o Reis wrote:=20
> > Even when i set all RAM regions to non rootshared, the problem continue=
s=20
> (send=20
> > in attachment the newly adjusted config file). Is the linux image that =
i=20
> am=20
> > using too big (1,2GB)? I've generated the image using the steps=20
> described=20
> > on setup-on-zynqmp-zcu102.md (Testing Jailhouse Linux).=20
> >=20
>
> If I do the math right, you are even not close to that 1.2 GB when it=20
> comes to=20
> the RAM you assigned. It's maybe some 700 MB.=20
>
> Jan=20
>
> >=20
> > quinta-feira, 25 de Julho de 2019 =C3=A0s 11:00:36 UTC+1, Jan Kiszka=20
> escreveu:=20
> >=20
> >     On 25.07.19 11:32, Jo=C3=A3o Reis wrote:=20
> >     > Hello,=20
> >     >=20
> >     > I'm trying to apply cache coloring to Linux and Erika. As root=20
> cell Linux=20
> >     cannot=20
> >     > be colored, i intend to use colored Linux in a non-root cell and=
=20
> colored=20
> >     Erika=20
> >     > in another non-root cell (the system stays as: Linux in root cell=
,=20
> Linux and=20
> >     > Erika in non-root cells).=20
> >     >=20
> >     > The problem that is occuring to me is when i issue the command:=
=20
> jailhouse=20
> >     cell=20
> >     > linux ultra96-linux-demo.cell Image -i rootfs.cpio -c=20
> "console=3DttyS0, 115200"=20
> >     >=20
> >     > The error is the following:=20
> >     >=20
> >     > root@xilinx-ultra96-reva-2018_2:~# jailhouse cell linux=20
> >     ultra96-linux-demo.cell=20
> >     > Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.cpio -c=20
> "console=3DttyS0, 115200"=20
> >     > [  127.150370] python invoked oom-killer:=20
> >     > gfp_mask=3D0x16080c0(GFP_KERNEL|__GFP_ZERO|__GFP_NOTRACK),=20
> nodemask=3D(null), =20
> >     > order=3D0, oom_score_adj=3D0=20
> >=20
> >     Looks like your inmate configuration grants too little memory for=
=20
> the Linux=20
> >     guest. Note that the in-tree configs may only be happily used with=
=20
> very small=20
> >     Linux images, just as the buildroot we generate via=20
> jailhouse-images.=20
> >=20
> >     Looking at your config...=20
> >=20
> >             /* RAM */ {=20
> >                     .phys_start =3D 0x74000000,=20
> >                     .virt_start =3D 0x74000000,=20
> >                     .size =3D 0x7ef0000,=20
> >                     .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE=
 |=20
> >                             JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |=
=20
> >                             JAILHOUSE_MEM_LOADABLE,=20
> >             },=20
> >=20
> >     This one is fine and will be available to the guest.=20
> >=20
> >             /* RAM */{=20
> >                     .phys_start =3D 0x3fd00000,=20
> >                     .virt_start =3D 0x3fd00000,=20
> >                     .size =3D 0x202f0000, //must be page size aligned=
=20
> >                     .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE=
 |=20
> >                             JAILHOUSE_MEM_EXECUTE |=20
> JAILHOUSE_MEM_LOADABLE |=20
> >                             JAILHOUSE_MEM_ROOTSHARED, //se tirar=20
> >     JAILHOUSE_MEM_ROOTSHARED da exception=20
> >     fault 0x20=20
> >             },=20
> >=20
> >     This one isn't because it shares RAM with the root cell that is=20
> probably not=20
> >     intended to be shared. But it will also not be presented as RAM to=
=20
> the non-root=20
> >     cell (via the devices tree) because of the ROOTSHARED tag.=20
> >=20
> >     Jan=20
> >=20
> >     --=20
> >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE=20
> >     Corporate Competence Center Embedded Linux=20
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
> https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-d=
db68083f7ee%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-d=
db68083f7ee%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
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
jailhouse-dev/fe00f482-c82c-4f93-8a0e-f73dc955888d%40googlegroups.com.

------=_Part_7301_673966262.1564151381462
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, i&#39;ve reduced the size of the linux image to 550MB =
and the rootfs.cpio to 540MB, but now the output prints <font color=3D"#000=
000">&quot;<span style=3D"font-family: SFMono-Regular, Consolas, &quot;Libe=
ration Mono&quot;, Menlo, monospace; font-size: 12px; white-space: pre;">No=
 space found to load all images&quot;. I have a memory region with size of =
</span></font><font color=3D"#000000" face=3D"SFMono-Regular, Consolas, Lib=
eration Mono, Menlo, monospace"><span style=3D"font-size: 12px; white-space=
: pre;">0x3bff0000 (~1GB) and another with </span></font><span style=3D"col=
or: rgb(0, 0, 0); font-family: SFMono-Regular, Consolas, &quot;Liberation M=
ono&quot;, Menlo, monospace; font-size: 12px; white-space: pre;">0x24000000=
</span><span style=3D"color: rgb(0, 0, 0); font-family: SFMono-Regular, Con=
solas, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 12px; whit=
e-space: pre;"> (~600MB).</span><br><br>quinta-feira, 25 de Julho de 2019 =
=C3=A0s 16:21:07 UTC+1, Jan Kiszka escreveu:<blockquote class=3D"gmail_quot=
e" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;paddin=
g-left: 1ex;">On 25.07.19 14:53, Jo=C3=A3o Reis wrote:
<br>&gt; Even when i set all RAM regions to non rootshared, the problem con=
tinues (send
<br>&gt; in attachment the newly adjusted config file). Is the linux image =
that i am
<br>&gt; using too big (1,2GB)? I&#39;ve generated the image using the step=
s described
<br>&gt; on=C2=A0setup-on-zynqmp-zcu102.md (Testing Jailhouse Linux).
<br>&gt;=20
<br>
<br>If I do the math right, you are even not close to that 1.2 GB when it c=
omes to
<br>the RAM you assigned. It&#39;s maybe some 700 MB.
<br>
<br>Jan
<br>
<br>&gt;=20
<br>&gt; quinta-feira, 25 de Julho de 2019 =C3=A0s 11:00:36 UTC+1, Jan Kisz=
ka escreveu:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 25.07.19 11:32, Jo=C3=A3o Reis wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; Hello,
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; I&#39;m trying to apply cache coloring to Linux=
 and Erika. As root cell Linux
<br>&gt; =C2=A0 =C2=A0 cannot
<br>&gt; =C2=A0 =C2=A0 &gt; be colored, i intend to use colored Linux in a =
non-root cell and colored
<br>&gt; =C2=A0 =C2=A0 Erika
<br>&gt; =C2=A0 =C2=A0 &gt; in another non-root cell (the system stays as: =
Linux in root cell, Linux and
<br>&gt; =C2=A0 =C2=A0 &gt; Erika in non-root cells).
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; The problem that is occuring to me is when i is=
sue the command: jailhouse
<br>&gt; =C2=A0 =C2=A0 cell
<br>&gt; =C2=A0 =C2=A0 &gt; linux ultra96-linux-demo.cell Image -i rootfs.c=
pio -c &quot;console=3DttyS0, 115200&quot;
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; The error is the following:
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; root@xilinx-ultra96-reva-2018_<wbr>2:~# jailhou=
se cell linux
<br>&gt; =C2=A0 =C2=A0 ultra96-linux-demo.cell
<br>&gt; =C2=A0 =C2=A0 &gt; Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.c=
pio -c &quot;console=3DttyS0, 115200&quot;
<br>&gt; =C2=A0 =C2=A0 &gt; [=C2=A0 127.150370] python invoked oom-killer:
<br>&gt; =C2=A0 =C2=A0 &gt; gfp_mask=3D0x16080c0(GFP_KERNEL|<wbr>__GFP_ZERO=
|__GFP_NOTRACK), nodemask=3D(null),=C2=A0
<br>&gt; =C2=A0 =C2=A0 &gt; order=3D0, oom_score_adj=3D0
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Looks like your inmate configuration grants too litt=
le memory for the Linux
<br>&gt; =C2=A0 =C2=A0 guest. Note that the in-tree configs may only be hap=
pily used with very small
<br>&gt; =C2=A0 =C2=A0 Linux images, just as the buildroot we generate via =
jailhouse-images.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Looking at your config...
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* R=
AM */ {
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phys_start =3D 0x74000000,
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.virt_start =3D 0x74000000,
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.size =3D 0x7ef0000,
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<wbr>JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<wbr>JAILHOUSE_MEM_LOADABLE,
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 This one is fine and will be available to the guest.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* R=
AM */{
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phys_start =3D 0x3fd00000,
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.virt_start =3D 0x3fd00000,
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.size =3D 0x202f0000, //must b=
e page size aligned
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<wbr>JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0<wbr>JAILHOUSE_MEM_ROOTSHARED, //se tirar
<br>&gt; =C2=A0 =C2=A0 JAILHOUSE_MEM_ROOTSHARED da exception
<br>&gt; =C2=A0 =C2=A0 fault 0x20
<br>&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 This one isn&#39;t because it shares RAM with the ro=
ot cell that is probably not
<br>&gt; =C2=A0 =C2=A0 intended to be shared. But it will also not be prese=
nted as RAM to the non-root
<br>&gt; =C2=A0 =C2=A0 cell (via the devices tree) because of the ROOTSHARE=
D tag.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Jan
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 --=20
<br>&gt; =C2=A0 =C2=A0 Siemens AG, Corporate Technology, CT RDA IOT SES-DE
<br>&gt; =C2=A0 =C2=A0 Corporate Competence Center Embedded Linux
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
 Groups
<br>&gt; &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send an email
<br>&gt; to <a href=3D"javascript:" target=3D"_blank" gdf-obfuscated-mailto=
=3D"JglqI0MeCQAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return =
true;">jailho...@<wbr>googlegroups.com</a>
<br>&gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfuscate=
d-mailto=3D"JglqI0MeCQAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;=
javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;=
;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/320981f=
3-9d93-46c5-b95f-ddb68083f7ee%40googlegroups.com" target=3D"_blank" rel=3D"=
nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid=
/jailhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40googlegroups.com&#39;=
;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40googlegroups.com&#39=
;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/320981=
f3-<wbr>9d93-46c5-b95f-ddb68083f7ee%<wbr>40googlegroups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/320=
981f3-9d93-46c5-b95f-ddb68083f7ee%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93=
-46c5-b95f-ddb68083f7ee%40googlegroups.com?utm_medium\x3demail\x26utm_sourc=
e\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.g=
oogle.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40goog=
legroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;"=
>https://groups.google.com/d/<wbr>msgid/jailhouse-dev/320981f3-<wbr>9d93-46=
c5-b95f-ddb68083f7ee%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;ut=
m_source=3Dfooter</a>&gt;.
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
om/d/msgid/jailhouse-dev/fe00f482-c82c-4f93-8a0e-f73dc955888d%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/fe00f482-c82c-4f93-8a0e-f73dc955888d%40googlegroups.com<=
/a>.<br />

------=_Part_7301_673966262.1564151381462--

------=_Part_7300_1953384863.1564151381462
Content-Type: text/x-csrc; charset=UTF-8; name=ultra96-linux-demo2.c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=ultra96-linux-demo2.c
X-Attachment-Id: 566eecc5-a50f-4249-b4e4-34ec65bfa3d5
Content-ID: <566eecc5-a50f-4249-b4e4-34ec65bfa3d5>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Configuration for linux-demo inmate on Avnet Ultra96 board:
 * 2 CPUs, 128M RAM, serial port 2
 *
 * Copyright (c) Siemens AG, 2014-2019
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
=09struct jailhouse_cell_desc cell;
=09__u64 cpus[1];
=09struct jailhouse_memory mem_regions[7];
=09struct jailhouse_irqchip irqchips[1];
=09struct jailhouse_pci_device pci_devices[1];
} __attribute__((packed)) config =3D {
=09.cell =3D {
=09=09.signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
=09=09.revision =3D JAILHOUSE_CONFIG_REVISION,
=09=09.name =3D "non-root",
=09=09.flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,/* |
=09=09JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE,*/

=09=09.cpu_set_size =3D sizeof(config.cpus),
=09=09.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
=09=09.num_irqchips =3D ARRAY_SIZE(config.irqchips),
=09=09.num_pci_devices =3D ARRAY_SIZE(config.pci_devices),

=09=09.vpci_irq_base =3D 140-32,

=09=09.console =3D {
=09=09=09.address =3D 0xff010000, /*UART1*/
=09=09=09//.address =3D 0xff000000, /*UART0*/ //se eu meter uart0 da erro u=
nhandled trap
=09=09=09.type=3D JAILHOUSE_CON_TYPE_XUARTPS,
=09=09=09.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
=09=09=09=09 JAILHOUSE_CON_REGDIST_4,
=09=09},
=09},

=09.cpus =3D {
=09=090xe, //1110
=09=09//0x8, //1000 - fica com cpu3
=09=09//0xc, //1100
=09},

=09.mem_regions =3D {
=09=09/* UART */ {
=09=09=09.phys_start =3D 0xff010000,
=09=09=09.virt_start =3D 0xff010000,
=09=09=09/*.phys_start =3D 0xff000000,
=09=09=09.virt_start =3D 0xff000000,*/
=09=09=09.size =3D 0x1000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x7bef0000,
=09=09=09.virt_start =3D 0,
=09=09=09.size =3D 0x10000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE,// | JAILHOUSE_MEM_LOADABLE,
=09=09},
=09=09/* RAM */ {
=09=09=09.phys_start =3D 0x74000000,
=09=09=09.virt_start =3D 0x74000000,
=09=09=09.size =3D 0x7ef0000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,/* |
=09=09=09=09JAILHOUSE_MEM_LOADABLE,*/
=09=09},
=09=09/* IVSHMEM shared memory region */ {
=09=09=09.phys_start =3D 0x7bf00000,
=09=09=09.virt_start =3D 0x7bf00000,
=09=09=09.size =3D 0x100000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED,
=09=09},
=09=09/* communication region */ {
=09=09=09.virt_start =3D 0x80000000,
=09=09=09.size =3D 0x00001000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_COMM_REGION,
=09=09},
=09=09=09=09/* RAM */{
=09=09=09.phys_start =3D 0x24000000,
=09=09=09.virt_start =3D 0x24000000,
=09=09=09.size =3D 0x3bff0000, //must be page size aligned
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
=09=09=09=09JAILHOUSE_MEM_EXECUTE ,/*| JAILHOUSE_MEM_LOADABLE |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED, *///se tirar JAILHOUSE_MEM_ROOTSHARED=
 da exception fault 0x20
=09=09},
=09=09{
=09=09=09.phys_start =3D 0,
=09=09=09.virt_start =3D 0x10000,
=09=09=09.size =3D 0x24000000,
=09=09=09.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE|
=09=09=09=09JAILHOUSE_MEM_EXECUTE,/* | JAILHOUSE_MEM_LOADABLE |
=09=09=09=09JAILHOUSE_MEM_ROOTSHARED,*/
=09=09},
=09},

=09.irqchips =3D {
=09=09/* GIC */ {
=09=09=09.address =3D 0xf9010000, /* GICD base address - Display controller=
 */
=09=09=09.pin_base =3D 32, /* The first irqchip starts at .pin_base=3D32 as=
 the first 32 interrupts are=20
reserved for SGIs and PPIs. */
=09=09=09.pin_bitmap =3D {
=09=09=09=09//1 << (54 - 32),
=09=09=09=091 << (53 - 32), // cat /proc/interrupts interrupt da UART0 AQUI=
 ESTA A DIFEREN=C3=87A
=09=09=09=090,
=09=09=09=090,
=09=09=09=09(1 << (140 - 128)) | (1 << (142 - 128)) //PL to PS interrupt si=
gnals 8 to 15.
=09=09=09},
=09=09},
=09},

=09.pci_devices =3D {
=09=09/* 00:00.0 */ {
=09=09=09.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
=09=09=09.bdf =3D 0 << 3, // 00:00.0
=09=09=09.iommu =3D 1,//
=09=09=09.bar_mask =3D {
=09=09=09=090xffffff00, 0xffffffff, 0x00000000,
=09=09=09=090x00000000, 0x00000000, 0x00000000,
=09=09=09},
=09=09=09.shmem_region =3D 3,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
=09=09=09//.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_CUSTOM,
=09=09=09.shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
=09=09=09//.num_msix_vectors =3D 1,
=09=09},
=09},
};

------=_Part_7300_1953384863.1564151381462--
