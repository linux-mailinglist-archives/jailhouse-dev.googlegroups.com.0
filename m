Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBB3OGSXZAKGQEZBGMEMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23b.google.com (mail-oi1-x23b.google.com [IPv6:2607:f8b0:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4815C0BD
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 15:55:43 +0100 (CET)
Received: by mail-oi1-x23b.google.com with SMTP id 199sf2875880oie.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=liNHy74WUuRvCBd2unZCv7t/kBXFmKc3rqHIDS7glpo=;
        b=Hagjg9M2DxE4MS821RtBilqeHTjkheonHhfouk8QJAscrpHREfbjgJltWNv+KcedRt
         3pKViT89MWQX17FV4DaH8/HoHEjEAAxUIOYl1bbjpgNhu/YshJBeXOJiht0l6jvKmxTp
         VN8DG4zMboNqqzvK4ZDFqYR041QZ5K+7LuPtQUzDIx6FbmVa8kdLr0Mhn9yEUxxMIALb
         +8dB090F1KFuTqF4Ey1iwF9WdpYXg/wMJPsK5oWwE6TJf4/9lj7jx+2VOLcExGkXKjbS
         z9tQRLeDjOxzSX4G9LE/dkCMz52QKsAsYWrGfn0TP8YK3BcSQH72QuMGj5eyhbgk5OWp
         M5fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=liNHy74WUuRvCBd2unZCv7t/kBXFmKc3rqHIDS7glpo=;
        b=Zpbg6kZ+CFk1Cjb7BxbHpv9MO9ZBE77ZUJAekLJyWY9+08mzpHKrmbZNf0Hus+yA17
         3x91LA4lQW2KH3SqZCM2KGbsG3H7ZKxMR07B/hB/Y8wsh+AbOAVOfKLsV1w+COPlUgrG
         Y2B+eTkSgKzGraHK6rGsiy5XqRv1Tg2d4r56+PVzhgKcTC6QXNPk5GansA5Cjow+2Tms
         u6PDVMzOw8P5yu3IECb3isoQ0Nan5kV0h9vY4Fx6qtPqU49P6VJ+xS/EmWV1zs+gMElH
         nRCyltTO+DNQ03CR6zN8ALlWYnRr1T3b+FCaoOW9GmKF6iLFMsxzYxNyIEOdONMu6hE/
         Vwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=liNHy74WUuRvCBd2unZCv7t/kBXFmKc3rqHIDS7glpo=;
        b=bki+DD4Yd31PvNfnj2eNWPZ6VhHzgBirOVoTlFr1uCk5nC5+U9uOI8pDqUlRARkNdt
         rvQJlJhIaQPss+04Fu/u5lZxaeCIBZp6LKG3deFh4rJ4zfB6v0BMrFQfcECds5lwmlB4
         oIDtjBOxfIvYPvajGQSXJjDS3OtbIOjqfxDtuH8tIMwIkpdWRTqn/RZwuC4ls7BVr8Dp
         7l2MBZtyB/wtaAkNQwz9e8sff18fD1tIUkHZDEeKsD94lpm/F0/1502xW5AryjgcPUD/
         HjX5m+gSZbUk7Ghd69obSworELDhy8Csyk1qqDvdnZ4DldiMxCE0fotQHymrNceqk/Zl
         J/+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVQkK9FiN9PfIdeWypVAuiaxjCJLTMxZI384o3UrwFd2mz2joF9
	565hnGTOjMbp1tdkqQAXAQI=
X-Google-Smtp-Source: APXvYqxz/5xKp4uI3v6zKqEM4hZXx8eWQNo/urIrrNwt9VawdUONHBO+301Q5TWR7IrwefQoSeFCKQ==
X-Received: by 2002:a05:6830:158:: with SMTP id j24mr14038813otp.316.1581605742143;
        Thu, 13 Feb 2020 06:55:42 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:5a87:: with SMTP id w7ls157247oth.1.gmail; Thu, 13 Feb
 2020 06:55:41 -0800 (PST)
X-Received: by 2002:a9d:6c06:: with SMTP id f6mr14036206otq.318.1581605740924;
        Thu, 13 Feb 2020 06:55:40 -0800 (PST)
Date: Thu, 13 Feb 2020 06:55:40 -0800 (PST)
From: vijai kumar <vijaikumar.kanagarajan@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <acffe83e-3f47-4d29-bef5-56ce542b7208@googlegroups.com>
In-Reply-To: <1b4ffcca-2b1f-cb4d-1548-c95cd4a2772c@siemens.com>
References: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
 <20200213134430.3052-2-vijaikumar.kanagarajan@gmail.com>
 <1b4ffcca-2b1f-cb4d-1548-c95cd4a2772c@siemens.com>
Subject: Re: [PATCH 2/4] recipes-bsp: Add support for pine64-plus uboot
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2990_1864946585.1581605740432"
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

------=_Part_2990_1864946585.1581605740432
Content-Type: multipart/alternative; 
	boundary="----=_Part_2991_385401024.1581605740433"

------=_Part_2991_385401024.1581605740433
Content-Type: text/plain; charset="UTF-8"



On Thursday, February 13, 2020 at 7:47:34 PM UTC+5:30, Jan Kiszka wrote:
>
> On 13.02.20 14:44, Vijai Kumar K wrote: 
> > Add support for building pine64-plus u-boot. Use mainline u-boot + ATF. 
> > 
> > Build only the necessary envtools. u-boot tools-only build is broken 
> > upstream and hence not supported here. 
>
> Actually, there is rarely the need to use self-built tools. Those 
> provided by Debian prebuilt are generally fine. 
>
> > 
> > Signed-off-by: Vijai Kumar K <vijaikumar...@gmail.com <javascript:>> 
> > --- 
> >   recipes-bsp/u-boot/files/pine64-plus-rules    | 32 ++++++++++++++++++ 
> >   .../u-boot-pine64-plus_2019.10-atf2.2.bb      | 33 
> +++++++++++++++++++ 
> >   2 files changed, 65 insertions(+) 
> >   create mode 100644 recipes-bsp/u-boot/files/pine64-plus-rules 
> >   create mode 100644 recipes-bsp/u-boot/
> u-boot-pine64-plus_2019.10-atf2.2.bb 
> > 
> > diff --git a/recipes-bsp/u-boot/files/pine64-plus-rules 
> b/recipes-bsp/u-boot/files/pine64-plus-rules 
> > new file mode 100644 
> > index 0000000..f6340f7 
> > --- /dev/null 
> > +++ b/recipes-bsp/u-boot/files/pine64-plus-rules 
> > @@ -0,0 +1,32 @@ 
> > +#!/usr/bin/make -f 
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
> > +ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE)) 
> > +export CROSS_COMPILE=$(DEB_HOST_GNU_TYPE)- 
> > +SET_CROSS_BUILD_TOOLS=CROSS_BUILD_TOOLS=y 
> > +endif 
> > +PARALLEL_BUILD=-j $(shell echo $$(($$(nproc) * 2))) 
> > + 
> > +override_dh_auto_build: 
> > +        $(MAKE) $(PARALLEL_BUILD) -C ../arm-trusted-firmware-* 
> PLAT=sun50i_a64 bl31 
> > +        $(MAKE) $(PARALLEL_BUILD) $(U_BOOT_CONFIG) 
> > +        BL31=$$(readlink -f 
> ../arm-trusted-firmware-*/build/sun50i_a64/release/bl31.bin) \ 
> > +        $(MAKE) $(PARALLEL_BUILD) $(U_BOOT_BIN) 
> > +        $(MAKE) $(PARALLEL_BUILD) $(SET_CROSS_BUILD_TOOLS) NO_SDL=1 
> envtools 
> > + 
> > +override_dh_auto_install: 
> > +        mv tools/env/lib.a tools/env/libubootenv.a 
> > + 
> > +override_dh_auto_test: 
> > + 
> > +%: 
> > +        CFLAGS= LDFLAGS= dh $@ --parallel 
> > diff --git a/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb 
> b/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb 
> > new file mode 100644 
> > index 0000000..4842ef8 
> > --- /dev/null 
> > +++ b/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb 
> > @@ -0,0 +1,33 @@ 
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
> > +U_BOOT_PV="${@d.getVar('PV').split('-atf')[0]}" 
> > +ATF_PV="${@d.getVar('PV').split('-atf')[1]}" 
> > + 
> > +require recipes-bsp/u-boot/u-boot-custom.inc 
> > +require 
> recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc 
> > + 
> > +SRC_URI += " \ 
> > +    
> ftp://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \ 
> > +    file://pine64-plus-rules \ 
> > +    " 
> > +SRC_URI[u-boot.sha256sum] = 
> "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014" 
> > + 
> > +U_BOOT_CONFIG="pine64_plus_defconfig" 
> > +U_BOOT_BIN="u-boot-sunxi-with-spl.bin" 
> > + 
> > +BUILD_DEPENDS += ", libssl-dev, swig:native, python-dev:native" 
>
> Where do those dependencies come from? libssl-dev is understood, but the 
> others? Just curious. 
>

