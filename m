Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3ELZKCAMGQERLXMV5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FDA3739AB
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 May 2021 13:47:57 +0200 (CEST)
Received: by mail-ej1-x63c.google.com with SMTP id d21-20020a1709067f15b02903a61441211csf342761ejr.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 May 2021 04:47:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1620215277; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZV4t3Q0li6n5XmBtLLNg/9q+0Nm7wZ1euPy+fJcYqPsk6WaiaOzJUt7CEI/fe8voer
         tHcuyW+n9DiyQmVwA8JpK0rJur5OJ0Vvqz5h4kAqD3w6YHA04gbFfPBbMlnIKl8+6gGX
         cAcBgzTZdYoSxu6IjI8SRovqQY6ZzvkdcYCgqUMClZ7VgTL6uBRccv47Vm79rRFmkW41
         c24c+Tb2lnuF78r41VIquOSkzeJwa4h0kvpg4t35NuG6N7NAP1ihnyIMKvmeNdCtSckU
         QKJKip8gAOKo8ggm+lzOnV0Y+qQfOZ5IjkXHT6ir/ShH45UaiQs8tIXPjWHmadF5UKCv
         GNww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=l7FdYxftLnCCHpySnTahqQUrvbL6ofXMO+HeEWYwRZM=;
        b=I0W+So12XOygWR978gD2Zto7B/ZLUoa7abirbajRhbCgMTrvcmRsePKM6uHQNEgh/Z
         e/IthDx1SAeKNn93bALNEFISeLfwbGvVA2rs4IDTwNC9Q9q+L2ZfitBawt7oie+U68kB
         AN79eIHn7jTEdPH5BZtaC6Mf595oDMi9nZUcQNutTwohqh/oC5IRAC/UvYRJuxeWkGVW
         o2HOKwEZsDSvLd0CsstIHJMx3/PE3rA50zrFNos8Qa3ptzxXS3VM6JFduhIFDanc6AjX
         6yOWV892NH/pab0A/dTJGfo/Hg4zfnI91+oz5xX+D5sEwoFISsED0ZOB4Qfbq2ec/R4r
         y4Ig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=l7FdYxftLnCCHpySnTahqQUrvbL6ofXMO+HeEWYwRZM=;
        b=eLwAj4DF5WDkppZWjdOsB/9RRr3bsHqJ8/Ir5gEhl7KUcccHKKqvshx18OQdEViXXb
         sdIe09pzKPkFdJnz4CDb2tNqGfPsPb3UC47pHsNJzLCz/P3ffvwsDvId1fPkgy/vEoZ0
         TiwrF6iw5HRcA3AhGXWevQofV/PNvyDs77oQ8KC+DkiaoVqLp355lXgbK85QN7BNbd83
         6wZsxrPB6L1oO7sTu1ZTQaj/QqcERfrJTTN8bvpfeJ3dW6MRaNJ1L5KGHYI22+By7Lf/
         cM97u6FZQEcsMlEnMhAAbZI4AZfbMS4cvbi5pj0sVd+a37nAi6uPZ2aPw1Gn1+Uau5tz
         NMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=l7FdYxftLnCCHpySnTahqQUrvbL6ofXMO+HeEWYwRZM=;
        b=cJJWHHBCrJtc7WxUrSybICKWZgy/O5SmTGImxdo/HQmfWbJvwDfrz6wO/jRw7cDR0N
         iEjDA6pNfL8LHbtcyEaiZqq25IoGBpz1r8tMdaihEHzsQGOQXfV1/qktUcBH0rNpOgH0
         yJ3DqAC99pN8rFBtJwR4zdPeiIPbd458D8Hj7RTez0XLyDtjxoVRC4DDTU48R7adFBvc
         QTMmQGK6yZ+cra1QtB/Uc/hx8iZE3N8fgCfI5HctL/xnRJc6zFEeVcS/HrZyBv9XDxRD
         wnB7EtqstJRBgXxrRzw6h71Moa5lGMkz8ijDjLBsMAND+ua7d2RXvH8zlYDRN6W9hKWs
         zhYA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532cKFyeTlwFI0gf+hNdFDCDEkuyXuWZKG84EPylbTH7pbL/+Mip
	MyQExupDeVbKvn0U+4gwag0=
