Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBKVBYPVQKGQEQTIMDBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E69FA9DCB
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Sep 2019 11:08:59 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id x1sf695638wrn.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Sep 2019 02:08:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567674539; cv=pass;
        d=google.com; s=arc-20160816;
        b=pACXkXWy009fvaqFT7ShETOZVngtkA5yAVGMN4hyZ+3N2Lcz+3XMZZjoxdffEklBrm
         DT5jIUlOU0X1N56tmcgVS9AopNRpUU117i24cYHkhOeeKL5+LGr0hbZ6yO6CSCBFilYa
         JJmR62fssoRw/uuCBJAEn30b1vfltx5ugtP+ywKdLMIhyVLWh77l6VcBLFeNKHV+Kl6A
         pS12t/N4K2y4h249YMTnvh1b64Z6OUblDKwqjOb3blzBFdVTu73q9Clz89LbpiQRwaR0
         /Fnk9agLvAGhDrFZePD4GzdfihlvA3Qb9+IxA72Hfi6x58CpdZcNS16MlnGI8gGHIcu9
         MpMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=y5cKx6TFwD4LJHdgkVErHf9Aq1bAdE4Crqavl0Cs5kc=;
        b=WCvuTUoOM6e6ByrNVxC1Blk2wK12lOTp2/dubV82peH68TMawlsVW7IY1XUDJT4el/
         w0OH4y5VApdZE4oyRLri2StlZiMg97fd8XwSdiUB7/l+G+f/9x8cfebFQqL4GvUnoSPQ
         P4vOcakYVBTRRDnptg5oGgEOZ32He1FCtHsMkFIh++qlKyhx0LS6qt6fAribCAt+ODgK
         yR5zCfl1ucVP7sJACB1kdrZTX9TTi21B0fgF/3qzJvDj7nsZA0Z7Oa8+SYO3q/7e/tDH
         5V5OOjhB+poCoh+eDATGQKZBtuVfJGAEKdeeInIuz1sfV9JQvNMG6YsHDYQrziotIStT
         kSlQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=y5cKx6TFwD4LJHdgkVErHf9Aq1bAdE4Crqavl0Cs5kc=;
        b=HnZGUei/9hAvjuiscEzs4MohtYU7gvYoqmgQwTCw3un32bhQ+PznIkvJAEa5iEoeC2
         0kV5pLqFSgDbE8yBQaQvhurAnRcN3TsOh605Yh5wmYY1pONU+OoLp5sTd9JMPYIyBPMl
         xSeFotleStuAGIVnryaA9EBkjJL+fQpQatV8flN4pePCWPpoOPx2WRVoQy/yyTGYWY2y
         cJsmIgjeb13YnyCVlCpuByJln2kGzFxHI3AnyfZK5yUhoK7XbvkvfwLsreDhbNYKsTvT
         XFOvInf1gSCI5io3mfc5/zutW+c5+9jQE3wEG6LA4K+1zIqWQetXb84p5qzBvrMlW7bM
         rPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=y5cKx6TFwD4LJHdgkVErHf9Aq1bAdE4Crqavl0Cs5kc=;
        b=RsbPxXiBpehQH3/MWLLW2Dsg7Pb7su1U9qswMw35/J84VUwCJ3ejK1IKye1ml9/8Cb
         kByLZ9VH/7c8vAcIgwEwubxi0TBgOtvWiJZy2sBl74CC6dbWzWxL26wv2oV6Q4ut1OcI
         q3YB5XHZ/3eQS0M6MojQ1pIV7NVQICA2fASd9uhwPsQxN1PZYAHuZWDdweMOz0VlmJt5
         rY4UE3Rc/M/mhpAvWu25tDj/xju0NYbuflweVmtmCGmkymz3oy+DWuFLnaaTvXl3ouEL
         6cIrPiJajq98g7n1OkjqBJG8789at+f0ngxHPQgkR4U4uve8Tl4jQLhThPqB3kSDiLJy
         Qf6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVBj/QJwg6vmr0OjR3nk5kwyPUZ3W9HpaOFsyQGA/cPUB2BP+rR
	Rlh3RRYhxqkudQOE280u2OQ=
X-Google-Smtp-Source: APXvYqy2PltgyQzmJ27W/Zwr1ZCsLG9XttJwUXph1cu5AvNV3YDK9E1v4uPL4cfouTWkoEOzzVM4KQ==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr150303wrq.332.1567674538956;
        Thu, 05 Sep 2019 02:08:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f907:: with SMTP id x7ls550476wmh.3.canary-gmail; Thu,
 05 Sep 2019 02:08:58 -0700 (PDT)
