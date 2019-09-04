Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBKXVX3VQKGQEUJCYIWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE9CA83B0
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 15:22:56 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id a2sf11927037wrs.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 06:22:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567603371; cv=pass;
        d=google.com; s=arc-20160816;
        b=jNeW9lZgZ9CxH5Sp5qhHsVYREfKLuACW0/BV/CM1GOjahLVDZ1HkHtENnr38qD9Fc8
         B2XT8/rrY/lGTmd4QjJgFWE3g9kjkWlbU/uJVbBBN0G08QYjXWhwgAWxRnW3Rf8F8/H7
         aTPZk6ap2ApHA+CUtX4SLBwtq6jrFoxzj7rYCo5Vu93M6I+zbhTOlYn0aePUFOC1YxjJ
         VzJP/gs7Zgu/m9j3Qc52+/5wLspcqndU0eb3Xk/PSO5JCHocWY5Vlf4WV75c/AikJdBQ
         maZ1vAYpQ87x/qPfYD5N5259NNyQxek7aocfd5GtOvN7vlrslB3uZ093r4eo4TsPVV8g
         YLhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=/doEiQ+ho+m4LkTRB8wuClMr+weYQ2vgf4z5CAJodgY=;
        b=Qrp3K6njXTCdHZ++gUdLhu4SklwmfYGPCAMSue6D4QXkKv67etWIHW5Y441m+pPc8w
         sFiWeZDmFGnM/f5s3D5zHQF3sxtxppC93/fXaGb9W/uj4qOkBMFdyRQy3olmS9OuyOb3
         idMLCbZFpjNPSRCzjuMMTfxFUBVmFsoqUNn/HxvZFgJ1p9Fj3L3mLBu7J/iFjR1qgf+e
         bk9/qi/b1dZfMJDcPkB6GYyTv8KhozQV1NHjtElVPgg//0xSsL3Tge3R6DY8aFTUME8C
         NyvYtnnPf3NDSQnFSr8WIs1L6zKApjcrsKPVz5qwI5cR1lpMCbyGjK+hLdKZvxEVwH1r
         eKZA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/doEiQ+ho+m4LkTRB8wuClMr+weYQ2vgf4z5CAJodgY=;
        b=Ls/k5OmO51U/iduV5vaDZtSw7eWtW1XlvmouTzcl5jj3OI2AV+FLHe2nuQ1JkFkcFJ
         /xrJFrC3obU6xRyiXbizsGoUTXHoalzQJ3O/ljDR9Ccp2oVf9HLtWY2xsA55K86L6ddM
         t0uaI/uEQl2fc7jIK6/Opihqorb1AplwekIHKQac8Tebu1Xy8JFhE1uhLIQ/kf2YiEr1
         7K4M947GpMAz/o0XfCMueUzmuNaBMovRxsxDfu0pdGCEuvoBcC47qGJemxMCkDAZDuPU
         h1o6LMdI9wmIF14oh4chHgBQe7hVmZVGwlnZX9fT3a7F2ryN66d9e6JFYPNzEckvp072
         SPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/doEiQ+ho+m4LkTRB8wuClMr+weYQ2vgf4z5CAJodgY=;
        b=D8JXTAlAATRs0io8xQLhqYUl1IsDI+hXZptOwYHzzHQm29/rfLX0ZPH+lnZ2NBPBKn
         1sHCCaHXAww4M1hf7zTBrsb6FdQpJJzv5pbJKz1rUBc0MCGt7DeWudIfYu9PWmCE3krr
         o82a43vZe8fKm6blNgKxTfUmA2XmRwKu0pemLL2rF6xYUNHbvKlcJwn1Zkv6+NiJwr6E
         BrT8NhoP/OrEnPgkcwYS5PWZWkjL3rxiISrcEMt6+PEO76UOKu3+mqZwDS1U9EidNVlA
         yf3oOcTnUlpFolaykoHQmuQ5+I9XL9rLcAT0yUHYEFSk/yYQBVPQCCSsqWXl1QZOED1Q
         cEHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV7LbbQxbeUV0ZJP6W5P+0rXn3BedzJdnxWwROyHUM1v+/iKJnt
	IDENMRPnkqekXVJXNjCyP0o=
