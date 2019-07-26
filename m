Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBJPQ5TUQKGQEXINZWUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A9D77025
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 19:28:06 +0200 (CEST)
Received: by mail-ot1-x338.google.com with SMTP id 20sf29397258otv.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 10:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/ZWg9y+lgPI3z/VjlBJ9AXEM0vlJUVvVY9a3uST9Vuc=;
        b=fi1F+9AK928RcLACh6S4OHeZaIANMOgLA20V+ZKLSwWrLORtP6Q8uvOZwt+ya7W78K
         90ndXSKdpNhfbnYnYjakWvbK4w519NKFlhNjvZ8AdbBxgN3cL6ZWXuozvCcZACDa1poh
         B2sgeLuS8wLlky0TUaFXl7OhR+v2mN1+O52XafNR3vP7CokhzAP9eE0986ON/9c/gYBW
         Lifadgopo5P+/8u+hy2wp74WM1ZImqWCiHukOjcxkUBDxSoYwL/brHgqT884cOw9nHL0
         Qylki7Eyk1un5JiSX8Ryco8KYila7mXpntOyr0U1NXMBe6Aejyk6tGaM5tOyXKYGHprM
         XzXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/ZWg9y+lgPI3z/VjlBJ9AXEM0vlJUVvVY9a3uST9Vuc=;
        b=GJjaoKNA8ZZpK25CClKFQLV2EDyg9Sx8dMxXnSBJWDl7ebbPROwoaNz6VtJ7RdTybm
         w9FakALz6R9ny++yRkwB+8aNpHIX7SPQw/MXPCLrZ8WwHZ/C420gsvAQsVBzcXRlp4pE
         lUqMICoJ01hOySWTBx7l5De0Aguw+Ws/GzKgdYBHn2a8M8TGiSBwdYpD8gHTtUbEUyVl
         GvJegv4JLnlRbg9SSQXJvPHzglRlZtQh4fpmPSJkD9S3XGEMieC5veU9rIdXqNuJJbpm
         D/5NbcuhuhoJ2vSjA3lmwRZWDhhgQyijadqf/U6thdLX0BI46us2w6Bn7CDQuc1gXXG1
         Uu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/ZWg9y+lgPI3z/VjlBJ9AXEM0vlJUVvVY9a3uST9Vuc=;
        b=cWn6nn/+izzEAldACJ+lJGUhmsADTQ/n9N4yI4OwryIGB+CE7YH45K9tXc0WP7M/yO
         pciXlmqcthuvWSgSKJUCmukXh21EyQS1INMpxx8cwif69UMwhMP4VGmbfYmcpCU+zlvv
         e3m/omyKptfgDwGNIBT9nMPIi+FkVsBupLJ55WRXeukBlpMHw62CuPdE2F/JNFPE4ZRd
         fC2wvZ7/hEIUO2WP0J/Hzi7Ux7ihmMm4OEOWMIrEN+Ft/cwNc/cnzVhRWJldENBbrT1z
         Dft3Hnqqeh19RIanpbG5KbxYmxK4w/Kg9TZjCoBRLW1tBiXDoQvHh60oa/xD/rYOEU3Y
         wyYA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVFIYCT/MA4soHHlfAyj/7ZHUSs3k+ThHceZ6Cn/OAKlRV7hEnj
	97LHDb0pky/JgUZAvv0JQFo=
X-Google-Smtp-Source: APXvYqwIUfvV1Ds8vcW6dpjaQ0Cn2VEBopyL+7XEzuFkyyMyplcD7MWiJvu2Xl8Y58Rn1d0DQCI2ng==
X-Received: by 2002:aca:4806:: with SMTP id v6mr11766678oia.133.1564162085659;
        Fri, 26 Jul 2019 10:28:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:2818:: with SMTP id 24ls7494991oix.12.gmail; Fri, 26 Jul
 2019 10:28:05 -0700 (PDT)
X-Received: by 2002:aca:37c5:: with SMTP id e188mr11653861oia.66.1564162084945;
        Fri, 26 Jul 2019 10:28:04 -0700 (PDT)
Date: Fri, 26 Jul 2019 10:28:04 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <211205da-9e38-4178-895a-3ba80f214aa9@googlegroups.com>
In-Reply-To: <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <7f3933fc-c609-9349-4e57-a680489e9928@siemens.com>
 <320981f3-9d93-46c5-b95f-ddb68083f7ee@googlegroups.com>
 <c1a63d36-2dd0-5b52-bb16-31794ab93b62@siemens.com>
 <fe00f482-c82c-4f93-8a0e-f73dc955888d@googlegroups.com>
 <b4e7dbee-58cd-3126-ce6b-7b54ee0ef241@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7711_1527128962.1564162084327"
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

