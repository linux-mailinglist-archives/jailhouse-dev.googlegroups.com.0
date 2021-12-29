Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBB2FJWKHAMGQEK3YO33I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83e.google.com (mail-qt1-x83e.google.com [IPv6:2607:f8b0:4864:20::83e])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AAD481586
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Dec 2021 18:03:37 +0100 (CET)
Received: by mail-qt1-x83e.google.com with SMTP id d26-20020ac800da000000b002c43d2f6c7fsf14385378qtg.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Dec 2021 09:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wVtQFAYgvMN0RP/kV7cKBe/H/ttRYam4rqVvWsVrMjM=;
        b=PBvvjcuLc9bSZmXx1NzYZHZqqe04C05xrJc/OgJIXm2srNxDP+qHXZ8TMqOAMnh8J1
         F8wAQAsUIaH8He0ex/0dhWtHPdSlHThkK7nX3KWViVhTKdcG/eyUgEaCeNjIIkCOJ9hC
         49EVIM7TCbaPCq1cYPONunWt9V3q510iySRVZCsuUPlRb6Ozs18ZqEb+hSD9Y0AT8aep
         7ISe9P5tkzNmrjycIl5TEHQbtcD3Zsk+FDPctlPC/vE58y+hMi33JZzeWSVrATYIgwBJ
         /GZdnMmD9dt2ZOJRwDSCPL5/hvK2u6iqthvVdse+3p5xgF0mI705QdrQHXXPdXJZ1lkw
         FzPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wVtQFAYgvMN0RP/kV7cKBe/H/ttRYam4rqVvWsVrMjM=;
        b=nRQXkmSkZI3M76qrWEpUQ3h5WRpHZfkinprCyz2iHtkZVj64V8SpKJeJcBYlts6JZl
         eALnGA3Pdm1yDNIZJ9szAogl64CdC1QEry8HbEJq0F8HbaBy1ceJlNgsKPidbWrrOpd/
         q7JnafV+/HjPODFXct5LexsZ/Ht5fuWec7DB8vdbxc26YLzoM4vIev+J9CGDZ1wdKXvm
         c2HDehWfL1WKL95Qvi6BbuHAPfF0ANj9/wwi9DHHzY5R+xuT/B7Pqp33ql40PpgLJ8MV
         yOpI0CgmnZG+c7rCpezvglJpAJr+pAuq+yWfnsvdNUfHp56w7Kj0EVkjgH9uUKdGpdRZ
         mMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wVtQFAYgvMN0RP/kV7cKBe/H/ttRYam4rqVvWsVrMjM=;
        b=HmDD3jbsWKM3r8X5wjUr7zKgwl9Mcqgd7rPBrI7iycqllY5OjUGBbs/RdTcI1E/Ox/
         BB5+y4UQg26Mx+lNwslKkFaSECKC3uPnQZfWoRBvgjkw56luNItbsNfLZyNpkMl2OGrd
         qf78sRuouY04PXDk5xjDxYTUSw4twq6J1VJPkDI+OrUczS+tjMuqMB0uTtwOTZnpD3qE
         hx9pi5IxPl6nXE/5ZOFQ7YN6t9zPHKra20I0+IM6GZEPjP72jMTkZN4ywTHzis/IPOwQ
         tslXT9KFgKp7z+I3whaK6OCvUtlDzYsI7pwlJzDnauI88XQFtEkt7/5TBpe1vAkaND2x
         N6+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530+/Q/dpmFZPpqRsDoMuUL3muifM8aXkCVzL+t6YgQUk5mODPB8
	OEhMFT4uOZqOZVghFPTq+hA=
X-Google-Smtp-Source: ABdhPJztE0MPylJXXcilpG/onK4VpszgYTZ/iBtql/tQ39UGnCbfL4Ol5d0kQTcgVLB/Y0odzKMJYQ==
X-Received: by 2002:a05:6214:1cc3:: with SMTP id g3mr10013320qvd.53.1640797416627;
        Wed, 29 Dec 2021 09:03:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:b3cf:: with SMTP id b15ls9414863qvf.1.gmail; Wed, 29 Dec
 2021 09:03:35 -0800 (PST)
