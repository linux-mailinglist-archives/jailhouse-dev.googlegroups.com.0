Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBBJ4SWKHAMGQED6C347Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3d.google.com (mail-qv1-xf3d.google.com [IPv6:2607:f8b0:4864:20::f3d])
	by mail.lfdr.de (Postfix) with ESMTPS id C528A48150A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Dec 2021 17:13:28 +0100 (CET)
Received: by mail-qv1-xf3d.google.com with SMTP id fw10-20020a056214238a00b003c05d328ad2sf17468871qvb.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Dec 2021 08:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SGWwgGtEn4Rv+7OWaQNcD7pnpQKJOzw0CtcqeFFGH7g=;
        b=trVBn5xlqILSHuFvuzOKn4iM3TAfKGTaMC2y6F0bZoyH+v/9Y28Rm05777DShoeIu1
         Z1Om5SC+Mly3slPx9FsQQDEM/m7e2hS39juPA4+lx64yGJpfWk/H5/169msGBVguMvuH
         GZLtCBGktJDxza5DiPXFVx4pu4zobNisJPfngshW7hzbfOfJchNzm8J/6k8z72rX7JcI
         mxXgh7UXa+OZhhk4isSbdQx4s+yF4BMw1OXANebG7qb4pNLB/KiUWPvucJMwZOtlby4x
         Bpc1C/F1cKlzu5nNbbg13zPU7xWULX+ZBqrd3Usm5PMbTxSz9w4uXlT+wDB8OFtIOgm6
         aWWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SGWwgGtEn4Rv+7OWaQNcD7pnpQKJOzw0CtcqeFFGH7g=;
        b=Ji+Ddv44kKn75+kRzgzB1QbgSfECrSisdebLT0tUYR9XABlGj79KkE0QC3KQt9ndH2
         mnyCGG43gdoBJ/Pn4sTfQN7i7AZhfBX2d5tMEAxSAFsXxl1p5Yw3nLbfLL2E7DmMkC1F
         yf3bzwgRsS/UCvsl8KHGDEn70agiS34Z1Ba9V1LEsQ21JIAyV1ZvROaMetUD7OpLi2d/
         DLALduDCZ/cB6GDhSZTwXs7VWLSzFs7h4/QJs67DfOODV1VsBYZw20Xvd8nvh/GUZPm5
         gf9/faHpPFpnDvL2jJ32jZPOQrfjkETFtAaLhNDgs4VUHW6Ot4vqPfAG79SbS8krCLq5
         ZILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SGWwgGtEn4Rv+7OWaQNcD7pnpQKJOzw0CtcqeFFGH7g=;
        b=cZ3dpSf+zTe/1soMyKdWJDNgjqM0OHGt4oXCRlWs31+Qiphsj4WIzMr95wzr4+4tpn
         C3ug0SnoFZAu4kIPiuEsZ3+cp+wPgiZnqiK9nY570cABByqZmWtoKbUtw1JWZenYSRyH
         eTaLILL6jJZHYFS/oDryLHrU1nkum7g1N7SYdptcEiwal+HWurv3wVB30IFofl/ffOUP
         jwy2H3q1JmfUTgc+jSnWvXZi0BiVh2Bzr9MAkN57qEWzW7CVa1ze+RtjX46JojJ+naDW
         AqAtTcIXmH6C1UIeEu0q3IcJh9v6k4nhGMNnqPl8tmDF8w14cGQ8gAJ6fwoKLgM8g+Sw
         Vp2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532wXkyUUMVAi4yn2rkX+JnS0AeEmdq5eFue5K+T/Fx550VsQW/V
	R9kgrGQdt53DSA0wyyCvPQk=
X-Google-Smtp-Source: ABdhPJyaL5I5s+5PjMEvBytAA8qhvvNVFwXQc2KRi+7xj4DbEeUoog+0/CNwpy50kbveEr70b18bHw==
X-Received: by 2002:a05:620a:24cf:: with SMTP id m15mr19703668qkn.623.1640794407435;
        Wed, 29 Dec 2021 08:13:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:ca90:: with SMTP id a16ls9344755qvk.7.gmail; Wed, 29 Dec
 2021 08:13:27 -0800 (PST)
X-Received: by 2002:a05:6214:5087:: with SMTP id kk7mr23952576qvb.76.1640794406939;
        Wed, 29 Dec 2021 08:13:26 -0800 (PST)
Date: Wed, 29 Dec 2021 08:13:26 -0800 (PST)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e3f8d47c-8a22-4abc-8977-e17641a404f9n@googlegroups.com>
In-Reply-To: <f25df50a-e947-002b-5528-8d9793318aa6@siemens.com>
References: <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAAgAAEf4CAAANwgA==>
 <AQHX9zll1kEOxXgNtECZVvZtiJyBGKw+juAA>
 <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
 <64fa037aefed1d130bc0d3a49ccc3d09d5b504bc.camel@siemens.com>
 <2be13d89-1023-411b-ba9e-1d10044824e5n@googlegroups.com>
 <f76e76b332af3cef7a46e9048e96d6b50aa50fa0.camel@siemens.com>
 <c7eaa08e-ae92-4c5c-a57c-7ddac379242cn@googlegroups.com>
 <514e2fa3-9e58-5b79-038c-fe4ac21e803e@siemens.com>
 <f25df50a-e947-002b-5528-8d9793318aa6@siemens.com>
Subject: Re: FATAL: Unhandled VM-Exit, reason 2
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8964_1587308810.1640794406348"
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

------=_Part_8964_1587308810.1640794406348
Content-Type: multipart/alternative; 
	boundary="----=_Part_8965_504563324.1640794406348"

