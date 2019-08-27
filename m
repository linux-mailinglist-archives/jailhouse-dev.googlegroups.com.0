Return-Path: <jailhouse-dev+bncBCR7PPMN34DRB45LSTVQKGQEKUNVWCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF4E9E6E8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Aug 2019 13:37:25 +0200 (CEST)
Received: by mail-ot1-x33c.google.com with SMTP id c1sf11737390otb.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Aug 2019 04:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6bTs6LbW72szUP9K1u6Sopo9Xi/ItZlPJpMGX1mrFx8=;
        b=MSd8kprMdtX9OUpN4Ki80WRJcz2MpH7xxcy1N0OVkzcEL/Gn32ww/uyrZFJLbAnOaP
         3Ljw9pc8C6VmqDMI4vrqqvIhfzMHRZgTLvbuILEH9oR04e5RGg0GmfLycGJTp8yxDwde
         45elmaq0QVDjvzzKpOqDkASB1CCSSziA6hqzwjcuMgX3ggvWu9lMoD0BjsOPh8yxlYEm
         ZNJR9o0FF0NU8HF/ouNzSd5WsNgoppTzxD1prE2LrYezumWCXTWUK+FwB5GSt0lBKppg
         FouwXH7rEaN7a+3wemiwWwgFqilHwj2Oqn5Y5EF2W+nZPuDKeDBIVFCnE9TSONPsrN8L
         Z52A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6bTs6LbW72szUP9K1u6Sopo9Xi/ItZlPJpMGX1mrFx8=;
        b=oVq29lI+trzyqvIaYBv77S7pbpQRnuiErRV9TfINzSFVrMPtuOBCnxtIUP3UctqUFR
         Hd63cwXPQpNh34/7D8k1UCfKuDffUhLT72jsCSMrsGHAzItt2oXgJ1JKcAFwHJ+GUYFY
         NjvMmawLp3Z5CpK896NIK0qoy9HQTnsv/usaMzqCXNcpvkK13A0zqas9yhcx+3Dt9wsn
         PqgUAXuQiRoyWxZ2OFkAnR4OluYHMId73fFLEkx+UBlD1AopUxGTUlkmG/DZ3syNbqGE
         gMqzA9Xel+BQWzvwCWD0Unr6EEQeFodct6cgP9tazkjnIoHBDTaHa6NJDDfCgdgwfKrM
         Ne9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6bTs6LbW72szUP9K1u6Sopo9Xi/ItZlPJpMGX1mrFx8=;
        b=ZqyyUoc8b999uqgcShRT3xUY3+/sfwQCfRIezB2VsSTnlz+MhHx6GyrXI2nHRCjKfC
         rwNao3My2mb3w2oJh/zNvDJLDWF5IrCZYCpajpl+gaQfxC5scrn3PtNUL9yELe+tVsMN
         so5ZkyVYPUNhPmvBnedUlHO30Iv8wBa8MKxocU/G4Jb3j+tLcrRjSmbRKq5RBrG7x137
         g40D2qPt9ICkcemqKGnXjw512TuFhni8VzKCgxYQACUpn7oBKpqKeTg1SZXR9VNqSArR
         K1g0zFjjt8W+YuC5M6xVKErQvnkkCiJ2ndiA7bFWXYDVU0NuDZR5lEOGhYvsMzB0+HhD
         8sMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWuUec1dZ/Itfawh7i70ZLpYLBplXRHDsIr7UCt+gYJ4ZAsHUC7
	DycICx/0c/j6rml5PunqNIk=
X-Google-Smtp-Source: APXvYqweWICKe9cLPEBDGzRavnrXWbkLgLpUr5sbDIkebBrhcztezmuuSoeccqsytsOEe7JxSX7bIg==
X-Received: by 2002:a05:6830:1452:: with SMTP id w18mr17863248otp.330.1566905844057;
        Tue, 27 Aug 2019 04:37:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:fc93:: with SMTP id a141ls777975oii.10.gmail; Tue, 27
 Aug 2019 04:37:23 -0700 (PDT)
