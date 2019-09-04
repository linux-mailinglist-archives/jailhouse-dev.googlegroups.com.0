Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNOFX3VQKGQEZUJEHGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id BC174A8132
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 13:40:37 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id n3sf686559wmf.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 04:40:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567597237; cv=pass;
        d=google.com; s=arc-20160816;
        b=E4BxKSKtKqoEKKMp1YUCIK6blDzP8w8+4cxRKWN8xg0PYKhusu+eka0dXvD1/jwprc
         s9vGAmjqVNuRugZ0BDCX3gyXD98t5YHLPtKmRlSQczkMk/SKFdmmh1sOgOkH+sxyYYgy
         Xt5nHtq1Dv66IRV88oKQUQpc/5TkjyC5CIE6imWx4ldjpNMJCF4b80+Ze2dV2IB7Sqq3
         NRcnVJaS6evVIuUozDhOIotAj4qiTRzRW8DkTEiwuuL06btTp2iB4Kmw31asGKMBhtnN
         ozehjVtWKiAVckcXoBJ3O8/xiWSz/D1LqYmmuUPdEyuVP0la0F7VMdGsoGgR4hxiCH89
         pdAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=q6ZNmKp/cVO2iiL/ddoKb3sqrxh1f59dn4JpEyrCx9k=;
        b=wCP1n75Hr82Muie1lsOltxymIchG+Dg//LuxOYtuEYh+Ongg1FvD7iDhemMucrqhdJ
         MmsnUagpRHnan9Vsnjwq2u6Ea24DJ6iEEZJVUaIo+xJsLumenkFZIsWB0D5aOxmVludX
         CIyyq5TE+VVLnid8+pEEfHhttsH4+ebK0JiMEBviL6aEf4x8k/lAmF7cxzr7+YgPCgAC
         /lHqCi+heI36VdMcHvPfpn5JqohfhxxEomXMv+BPYAuX3xUI4q6461YIpyQtFeBoDWz/
         MSZrzqNLxYrYznbvFkqCANyS1pDVGL7zWB6cq9wfYIMo+KwTALIxH4gmdc1MiY8/97Vj
         40dQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=q6ZNmKp/cVO2iiL/ddoKb3sqrxh1f59dn4JpEyrCx9k=;
        b=qh586V5XakGlZIlEpSyqR0CNaepxRY9g61vuCN8cSguGcQI2eiaRJPf6RY6i9NE5/t
         Tjhkg66z/VgA4iwmfKfi4PLXc2wVan+T7o8E+KflVtmNXhBLuervNJbAhJnopSYH2BEc
         Xa3kv37+nnW5EojLGEgQg6MfaEOj/d0DqNcbqWKiYfbdz1LaZ+UvaCZADvnK5Nhhhxrs
         iAEDBftOSBhun498gFQg3f64Zd+ti6Kz/QZKUaKNnVQtj6Vyy7YPO4GMb+OrqDQiZu/Q
         4i5bhJ6AQQMK4hj48qGsMXjK9IsF14VsAtb3fegwiG64s1Qjnyfg1lMn4JXBzTr4ktpw
         ttHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=q6ZNmKp/cVO2iiL/ddoKb3sqrxh1f59dn4JpEyrCx9k=;
        b=ed1lynueGemvSv/z5yEofOGjl5LFg16bUyvuCXRTejur3Xv1XYLPUn1H1WduyLeiGe
         1lq2Pl353TQS7asltEqBMicCJGhpO3AXEjg0gMFoQMqOcCeQEL3oJZZ80dvn91uczxVY
         rfteaqv74GhBFO6xSB5+SAWXcAFdPgUWTPoI2cgtVts2ZMsJqUHNK62gD2HIzkl2erVa
         409afU0SjayN33tQ9p0eAyoE3VjqRJ6oaLGuW+HF1YFMv0TsHCmjik/IQpdy5kaBmE4O
         BxSB/BNV8+9JfXDe4YPkgJEAO1nHVhTAUSYJqn/zah3QaBBokkPZWtqVUqZJaMKp0rAp
         O+kw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXEXbmbpY1TksrPQ0KUrmEBX5SEp/GhoXETVPj47f08OQRpvp++
	bYcxpWpFiyqErAR+XcF4VaE=
