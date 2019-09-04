Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXV3X7VQKGQE5T6TKAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97CA8636
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 17:53:02 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id z39sf10249088edc.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 08:53:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567612382; cv=pass;
        d=google.com; s=arc-20160816;
        b=yAjgP95p8tQ7VURI/WjUn3n6Fx1V+JbShorrbaQjh8ONTaxBFlg87KUFGmxcYaACkh
         +5T4UJasxMAiXe1ZJYTUUWLtdsk/7bM/HF4aDfZCL4BOfdrxdvT7XbQjSMYeHsg8vRXj
         W5DcSmTUooA2qK2HN14Jzu8KOF6h6Jzm5OGMUALU+SjvQt7VNa9BMnI8gXEAfnB5nc4d
         P3vktfxZTO37axdZnYOFjANhDdzKiFm0C6S/bwcsy7zu40Ijrd+ZNGAJn2dZi1xYwgDb
         yHdr/tRg55EVDAg7sOXF8wNIiRsotPlWcT0HwyjYAFZ0MqOVR1Y4bucxMGEMQVefTrCM
         geLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=b7x8/zN0yIgY/ldd0B30UpZqXELsCOJWiDMRNRGTXOI=;
        b=GLi5LZYSYxb2yh1BPu7UI36yJhWdUJly6m7hyTNM92CFbcsfrVFlR9eBq85Y/5YynV
         WkkmJtMQMWavetO5iheFGrqTv6JXFgR4pjqVxRt9qEG8etXJ9vMliHZvl8rhxNxtvWJA
         7Wxa9TM7KXVnpn7keBn9BTqzNIiUxxSPhQLnNs8vFoBtKr1//xGH8YmUgoEW46h6MMKO
         ezDwMHzLx4G63W9PmSD61jSxW4Sfmz/tVJvyxOwVbLON3H0MJ4VRsp76BZBWrZ8pamYB
         m75rJW74BxuTncPF99eiHNJ2PgofJqzSiFRMq2gZT426dQFNxHKy3LCpfYm9J+rkpzZe
         xRRw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=b7x8/zN0yIgY/ldd0B30UpZqXELsCOJWiDMRNRGTXOI=;
        b=fFxtj2wKPLxnbUFu4gBu2w4ew25xsn++Nw6SQU+e5rlN6koQdr4ioR9ofYu+1I5Qj8
         5mexgv1+Ri7MEpOdCiQNitWXHc/S4aVtY/YsdubE+N1eaO1s84gn1XLCogkjeBNCK3ok
         LtSTYilCz2R0f6/9LKrv4OcWORJYUsyZeWIJoDadr4iOl3KcxsalHi1xXQQTSnnwL9pK
         5yHY5uy1Aw2qUT4kzcSiLucACbWvQxnxwItfrPSn5uA7CaS63EWlAfJWFU4oCxlwQfP0
         8G4ddyo3+/F2MtBh+SaZZsviTt9x3EZzpKeW/PD7MKTg80XqidLSpIDMub5zv3mqf2Wz
         XnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=b7x8/zN0yIgY/ldd0B30UpZqXELsCOJWiDMRNRGTXOI=;
        b=KUvv/pMjQCAfNIMOPQI8Qze4qaAJdMosYGNZTRaFzypsubyUy3GKJF137s/ar28P8X
         vOHi+m7ff8oL8N+3M6CmUtE/uPxerV5d/r4/4PrjwOlJ4tu6Af9ugZZEGN3NvS2Y8LhY
         2I3Kq8A+B/M9km2vMgFoY3U0yPBbbH4/bh/AyKB4K5B6wo9PNIlHXosl6+V4Ff7xBnB6
         +YKxKElK5bmlN70puWzAmN+PbyFzDrOYlC/OGX34YWPAdwr+n6OzPPtFNLr+KAKfVll5
         ATtFzM8CcbPIE3MR23un3pGODji1P+lqTGDkiWKFrwONVlghrTskTwzI23YuJP59ZrZo
         /PgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWSUF9vTetRKfpdpbsMyivOtdKXVOvEJ3AVTOx5yefgI4wO+4Gc
	NTw5x/JmK1Ga4vTUNCUXY/8=
X-Google-Smtp-Source: APXvYqwM5sObX58DXBp3e43lT10/KY4cGl4NZdvvsColPreuLJa1oXZZGxS9NKhrRBSY0dyI7YlW2Q==
X-Received: by 2002:a50:f708:: with SMTP id g8mr41875971edn.128.1567612382612;
        Wed, 04 Sep 2019 08:53:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ee99:: with SMTP id f25ls6418971edr.9.gmail; Wed, 04 Sep
 2019 08:53:01 -0700 (PDT)