X-Received: by 2002:a05:6214:20e9:: with SMTP id 9mr15210698qvk.94.1640797415782;
        Wed, 29 Dec 2021 09:03:35 -0800 (PST)
Date: Wed, 29 Dec 2021 09:03:35 -0800 (PST)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <91742023-c4b3-4280-809a-5fa78cb7311bn@googlegroups.com>
In-Reply-To: <89194c06905f238053f114816f57f23100437bae.camel@siemens.com>
References: <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAAgAAEf4CAAANwgIAGZAmAgAFCIwCAAAQigIADbnUAgAAG6QA=>
 <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAAgAAEf4CAAANwgA==>
 <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAA>
 <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
 <64fa037aefed1d130bc0d3a49ccc3d09d5b504bc.camel@siemens.com>
 <2be13d89-1023-411b-ba9e-1d10044824e5n@googlegroups.com>
 <f76e76b332af3cef7a46e9048e96d6b50aa50fa0.camel@siemens.com>
 <c7eaa08e-ae92-4c5c-a57c-7ddac379242cn@googlegroups.com>
 <514e2fa3-9e58-5b79-038c-fe4ac21e803e@siemens.com>
 <f25df50a-e947-002b-5528-8d9793318aa6@siemens.com>
 <e3f8d47c-8a22-4abc-8977-e17641a404f9n@googlegroups.com>
 <89194c06905f238053f114816f57f23100437bae.camel@siemens.com>
Subject: Re: FATAL: Unhandled VM-Exit, reason 2
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_25123_1201023392.1640797415124"
X-Original-Sender: huangjiajun145041@gmail.com
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

------=_Part_25123_1201023392.1640797415124
Content-Type: multipart/alternative; 
	boundary="----=_Part_25124_1268666662.1640797415124"

------=_Part_25124_1268666662.1640797415124
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Now the kernel code branch I use is v5.4.39 from=20
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git=20
linux-kernel.
This driver comes from https://github.com/fixstars/cRTOS-drivers.git.The=20
original ivshmem-net  source code is contributed by Mans Rullgard .

=E5=9C=A82021=E5=B9=B412=E6=9C=8830=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC=
+8 00:38:13<Bezdeka, Florian> =E5=86=99=E9=81=93=EF=BC=9A

> On Wed, 2021-12-29 at 08:13 -0800, jiajun huang wrote:
> > Hi,
> > Unfortunately, after I tried almost all methods, the network still
> > cannot be connected. But I can be sure that the ivshmem-net device
> > did not receive the interrupt, but the shadow device that also uses
> > the ivshmem interface can receive the interrupt normally, and the
> > state change of another virtual device is detected.
> > I want to know if this is due to the kernel version. Are there any
> > kernel branches that you maintain yourself?
>
> Seems I overlooked your linux-net-driver.c. Where does that come from?
> I'm normally using Linux from [1] or [2].
>
> [1] https://github.com/siemens/linux/tree/jailhouse-enabling/5.10
> [2] https://github.com/siemens/linux/tree/jailhouse-enabling/5.10-rt
>
> I would expect build failures if there is none of the jailhouse-
> enabling branches in use, but that might have changed.
>
> Regards,
> Florian
>
> > Best wish
> > =E5=9C=A82021=E5=B9=B412=E6=9C=8827=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80=
 UTC+8 19:49:29<Florian Bezdeka> =E5=86=99=E9=81=93=EF=BC=9A
