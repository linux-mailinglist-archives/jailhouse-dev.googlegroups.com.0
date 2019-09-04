Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBJUCX3VQKGQEFHOAQII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 273FDA7F15
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 11:17:27 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id k67sf870017wmf.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 02:17:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567588646; cv=pass;
        d=google.com; s=arc-20160816;
        b=spZv0MURHplXyHKP+bwqNuINuJOZVByw9K6ksLhf1C3KJ7r5lz3X/XPjCq1/VAseRe
         CSPyPLfbFZxRvC2RCSKdqFrU8PmbZahbvOCU1LVQJMYJfgeBgp29FpS9VcHez1wrJkKr
         +77hRFOsKw9H0hZf0QmlijOBvqY1VOCFJEv33U64tNKkEPYHQV/in9C+kF49UIETRYl6
         ebX+BOY4TRa7AyuX7feVeKK+4U+T+BQBoGJBufe2BehXowi2xht1QDd5zWFkdW+7X3UL
         +1z40aXbccvNpXrSFDqNEn82HhOUcD4Fl0qRnjLYoMgM1P4fI7cvikgyAGK2yGQfV6xO
         ZsRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=bXYQym85CkEHuG+/Di742D/Dv+dJcRLNemnn6eu41OE=;
        b=ihYfCpQyf1u3/KghnAUMivR98BMXfhr4Q5EgPHwyseBX2NAl8OG7reh4YHJUpDigOz
         tsSpf6zo+y2ONWXxAHGSifzgrbrp+hkfbluIUlTkzJ+RXUDAHvd+pzOlko+hln6/9QVD
         PggUUnpTVNZoLvnM/Q1Sz00Wj3cG4udb+ZdXQlRQ7+RCvawzQj6PgyEtWqix6wnhOmjs
         Vscr9YuNg4Zf0CQQkHPFssRvBpP/eQ6Xv37WuIpDWtue7V9+6ow2D+qS97hpa82jrUtK
         H8TU49Ufo8iCy1/LXMedBAm4w+PcNZc1AjDUvmV27RyEJlR4zdktwJoMKdDz2PMDa0Px
         Q3SA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bXYQym85CkEHuG+/Di742D/Dv+dJcRLNemnn6eu41OE=;
        b=QtmOgjrc9YC4FRhhnMTAUKMEhskc/RkPmjuH6Pk1aRHlBcmDdfN7wis0lPrnEyfV4T
         wgAatMYAsxJxIsCYyhPKTwcECO0WqUh1vFEQlU02V/uikXsj0PRiA4mIJPIMOiiHSgK+
         kwnAqWFzLNoKUpxPtJmh7kW1SUPRnUgamrg085hPXkzwUbRYPr5zPeT7hC481Tz5AGaV
         HOdIH0qw/EfSHFzpmwMQCLgNmw17xq6oVBK0dlYRrU2pfyRObwmZ1SgN4ufngE3i9mNx
         EwZhpOr08lguU5NW/ZT+fYQ5ScDLNIzioGOYz55DFPeayDarGPppedqtWWXJGtQxbGN+
         Ubcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bXYQym85CkEHuG+/Di742D/Dv+dJcRLNemnn6eu41OE=;
        b=J4Pju3RXzZ0YNheRutAiqjK18qrkIXZMq4dWTV68NAJAbNtFDhgS4dNJMeNe4yL7ok
         zI4+i7ZBjvZk24GAragbVKCiYBIMMfcq5RhH3OPiZnuvofG8EYZ5zIXOa3NXeWyFtySX
         cwvB2yQlkLYTeuccVd2idYNGYSirgUmeUWO+wOb20I9O9jySBn4EfGtVcVF7RXwnsT9h
         9iBx3McRp5qrdk5qk4OOpn91Ik6iE07rBLLFzWG0Q/oY42BXMVDzktMxWO+VhhKeycC+
         Qfw6aAO7Tsvyf6pLa+BaW07B19n7vC4Bpnd4VKzJq68sxD6zSyCPUuGbLKfnpHthKdQ2
         MVkw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX88gMnPvXLRkVdRTAfQY6PWFqJMgCSbix+U7u2Rj+wUS6+S+NB
	U6SZEFzcrrHbQDJ6Ur3ADk4=
X-Google-Smtp-Source: APXvYqz7NnlCmkZk10ewPPUihSPSZ98f6jKQDj2JiWasGWeouqT2urr+BjGJw35CvaQC8eF1TAEHXw==
X-Received: by 2002:a5d:4985:: with SMTP id r5mr6220082wrq.71.1567588646822;
        Wed, 04 Sep 2019 02:17:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a745:: with SMTP id e5ls5725457wrd.5.gmail; Wed, 04 Sep
 2019 02:17:26 -0700 (PDT)