swig is needed for scripts/dtc/pylibfdt/ which comes as a dependency from 
binman.

python-dev is not actually needed. I might have introduced it as part of 
debugging some compilation issue.
I will check and remove it in v2.


> > + 
> > +S = "${WORKDIR}/u-boot-${U_BOOT_PV}" 
> > + 
> > +do_prepare_build_append() { 
> > +    cp ${WORKDIR}/pine64-plus-rules ${S}/debian/rules 
> > +} 
> > 
>
> Jan 
>
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE 
> Corporate Competence Center Embedded Linux 
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/acffe83e-3f47-4d29-bef5-56ce542b7208%40googlegroups.com.

------=_Part_2991_385401024.1581605740433
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thursday, February 13, 2020 at 7:47:34 PM UTC+5=
:30, Jan Kiszka wrote:<blockquote class=3D"gmail_quote" style=3D"margin: 0;=
margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 13.02=
.20 14:44, Vijai Kumar K wrote:
<br>&gt; Add support for building pine64-plus u-boot. Use mainline u-boot +=
 ATF.
<br>&gt;=20
<br>&gt; Build only the necessary envtools. u-boot tools-only build is brok=
en
<br>&gt; upstream and hence not supported here.
<br>
<br>Actually, there is rarely the need to use self-built tools. Those=20
<br>provided by Debian prebuilt are generally fine.
<br>
<br>&gt;=20
<br>&gt; Signed-off-by: Vijai Kumar K &lt;<a href=3D"javascript:" target=3D=
"_blank" gdf-obfuscated-mailto=3D"Fczp4dnhBQAJ" rel=3D"nofollow" onmousedow=
n=3D"this.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=
=3D&#39;javascript:&#39;;return true;">vijaikumar...@gmail.<wbr>com</a>&gt;
<br>&gt; ---
<br>&gt; =C2=A0 recipes-bsp/u-boot/files/<wbr>pine64-plus-rules =C2=A0 =C2=
=A0| 32 ++++++++++++++++++
<br>&gt; =C2=A0 .../<a href=3D"http://u-boot-pine64-plus_2019.10-atf2.2.bb"=
 target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://=