------=_Part_7711_1527128962.1564162084327
Content-Type: multipart/alternative; 
	boundary="----=_Part_7712_2127603546.1564162084328"

------=_Part_7712_2127603546.1564162084328
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No, the initramfs size is uncompressed (compressed is ~170MB). What -k=20
switch are you referring to?

sexta-feira, 26 de Julho de 2019 =C3=A0s 16:16:29 UTC+1, Jan Kiszka escreve=
u:
>
> On 26.07.19 16:29, Jo=C3=A3o Reis wrote:=20
> > Ok, i've reduced the size of the linux image to 550MB and the=20
> rootfs.cpio to=20
> > 540MB, but now the output prints "No space found to load all images". I=
=20
> have a=20
> > memory region with size of 0x3bff0000 (~1GB) and another with=20
> 0x24000000(~600MB).=20
>
> Is that the compressed size? One issue is that, when you combine kernel=
=20
> and=20
> initramfs into one image and compress only the kernel, the logic of=20
> jailhouse-cell-linux that calculate the required size after decompression=
=20
> may=20
> overestimate that space demand. You can try tuning with the -k switch.=20
>
> Jan=20
>
> >=20
> > quinta-feira, 25 de Julho de 2019 =C3=A0s 16:21:07 UTC+1, Jan Kiszka=20
> escreveu:=20
> >=20
> >     On 25.07.19 14:53, Jo=C3=A3o Reis wrote:=20
> >     > Even when i set all RAM regions to non rootshared, the problem=20
> continues=20
> >     (send=20
> >     > in attachment the newly adjusted config file). Is the linux image=
=20
> that i am=20
> >     > using too big (1,2GB)? I've generated the image using the steps=
=20
> described=20
> >     > on setup-on-zynqmp-zcu102.md (Testing Jailhouse Linux).=20
> >     >=20
> >=20
> >     If I do the math right, you are even not close to that 1.2 GB when=
=20
> it comes to=20
> >     the RAM you assigned. It's maybe some 700 MB.=20
> >=20
> >     Jan=20
> >=20
> >     >=20
> >     > quinta-feira, 25 de Julho de 2019 =C3=A0s 11:00:36 UTC+1, Jan Kis=
zka=20
> escreveu:=20
> >     >=20
> >     >     On 25.07.19 11:32, Jo=C3=A3o Reis wrote:=20
> >     >     > Hello,=20
> >     >     >=20
> >     >     > I'm trying to apply cache coloring to Linux and Erika. As=
=20
> root cell=20
> >     Linux=20
> >     >     cannot=20
> >     >     > be colored, i intend to use colored Linux in a non-root cel=
l=20
> and=20
> >     colored=20
> >     >     Erika=20
> >     >     > in another non-root cell (the system stays as: Linux in roo=
t=20
> cell,=20
> >     Linux and=20
> >     >     > Erika in non-root cells).=20
> >     >     >=20
> >     >     > The problem that is occuring to me is when i issue the=20
> command:=20
> >     jailhouse=20
> >     >     cell=20
> >     >     > linux ultra96-linux-demo.cell Image -i rootfs.cpio -c=20
> >     "console=3DttyS0, 115200"=20
> >     >     >=20
> >     >     > The error is the following:=20
> >     >     >=20
> >     >     > root@xilinx-ultra96-reva-2018_2:~# jailhouse cell linux=20
> >     >     ultra96-linux-demo.cell=20
> >     >     > Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.cpio -c=20
> >     "console=3DttyS0, 115200"=20
> >     >     > [  127.150370] python invoked oom-killer:=20
> >     >     > gfp_mask=3D0x16080c0(GFP_KERNEL|__GFP_ZERO|__GFP_NOTRACK),=
=20
> >     nodemask=3D(null), =20
> >     >     > order=3D0, oom_score_adj=3D0=20
> >     >=20
> >     >     Looks like your inmate configuration grants too little memory=
=20
> for the=20
> >     Linux=20
> >     >     guest. Note that the in-tree configs may only be happily used=
=20
> with=20
> >     very small=20
> >     >     Linux images, just as the buildroot we generate via=20
> jailhouse-images.=20
> >     >=20
> >     >     Looking at your config...=20
> >     >=20
> >     >             /* RAM */ {=20
> >     >                     .phys_start =3D 0x74000000,=20
> >     >                     .virt_start =3D 0x74000000,=20
> >     >                     .size =3D 0x7ef0000,=20
> >     >                     .flags =3D JAILHOUSE_MEM_READ |=20
> JAILHOUSE_MEM_WRITE |=20
> >     >                             JAILHOUSE_MEM_EXECUTE |=20
> JAILHOUSE_MEM_DMA |=20
> >     >                             JAILHOUSE_MEM_LOADABLE,=20
> >     >             },=20
> >     >=20
> >     >     This one is fine and will be available to the guest.=20
> >     >=20
> >     >             /* RAM */{=20
> >     >                     .phys_start =3D 0x3fd00000,=20
> >     >                     .virt_start =3D 0x3fd00000,=20
> >     >                     .size =3D 0x202f0000, //must be page size=20
> aligned=20
> >     >                     .flags =3D JAILHOUSE_MEM_READ |=20
> JAILHOUSE_MEM_WRITE |=20
> >     >                             JAILHOUSE_MEM_EXECUTE |=20
> JAILHOUSE_MEM_LOADABLE |=20
> >     >                             JAILHOUSE_MEM_ROOTSHARED, //se tirar=
=20
> >     >     JAILHOUSE_MEM_ROOTSHARED da exception=20
> >     >     fault 0x20=20
> >     >             },=20
> >     >=20
> >     >     This one isn't because it shares RAM with the root cell that=
=20
> is=20
> >     probably not=20
> >     >     intended to be shared. But it will also not be presented as=
=20
> RAM to the=20
> >     non-root=20
> >     >     cell (via the devices tree) because of the ROOTSHARED tag.=20
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
> https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-d=
db68083f7ee%40googlegroups.com=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-d=
db68083f7ee%40googlegroups.com>=20
>
> >=20
> >     >=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-d=
db68083f7ee%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> >     <
> https://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-d=
db68083f7ee%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>>.=20
>
> >=20
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
> https://groups.google.com/d/msgid/jailhouse-dev/fe00f482-c82c-4f93-8a0e-f=
73dc955888d%40googlegroups.com=20
> > <
> https://groups.google.com/d/msgid/jailhouse-dev/fe00f482-c82c-4f93-8a0e-f=
73dc955888d%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20
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
jailhouse-dev/211205da-9e38-4178-895a-3ba80f214aa9%40googlegroups.com.

