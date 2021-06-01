Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBJ453CCQMGQEYMG3PFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E913971B8
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Jun 2021 12:40:40 +0200 (CEST)
Received: by mail-qt1-x837.google.com with SMTP id a12-20020ac8108c0000b029023c90fba3dcsf1541890qtj.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Jun 2021 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pntmNDMy3nfdj+5aGwvO3A8hSqHH4s3un/YkLViie68=;
        b=pMabVM7mQNhGgmnzh48wTN8O2t20r8/jubhCN6gst5MYHI7MVu6m0p6GybxWbiNu+6
         mM/67RRSrmuHxDwI+5bjQa8gARfFsxmOixyLIdSc12uKqh7FvgQTkchQww5LemmyMRHZ
         Jnj8PMhGUwrXtKppJiwO4B0Ep11APs1Sq/qPMzVJ8OCYQhWeeHq2vIl0UzG6gMBbKEHi
         Ddg/Rx+ogdssWNUmVJwVIXJw3BEGnK8qMeIpKA+mK805r5OWfk1fWhsQ8T+k7n8XXfcN
         v6WGIEqFuvh3dkMZ95FmUmpbDGoF4KZzvg22xmARoYFpP4Cta/Ugdt1o5pUVRK/0TnOe
         bnvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pntmNDMy3nfdj+5aGwvO3A8hSqHH4s3un/YkLViie68=;
        b=bNF/KZvv4W3/MU2fvUtg4GHcwQlKXOqEiZhgc6cBdwxr66GVM/i2AJXJCboy4HH62X
         jwdNZ9EbbWvl0FhKiwgX4sW4SBSqR1ySqQQSqmAaqVa+yvj+I1WCsiw02jGQBC1iPwrr
         j1JihSCJZYHgAdeynndJbCgM91Oc0jiIisNdG9Qu1JlRnH5d/u276zNrGWWB+Spwvdbr
         vnKuY+X9rsxJOOv0IDGqP8AHPcsQe8miBmrO0qjFmoKhTawHVWyd+oS2wIeqbIk/NxMZ
         N9BS/LS3evAOB2jYSpWn69Ru8lSCcoHqrVZ2vlOdKMznODLePk6bs2jai8EAJ5h/fr5w
         N4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pntmNDMy3nfdj+5aGwvO3A8hSqHH4s3un/YkLViie68=;
        b=LBVqHGeqe6Vi5RIKcuIvYDSJ8cgJjkphKzlnFN2u2wpdZHJAB5HIgq56eY4Jpv7hm+
         xPttvWQds4EaUwWiLFeBdkaOVj+jRcIJv83Iug+2zTZ/JGVJ7cay9uKsu8MXTGmjAhv3
         2FKSLHP1d8ydToH1CbUfC4sYKLjZJvAXLFohLMCDPcuhxqSLAxer7Gkbm8Ux8XUb8zKh
         +vxK4lK3n4xm1hfhYG7VJRGRTMZGUo/pNnygi7qYLGpRA1s9wv1MFUIYhTsq6PLnIzvE
         a5SQg3soG8ARBFLA3DTUde0HyelLImOt/z9pwnEXkE1cwt1zP0sz0y9fHfcXuL0jQdBS
         Hv1g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ldq7hHpAVHd83PFTkV60+rDxEJi5aDtPQQgnW6lOrxAKZA4v7
	o9pS1VYpj5Eg8n1KE4dhgY4=
X-Google-Smtp-Source: ABdhPJwz9n9DGC+qJvTgWe1Bt/HZMVxJHShuDpZliOOXm62QuyBP7NaVQs5LivW9XPdmyEqSDcLWXg==
X-Received: by 2002:a05:622a:648:: with SMTP id a8mr19135194qtb.176.1622544039237;
        Tue, 01 Jun 2021 03:40:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:5f44:: with SMTP id t65ls10594816qkb.0.gmail; Tue, 01
 Jun 2021 03:40:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4084:: with SMTP id f4mr9927081qko.337.1622544038712;
        Tue, 01 Jun 2021 03:40:38 -0700 (PDT)
Date: Tue, 1 Jun 2021 03:40:38 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0520cade-198a-4f89-95e4-cd5fbc6c1ae2n@googlegroups.com>
In-Reply-To: <d5e6079c-5cf5-ce18-45c0-d0eaa7d60350@siemens.com>
References: <09c2642b-ba89-4226-8452-534393dc6a33n@googlegroups.com>
 <d5e6079c-5cf5-ce18-45c0-d0eaa7d60350@siemens.com>
Subject: Re: How to partition PCI devices to none-root cells in rpi4b?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4414_1419716745.1622544038169"
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

------=_Part_4414_1419716745.1622544038169
Content-Type: multipart/alternative; 
	boundary="----=_Part_4415_3780134.1622544038169"

------=_Part_4415_3780134.1622544038169
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is UART different from other  devices? I see some uart-8250.c  code.  The =
=20
uart is  especially   treated ?

