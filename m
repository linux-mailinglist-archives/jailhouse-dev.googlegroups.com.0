Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBHGHSXZAKGQEIXX3FDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC5B15C0C2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 15:56:29 +0100 (CET)
Received: by mail-oi1-x23a.google.com with SMTP id 16sf2860297oii.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 06:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GkqFNxF/afqa8736DHWau1fIqwc0sZ1LYcH6qiG97zQ=;
        b=Hgj12NGrszpnN96B2Yt7ODyrUkRVOspqNwMsvzTgHhyvTQ4/ciJvItRRYEkPyExo9B
         dynrW9sB/l4Mg2pmheL4DcrJwGUBQ7N1Nm487i7XqB91q97DsAERaoGFitF/TW0se0DT
         1wuKtCgFvLpvXaIWlh4x6hFAHcHyMm4h0/R50S2F1yv3MGNDZq8t2toORMZW7gkNT6o5
         /6x7AtBNuqHuSnCXPLqtJraZTHlN+rQy/zd5IoQp7COxT/D53ytaAii58ABUStgMmZzU
         AxIWo4Gf6k/vAbOEix5zCifl3hmqG/K5VMloDy4ub9e4O9FY9phTFRHQmKpph3/CZLkd
         DsiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GkqFNxF/afqa8736DHWau1fIqwc0sZ1LYcH6qiG97zQ=;
        b=BJk91Zp/3ZTk7lDGY0imRfH169sYg50IhoyJ+b7FYkfcWNCpvTgQECJdsRaTylCaJF
         WQ2WxatX0PUxVFeDSjx4mB1mpeP4waZUSZRSMEZbq+oxXFlaPYBi+CiKe14B/JRT0TQn
         t/vxnHdVomHoUMYiwdjsITH1JMwhNwJXfrBlK9xOc9i+UWoSnHlnsEZ/lUT+b8/Pk8At
         VeBpN/4syHnE283SPwmWJSLG+zEyCW9iNPUg4o7hUkauaqGYajFyo9UpABhv6rLsCrJk
         uzOghR5keGdTqMk5sYyswN/BUaZxRSeVxIfkeIwG9fQ+bVvxnPw02NbOi9usMkmexoHY
         RZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GkqFNxF/afqa8736DHWau1fIqwc0sZ1LYcH6qiG97zQ=;
        b=WAv0chZL+h6xipZx9QJ/ApLZ+OrIRiJ+xld/90HBy9mHqe6hLo2e2K3M3jHTGDsKor
         VnmJNnxCY49zsKlF2W9Rv49tslJYT0YWkixHxPLKPR5/olIKpx4l8JfhVXhyHoAATkFK
         6L6iUJBPZqB87A4ZNwd0hxHKb/IfqXJrDQhJIQZobImmVFJcZMjN5opqf67orX5exIKq
         3q89hgXuuhAlhuR7JEnJo+BYs35sPl+g5PHjCgcUI+PUhm8ySsigkRpqMIwSw2q5Ams+
         ge2rJK1uwuHRGmyE1Xsw1gShlmgh08c2CCJOQknFl50E+ObPbS4Kkv+pELaczooXL/Z2
         3RZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV4TsSXMeFpgEqsD3tYxnkdsm4EMy9+0AkyesoZpfr6fDoc5HRM
	jWtglv6pk5FXuL+JAMyc/iw=
X-Google-Smtp-Source: APXvYqzO4dtTNs7NotWbq+hyoPT5+uZLyRAGiCvsE6RKFZrGMADPxyYZfqIatiUMfnWaebOHNTN7sg==
X-Received: by 2002:a9d:7548:: with SMTP id b8mr14220937otl.74.1581605788495;
        Thu, 13 Feb 2020 06:56:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:7282:: with SMTP id p124ls7580086oic.4.gmail; Thu, 13
 Feb 2020 06:56:28 -0800 (PST)
X-Received: by 2002:aca:c551:: with SMTP id v78mr3156527oif.161.1581605787864;
        Thu, 13 Feb 2020 06:56:27 -0800 (PST)
Date: Thu, 13 Feb 2020 06:56:27 -0800 (PST)
From: vijai kumar <vijaikumar.kanagarajan@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7cec04f3-8256-4d82-9942-53c01997d519@googlegroups.com>
In-Reply-To: <53bb9717-30a9-c930-8dcf-a6e0fcb2d99e@siemens.com>
References: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
 <20200213134430.3052-4-vijaikumar.kanagarajan@gmail.com>
 <53bb9717-30a9-c930-8dcf-a6e0fcb2d99e@siemens.com>