X-Google-Smtp-Source: ABdhPJyOqMu3PWiSBQL2sQ72xbWaMSgkKa+ycQgehpueL1KUPA9BGMsPNC6uNXJWXANCHBUkT7GlzQ==
X-Received: by 2002:a05:6402:3585:: with SMTP id y5mr23752592edc.233.1620215276831;
        Wed, 05 May 2021 04:47:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:ca0c:: with SMTP id jt12ls9416947ejb.11.gmail; Wed,
 05 May 2021 04:47:55 -0700 (PDT)
X-Received: by 2002:a17:907:2d0c:: with SMTP id gs12mr12705765ejc.173.1620215275760;
        Wed, 05 May 2021 04:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620215275; cv=none;
        d=google.com; s=arc-20160816;
        b=KgmVXrDSPiZgMqus+LIUKg3tApGojquwwiXEBHq9Mb9qRcsbW12iPOGwnyXlwkKzpE
         FyGE7S69UtdaIj+bi/GPO00ACvlnUCDjaIHZCLupURgGQWlkp4OUZgFs+dmkvX/xaU5F
         NAfYfp/b+A1xZmoNU0hhVzq0Otm8lfbKyWHrY0hkyzpRolWjSHlKsr94wM2WYEcNT6Bk
         ByEvh4t1xm3zEdRBhe+LYa1LwPmDJ6w8UK15IFSKAXLhTDB0BKw9/apdCdYHhzPRBAiS
         UngS/kaw9sebOCkBkfitKReeogsWqtVSIGVuJCBmFVyv+Pvt+qexjiSG6+ixajxCswGb
         o1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=tR4DEyqHEz+mmZlsQmmwIJMUMHByQSDiqBOxkoDSuqg=;
        b=pYBCdKQMw+DpQYOhQNe0KOeLnGBgjNIv81NfStEnoZtNIdGEO+9npLnVG2ZrE6FQDc
         VV9q1OlXpOxj6ONcb1Lg7Ws6ZqOUFa3YzxuMHqZIJhRqFRbg5T53SYj0QaqjbiR1jX+h
         w7hkZknP7P0BJIK49UyL9SgDbRYrhst7P8oN6T5i/RQlr1IZDYweJHwTgmG1/FUM1W6s
         ygA+gPeddu4hrywt4QCyG3oEwh1YWwjcV47Y9LhvFzUsQOENPg7X7y/3V89uzz4/6mFX
         pnuPb4ERF9EeWwtCziKJBWoz4iCgnOVBa5RjOWWVNyLrn9eQ+ZAWPtsbfXci4kmvF4uk
         pu2g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id y5si87622edc.5.2021.05.05.04.47.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 04:47:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 145BlpHf008710
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 May 2021 13:47:51 +0200
Received: from [167.87.5.119] ([167.87.5.119])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 145BiDRw011824;
	Wed, 5 May 2021 13:44:13 +0200
Subject: Re: [PATCH v2.1 0/9] Cache-coloring (ioremap_colored version)
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210322194411.82520-1-andrea.bastoni@tum.de>
 <1a89d1ea-4299-171d-b655-73252c5a2a61@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9eee496a-57bd-7c05-6970-140bd1236cc4@siemens.com>
Date: Wed, 5 May 2021 13:44:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1a89d1ea-4299-171d-b655-73252c5a2a61@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 04.05.21 14:43, Andrea Bastoni wrote:
> Hi Jan,
>=20
> I'd like to ping on this if you had time for a review.

Sorry, I didn't find the time yet. Will try to reschedule this for the
next days.

Jan