X-Google-Smtp-Source: APXvYqwl8le1id34YS20q0jSEyvlUi4RDQ8fLal5mFOhgSSMTHUzpIyRj3tZqxD52n5PKiegehN5tQ==
X-Received: by 2002:a1c:f408:: with SMTP id z8mr4282314wma.150.1567597237428;
        Wed, 04 Sep 2019 04:40:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a78e:: with SMTP id q136ls1074381wme.1.gmail; Wed, 04
 Sep 2019 04:40:36 -0700 (PDT)
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr4245068wmd.14.1567597236657;
        Wed, 04 Sep 2019 04:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567597236; cv=none;
        d=google.com; s=arc-20160816;
        b=ZFqDQ9vjqL01pDwLdFDQLbz5lo7tzkcg+8HA2LBKh0ixmPxiPpZ+LF0kd+jwY4YVYI
         aGjxrQVByFvGBMttxG2Q8s8ealb6mX3ypfTaXFdBWYNWSMmc0QlNdAD0alr75f9JKawP
         oOv3UMNCnw3XWoyQ7tDxzRAHzqTdhUNRIigOUT7Qf68YzPx6Ia18piJwATC39f7D6CUR
         V7alN0cx4iEL20R7iVaYs8C9qnuLAybBzVc5WjRutfDPAei7feRWqy94IsU/slOG17Wz
         o34Cbi3Eyk7alalPiui1caKvGQD0W+c7w92/FL6klkr68AcRhDlxAvc8gkskDkIBv7DY
         o5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=W97jlQ0SxhTE3sOeu6vS1Ahi0STmUqSu7FI6zvHHDNA=;
        b=HOjwJptrbpDMnQlMGJHqdiU3Si0zOzyu7JSEHqqj8wksaYgVTzctOySem6O+K96BeE
         OUJheFHSqkoyzN2cVZBczR6qKwIi+hEAo/oeHr1rw4VekNTbPf/8UBaNhVejiVV4Ff1I
         1ZaAQjrRGW1SQvRnUyd8eg4BFxaZkNLW99O2Sd40UH+v7HJ8HFQ9w8UbxapnD1WK6Ir4
         tJlu9pbm2oVMMziw/Zn6Yx6MBDdMsK0eI/gd8wt/2DcHNV8a3i5+M88JC/Fus5PghWaN
         DhtESPnmAkiqivNks+uwhNP8+VyBrOsR7Ac9PD/WrLP7YCPuujczBXYYBAbWerkKJxA9
         ymxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id l14si134714wmc.1.2019.09.04.04.40.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 04:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x84BeawO002595
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 4 Sep 2019 13:40:36 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x84Beaea014404;
	Wed, 4 Sep 2019 13:40:36 +0200
Subject: Re: [jh-images][PATCH 05/13] Add recipe for building ZynqMP PMU
 firmware
To: Henning Schild <henning.schild@siemens.com>
Cc: jailhouse-dev@googlegroups.com
References: <cover.1567490365.git.jan.kiszka@siemens.com>
 <1b82afa10f1cab52959999c5fba4cf0235a5614b.1567490365.git.jan.kiszka@siemens.com>
 <20190904111724.1f8e2b9d@md1za8fc.ad001.siemens.net>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dc7ca516-1fa3-d1ed-f38a-60d9d601ae90@siemens.com>