X-Received: by 2002:adf:dec2:: with SMTP id i2mr4028265wrn.92.1567588646368;
        Wed, 04 Sep 2019 02:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567588646; cv=none;
        d=google.com; s=arc-20160816;
        b=XQCN+grFwr+FKCZRSjIR0dGm5zy/wVSEwh3ITuDMGiSx4lbrUB5OTG/tj2I8Bda7LK
         /sOIeGyKOpmwW46RnpaAVWYk/dtMLJzGq2NShG9IiYmcZJew57vceh6JWH3E8FpMRS0H
         Hv2ZJH1SI+TPSdDOSzq0PbfQZmUAzl7rgoNzCBW0AjitT3wLeMe1Hm/oh4Dne1wvVjbq
         hHog/ldts8wSTSg3i0bJVOAlETQOxF/qY2JwpiPnwmIINWnfh+GqDooCnBHNrb3Rwtsg
         dbrjDhEiluu9YxhAvcT3kd9m9fDZPjHCjhAh88na5hRNV0Dc73Qniw88LZm9Y9ahcF5/
         ywJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=Q4FVl/E+Z6n8ik0MFrPMI7d/L/roaZ+PR9AvZNxCaBc=;
        b=zP7UneHj/rgX1GyCZuUEFK/CKtAaGBaTN/YjLoaANGIPPhLXvpGoaGfnXuDSimNRoW
         YB4aKASE6G/raz7PxLa08NWVpeJClSR9uxg8bMpMjDPC99UHgp/ssVwEydD7Ez6xObov
         xldUtN+f8XHp+URyo6zzfy8eVTs8bh8wftWYJn3RIL5RVY+PHn5M97LkexVMXosMO0nP
         Vt1J8sXigJQ77ivOCAzhQqd6+nrIHS9YDmmoyi8Hz8xB1wQWgRIWfNaVYLZ54G3isgfh
         1gQVcG4/Ye5mgCYy9wffgdArosXTmPUqMcd2cbDOmdA+Kbst6I/DDsxt8UtvigYLYqUF
         Bs3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id r1si646895wrp.3.2019.09.04.02.17.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 02:17:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x849HPtg028206
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 4 Sep 2019 11:17:26 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.141])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x849HPgJ012478;
	Wed, 4 Sep 2019 11:17:25 +0200
Date: Wed, 4 Sep 2019 11:17:24 +0200
From: Henning Schild <henning.schild@siemens.com>
To: "[ext] Jan Kiszka" <jan.kiszka@siemens.com>
Cc: <jailhouse-dev@googlegroups.com>
Subject: Re: [jh-images][PATCH 05/13] Add recipe for building ZynqMP PMU
 firmware
Message-ID: <20190904111724.1f8e2b9d@md1za8fc.ad001.siemens.net>
In-Reply-To: <1b82afa10f1cab52959999c5fba4cf0235a5614b.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
	<1b82afa10f1cab52959999c5fba4cf0235a5614b.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Am Tue, 3 Sep 2019 07:59:17 +0200
schrieb "[ext] Jan Kiszka" <jan.kiszka@siemens.com>:

> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Will replace the old binary package so far used for the Ultra96.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  recipes-bsp/zynqmp-pmufw/files/debian/compat       |  1 +
>  recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl | 10 ++++++++
>  recipes-bsp/zynqmp-pmufw/files/debian/rules        | 24
> +++++++++++++++++ recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
> | 30 ++++++++++++++++++++++ 4 files changed, 65 insertions(+)
>  create mode 100644 recipes-bsp/zynqmp-pmufw/files/debian/compat
>  create mode 100644 recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
>  create mode 100755 recipes-bsp/zynqmp-pmufw/files/debian/rules
>  create mode 100644 recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
> 
> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/compat
> b/recipes-bsp/zynqmp-pmufw/files/debian/compat new file mode 100644
> index 0000000..ec63514
> --- /dev/null
> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/compat
> @@ -0,0 +1 @@
> +9
> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
> b/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl new file mode
> 100644 index 0000000..4d14702
> --- /dev/null
> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
> @@ -0,0 +1,10 @@
> +Source: ${PN}
> +Section: misc
> +Priority: optional
> +Standards-Version: 3.9.6
> +Build-Depends: crosstool-ng-microblaze:native
> +Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
> +
> +Package: ${PN}
> +Architecture: all
> +Description: ${DESCRIPTION}
> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/rules
> b/recipes-bsp/zynqmp-pmufw/files/debian/rules new file mode 100755
> index 0000000..e86f7a3
> --- /dev/null
> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/rules
> @@ -0,0 +1,24 @@
> +#!/usr/bin/make -f
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Siemens AG, 2019
> +#
> +# Authors:
> +#  Jan Kiszka <jan.kiszka@siemens.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +DPKG_EXPORT_BUILDFLAGS = 1
> +include /usr/share/dpkg/default.mk
> +
> +override_dh_auto_build:
> +	$(MAKE) -C lib/sw_apps/zynqmp_pmufw/src
> +
> +override_dh_auto_install:
> +	dh_install lib/sw_apps/zynqmp_pmufw/src/executable.elf \
> +		usr/share/zynqmp-pmufw/
> +
> +%:
> +	dh $@ --parallel
> diff --git a/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
> b/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb new file mode 100644
> index 0000000..ff9f05e
> --- /dev/null
> +++ b/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
> @@ -0,0 +1,30 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Siemens AG, 2019
> +#
> +# Authors:
> +#  Jan Kiszka <jan.kiszka@siemens.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +inherit dpkg
> +
> +DESCRIPTION = "ZynqMP PMU Firmware"
> +
> +SRC_URI = " \
> +
> https://github.com/Xilinx/embeddedsw/archive/xilinx-v${PV}.tar.gz \
> +    file://debian/"
> +SRC_URI[sha256sum] =
> "0b36721d62f970b1873fd337e94ee13304500ecec1dd5dbfc4f0ed952e55cf5f" +
> +DEPENDS = "crosstool-ng-microblaze"
> +
> +TEMPLATE_FILES = "debian/control.tmpl"
> +
> +S = "${WORKDIR}/embeddedsw-xilinx-v${PV}"
> +
> +do_prepare_build() {
> +    cp -r ${WORKDIR}/debian ${S}
> +    deb_add_changelog

Why not use the whole debianization? It supports custom pre-existing
files, and if there are gaps we could improve it in isar.

Henning

> +}

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190904111724.1f8e2b9d%40md1za8fc.ad001.siemens.net.