X-Received: by 2002:a1c:7611:: with SMTP id r17mr2039757wmc.117.1567674538097;
        Thu, 05 Sep 2019 02:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567674538; cv=none;
        d=google.com; s=arc-20160816;
        b=Ri2BkGYY1CPjfJJ1F9+4CAdMzTvL1VhRqLOf9BdwHA5K7vC6k1NdKmEzUOZ2mK7//w
         8xsAY40/UutDUJ5Ov9Kc9HNYe2caiHO5XBO2Ty7i5fp0dsYWKm8zhVSKoSsVl8xaLGR0
         HPZx0ESljt/9hkGZylcO8MAlQs1Llqlx4o/AqoWvGedq8vMtscfbJt4Vbq62gU9bCLWd
         QkRsvUBoaD8//nRHIHFbQB6fnNz04lYXS79yHkydgoo0ojpxNVvFLzXJMUDFMVHeIfZ8
         6j94n6n2SrM5LrBW8rzmAP2RJZ2xPxMZu/xQfcOWkpubEvayuWiUc4LqI4ASO+Yc8vxv
         4VJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=FKbTiN2/nNOnhivcQdZvyPTz2s+UvHMiBUlqeWcZRgY=;
        b=vwRTXNJaemetCnSPy+nMFqIWqoHoz+X5+4+STD7OKhWTC8Eoo6dyBzjmNsOTsx5h8r
         9ViIsCGAXWan/YGxma0kvPlSd9fLv6KOtco7MZT7RH9RsvTDbG0fTmAI9qkqnAv5facr
         +/x8A+1I1yhfEg4QkRHR4jvABZdfLAw/vN4sDN29tOiZiPUcczH+/Jr4RHzZ1Sb2GVTA
         4NgEnv6hQX4an81DsO6iJNw/pkpBp31P1+XIi+Wuw91ucQy1pIHYX3IYl1eWvx9zh3wn
         pGwvCUkeKyIsd0UDSzIvU98ELXJrO3keQCJTDJM5OxXB2fq8BRdm3ZNpOs2oFggjBULg
         yNLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p3si80748wrn.4.2019.09.05.02.08.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 02:08:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x8598v32027360
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 5 Sep 2019 11:08:57 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.69.141])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x8598v0H028417;
	Thu, 5 Sep 2019 11:08:57 +0200
Date: Thu, 5 Sep 2019 11:08:55 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: <jailhouse-dev@googlegroups.com>
Subject: Re: [jh-images][PATCH 05/13] Add recipe for building ZynqMP PMU
 firmware
Message-ID: <20190905110855.5ef2241e@md1za8fc.ad001.siemens.net>
In-Reply-To: <4d3e993a-6325-73a5-c8cf-c2f96478beb9@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
	<1b82afa10f1cab52959999c5fba4cf0235a5614b.1567490365.git.jan.kiszka@siemens.com>
	<20190904111724.1f8e2b9d@md1za8fc.ad001.siemens.net>
	<dc7ca516-1fa3-d1ed-f38a-60d9d601ae90@siemens.com>
	<20190904152249.14086fef@md1za8fc.ad001.siemens.net>
	<4d3e993a-6325-73a5-c8cf-c2f96478beb9@siemens.com>
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

Am Wed, 4 Sep 2019 17:52:59 +0200
schrieb Jan Kiszka <jan.kiszka@siemens.com>:

> On 04.09.19 15:22, Henning Schild wrote:
> > Am Wed, 4 Sep 2019 13:40:34 +0200
> > schrieb Jan Kiszka <jan.kiszka@siemens.com>:
> >   
> >> On 04.09.19 11:17, Henning Schild wrote:  
> >>> Am Tue, 3 Sep 2019 07:59:17 +0200
> >>> schrieb "[ext] Jan Kiszka" <jan.kiszka@siemens.com>:
> >>>      
> >>>> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>>>
> >>>> Will replace the old binary package so far used for the Ultra96.
> >>>>
> >>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >>>> ---
> >>>>    recipes-bsp/zynqmp-pmufw/files/debian/compat       |  1 +
> >>>>    recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl | 10
> >>>> ++++++++ recipes-bsp/zynqmp-pmufw/files/debian/rules        | 24
> >>>> +++++++++++++++++ recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
> >>>> | 30 ++++++++++++++++++++++ 4 files changed, 65 insertions(+)
> >>>>    create mode 100644
> >>>> recipes-bsp/zynqmp-pmufw/files/debian/compat create mode 100644
> >>>> recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl create mode
> >>>> 100755 recipes-bsp/zynqmp-pmufw/files/debian/rules create mode
> >>>> 100644 recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
> >>>>
> >>>> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/compat
> >>>> b/recipes-bsp/zynqmp-pmufw/files/debian/compat new file mode
> >>>> 100644 index 0000000..ec63514
> >>>> --- /dev/null
> >>>> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/compat
> >>>> @@ -0,0 +1 @@
> >>>> +9
> >>>> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
> >>>> b/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl new file
> >>>> mode 100644 index 0000000..4d14702
> >>>> --- /dev/null
> >>>> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
> >>>> @@ -0,0 +1,10 @@
> >>>> +Source: ${PN}
> >>>> +Section: misc
> >>>> +Priority: optional
> >>>> +Standards-Version: 3.9.6
> >>>> +Build-Depends: crosstool-ng-microblaze:native
> >>>> +Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
> >>>> +
> >>>> +Package: ${PN}
> >>>> +Architecture: all
> >>>> +Description: ${DESCRIPTION}
> >>>> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/rules
> >>>> b/recipes-bsp/zynqmp-pmufw/files/debian/rules new file mode
> >>>> 100755 index 0000000..e86f7a3
> >>>> --- /dev/null
> >>>> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/rules
> >>>> @@ -0,0 +1,24 @@
> >>>> +#!/usr/bin/make -f
> >>>> +#
> >>>> +# Jailhouse, a Linux-based partitioning hypervisor
> >>>> +#
> >>>> +# Copyright (c) Siemens AG, 2019
> >>>> +#
> >>>> +# Authors:
> >>>> +#  Jan Kiszka <jan.kiszka@siemens.com>
> >>>> +#
> >>>> +# SPDX-License-Identifier: MIT
> >>>> +#
> >>>> +
> >>>> +DPKG_EXPORT_BUILDFLAGS = 1
> >>>> +include /usr/share/dpkg/default.mk
> >>>> +
> >>>> +override_dh_auto_build:
> >>>> +	$(MAKE) -C lib/sw_apps/zynqmp_pmufw/src
> >>>> +
> >>>> +override_dh_auto_install:
> >>>> +	dh_install lib/sw_apps/zynqmp_pmufw/src/executable.elf \
> >>>> +		usr/share/zynqmp-pmufw/
> >>>> +
> >>>> +%:
> >>>> +	dh $@ --parallel
> >>>> diff --git a/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
> >>>> b/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb new file mode
> >>>> 100644 index 0000000..ff9f05e
> >>>> --- /dev/null
> >>>> +++ b/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
> >>>> @@ -0,0 +1,30 @@
> >>>> +#
> >>>> +# Jailhouse, a Linux-based partitioning hypervisor
> >>>> +#
> >>>> +# Copyright (c) Siemens AG, 2019
> >>>> +#
> >>>> +# Authors:
> >>>> +#  Jan Kiszka <jan.kiszka@siemens.com>
> >>>> +#
> >>>> +# SPDX-License-Identifier: MIT
> >>>> +#
> >>>> +
> >>>> +inherit dpkg
> >>>> +
> >>>> +DESCRIPTION = "ZynqMP PMU Firmware"
> >>>> +
> >>>> +SRC_URI = " \
> >>>> +
> >>>> https://github.com/Xilinx/embeddedsw/archive/xilinx-v${PV}.tar.gz
> >>>> \
> >>>> +    file://debian/"
> >>>> +SRC_URI[sha256sum] =
> >>>> "0b36721d62f970b1873fd337e94ee13304500ecec1dd5dbfc4f0ed952e55cf5f"
> >>>> + +DEPENDS = "crosstool-ng-microblaze"
> >>>> +
> >>>> +TEMPLATE_FILES = "debian/control.tmpl"
> >>>> +
> >>>> +S = "${WORKDIR}/embeddedsw-xilinx-v${PV}"
> >>>> +
> >>>> +do_prepare_build() {
> >>>> +    cp -r ${WORKDIR}/debian ${S}
> >>>> +    deb_add_changelog  
> >>>
> >>> Why not use the whole debianization? It supports custom
> >>> pre-existing files, and if there are gaps we could improve it in
> >>> isar.  
> >>
> >> deb_debianize is still somehow in the stage of "for insiders only".
> >> Add a proper upstream test case, document the API, and we can move
> >> forward with it.  
> > 
> > I know that, but you are using deb_add_changelog which is a subset
> > of it. So no reason, except for you did not yet look into it?  
> 
> Even in Isar, we are now stressing deb_add_changelog outside of
> deb_debianize while the latter is dpkg-raw only still.
> 
> I'm happy to change jailhouse-images to deb_debianize, but I really
> like to see a proper description of it. E.g., the fact that only
> generates what is missing was new and can probably be exploited more
> even in Isar upstream (u-boot-custom).

I do not want to make you use it. All i want to know is whether there
are known issues in it. Because those can be fixed easier before making
it official.

Henning

> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190905110855.5ef2241e%40md1za8fc.ad001.siemens.net.