Date: Wed, 4 Sep 2019 13:40:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904111724.1f8e2b9d@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 04.09.19 11:17, Henning Schild wrote:
> Am Tue, 3 Sep 2019 07:59:17 +0200
> schrieb "[ext] Jan Kiszka" <jan.kiszka@siemens.com>:
> 
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Will replace the old binary package so far used for the Ultra96.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   recipes-bsp/zynqmp-pmufw/files/debian/compat       |  1 +
>>   recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl | 10 ++++++++
>>   recipes-bsp/zynqmp-pmufw/files/debian/rules        | 24
>> +++++++++++++++++ recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
>> | 30 ++++++++++++++++++++++ 4 files changed, 65 insertions(+)
>>   create mode 100644 recipes-bsp/zynqmp-pmufw/files/debian/compat
>>   create mode 100644 recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
>>   create mode 100755 recipes-bsp/zynqmp-pmufw/files/debian/rules
>>   create mode 100644 recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
>>
>> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/compat
>> b/recipes-bsp/zynqmp-pmufw/files/debian/compat new file mode 100644
>> index 0000000..ec63514
>> --- /dev/null
>> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/compat
>> @@ -0,0 +1 @@
>> +9
>> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
>> b/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl new file mode
>> 100644 index 0000000..4d14702
>> --- /dev/null
>> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/control.tmpl
>> @@ -0,0 +1,10 @@
>> +Source: ${PN}
>> +Section: misc
>> +Priority: optional
>> +Standards-Version: 3.9.6
>> +Build-Depends: crosstool-ng-microblaze:native
>> +Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
>> +
>> +Package: ${PN}
>> +Architecture: all
>> +Description: ${DESCRIPTION}
>> diff --git a/recipes-bsp/zynqmp-pmufw/files/debian/rules
>> b/recipes-bsp/zynqmp-pmufw/files/debian/rules new file mode 100755
>> index 0000000..e86f7a3
>> --- /dev/null
>> +++ b/recipes-bsp/zynqmp-pmufw/files/debian/rules
>> @@ -0,0 +1,24 @@
>> +#!/usr/bin/make -f
>> +#
>> +# Jailhouse, a Linux-based partitioning hypervisor
>> +#
>> +# Copyright (c) Siemens AG, 2019
>> +#
>> +# Authors:
>> +#  Jan Kiszka <jan.kiszka@siemens.com>
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +DPKG_EXPORT_BUILDFLAGS = 1
>> +include /usr/share/dpkg/default.mk
>> +
>> +override_dh_auto_build:
>> +	$(MAKE) -C lib/sw_apps/zynqmp_pmufw/src
>> +
>> +override_dh_auto_install:
>> +	dh_install lib/sw_apps/zynqmp_pmufw/src/executable.elf \
>> +		usr/share/zynqmp-pmufw/
>> +
>> +%:
>> +	dh $@ --parallel
>> diff --git a/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
>> b/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb new file mode 100644
>> index 0000000..ff9f05e
>> --- /dev/null
>> +++ b/recipes-bsp/zynqmp-pmufw/zynqmp-pmufw_2019.1.bb
>> @@ -0,0 +1,30 @@
>> +#
>> +# Jailhouse, a Linux-based partitioning hypervisor
>> +#
>> +# Copyright (c) Siemens AG, 2019
>> +#
>> +# Authors:
>> +#  Jan Kiszka <jan.kiszka@siemens.com>
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +inherit dpkg
>> +
>> +DESCRIPTION = "ZynqMP PMU Firmware"
>> +
>> +SRC_URI = " \
>> +
>> https://github.com/Xilinx/embeddedsw/archive/xilinx-v${PV}.tar.gz \
>> +    file://debian/"
>> +SRC_URI[sha256sum] =
>> "0b36721d62f970b1873fd337e94ee13304500ecec1dd5dbfc4f0ed952e55cf5f" +
>> +DEPENDS = "crosstool-ng-microblaze"
>> +
>> +TEMPLATE_FILES = "debian/control.tmpl"
>> +
>> +S = "${WORKDIR}/embeddedsw-xilinx-v${PV}"
>> +
>> +do_prepare_build() {
>> +    cp -r ${WORKDIR}/debian ${S}
>> +    deb_add_changelog
> 
> Why not use the whole debianization? It supports custom pre-existing
> files, and if there are gaps we could improve it in isar.

deb_debianize is still somehow in the stage of "for insiders only". Add a proper 
upstream test case, document the API, and we can move forward with it.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dc7ca516-1fa3-d1ed-f38a-60d9d601ae90%40siemens.com.