Will some demos which show  how to  partition  network devices or some=20
other devices into   inmates   be done?
I have tryed  in rpi4b.  like  zynqmp-zcu102-linux-demo.c ,   I added the=
=20
mem regions and irq.  But, the  network cann't seen in inmate.
=20

=E5=9C=A82021=E5=B9=B45=E6=9C=8814=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+=
8 =E4=B8=8B=E5=8D=886:10:37<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=
=9A

> On 14.05.21 05:08, along li wrote:
> > Dear community,
> >=20
> > For X86 platform, the  tutorial  pdf talks some about  how to partition
> > pci device into none-root cells.    =20
> > tutorial:=20
> > =20
> https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-J=
ailhouse-Tutorial.pdf
> > <
> https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-J=
ailhouse-Tutorial.pdf
> >
> >=20
> > But how to do this in arm64 platforms, there is no  document.
> >=20
> > Well how to do this, Are there  some configuration demos ?
> >=20
>
> Plenty, though understanding the details requires a bit knowledge about
> the respective platforms. If you look at
> configs/arm64/zynqmp-zcu102-linux-demo.c, e.g., you can see that it gets
> a UART assigned by handing over the MMIO region and (IIRC) GIC IRQ 54.
> But, as I already explained, there can be more complex challenges when
> you also need to enable / clock the respective device, and those
> controls are shared with the root cell.
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
jailhouse-dev/0520cade-198a-4f89-95e4-cd5fbc6c1ae2n%40googlegroups.com.

------=_Part_4415_3780134.1622544038169
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is UART different from other&nbsp; devices? I see some uart-8250.c&nbsp; co=
de.&nbsp; The&nbsp; uart is&nbsp;

especially&nbsp; &nbsp;treated ?<div><br></div><div>Will some demos which s=
how&nbsp; how to&nbsp; partition&nbsp; network devices or some other device=
s into&nbsp; &nbsp;inmates&nbsp; &nbsp;be done?</div><div>I have tryed&nbsp=
; in rpi4b.&nbsp; like&nbsp; zynqmp-zcu102-linux-demo.c ,&nbsp; &nbsp;I add=
ed the mem regions and irq.&nbsp; But, the&nbsp; network cann't seen in inm=
ate.</div><div><div>&nbsp;<br><br></div></div><div class=3D"gmail_quote"><d=
iv dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82021=E5=B9=B45=E6=9C=8814=E6=
=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC+8 =E4=B8=8B=E5=8D=886:10:37&lt;j.kisz=
ka...@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D=
"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204,=
 204, 204); padding-left: 1ex;">On 14.05.21 05:08, along li wrote:
<br>&gt; Dear community,
<br>&gt;=20
<br>&gt; For X86 platform, the=C2=A0 tutorial=C2=A0 pdf talks some about=C2=
=A0 how to partition
<br>&gt; pci device into none-root cells.=C2=A0 =C2=A0 =C2=A0
<br>&gt; tutorial:=C2=A0
<br>&gt; =C2=A0<a href=3D"https://events.static.linuxfound.org/sites/events=
/files/slides/ELCE2016-Jailhouse-Tutorial.pdf" target=3D"_blank" rel=3D"nof=
ollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=
=3Dhttps://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-=
Jailhouse-Tutorial.pdf&amp;source=3Dgmail&amp;ust=3D1622630046250000&amp;us=
g=3DAFQjCNHNiDajNlZvCYth86pCt2QquHbixA">https://events.static.linuxfound.or=
g/sites/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf</a>
<br>&gt; &lt;<a href=3D"https://events.static.linuxfound.org/sites/events/f=
iles/slides/ELCE2016-Jailhouse-Tutorial.pdf" target=3D"_blank" rel=3D"nofol=
low" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3D=
https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jai=
lhouse-Tutorial.pdf&amp;source=3Dgmail&amp;ust=3D1622630046250000&amp;usg=
=3DAFQjCNHNiDajNlZvCYth86pCt2QquHbixA">https://events.static.linuxfound.org=
/sites/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf</a>&gt;
<br>&gt;=20
<br>&gt; But how to do this in arm64 platforms, there is no=C2=A0 document.
<br>&gt;=20
<br>&gt; Well how to do this, Are there=C2=A0 some configuration demos ?
<br>&gt;=20
<br>
<br>Plenty, though understanding the details requires a bit knowledge about
<br>the respective platforms. If you look at
<br>configs/arm64/zynqmp-zcu102-linux-demo.c, e.g., you can see that it get=
s
<br>a UART assigned by handing over the MMIO region and (IIRC) GIC IRQ 54.
<br>But, as I already explained, there can be more complex challenges when
<br>you also need to enable / clock the respective device, and those
<br>controls are shared with the root cell.
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
om/d/msgid/jailhouse-dev/0520cade-198a-4f89-95e4-cd5fbc6c1ae2n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0520cade-198a-4f89-95e4-cd5fbc6c1ae2n%40googlegroups.co=
m</a>.<br />

------=_Part_4415_3780134.1622544038169--

------=_Part_4414_1419716745.1622544038169--