>=20
> Thanks,
> Andrea
>=20
> On 22/03/2021 20:44, Andrea Bastoni wrote:
>> Hi,
>>
>> Didn't have much time to work at it in the last period, so it took a
>> while.
>>
>> There are two similar patch batches: PATCH v2.1 and PATCH v2.2.
>>
>> v2.1 is the version with the colored ioremapping in the Linux driver.
>> I've tried to keep the replication of the code to a minimum, but the
>> main coloring loop has to be replicated in both driver and hypervisor.
>>
>> v2.2 is the version with the temporary "root mapping offset" that
>> allows reusing the plain Linux ioremap.
>>
>> I've removed all other "additional" patches and just focused on the
>> bulk of the coloring implementation.
>>
>> Overall the changes are:
>> git diff --stat siemens/master driver/ hypervisor/ include/
>> v2.1) 15 files changed, 515 insertions(+), 22 deletions(-)
>> v2.2) 15 files changed, 468 insertions(+), 24 deletions(-)
>>
>> PATCH v2.1 is also here
>> https://gitlab.com/bastoni/jailhouse/-/tree/for_upstream/202103_coloring=
_driver
>>
>> PATCH v2.2 is also here
>> https://gitlab.com/bastoni/jailhouse/-/tree/for_upstream/202103_coloring
>>
>>
>> Feedback/comment welcome,
>>
>> Thanks,
>> Andrea
>>
>> Andrea Bastoni (7):
>> =C2=A0=C2=A0 arm-common: bitops: add most-significant-bit operation
>> =C2=A0=C2=A0 include: cache-partitioning via coloring, add configuration
>> =C2=A0=C2=A0 hypervisor: arm64, arm-common: add cache-partitioning via c=
oloring
>> =C2=A0=C2=A0 driver: provide colored ioremap operation
>> =C2=A0=C2=A0 configs: arm64: add example configuration for colored ZCU10=
2 inmate
>> =C2=A0=C2=A0 configs: arm64: add coloring example for qemu-arm64
>> =C2=A0=C2=A0 configs: arm64: hook-in coloring parameters for ZCU102
>>
>> Luca Miccio (2):
>> =C2=A0=C2=A0 pyjailhouse: add support for colored regions
>> =C2=A0=C2=A0 Documentation: add description and usage of cache coloring =
support
>>
>> =C2=A0 Documentation/cache-coloring.md=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 177 +++++++++++++++++=
+
>> =C2=A0 configs/arm64/qemu-arm64-inmate-demo-col.c=C2=A0=C2=A0=C2=A0 | 13=
4 +++++++++++++
>> =C2=A0 configs/arm64/qemu-arm64.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 3 +
>> =C2=A0 configs/arm64/zynqmp-zcu102-inmate-demo-col.c |=C2=A0 75 ++++++++
>> =C2=A0 configs/arm64/zynqmp-zcu102.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
3 +
>> =C2=A0 driver/cell.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
11 +-
>> =C2=A0 driver/main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
75 ++++++++
>> =C2=A0 driver/main.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 3 +
>> =C2=A0 .../arch/arm-common/include/asm/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 10 +
>> =C2=A0 .../arch/arm-common/include/asm/coloring.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 45 +++++
>> =C2=A0 .../arch/arm-common/include/asm/dcaches.h=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 8 +
>> =C2=A0 hypervisor/arch/arm-common/mmu_cell.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 68 +++++--
>> =C2=A0 hypervisor/arch/arm64/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
>> =C2=A0 hypervisor/arch/arm64/coloring.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 109 +++++++++++
>> =C2=A0 hypervisor/arch/arm64/include/asm/coloring.h=C2=A0 | 140 ++++++++=
++++++
>> =C2=A0 hypervisor/arch/arm64/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
3 +
>> =C2=A0 hypervisor/control.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
>> =C2=A0 hypervisor/include/jailhouse/control.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
>> =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +
>> =C2=A0 include/jailhouse/coloring.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
45 +++++
>> =C2=A0 pyjailhouse/config_parser.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 9 +-
>> =C2=A0 21 files changed, 913 insertions(+), 25 deletions(-)
>> =C2=A0 create mode 100644 Documentation/cache-coloring.md
>> =C2=A0 create mode 100644 configs/arm64/qemu-arm64-inmate-demo-col.c
>> =C2=A0 create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
>> =C2=A0 create mode 100644 hypervisor/arch/arm-common/include/asm/colorin=
g.h
>> =C2=A0 create mode 100644 hypervisor/arch/arm64/coloring.c
>> =C2=A0 create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>> =C2=A0 create mode 100644 include/jailhouse/coloring.h
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9eee496a-57bd-7c05-6970-140bd1236cc4%40siemens.com.