X-Received: by 2002:a05:6808:9b6:: with SMTP id e22mr15983143oig.147.1566905843542;
        Tue, 27 Aug 2019 04:37:23 -0700 (PDT)
Date: Tue, 27 Aug 2019 04:37:22 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4a855b24-4638-4349-93a8-72366bc248be@googlegroups.com>
In-Reply-To: <be855ebb-4ed7-2f57-5870-ace709135e4f@siemens.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
 <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
 <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
 <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
 <df7be3b4-a447-0ff1-f43b-ee37bf6513bb@web.de>
 <c183c116-5942-4d08-a0a7-a897e8fbed20@googlegroups.com>
 <6dfd2128-011a-420f-860f-4ccb472c079f@googlegroups.com>
 <67cdfa4b-86e9-496a-3878-b5a0016b75c0@siemens.com>
 <521c355a-eacc-434e-b50d-dd7c797be08a@googlegroups.com>
 <4fe67562-ffb1-a306-542e-c27b0450bca1@web.de>
 <71ab42b5-b8c9-4392-9575-759f6eb899a0@googlegroups.com>
 <1c8ad7db-eb23-034d-dbad-33267d4227f1@siemens.com>
 <12e2c8ec-e900-4d3a-9f78-086803483af6@googlegroups.com>
 <be855ebb-4ed7-2f57-5870-ace709135e4f@siemens.com>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2288_1601053849.1566905843061"
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

------=_Part_2288_1601053849.1566905843061
Content-Type: multipart/alternative; 
	boundary="----=_Part_2289_1521256014.1566905843061"

------=_Part_2289_1521256014.1566905843061
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What i see with cat /proc/iomem is the same as the root cell, so i must not=
=20
be connecting properly, do you have a hint of what might be incorrect?

I noticed that after issuing that command, there was still no TX/RX bytes=
=20
transmitted through the virtual interface,

eth0      Link encap:Ethernet  HWaddr 86:A0:B7:4C:68:15 =20
          inet addr:10.10.70.3  Bcast:10.255.255.255  Mask:255.0.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:16384  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000=20
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

ter=C3=A7a-feira, 27 de Agosto de 2019 =C3=A0s 10:34:25 UTC+1, Jan Kiszka e=
screveu:
>
> On 26.08.19 20:09, Jo=C3=A3o Reis wrote:=20
> > I am using inmate-zynqmp.dtb for non-root cell, which is not being used=
=20
> by root=20
> > cell. Or are you referring to Petalinux's device tree? In that case,=20
> what nodes=20
> > must i alter? The memory node?=20
> >=20
>
> If you are already using the inmate dtb, you won't see most of the=20
> resources in=20
> /proc/iomem that you have in the root cell - or you are still looking at=
=20
> the=20
> root cell. This is what you get normally in the inmate with uart access=
=20
> (taken=20
> on ultra96):=20
>
> # cat /proc/iomem=20
> 10000000-1000ffff : pci@fc000000=20
>    10000000-100000ff : 0000:00:00.0=20
>      10000000-100000ff : ivshmem-net=20
> 74000000-7beeffff : System RAM=20
>    74000000-74000fff : reserved=20
>    74280000-7509ffff : Kernel code=20
>    750a0000-751bffff : reserved=20
>    751c0000-75368fff : Kernel data=20
>    7638a000-76b5cfff : reserved=20
>    79c00000-7bbfffff : reserved=20
>    7bead000-7bed8fff : reserved=20
>    7bedb000-7bedcfff : reserved=20
>    7bedd000-7beddfff : reserved=20
>    7bede000-7bee1fff : reserved=20
>    7bee2000-7bee3fff : reserved=20
>    7bee4000-7beeffff : reserved=20
> 7bf00000-7bffffff : ivshmem-net=20
> fc000000-fc0fffff : PCI ECAM=20
> ff010000-ff010fff : xuartps=20
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
jailhouse-dev/4a855b24-4638-4349-93a8-72366bc248be%40googlegroups.com.