Subject: Re: [PATCH 4/4] Enable pine64-plus support
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2914_1409112071.1581605787373"
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
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

------=_Part_2914_1409112071.1581605787373
Content-Type: multipart/alternative; 
	boundary="----=_Part_2915_448124068.1581605787373"

------=_Part_2915_448124068.1581605787373
Content-Type: text/plain; charset="UTF-8"



On Thursday, February 13, 2020 at 7:49:02 PM UTC+5:30, Jan Kiszka wrote:
>
> On 13.02.20 14:44, Vijai Kumar K wrote: 
> > - Add the necessary machine, multiconfig and wks file. 
> > - Add entry in images list. 
> > 
> > Signed-off-by: Vijai Kumar K <vijaikumar...@gmail.com <javascript:>> 
> > --- 
> >   conf/machine/pine64-plus.conf                 | 19 +++++++++++++++++++ 
> >   .../pine64-plus-jailhouse-demo.conf           | 14 ++++++++++++++ 
> >   images.list                                   |  1 + 
> >   wic/pine64-plus.wks                           | 16 ++++++++++++++++ 
> >   4 files changed, 50 insertions(+) 
> >   create mode 100644 conf/machine/pine64-plus.conf 
> >   create mode 100644 conf/multiconfig/pine64-plus-jailhouse-demo.conf 
> >   create mode 100644 wic/pine64-plus.wks 
> > 
> > diff --git a/conf/machine/pine64-plus.conf 
> b/conf/machine/pine64-plus.conf 
> > new file mode 100644 
> > index 0000000..0949ab4 
> > --- /dev/null 
> > +++ b/conf/machine/pine64-plus.conf 
> > @@ -0,0 +1,19 @@ 
> > +# 
> > +# Jailhouse, a Linux-based partitioning hypervisor 
> > +# 
> > +# Copyright (c) Vijai Kumar K, 2020 
> > +# 
> > +# Authors: 
> > +#  Vijai Kumar K <vijaikumar...@gmail.com <javascript:>> 
> > +# 
> > +# SPDX-License-Identifier: MIT 
> > +# 
> > + 
> > +DISTRO_ARCH = "arm64" 
> > + 
> > +IMAGE_TYPE = "wic-img" 
> > +IMAGER_INSTALL += "u-boot-pine64-plus" 
> > +IMAGER_BUILD_DEPS += "u-boot-pine64-plus" 
> > +PREFERRED_PROVIDER_u-boot-pine64-plus = "u-boot-pine64-plus" 
> > + 
> > +IMAGE_INSTALL += "u-boot-script" 
> > diff --git a/conf/multiconfig/pine64-plus-jailhouse-demo.conf 
> b/conf/multiconfig/pine64-plus-jailhouse-demo.conf 
> > new file mode 100644 
> > index 0000000..5e66c94 
> > --- /dev/null 
> > +++ b/conf/multiconfig/pine64-plus-jailhouse-demo.conf 
> > @@ -0,0 +1,14 @@ 
> > +# 
> > +# Jailhouse, a Linux-based partitioning hypervisor 
> > +# 
> > +# Copyright (c) Vijai Kumar K, 2020 
> > +# 
> > +# Authors: 
> > +#  Vijai Kumar K <vijaikumar...@gmail.com <javascript:>> 
> > +# 
> > +# SPDX-License-Identifier: MIT 
> > +# 
> > +# 
> > +MACHINE = "pine64-plus" 
> > + 
> > +DISTRO = "jailhouse-demo" 
> > diff --git a/images.list b/images.list 
> > index 26a802d..b794d85 100644 
> > --- a/images.list 
> > +++ b/images.list 
> > @@ -7,3 +7,4 @@ macchiatobin        Marvell MACCHIATObin 
> >   hikey620        LeMaker HiKey (Kirin 620 SoC, 2 GB edition) 
> >   ultra96                Avnet Ultra96 
> >   rpi4                Raspberry Pi 4 (1 GB edition) 
> > +pine64-plus        Pine64+ (Allwinner A64, 2GB edition) 
> > diff --git a/wic/pine64-plus.wks b/wic/pine64-plus.wks 
> > new file mode 100644 
> > index 0000000..aacca04 
> > --- /dev/null 
> > +++ b/wic/pine64-plus.wks 
> > @@ -0,0 +1,16 @@ 
> > +# 
> > +# Jailhouse, a Linux-based partitioning hypervisor 
> > +# 
> > +# Copyright (c) Vijai Kumar K, 2020 
> > +# 
> > +# Authors: 
> > +#  Vijai Kumar K <vijaikumar...@gmail.com <javascript:>> 
> > +# 
> > +# SPDX-License-Identifier: MIT 
> > +# 
> > + 
> > +part u-boot --source rawcopy --sourceparams 
> "file=/usr/lib/u-boot/pine64-plus/u-boot-sunxi-with-spl.bin" --no-table 
> --align 8 
> > + 
> > +part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label 
> platform --align 1024 
> > + 
> > +bootloader --append "rootwait mem=1792M" 
> > 
>
> Could you add a section to the README as well? 
>