X-Google-Smtp-Source: APXvYqxjs3VtrulmabYzuDYwLtfjZWRL8EmXA6TbAwlX9zlRkliyDTkbEM1JN6aZYpA++pUl7zSjfA==
X-Received: by 2002:a7b:c922:: with SMTP id h2mr4546124wml.63.1567603371316;
        Wed, 04 Sep 2019 06:22:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c141:: with SMTP id z1ls1187345wmi.5.gmail; Wed, 04 Sep
 2019 06:22:50 -0700 (PDT)
X-Received: by 2002:a1c:c78f:: with SMTP id x137mr4734746wmf.42.1567603370587;
        Wed, 04 Sep 2019 06:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567603370; cv=none;
        d=google.com; s=arc-20160816;
        b=CWnIOIhTchf+NLGdFMhzcohbRC/V1bZyMvzmnfSZR6I5XzBwCYIV/kRrbPdvGyRTea
         hNjx3uocd7IXPoeg5BjnF59OXds65aqn+JYU+5B0vyMBEBsz7lCv1iRJaCkGHGMlXWSH
         PHw/S42yYyU4yGBj24TVbP5aP7KC9693pIoyFJkA/AzrT8EK9BjYw58O+scrnprfnCYf
         vhLH6RQtWygqe5XQ1OFVEUYtKgd4YZQt31EEHt93hADb/oYaQme1FRzCjcIPnZ8H+zT8
         deQSCSpAs12bm6ZZujd2EzhPuQea+xCG+nSCmxUn2EoaxCB1uflxkavY6VUYITqxRAVF
         AKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=dKfhRY6W4QhAiuhYSQF57ACJYwnybsEbulZJbwP2eds=;
        b=NdmZxURVQqne+Ad3cE6if8zT18pVWqPYSss+geCrI2uk63/5kAhTXp3K5CtivKl5RR
         ja3cx587zb8bF859At2ur4jJBh4AhHp/MddO9N4ZjSThT6EBmEji8WKDg0keqt5wdLX0
         ZqIYUImFCzL+EJhiEy3at1MUmDf05JqLPCbu9MAj6VH29oDHu+8XeD7GMmCHQO9B6JUe
         +zVGUuHbclJTd47TB2It+ff545Y0+29qm3AFf7JxC4EL3itpKPrDbjcmcUsQKY6rSfBv
         u6EBKdr5yK7atSAtZIs9rHJc/L4Ky3hqEeoTiJWYU0gp9ofRkTT14IZ7QacsIEv55cMB
         0o0w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k13si1315583wrv.0.2019.09.04.06.22.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 06:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x84DMo4s019117
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 4 Sep 2019 15:22:50 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.141])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x84DMolW009815;
	Wed, 4 Sep 2019 15:22:50 +0200
Date: Wed, 4 Sep 2019 15:22:49 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: <jailhouse-dev@googlegroups.com>
Subject: Re: [jh-images][PATCH 05/13] Add recipe for building ZynqMP PMU
 firmware
Message-ID: <20190904152249.14086fef@md1za8fc.ad001.siemens.net>
In-Reply-To: <dc7ca516-1fa3-d1ed-f38a-60d9d601ae90@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
	<1b82afa10f1cab52959999c5fba4cf0235a5614b.1567490365.git.jan.kiszka@siemens.com>
	<20190904111724.1f8e2b9d@md1za8fc.ad001.siemens.net>
	<dc7ca516-1fa3-d1ed-f38a-60d9d601ae90@siemens.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
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

Am Wed, 4 Sep 2019 13:40:34 +0200
schrieb Jan Kiszka <jan.kiszka@siemens.com>:

> On 04.09.19 11:17, Henning Schild wrote:
> > Am Tue, 3 Sep 2019 07:59:17 +0200
> > schrieb "[ext] Jan Kiszka" <jan.kiszka@siemens.com>:
> >   
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>
> >> Will replace the old binary package so far used for the Ultra96.
> >>
> >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >> ---
> >>   recipes-bsp/zynqmp-pmufw/files/debian/compat       |  1 +
> >>   recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl | 10 ++++++++
> >>   recipes-bsp/zynqmp-pmufw/files/debian/rules        | 24
> >> +++++++++++++++++ recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
> >> | 30 ++++++++++++++++++++++ 4 files changed, 65 insertions(+)
> >>   create mode 100644 recipes-bsp/zynqmp-pmufw/files/debian/compat
> >>   create mode 100644
> >> recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl create mode
> >> 100755 recipes-bsp/zynqmp-pmufw/files/debian/rules create mode
> >> 100644 recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
> >>
> >> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/compat
> >> b/recipes-bsp/zynqmp-pmufw/files/debian/compat new file mode 100644
> >> index 0000000..ec63514
> >> --- /dev/null
> >> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/compat
> >> @@ -0,0 +1 @@
> >> +9
> >> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
> >> b/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl new file mode
> >> 100644 index 0000000..4d14702
> >> --- /dev/null
> >> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
> >> @@ -0,0 +1,10 @@
> >> +Source: ${PN}
> >> +Section: misc
> >> +Priority: optional
> >> +Standards-Version: 3.9.6
> >> +Build-Depends: crosstool-ng-microblaze:native
> >> +Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
> >> +
> >> +Package: ${PN}
> >> +Architecture: all
> >> +Description: ${DESCRIPTION}
> >> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/rules
> >> b/recipes-bsp/zynqmp-pmufw/files/debian/rules new file mode 100755
> >> index 0000000..e86f7a3
> >> --- /dev/null
> >> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/rules
> >> @@ -0,0 +1,24 @@
> >> +#!/usr/bin/make -f
> >> +#
> >> +# Jailhouse, a Linux-based partitioning hypervisor
> >> +#
> >> +# Copyright (c) Siemens AG, 2019
> >> +#
> >> +# Authors:
> >> +#  Jan Kiszka <jan.kiszka@siemens.com>
> >> +#
> >> +# SPDX-License-Identifier: MIT
> >> +#
> >> +
> >> +DPKG_EXPORT_BUILDFLAGS = 1
> >> +include /usr/share/dpkg/default.mk
> >> +
> >> +override_dh_auto_build:
> >> +	$(MAKE) -C lib/sw_apps/zynqmp_pmufw/src
> >> +
> >> +override_dh_auto_install:
> >> +	dh_install lib/sw_apps/zynqmp_pmufw/src/executable.elf \
> >> +		usr/share/zynqmp-pmufw/
> >> +
> >> +%:
> >> +	dh $@ --parallel
> >> diff --git a/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
> >> b/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb new file mode
> >> 100644 index 0000000..ff9f05e
> >> --- /dev/null
> >> +++ b/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
> >> @@ -0,0 +1,30 @@
> >> +#
> >> +# Jailhouse, a Linux-based partitioning hypervisor
> >> +#
> >> +# Copyright (c) Siemens AG, 2019
> >> +#
> >> +# Authors:
> >> +#  Jan Kiszka <jan.kiszka@siemens.com>
> >> +#
> >> +# SPDX-License-Identifier: MIT
> >> +#
> >> +
> >> +inherit dpkg
> >> +
> >> +DESCRIPTION = "ZynqMP PMU Firmware"
> >> +
> >> +SRC_URI = " \
> >> +
> >> https://github.com/Xilinx/embeddedsw/archive/xilinx-v${PV}.tar.gz \
> >> +    file://debian/"
> >> +SRC_URI[sha256sum] =
> >> "0b36721d62f970b1873fd337e94ee13304500ecec1dd5dbfc4f0ed952e55cf5f"
> >> + +DEPENDS = "crosstool-ng-microblaze"
> >> +
> >> +TEMPLATE_FILES = "debian/control.tmpl"
> >> +
> >> +S = "${WORKDIR}/embeddedsw-xilinx-v${PV}"
> >> +
> >> +do_prepare_build() {
> >> +    cp -r ${WORKDIR}/debian ${S}
> >> +    deb_add_changelog  
> > 
> > Why not use the whole debianization? It supports custom pre-existing
> > files, and if there are gaps we could improve it in isar.  
> 
> deb_debianize is still somehow in the stage of "for insiders only".
> Add a proper upstream test case, document the API, and we can move
> forward with it.

I know that, but you are using deb_add_changelog which is a subset of
it. So no reason, except for you did not yet look into it?

Henning

> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190904152249.14086fef%40md1za8fc.ad001.siemens.net.