X-Received: by 2002:a50:e601:: with SMTP id y1mr36363150edm.221.1567612381873;
        Wed, 04 Sep 2019 08:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567612381; cv=none;
        d=google.com; s=arc-20160816;
        b=x9GF0ItOkMLAWUOkf+mY3/ypMRZdxzpfXoMXVaQLxX237YPP6kpr5e5RbxvGuJ2Fd2
         +oYT8dN5pYl6O59EiwG+NHTblc1acBZSCFlE21VgN69Xe9r0AN11L2CME5XRaVABbijJ
         P+p5lDoxxhLEQtUNymdm4QuFCQ8soAvh9HAmFPTD7FxGQanZMvg6iltFZ2QI4J8CNmVT
         w7uHRu05+/ZS1WVBkfki2iwZbgOQO/l3zELv8Baa1+Ks1+8TRJbnoyzzo6Wo+CeZO3am
         byA2Ccb/6pZ7ITVSLdVq0Hx6b3B//KISE8z75HoJd/6buEHF0By1cxOpI4BNzQHaPL2j
         VQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=vUUzZFBEoLeCdSgqagmx5X/KIX24y208UNRERaS2b5w=;
        b=TR+Yv9oWbSjbTcyDJ42flYjVuFH2lLjVh62NQdDKAbc1yY2vc0sJo4wiGqBcNfY6mB
         CHv7tS76H+f42t/BKxsMUHjcuoRN1WBRdCgf+w+WALOlGcRt3gyqe7tvSTQ5hmtxBdyb
         UF6o38dUoDWprQKZeqfZQGws3gsZ0JExDY6hAezpx1qycai/Xe0BvVlh5Lsm97zeghG2
         WX99JMK2sf1mZwDP9F3fwNKqCH1NIq/bZvyfjmbQp8jgtggWNpx+j3ak1nIM1DwNCoub
         seeYQ8V4MfdscixizuBSz+UTfsl3EDn2jcRoGVERnA9yiVkERoeXrB5x3gNsHR8INxk+
         Waww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f20si917453edx.1.2019.09.04.08.53.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 08:53:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x84Fr1dp026186
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 4 Sep 2019 17:53:01 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x84Fr16o020014;
	Wed, 4 Sep 2019 17:53:01 +0200
Subject: Re: [jh-images][PATCH 05/13] Add recipe for building ZynqMP PMU
 firmware
To: Henning Schild <henning.schild@siemens.com>
Cc: jailhouse-dev@googlegroups.com
References: <cover.1567490365.git.jan.kiszka@siemens.com>
 <1b82afa10f1cab52959999c5fba4cf0235a5614b.1567490365.git.jan.kiszka@siemens.com>
 <20190904111724.1f8e2b9d@md1za8fc.ad001.siemens.net>
 <dc7ca516-1fa3-d1ed-f38a-60d9d601ae90@siemens.com>
 <20190904152249.14086fef@md1za8fc.ad001.siemens.net>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <4d3e993a-6325-73a5-c8cf-c2f96478beb9@siemens.com>
Date: Wed, 4 Sep 2019 17:52:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904152249.14086fef@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
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