------=_Part_2289_1521256014.1566905843061
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What i see with cat /proc/iomem is the same as the root ce=
ll, so i must not be connecting properly, do you have a hint of what might =
be incorrect?<div><br></div><div>I noticed that after issuing that command,=
 there was still no TX/RX bytes transmitted through the virtual interface,<=
/div><div><br></div><div><div>eth0=C2=A0 =C2=A0 =C2=A0 Link encap:Ethernet=
=C2=A0 HWaddr 86:A0:B7:4C:68:15=C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 inet addr:10.10.70.3=C2=A0 Bcast:10.255.255.255=C2=A0 Mask:25=
5.0.0.0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING M=
ULTICAST=C2=A0 MTU:16384=C2=A0 Metric:1</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overruns:0 frame:0</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 overruns:0 =
carrier:0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueue=
len:1000=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0=
 B)=C2=A0 TX bytes:0 (0.0 B)</div><br>ter=C3=A7a-feira, 27 de Agosto de 201=
9 =C3=A0s 10:34:25 UTC+1, Jan Kiszka escreveu:<blockquote class=3D"gmail_qu=
ote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padd=
ing-left: 1ex;">On 26.08.19 20:09, Jo=C3=A3o Reis wrote:
<br>&gt; I am using inmate-zynqmp.dtb for non-root cell, which is not being=
 used by root=20
<br>&gt; cell. Or are you referring to Petalinux&#39;s device tree? In that=
 case, what nodes=20
<br>&gt; must i alter? The memory node?
<br>&gt;=20
<br>
<br>If you are already using the inmate dtb, you won&#39;t see most of the =
resources in=20
<br>/proc/iomem that you have in the root cell - or you are still looking a=
t the=20
<br>root cell. This is what you get normally in the inmate with uart access=
 (taken=20
<br>on ultra96):
<br>
<br># cat /proc/iomem
<br>10000000-1000ffff : pci@fc000000
<br>=C2=A0 =C2=A010000000-100000ff : 0000:00:00.0
<br>=C2=A0 =C2=A0 =C2=A010000000-100000ff : ivshmem-net
<br>74000000-7beeffff : System RAM
<br>=C2=A0 =C2=A074000000-74000fff : reserved
<br>=C2=A0 =C2=A074280000-7509ffff : Kernel code
<br>=C2=A0 =C2=A0750a0000-751bffff : reserved
<br>=C2=A0 =C2=A0751c0000-75368fff : Kernel data
<br>=C2=A0 =C2=A07638a000-76b5cfff : reserved
<br>=C2=A0 =C2=A079c00000-7bbfffff : reserved
<br>=C2=A0 =C2=A07bead000-7bed8fff : reserved
<br>=C2=A0 =C2=A07bedb000-7bedcfff : reserved
<br>=C2=A0 =C2=A07bedd000-7beddfff : reserved
<br>=C2=A0 =C2=A07bede000-7bee1fff : reserved
<br>=C2=A0 =C2=A07bee2000-7bee3fff : reserved
<br>=C2=A0 =C2=A07bee4000-7beeffff : reserved
<br>7bf00000-7bffffff : ivshmem-net
<br>fc000000-fc0fffff : PCI ECAM
<br>ff010000-ff010fff : xuartps
<br>
<br>Jan
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
om/d/msgid/jailhouse-dev/4a855b24-4638-4349-93a8-72366bc248be%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/4a855b24-4638-4349-93a8-72366bc248be%40googlegroups.com<=
/a>.<br />

------=_Part_2289_1521256014.1566905843061--

------=_Part_2288_1601053849.1566905843061--