------=_Part_7712_2127603546.1564162084328
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No, the initramfs size is uncompressed (compressed is ~170=
MB). What -k switch are you referring to?<br><br>sexta-feira, 26 de Julho d=
e 2019 =C3=A0s 16:16:29 UTC+1, Jan Kiszka escreveu:<blockquote class=3D"gma=
il_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid=
;padding-left: 1ex;">On 26.07.19 16:29, Jo=C3=A3o Reis wrote:
<br>&gt; Ok, i&#39;ve reduced the size of the linux image to 550MB and the =
rootfs.cpio to
<br>&gt; 540MB, but now the output prints &quot;No space found to load all =
images&quot;. I have a
<br>&gt; memory region with size of 0x3bff0000 (~1GB) and another with 0x24=
000000(~600MB).
<br>
<br>Is that the compressed size? One issue is that, when you combine kernel=
 and
<br>initramfs into one image and compress only the kernel, the logic of
<br>jailhouse-cell-linux that calculate the required size after decompressi=
on may
<br>overestimate that space demand. You can try tuning with the -k switch.
<br>
<br>Jan
<br>
<br>&gt;=20
<br>&gt; quinta-feira, 25 de Julho de 2019 =C3=A0s 16:21:07 UTC+1, Jan Kisz=
ka escreveu:
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 On 25.07.19 14:53, Jo=C3=A3o Reis wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; Even when i set all RAM regions to non rootshar=
ed, the problem continues
<br>&gt; =C2=A0 =C2=A0 (send
<br>&gt; =C2=A0 =C2=A0 &gt; in attachment the newly adjusted config file). =
Is the linux image that i am
<br>&gt; =C2=A0 =C2=A0 &gt; using too big (1,2GB)? I&#39;ve generated the i=
mage using the steps described
<br>&gt; =C2=A0 =C2=A0 &gt; on=C2=A0setup-on-zynqmp-zcu102.md (Testing Jail=
house Linux).
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 If I do the math right, you are even not close to th=
at 1.2 GB when it comes to
<br>&gt; =C2=A0 =C2=A0 the RAM you assigned. It&#39;s maybe some 700 MB.
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 Jan
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; quinta-feira, 25 de Julho de 2019 =C3=A0s 11:00=
:36 UTC+1, Jan Kiszka escreveu:
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 On 25.07.19 11:32, Jo=C3=A3o Reis=
 wrote:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; Hello,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; I&#39;m trying to apply cach=