Sure. 


> Thanks, 
> Jan 
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7cec04f3-8256-4d82-9942-53c01997d519%40googlegroups.com.

------=_Part_2915_448124068.1581605787373
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thursday, February 13, 2020 at 7:49:02 PM UTC+5=
:30, Jan Kiszka wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;=
margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 13.02=
.20 14:44, Vijai Kumar K wrote:
<br>&gt; - Add the necessary machine, multiconfig and wks file.
<br>&gt; - Add entry in images list.
<br>&gt;=20
<br>&gt; Signed-off-by: Vijai Kumar K &lt;<a href=3D"javascript:" target=3D=
"_blank" gdf-obfuscated-mailto=3D"g7pEme7hBQAJ" rel=3D"nofollow" onmousedow=
n=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=
=3D&#39;javascript:&#39;;return true;">vijaikumar...@gmail.<wbr>com</a>&gt;
<br>&gt; ---
<br>&gt; =C2=A0 conf/machine/pine64-plus.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 +++++++++++++++++++
<br>&gt; =C2=A0 .../pine64-plus-jailhouse-<wbr>demo.conf =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 14 ++++++++++++++
<br>&gt; =C2=A0 images.list =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A01 +
<br>&gt; =C2=A0 wic/pine64-plus.wks =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++++++++++++++
<br>&gt; =C2=A0 4 files changed, 50 insertions(+)
<br>&gt; =C2=A0 create mode 100644 conf/machine/pine64-plus.conf
<br>&gt; =C2=A0 create mode 100644 conf/multiconfig/pine64-plus-<wbr>jailho=
use-demo.conf
<br>&gt; =C2=A0 create mode 100644 wic/pine64-plus.wks
<br>&gt;=20
<br>&gt; diff --git a/conf/machine/pine64-plus.<wbr>conf b/conf/machine/pin=
e64-plus.<wbr>conf
<br>&gt; new file mode 100644
<br>&gt; index 0000000..0949ab4
<br>&gt; --- /dev/null
<br>&gt; +++ b/conf/machine/pine64-plus.<wbr>conf
<br>&gt; @@ -0,0 +1,19 @@
<br>&gt; +#
<br>&gt; +# Jailhouse, a Linux-based partitioning hypervisor
<br>&gt; +#
<br>&gt; +# Copyright (c) Vijai Kumar K, 2020
<br>&gt; +#
<br>&gt; +# Authors:
<br>&gt; +# =C2=A0Vijai Kumar K &lt;<a href=3D"javascript:" target=3D"_blan=
k" gdf-obfuscated-mailto=3D"g7pEme7hBQAJ" rel=3D"nofollow" onmousedown=3D"t=
his.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;=
javascript:&#39;;return true;">vijaikumar...@gmail.<wbr>com</a>&gt;
<br>&gt; +#
<br>&gt; +# SPDX-License-Identifier: MIT
<br>&gt; +#
<br>&gt; +
<br>&gt; +DISTRO_ARCH =3D &quot;arm64&quot;
<br>&gt; +
<br>&gt; +IMAGE_TYPE =3D &quot;wic-img&quot;
<br>&gt; +IMAGER_INSTALL +=3D &quot;u-boot-pine64-plus&quot;
<br>&gt; +IMAGER_BUILD_DEPS +=3D &quot;u-boot-pine64-plus&quot;
<br>&gt; +PREFERRED_PROVIDER_u-boot-<wbr>pine64-plus =3D &quot;u-boot-pine6=
4-plus&quot;
<br>&gt; +
<br>&gt; +IMAGE_INSTALL +=3D &quot;u-boot-script&quot;
<br>&gt; diff --git a/conf/multiconfig/pine64-<wbr>plus-jailhouse-demo.conf=
 b/conf/multiconfig/pine64-<wbr>plus-jailhouse-demo.conf