> > > On 27.12.21 12:34, Florian Bezdeka wrote:
> > > > On 26.12.21 17:21, jiajun huang wrote:
> > > > > Happy New Year=EF=BC=8C
> > > > >=20
> > > > > I successfully created root cell and inmate cell on QEMU, and
> > > > > nuttx
> > > > > running in the inmate cell. At the same time, I added the
> > > > > ivshmem-net
> > > > > device to the root cell and the intimate cell, and loaded the
> > > > > NIC
> > > > > driver. Finally, I configured ip 172.16.0.1 and 172.16.0.2 for
> > > > > the
> > > > > network card. But when I execute ping 172.16.0.2 in the root
> > > > > cell, the
> > > > > error "From 172.16.0.1 icmp_seq=3D1 Destination Host Unreachable"
> > > > > appears.
> > > > > The attachment is the driver I used in linux and nuttx
> > > > > respectively.The
> > > > > network driver uses the virtio interface. I tried to log in the
> > > > > driver,
> > > > > but I found that the control flow did not enter
> > > > > ndo_start_xmit().
> > > >=20
> > > > Looking at the hypervisor logs, it seems that the memory
> > > > configuration
> > > > of your virtual interfaces is correct now. The shared memory
> > > > between the
> > > > cells is detected, the device probing seems successful.
> > > >=20
> > > > I guess you don't receive interrupts for your virtual devices.
> > > > Could you
> > > > verify that by looking into /proc/interrupts?
> > > >=20
> > > > Are we still running on qemu? All your devices have .iommu =3D 0
> > > > set, but
> > > > the .irqchip configuration looks different (root cell as well as
> > > > inmate)
> > > > compared to the qemu example that we have.
> > > >=20
> > >=20
> > > As you have configured MSI-X interrupts for the virtual devices,
> > > the
> > > documentation says:
> > >=20
> > > You may also need to set the iommu field to match the IOMMU unit
> > > that
> > > the guest expects based on the bdf value. Try 1 if MSI-X interrupts
> > > do
> > > not make it when using 0.
> > >=20
> > > Just give it a try...
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/91742023-c4b3-4280-809a-5fa78cb7311bn%40googlegroups.com.

------=_Part_25124_1268666662.1640797415124
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Now the kernel code branch I use is v5.4.39 from https://git.kernel.org/pub=
/scm/linux/kernel/git/stable/linux.git linux-kernel.<div>This driver comes =
from https://github.com/fixstars/cRTOS-drivers.git.The original&nbsp;ivshme=
m-net&nbsp;&nbsp;source code is contributed by Mans Rullgard&nbsp;.<br><br>=
</div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=
=9C=A82021=E5=B9=B412=E6=9C=8830=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+8 =
00:38:13&lt;Bezdeka, Florian> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockq=
uote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px s=
olid rgb(204, 204, 204); padding-left: 1ex;">On Wed, 2021-12-29 at 08:13 -0=
800, jiajun huang wrote:
<br>&gt; Hi,
<br>&gt; Unfortunately, after I tried almost all methods, the network still
<br>&gt; cannot be connected. But I can be sure that the ivshmem-net device
<br>&gt; did not receive the interrupt, but the shadow device that also use=
s
<br>&gt; the ivshmem interface can receive the interrupt normally, and the
<br>&gt; state change of another virtual device is detected.
<br>&gt; I want to know if this is due to the kernel version. Are there any
<br>&gt; kernel branches that you maintain yourself?
<br>
<br>Seems I overlooked your linux-net-driver.c. Where does that come from?
<br>I&#39;m normally using Linux from [1] or [2].
<br>
<br>[1] <a href=3D"https://github.com/siemens/linux/tree/jailhouse-enabling=
/5.10" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://github.com/siemens/linux/tree/=
jailhouse-enabling/5.10&amp;source=3Dgmail&amp;ust=3D1640883655434000&amp;u=
sg=3DAFQjCNEeB7jhOi9zhkyPMRgvrrteKhFqsA">https://github.com/siemens/linux/t=
ree/jailhouse-enabling/5.10</a>
<br>[2] <a href=3D"https://github.com/siemens/linux/tree/jailhouse-enabling=
/5.10-rt" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https:=
//www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://github.com/siemens/linux/tr=
ee/jailhouse-enabling/5.10-rt&amp;source=3Dgmail&amp;ust=3D1640883655434000=
&amp;usg=3DAFQjCNELS0zlKYB9xtrt1cW3F_pkLuy_Qw">https://github.com/siemens/l=
inux/tree/jailhouse-enabling/5.10-rt</a>
<br>
<br>I would expect build failures if there is none of the jailhouse-
<br>enabling branches in use, but that might have changed.
<br>
<br>Regards,
<br>Florian
<br>
<br>&gt; Best wish
<br>&gt; =E5=9C=A82021=E5=B9=B412=E6=9C=8827=E6=97=A5=E6=98=9F=E6=9C=9F=E4=
=B8=80 UTC+8 19:49:29&lt;Florian Bezdeka&gt; =E5=86=99=E9=81=93=EF=BC=9A
<br>&gt; &gt; On 27.12.21 12:34, Florian Bezdeka wrote:
<br>&gt; &gt; &gt; On 26.12.21 17:21, jiajun huang wrote:
<br>&gt; &gt; &gt; &gt; Happy New Year=EF=BC=8C
<br>&gt; &gt; &gt; &gt;=20
<br>&gt; &gt; &gt; &gt; I successfully created root cell and inmate cell on=
 QEMU, and