e coloring to Linux and Erika. As root cell
<br>&gt; =C2=A0 =C2=A0 Linux
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 cannot
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; be colored, i intend to use =
colored Linux in a non-root cell and
<br>&gt; =C2=A0 =C2=A0 colored
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Erika
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; in another non-root cell (th=
e system stays as: Linux in root cell,
<br>&gt; =C2=A0 =C2=A0 Linux and
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; Erika in non-root cells).
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; The problem that is occuring=
 to me is when i issue the command:
<br>&gt; =C2=A0 =C2=A0 jailhouse
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 cell
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; linux ultra96-linux-demo.cel=
l Image -i rootfs.cpio -c
<br>&gt; =C2=A0 =C2=A0 &quot;console=3DttyS0, 115200&quot;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; The error is the following:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; root@xilinx-ultra96-reva-201=
8_<wbr>2:~# jailhouse cell linux
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 ultra96-linux-demo.cell
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; Image -d inmate-zynqmp-zcu10=
2-2.dtb -i rootfs.cpio -c
<br>&gt; =C2=A0 =C2=A0 &quot;console=3DttyS0, 115200&quot;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; [=C2=A0 127.150370] python i=
nvoked oom-killer:
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; gfp_mask=3D0x16080c0(GFP_KER=
NEL|<wbr>__GFP_ZERO|__GFP_NOTRACK),
<br>&gt; =C2=A0 =C2=A0 nodemask=3D(null),=C2=A0
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 &gt; order=3D0, oom_score_adj=3D0
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Looks like your inmate configurat=
ion grants too little memory for the
<br>&gt; =C2=A0 =C2=A0 Linux
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 guest. Note that the in-tree conf=
igs may only be happily used with
<br>&gt; =C2=A0 =C2=A0 very small
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Linux images, just as the buildro=
ot we generate via jailhouse-images.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 Looking at your config...
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0/* RAM */ {
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phys_start =
=3D 0x74000000,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.virt_start =
=3D 0x74000000,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.size =3D 0x=
7ef0000,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags =3D J=
AILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>JAILHOUSE_MEM_EXECUTE | JAILHOUSE_=
MEM_DMA |
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>JAILHOUSE_MEM_LOADABLE,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0},
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 This one is fine and will be avai=
lable to the guest.
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0/* RAM */{
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.phys_start =
=3D 0x3fd00000,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.virt_start =
=3D 0x3fd00000,
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.size =3D 0x=
202f0000, //must be page size aligned
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.flags =3D J=
AILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>JAILHOUSE_MEM_EXECUTE | JAILHOUSE_=
MEM_LOADABLE |
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<wbr>JAILHOUSE_MEM_ROOTSHARED, //se tir=
ar
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 JAILHOUSE_MEM_ROOTSHARED da excep=
tion
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 fault 0x20
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0},
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 This one isn&#39;t because it sha=
res RAM with the root cell that is
<br>&gt; =C2=A0 =C2=A0 probably not
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 intended to be shared. But it wil=
l also not be presented as RAM to the
<br>&gt; =C2=A0 =C2=A0 non-root
<br>&gt; =C2=A0 =C2=A0 &gt; =C2=A0 =C2=A0 cell (via the devices tree) becau=
se of the ROOTSHARED tag.
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
lank" gdf-obfuscated-mailto=3D"1c87F5dsCQAJ" rel=3D"nofollow" onmousedown=
=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D=
&#39;javascript:&#39;;return true;">jailhouse-dev+<wbr>unsubscribe@googlegr=
oups.com</a> &lt;javascript:&gt;&gt;.
<br>&gt; =C2=A0 =C2=A0 &gt; To view this discussion on the web visit
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 <a href=3D"https://groups.google.com/d/msgid/jailhou=
se-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40googlegroups.com" target=3D"_=
blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://groups.goog=
le.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40googleg=
roups.com&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.goo=
gle.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40google=
groups.com&#39;;return true;">https://groups.google.com/d/<wbr>msgid/jailho=
use-dev/320981f3-<wbr>9d93-46c5-b95f-ddb68083f7ee%<wbr>40googlegroups.com</=
a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40googlegroups.com" target=
=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://groups=
.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40go=
oglegroups.com&#39;;return true;" onclick=3D"this.href=3D&#39;https://group=
s.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40g=
ooglegroups.com&#39;;return true;">https://groups.google.com/d/<wbr>msgid/j=
ailhouse-dev/320981f3-<wbr>9d93-46c5-b95f-ddb68083f7ee%<wbr>40googlegroups.=
com</a>&gt;
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 &gt;
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40googlegroups.com?utm_medi=
um=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmo=
usedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev=
/320981f3-9d93-46c5-b95f-ddb68083f7ee%40googlegroups.com?utm_medium\x3demai=
l\x26utm_source\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;ht=
tps://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-ddb68=
083f7ee%40googlegroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;=
;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/320981f=
3-<wbr>9d93-46c5-b95f-ddb68083f7ee%<wbr>40googlegroups.com?utm_medium=3D<wb=
r>email&amp;utm_source=3Dfooter</a>
<br>&gt; =C2=A0 =C2=A0 &lt;<a href=3D"https://groups.google.com/d/msgid/jai=
lhouse-dev/320981f3-9d93-46c5-b95f-ddb68083f7ee%40googlegroups.com?utm_medi=
um=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmo=
usedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev=
/320981f3-9d93-46c5-b95f-ddb68083f7ee%40googlegroups.com?utm_medium\x3demai=
l\x26utm_source\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;ht=
tps://groups.google.com/d/msgid/jailhouse-dev/320981f3-9d93-46c5-b95f-ddb68=
083f7ee%40googlegroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;=
;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/320981f=
3-<wbr>9d93-46c5-b95f-ddb68083f7ee%<wbr>40googlegroups.com?utm_medium=3D<wb=
r>email&amp;utm_source=3Dfooter</a>&gt;&gt;.
<br>&gt;=20
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
=3D"1c87F5dsCQAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;javascri=
pt:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;;return =
true;">jailho...@<wbr>googlegroups.com</a>
<br>&gt; &lt;mailto:<a href=3D"javascript:" target=3D"_blank" gdf-obfuscate=
d-mailto=3D"1c87F5dsCQAJ" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;=
javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;javascript:&#39;=
;return true;">jailhouse-dev+<wbr>unsubscribe@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fe00f48=
2-c82c-4f93-8a0e-f73dc955888d%40googlegroups.com" target=3D"_blank" rel=3D"=
nofollow" onmousedown=3D"this.href=3D&#39;https://groups.google.com/d/msgid=
/jailhouse-dev/fe00f482-c82c-4f93-8a0e-f73dc955888d%40googlegroups.com&#39;=
;return true;" onclick=3D"this.href=3D&#39;https://groups.google.com/d/msgi=
d/jailhouse-dev/fe00f482-c82c-4f93-8a0e-f73dc955888d%40googlegroups.com&#39=
;;return true;">https://groups.google.com/d/<wbr>msgid/jailhouse-dev/fe00f4=
82-<wbr>c82c-4f93-8a0e-f73dc955888d%<wbr>40googlegroups.com</a>
<br>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/fe0=
0f482-c82c-4f93-8a0e-f73dc955888d%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;https://groups.google.com/d/msgid/jailhouse-dev/fe00f482-c82c=
-4f93-8a0e-f73dc955888d%40googlegroups.com?utm_medium\x3demail\x26utm_sourc=
e\x3dfooter&#39;;return true;" onclick=3D"this.href=3D&#39;https://groups.g=
oogle.com/d/msgid/jailhouse-dev/fe00f482-c82c-4f93-8a0e-f73dc955888d%40goog=
legroups.com?utm_medium\x3demail\x26utm_source\x3dfooter&#39;;return true;"=
>https://groups.google.com/d/<wbr>msgid/jailhouse-dev/fe00f482-<wbr>c82c-4f=
93-8a0e-f73dc955888d%<wbr>40googlegroups.com?utm_medium=3D<wbr>email&amp;ut=
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
om/d/msgid/jailhouse-dev/211205da-9e38-4178-895a-3ba80f214aa9%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/211205da-9e38-4178-895a-3ba80f214aa9%40googlegroups.com<=
/a>.<br />

------=_Part_7712_2127603546.1564162084328--

------=_Part_7711_1527128962.1564162084327--