<br>&gt; new file mode 100644
<br>&gt; index 0000000..5e66c94
<br>&gt; --- /dev/null
<br>&gt; +++ b/conf/multiconfig/pine64-<wbr>plus-jailhouse-demo.conf
<br>&gt; @@ -0,0 +1,14 @@
<br>&gt; +#
<br>&gt; +# Jailhouse, a Linux-based partitioning hypervisor
<br>&gt; +#
<br>&gt; +# Copyright (c) Vijai Kumar K, 2020
<br>&gt; +#
<br>&gt; +# Authors:
<br>&gt; +# =C2=A0Vijai Kumar K &lt;<a href=3D"javascript:" target=3D"_blan=
k" gdf-obfuscated-mailto=3D"g7pEme7hBQAJ" rel=3D"nofollow" onmousedown=3D"t=
his.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;=
javascript:&#39;;return true;">vijaikumar...@gmail.<wbr>com</a>&gt;
<br>&gt; +#
<br>&gt; +# SPDX-License-Identifier: MIT
<br>&gt; +#
<br>&gt; +#
<br>&gt; +MACHINE =3D &quot;pine64-plus&quot;
<br>&gt; +
<br>&gt; +DISTRO =3D &quot;jailhouse-demo&quot;
<br>&gt; diff --git a/images.list b/images.list
<br>&gt; index 26a802d..b794d85 100644
<br>&gt; --- a/images.list
<br>&gt; +++ b/images.list
<br>&gt; @@ -7,3 +7,4 @@ macchiatobin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0Marvell MACCHIATObin
<br>&gt; =C2=A0 hikey620=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0LeM=
aker HiKey (Kirin 620 SoC, 2 GB edition)
<br>&gt; =C2=A0 ultra96=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Avnet Ultra96
<br>&gt; =C2=A0 rpi4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Raspberry Pi 4 (1 GB edition)
<br>&gt; +pine64-plus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Pine64=
+ (Allwinner A64, 2GB edition)
<br>&gt; diff --git a/wic/pine64-plus.wks b/wic/pine64-plus.wks
<br>&gt; new file mode 100644
<br>&gt; index 0000000..aacca04
<br>&gt; --- /dev/null
<br>&gt; +++ b/wic/pine64-plus.wks
<br>&gt; @@ -0,0 +1,16 @@
<br>&gt; +#
<br>&gt; +# Jailhouse, a Linux-based partitioning hypervisor
<br>&gt; +#
<br>&gt; +# Copyright (c) Vijai Kumar K, 2020
<br>&gt; +#
<br>&gt; +# Authors:
<br>&gt; +# =C2=A0Vijai Kumar K &lt;<a href=3D"javascript:" target=3D"_blan=
k" gdf-obfuscated-mailto=3D"g7pEme7hBQAJ" rel=3D"nofollow" onmousedown=3D"t=
his.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;=
javascript:&#39;;return true;">vijaikumar...@gmail.<wbr>com</a>&gt;
<br>&gt; +#
<br>&gt; +# SPDX-License-Identifier: MIT
<br>&gt; +#
<br>&gt; +
<br>&gt; +part u-boot --source rawcopy --sourceparams &quot;file=3D/usr/lib=
/u-boot/pine64-<wbr>plus/u-boot-sunxi-with-spl.<wbr>bin&quot; --no-table --=
align 8
<br>&gt; +
<br>&gt; +part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --la=
bel platform --align 1024
<br>&gt; +
<br>&gt; +bootloader --append &quot;rootwait mem=3D1792M&quot;
<br>&gt;=20
<br>
<br>Could you add a section to the README as well?
<br></blockquote><div><br></div><div>Sure. <br></div><div> <br></div><block=
quote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-le=
ft: 1px #ccc solid;padding-left: 1ex;">
<br>Thanks,
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
om/d/msgid/jailhouse-dev/7cec04f3-8256-4d82-9942-53c01997d519%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/7cec04f3-8256-4d82-9942-53c01997d519%40googlegroups.com<=
/a>.<br />

------=_Part_2915_448124068.1581605787373--

------=_Part_2914_1409112071.1581605787373--