<br>&gt; &gt; &gt; &gt; nuttx
<br>&gt; &gt; &gt; &gt; running in the inmate cell. At the same time, I add=
ed the
<br>&gt; &gt; &gt; &gt; ivshmem-net
<br>&gt; &gt; &gt; &gt; device to the root cell and the intimate cell, and =
loaded the
<br>&gt; &gt; &gt; &gt; NIC
<br>&gt; &gt; &gt; &gt; driver. Finally, I configured ip 172.16.0.1 and 172=
.16.0.2 for
<br>&gt; &gt; &gt; &gt; the
<br>&gt; &gt; &gt; &gt; network card. But when I execute ping 172.16.0.2 in=
 the root
<br>&gt; &gt; &gt; &gt; cell, the
<br>&gt; &gt; &gt; &gt; error &quot;From 172.16.0.1 icmp_seq=3D1 Destinatio=
n Host Unreachable&quot;
<br>&gt; &gt; &gt; &gt; appears.
<br>&gt; &gt; &gt; &gt; The attachment is the driver I used in linux and nu=
ttx
<br>&gt; &gt; &gt; &gt; respectively.The
<br>&gt; &gt; &gt; &gt; network driver uses the virtio interface.=C2=A0I tr=
ied to log in the
<br>&gt; &gt; &gt; &gt; driver,
<br>&gt; &gt; &gt; &gt; but I found that the control flow did not enter
<br>&gt; &gt; &gt; &gt; ndo_start_xmit().
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Looking at the hypervisor logs, it seems that the memory
<br>&gt; &gt; &gt; configuration
<br>&gt; &gt; &gt; of your virtual interfaces is correct now. The shared me=
mory
<br>&gt; &gt; &gt; between the
<br>&gt; &gt; &gt; cells is detected, the device probing seems successful.
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; I guess you don&#39;t receive interrupts for your virtua=
l devices.
<br>&gt; &gt; &gt; Could you
<br>&gt; &gt; &gt; verify that by looking into /proc/interrupts?
<br>&gt; &gt; &gt;=20
<br>&gt; &gt; &gt; Are we still running on qemu? All your devices have .iom=
mu =3D 0
<br>&gt; &gt; &gt; set, but
<br>&gt; &gt; &gt; the .irqchip configuration looks different (root cell as=
 well as
<br>&gt; &gt; &gt; inmate)
<br>&gt; &gt; &gt; compared to the qemu example that we have.
<br>&gt; &gt; &gt;=20
<br>&gt; &gt;=20
<br>&gt; &gt; As you have configured MSI-X interrupts for the virtual devic=
es,
<br>&gt; &gt; the
<br>&gt; &gt; documentation says:
<br>&gt; &gt;=20
<br>&gt; &gt; You may also need to set the iommu field to match the IOMMU u=
nit
<br>&gt; &gt; that
<br>&gt; &gt; the guest expects based on the bdf value. Try 1 if MSI-X inte=
rrupts
<br>&gt; &gt; do
<br>&gt; &gt; not make it when using 0.
<br>&gt; &gt;=20
<br>&gt; &gt; Just give it a try...
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/91742023-c4b3-4280-809a-5fa78cb7311bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/91742023-c4b3-4280-809a-5fa78cb7311bn%40googlegroups.co=
m</a>.<br />

------=_Part_25124_1268666662.1640797415124--

------=_Part_25123_1201023392.1640797415124--