On 04.09.19 15:22, Henning Schild wrote:
> Am Wed, 4 Sep 2019 13:40:34 +0200
> schrieb Jan Kiszka <jan.kiszka@siemens.com>:
> 
>> On 04.09.19 11:17, Henning Schild wrote:
>>> Am Tue, 3 Sep 2019 07:59:17 +0200
>>> schrieb "[ext] Jan Kiszka" <jan.kiszka@siemens.com>:
>>>    
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>
>>>> Will replace the old binary package so far used for the Ultra96.
>>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> ---
>>>>    recipes-bsp/zynqmp-pmufw/files/debian/compat       |  1 +
>>>>    recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl | 10 ++++++++
>>>>    recipes-bsp/zynqmp-pmufw/files/debian/rules        | 24
>>>> +++++++++++++++++ recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
>>>> | 30 ++++++++++++++++++++++ 4 files changed, 65 insertions(+)
>>>>    create mode 100644 recipes-bsp/zynqmp-pmufw/files/debian/compat
>>>>    create mode 100644
>>>> recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl create mode
>>>> 100755 recipes-bsp/zynqmp-pmufw/files/debian/rules create mode
>>>> 100644 recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
>>>>
>>>> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/compat
>>>> b/recipes-bsp/zynqmp-pmufw/files/debian/compat new file mode 100644
>>>> index 0000000..ec63514
>>>> --- /dev/null
>>>> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/compat
>>>> @@ -0,0 +1 @@
>>>> +9
>>>> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
>>>> b/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl new file mode
>>>> 100644 index 0000000..4d14702
>>>> --- /dev/null
>>>> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
>>>> @@ -0,0 +1,10 @@
>>>> +Source: ${PN}
>>>> +Section: misc
>>>> +Priority: optional
>>>> +Standards-Version: 3.9.6
>>>> +Build-Depends: crosstool-ng-microblaze:native
>>>> +Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
>>>> +
>>>> +Package: ${PN}
>>>> +Architecture: all
>>>> +Description: ${DESCRIPTION}
>>>> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/rules
>>>> b/recipes-bsp/zynqmp-pmufw/files/debian/rules new file mode 100755
>>>> index 0000000..e86f7a3
>>>> --- /dev/null
>>>> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/rules
>>>> @@ -0,0 +1,24 @@
>>>> +#!/usr/bin/make -f
>>>> +#
>>>> +# Jailhouse, a Linux-based partitioning hypervisor
>>>> +#
>>>> +# Copyright (c) Siemens AG, 2019
>>>> +#
>>>> +# Authors:
>>>> +#  Jan Kiszka <jan.kiszka@siemens.com>
>>>> +#
>>>> +# SPDX-License-Identifier: MIT
>>>> +#
>>>> +
>>>> +DPKG_EXPORT_BUILDFLAGS = 1
>>>> +include /usr/share/dpkg/default.mk
>>>> +
>>>> +override_dh_auto_build:
>>>> +	$(MAKE) -C lib/sw_apps/zynqmp_pmufw/src
>>>> +
>>>> +override_dh_auto_install:
>>>> +	dh_install lib/sw_apps/zynqmp_pmufw/src/executable.elf \
>>>> +		usr/share/zynqmp-pmufw/
>>>> +
>>>> +%:
>>>> +	dh $@ --parallel
>>>> diff --git a/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
>>>> b/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb new file mode
>>>> 100644 index 0000000..ff9f05e
>>>> --- /dev/null
>>>> +++ b/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
>>>> @@ -0,0 +1,30 @@
>>>> +#
>>>> +# Jailhouse, a Linux-based partitioning hypervisor
>>>> +#
>>>> +# Copyright (c) Siemens AG, 2019
>>>> +#
>>>> +# Authors:
>>>> +#  Jan Kiszka <jan.kiszka@siemens.com>
>>>> +#
>>>> +# SPDX-License-Identifier: MIT
>>>> +#
>>>> +
>>>> +inherit dpkg
>>>> +
>>>> +DESCRIPTION = "ZynqMP PMU Firmware"
>>>> +
>>>> +SRC_URI = " \
>>>> +
>>>> https://github.com/Xilinx/embeddedsw/archive/xilinx-v${PV}.tar.gz \
>>>> +    file://debian/"
>>>> +SRC_URI[sha256sum] =
>>>> "0b36721d62f970b1873fd337e94ee13304500ecec1dd5dbfc4f0ed952e55cf5f"
>>>> + +DEPENDS = "crosstool-ng-microblaze"
>>>> +
>>>> +TEMPLATE_FILES = "debian/control.tmpl"
>>>> +
>>>> +S = "${WORKDIR}/embeddedsw-xilinx-v${PV}"
>>>> +
>>>> +do_prepare_build() {
>>>> +    cp -r ${WORKDIR}/debian ${S}
>>>> +    deb_add_changelog
>>>
>>> Why not use the whole debianization? It supports custom pre-existing
>>> files, and if there are gaps we could improve it in isar.
>>
>> deb_debianize is still somehow in the stage of "for insiders only".
>> Add a proper upstream test case, document the API, and we can move
>> forward with it.
> 
> I know that, but you are using deb_add_changelog which is a subset of
> it. So no reason, except for you did not yet look into it?

Even in Isar, we are now stressing deb_add_changelog outside of deb_debianize 
while the latter is dpkg-raw only still.

I'm happy to change jailhouse-images to deb_debianize, but I really like to see 
a proper description of it. E.g., the fact that only generates what is missing 
was new and can probably be exploited more even in Isar upstream (u-boot-custom).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4d3e993a-6325-73a5-c8cf-c2f96478beb9%40siemens.com.