www.google.com/url?q\x3dhttp%3A%2F%2Fu-boot-pine64-plus_2019.10-atf2.2.bb\x=
26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNFUeWL9foWiw2QVMqpC7q186UxJOg&#39;;re=
turn true;" onclick=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp=
%3A%2F%2Fu-boot-pine64-plus_2019.10-atf2.2.bb\x26sa\x3dD\x26sntz\x3d1\x26us=
g\x3dAFQjCNFUeWL9foWiw2QVMqpC7q186UxJOg&#39;;return true;">u-boot-pine64-pl=
us_2019.<wbr>10-atf2.2.bb</a> =C2=A0 =C2=A0 =C2=A0| 33 +++++++++++++++++++
<br>&gt; =C2=A0 2 files changed, 65 insertions(+)
<br>&gt; =C2=A0 create mode 100644 recipes-bsp/u-boot/files/<wbr>pine64-plu=
s-rules
<br>&gt; =C2=A0 create mode 100644 recipes-bsp/u-boot/<a href=3D"http://u-b=
oot-pine64-plus_2019.10-atf2.2.bb" target=3D"_blank" rel=3D"nofollow" onmou=
sedown=3D"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fu-bo=
ot-pine64-plus_2019.10-atf2.2.bb\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNFU=
eWL9foWiw2QVMqpC7q186UxJOg&#39;;return true;" onclick=3D"this.href=3D&#39;h=
ttp://www.google.com/url?q\x3dhttp%3A%2F%2Fu-boot-pine64-plus_2019.10-atf2.=
2.bb\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNFUeWL9foWiw2QVMqpC7q186UxJOg&#=
39;;return true;">u-boot-<wbr>pine64-plus_2019.10-atf2.2.bb</a>
<br>&gt;=20
<br>&gt; diff --git a/recipes-bsp/u-boot/files/<wbr>pine64-plus-rules b/rec=
ipes-bsp/u-boot/files/<wbr>pine64-plus-rules
<br>&gt; new file mode 100644
<br>&gt; index 0000000..f6340f7
<br>&gt; --- /dev/null
<br>&gt; +++ b/recipes-bsp/u-boot/files/<wbr>pine64-plus-rules
<br>&gt; @@ -0,0 +1,32 @@
<br>&gt; +#!/usr/bin/make -f
<br>&gt; +#
<br>&gt; +# Jailhouse, a Linux-based partitioning hypervisor
<br>&gt; +#
<br>&gt; +# Copyright (c) Vijai Kumar K, 2020
<br>&gt; +#
<br>&gt; +# Authors:
<br>&gt; +# =C2=A0Vijai Kumar K &lt;<a href=3D"javascript:" target=3D"_blan=
k" gdf-obfuscated-mailto=3D"Fczp4dnhBQAJ" rel=3D"nofollow" onmousedown=3D"t=
his.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;=
javascript:&#39;;return true;">vijaikumar...@gmail.<wbr>com</a>&gt;
<br>&gt; +#
<br>&gt; +# SPDX-License-Identifier: MIT
<br>&gt; +#
<br>&gt; +
<br>&gt; +ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_<wbr>HOST_GNU_TYPE))
<br>&gt; +export CROSS_COMPILE=3D$(DEB_HOST_GNU_<wbr>TYPE)-
<br>&gt; +SET_CROSS_BUILD_TOOLS=3DCROSS_<wbr>BUILD_TOOLS=3Dy
<br>&gt; +endif
<br>&gt; +PARALLEL_BUILD=3D-j $(shell echo $$(($$(nproc) * 2)))
<br>&gt; +
<br>&gt; +override_dh_auto_build:
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(MAKE) $(PARALLE=
L_BUILD) -C ../arm-trusted-firmware-* PLAT=3Dsun50i_a64 bl31
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(MAKE) $(PARALLE=
L_BUILD) $(U_BOOT_CONFIG)
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BL31=3D$$(readlin=
k -f ../arm-trusted-firmware-*/<wbr>build/sun50i_a64/release/bl31.<wbr>bin)=
 \
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(MAKE) $(PARALLE=
L_BUILD) $(U_BOOT_BIN)
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(MAKE) $(PARALLE=
L_BUILD) $(SET_CROSS_BUILD_TOOLS) NO_SDL=3D1 envtools
<br>&gt; +
<br>&gt; +override_dh_auto_install:
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mv tools/env/lib.=
a tools/env/libubootenv.a
<br>&gt; +
<br>&gt; +override_dh_auto_test:
<br>&gt; +
<br>&gt; +%:
<br>&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CFLAGS=3D LDFLAGS=
=3D dh $@ --parallel
<br>&gt; diff --git a/recipes-bsp/u-boot/<a href=3D"http://u-boot-pine64-pl=
us_2019.10-atf2.2.bb" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"thi=
s.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fu-boot-pine64-plu=
s_2019.10-atf2.2.bb\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNFUeWL9foWiw2QVM=
qpC7q186UxJOg&#39;;return true;" onclick=3D"this.href=3D&#39;http://www.goo=
gle.com/url?q\x3dhttp%3A%2F%2Fu-boot-pine64-plus_2019.10-atf2.2.bb\x26sa\x3=
dD\x26sntz\x3d1\x26usg\x3dAFQjCNFUeWL9foWiw2QVMqpC7q186UxJOg&#39;;return tr=
ue;">u-boot-<wbr>pine64-plus_2019.10-atf2.2.bb</a> b/recipes-bsp/u-boot/<a =
href=3D"http://u-boot-pine64-plus_2019.10-atf2.2.bb" target=3D"_blank" rel=
=3D"nofollow" onmousedown=3D"this.href=3D&#39;http://www.google.com/url?q\x=
3dhttp%3A%2F%2Fu-boot-pine64-plus_2019.10-atf2.2.bb\x26sa\x3dD\x26sntz\x3d1=
\x26usg\x3dAFQjCNFUeWL9foWiw2QVMqpC7q186UxJOg&#39;;return true;" onclick=3D=
"this.href=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fu-boot-pine64=
-plus_2019.10-atf2.2.bb\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNFUeWL9foWiw=
2QVMqpC7q186UxJOg&#39;;return true;">u-boot-<wbr>pine64-plus_2019.10-atf2.2=
.bb</a>
<br>&gt; new file mode 100644
<br>&gt; index 0000000..4842ef8
<br>&gt; --- /dev/null
<br>&gt; +++ b/recipes-bsp/u-boot/<a href=3D"http://u-boot-pine64-plus_2019=
.10-atf2.2.bb" target=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=
=3D&#39;http://www.google.com/url?q\x3dhttp%3A%2F%2Fu-boot-pine64-plus_2019=
.10-atf2.2.bb\x26sa\x3dD\x26sntz\x3d1\x26usg\x3dAFQjCNFUeWL9foWiw2QVMqpC7q1=
86UxJOg&#39;;return true;" onclick=3D"this.href=3D&#39;http://www.google.co=
m/url?q\x3dhttp%3A%2F%2Fu-boot-pine64-plus_2019.10-atf2.2.bb\x26sa\x3dD\x26=
sntz\x3d1\x26usg\x3dAFQjCNFUeWL9foWiw2QVMqpC7q186UxJOg&#39;;return true;">u=
-boot-<wbr>pine64-plus_2019.10-atf2.2.bb</a>
<br>&gt; @@ -0,0 +1,33 @@
<br>&gt; +#
<br>&gt; +# Jailhouse, a Linux-based partitioning hypervisor
<br>&gt; +#
<br>&gt; +# Copyright (c) Vijai Kumar K, 2020
<br>&gt; +#
<br>&gt; +# Authors:
<br>&gt; +# =C2=A0Vijai Kumar K &lt;<a href=3D"javascript:" target=3D"_blan=
k" gdf-obfuscated-mailto=3D"Fczp4dnhBQAJ" rel=3D"nofollow" onmousedown=3D"t=
his.href=3D&#39;javascript:&#39;;return true;" onclick=3D"this.href=3D&#39;=
javascript:&#39;;return true;">vijaikumar...@gmail.<wbr>com</a>&gt;
<br>&gt; +#
<br>&gt; +# SPDX-License-Identifier: MIT
<br>&gt; +#
<br>&gt; +
<br>&gt; +U_BOOT_PV=3D&quot;${@d.getVar(&#39;PV&#39;).<wbr>split(&#39;-atf&=
#39;)[0]}&quot;
<br>&gt; +ATF_PV=3D&quot;${@d.getVar(&#39;PV&#39;).<wbr>split(&#39;-atf&#39=
;)[1]}&quot;
<br>&gt; +
<br>&gt; +require recipes-bsp/u-boot/u-boot-<wbr>custom.inc
<br>&gt; +require recipes-bsp/arm-trusted-<wbr>firmware/arm-trusted-firmwar=
e_<wbr>${ATF_PV}.inc
<br>&gt; +
<br>&gt; +SRC_URI +=3D &quot; \
<br>&gt; + =C2=A0 =C2=A0<a href=3D"ftp://ftp.denx.de/pub/u-boot/u-boot-$%7B=
U_BOOT_PV%7D.tar.bz2;name=3Du-boot" target=3D"_blank" rel=3D"nofollow" onmo=
usedown=3D"this.href=3D&#39;ftp://ftp.denx.de/pub/u-boot/u-boot-$%7BU_BOOT_=
PV%7D.tar.bz2;name\x3du-boot&#39;;return true;" onclick=3D"this.href=3D&#39=
;ftp://ftp.denx.de/pub/u-boot/u-boot-$%7BU_BOOT_PV%7D.tar.bz2;name\x3du-boo=
t&#39;;return true;">ftp://ftp.denx.de/pub/u-boot/<wbr>u-boot-${U_BOOT_PV}.=
tar.bz2;<wbr>name=3Du-boot</a> \
<br>&gt; + =C2=A0 =C2=A0file://pine64-plus-rules \
<br>&gt; + =C2=A0 =C2=A0&quot;
<br>&gt; +SRC_URI[u-boot.sha256sum] =3D &quot;<wbr>8d6d6070739522dd236cba70=
55b873<wbr>6bfe92b4fac0ea18ad809829ca7966<wbr>7014&quot;
<br>&gt; +
<br>&gt; +U_BOOT_CONFIG=3D&quot;pine64_plus_<wbr>defconfig&quot;
<br>&gt; +U_BOOT_BIN=3D&quot;u-boot-sunxi-<wbr>with-spl.bin&quot;
<br>&gt; +
<br>&gt; +BUILD_DEPENDS +=3D &quot;, libssl-dev, swig:native, python-dev:na=
tive&quot;
<br>
<br>Where do those dependencies come from? libssl-dev is understood, but th=
e=20
<br>others? Just curious.
<br></blockquote><div><br></div><div>swig is needed for scripts/dtc/pylibfd=
t/ which comes as a dependency from binman.</div><div><br></div><div>python=
-dev is not actually needed. I might have introduced it as part of debuggin=
g some compilation issue.</div><div>I will check and remove it in v2.</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-=
left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">
<br>&gt; +
<br>&gt; +S =3D &quot;${WORKDIR}/u-boot-${U_BOOT_<wbr>PV}&quot;
<br>&gt; +
<br>&gt; +do_prepare_build_append() {
<br>&gt; + =C2=A0 =C2=A0cp ${WORKDIR}/pine64-plus-rules ${S}/debian/rules
<br>&gt; +}
<br>&gt;=20
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
om/d/msgid/jailhouse-dev/acffe83e-3f47-4d29-bef5-56ce542b7208%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/acffe83e-3f47-4d29-bef5-56ce542b7208%40googlegroups.com<=
/a>.<br />

------=_Part_2991_385401024.1581605740433--

------=_Part_2990_1864946585.1581605740432--