------=_Part_8965_504563324.1640794406348
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Unfortunately, after I tried almost all methods, the network still cannot=
=20
be connected. But I can be sure that the ivshmem-net device did not receive=
=20
the interrupt, but the shadow device that also uses the ivshmem interface=
=20
can receive the interrupt normally, and the state change of another virtual=
=20
device is detected.
I want to know if this is due to the kernel version. Are there any kernel=
=20
branches that you maintain yourself?
Best wish
=E5=9C=A82021=E5=B9=B412=E6=9C=8827=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=80 UTC=
+8 19:49:29<Florian Bezdeka> =E5=86=99=E9=81=93=EF=BC=9A

> On 27.12.21 12:34, Florian Bezdeka wrote:
> > On 26.12.21 17:21, jiajun huang wrote:
> >> Happy New Year=EF=BC=8C
> >>
> >> I successfully created root cell and inmate cell on QEMU, and nuttx
> >> running in the inmate cell. At the same time, I added the ivshmem-net
> >> device to the root cell and the intimate cell, and loaded the NIC
> >> driver. Finally, I configured ip 172.16.0.1 and 172.16.0.2 for the
> >> network card. But when I execute ping 172.16.0.2 in the root cell, the
> >> error "From 172.16.0.1 icmp_seq=3D1 Destination Host Unreachable" appe=
ars.
> >> The attachment is the driver I used in linux and nuttx respectively.Th=
e
> >> network driver uses the virtio interface. I tried to log in the driver=
,
> >> but I found that the control flow did not enter ndo_start_xmit().
> >=20
> > Looking at the hypervisor logs, it seems that the memory configuration
> > of your virtual interfaces is correct now. The shared memory between th=
e
> > cells is detected, the device probing seems successful.
> >=20
> > I guess you don't receive interrupts for your virtual devices. Could yo=
u
> > verify that by looking into /proc/interrupts?
> >=20
> > Are we still running on qemu? All your devices have .iommu =3D 0 set, b=
ut
> > the .irqchip configuration looks different (root cell as well as inmate=
)
> > compared to the qemu example that we have.
> >=20
>
> As you have configured MSI-X interrupts for the virtual devices, the
> documentation says:
>
> You may also need to set the iommu field to match the IOMMU unit that
> the guest expects based on the bdf value. Try 1 if MSI-X interrupts do
> not make it when using 0.
>
> Just give it a try...
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e3f8d47c-8a22-4abc-8977-e17641a404f9n%40googlegroups.com.

------=_Part_8965_504563324.1640794406348
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>Unfortunately, after I tried almost all methods, the network =
still cannot be connected. But I can be sure that the ivshmem-net device di=
d not receive the interrupt, but the shadow device that also uses the ivshm=
em interface can receive the interrupt normally, and the state change of an=
other virtual device is detected.<br>I want to know if this is due to the k=
ernel version. Are there any kernel branches that you maintain yourself?<br=
><div>Best wish</div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"=
gmail_attr">=E5=9C=A82021=E5=B9=B412=E6=9C=8827=E6=97=A5=E6=98=9F=E6=9C=9F=
=E4=B8=80 UTC+8 19:49:29&lt;Florian Bezdeka> =E5=86=99=E9=81=93=EF=BC=9A<br=
/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bor=
der-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 27.12.21 12:=
34, Florian Bezdeka wrote:
<br>&gt; On 26.12.21 17:21, jiajun huang wrote:
<br>&gt;&gt; Happy New Year=EF=BC=8C
<br>&gt;&gt;
<br>&gt;&gt; I successfully created root cell and inmate cell on QEMU, and =
nuttx
<br>&gt;&gt; running in the inmate cell. At the same time, I added the ivsh=
mem-net
<br>&gt;&gt; device to the root cell and the intimate cell, and loaded the =
NIC
<br>&gt;&gt; driver. Finally, I configured ip 172.16.0.1 and 172.16.0.2 for=
 the
<br>&gt;&gt; network card. But when I execute ping 172.16.0.2 in the root c=
ell, the
<br>&gt;&gt; error &quot;From 172.16.0.1 icmp_seq=3D1 Destination Host Unre=
achable&quot; appears.
<br>&gt;&gt; The attachment is the driver I used in linux and nuttx respect=
ively.The
<br>&gt;&gt; network driver uses the virtio interface.=C2=A0I tried to log =
in the driver,
<br>&gt;&gt; but I found that the control flow did not enter ndo_start_xmit=
().
<br>&gt;=20
<br>&gt; Looking at the hypervisor logs, it seems that the memory configura=
tion
<br>&gt; of your virtual interfaces is correct now. The shared memory betwe=
en the
<br>&gt; cells is detected, the device probing seems successful.
<br>&gt;=20
<br>&gt; I guess you don&#39;t receive interrupts for your virtual devices.=
 Could you
<br>&gt; verify that by looking into /proc/interrupts?
<br>&gt;=20
<br>&gt; Are we still running on qemu? All your devices have .iommu =3D 0 s=
et, but
<br>&gt; the .irqchip configuration looks different (root cell as well as i=
nmate)
<br>&gt; compared to the qemu example that we have.
<br>&gt;=20
<br>
<br>As you have configured MSI-X interrupts for the virtual devices, the
<br>documentation says:
<br>
<br>You may also need to set the iommu field to match the IOMMU unit that
<br>the guest expects based on the bdf value. Try 1 if MSI-X interrupts do
<br>not make it when using 0.
<br>
<br>Just give it a try...
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e3f8d47c-8a22-4abc-8977-e17641a404f9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e3f8d47c-8a22-4abc-8977-e17641a404f9n%40googlegroups.co=
m</a>.<br />

------=_Part_8965_504563324.1640794406348--

------=_Part_8964_1587308810.1640794406348--
