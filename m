Return-Path: <jailhouse-dev+bncBCD5HYFFQEERBFWSZP2QKGQEKI27UMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 805251C76C2
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 May 2020 18:43:03 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id q2sf438262ljq.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 May 2020 09:43:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588783383; cv=pass;
        d=google.com; s=arc-20160816;
        b=XY1UZuU5k0Klx3XXvcDt8s1YyfDElaVMBWiKKWILse/bB3gIyF6DzSPjfTEoU6R8YY
         S6ocBJEFzKqA3iMO6Stupijbi/N8yeHy/BEzdrjRHtZzl+6CngupyfclKP5/WU43TiJ8
         HmkqPYBgqTHQBHO1HXK6sM7uTCJ+r1yUrqOt8DsIe0MBva1XIhxB15bN/9WB+PbnkpGL
         0hgsr0nqvx5dpUigCIR+3E4ufu38tx6ASLKNUrEZq+8Yq5x/pAuvlMe9U3LztuxFmoGd
         Ps3E/v99f+OQcBr7CVmevoPKQOgZTC7geej79phQqLKlP4dswEo73lIGhrmksViJmsfv
         pgmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:mime-version:user-agent
         :date:message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature:dkim-signature;
        bh=vZ2IWI/k4qZa4EahwhPSNTvUQYvuitE72QlYYtVYq6M=;
        b=QbaXJAMbYp9aMqF3lGyRiL6y0lrZGU9vLmqSXbt9B3klAAuvlt7uF2y4AeTHZeu/Hg
         gFMSGgKz/aAXnI+4ESYBQ2OaxQmKl27+a7EkigT941UKJXu7AhgMod/g55bhuEQbdnuR
         yyDV1KvzxD9tL7/MnvrnyL0T7VNWjph0YT31IKsTSxNxfoqH2eyj2s2LbJUC9fakNuNt
         kkYFwWMuKh92gj+mY6Nadf6Ho4yxgJO5b9THPBIZNas4EH8YsMxGywGODYbZorxMMufg
         UazZPgNCrNy/yuO9KtE+NI3s2pjkxkWP3GpveMh9i71/Gjnw2PHepshfvpmzkT72q3yy
         Jbfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RFHdf3Li;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::342 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vZ2IWI/k4qZa4EahwhPSNTvUQYvuitE72QlYYtVYq6M=;
        b=gi4N10//wTtoBRD7ILazx+7stjFZ4eIsz36CATZOW28n9Af+xj26w8krycKG5nDY1J
         buDJrxISme8FL3twMKBMCwYaAem2r5j98e1Ruv+quN1NbM+8yE/wKa5Pq0DHw3Ybxg9l
         1gtA0RbYPNyhtS4pklfmpurDXEaZXbIrPhUYeEQxLRBIOzwrn/R9GRAVJymXnm1qavMg
         53F+9rBe5QUckJrChhd1/mVBR9Yvq6PjSYuMzvWB2GREnRxZuo7KOg++j7+zosdk2Xz0
         uUs4SNf/yUvVxx8FREkPUGzSDpn9r7mKumGXVIfyBpHv0C0TRUi+tHE0Sl1CAW9In6DL
         aKFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vZ2IWI/k4qZa4EahwhPSNTvUQYvuitE72QlYYtVYq6M=;
        b=RpFWhxhYM6yF/4fd558HwTSeTAbrwh8kDE+pfminxEit9BUTLx9W2KWxcFhZjph/sX
         1jksOdLWMgAX85QJxOj/g8AGJ2T6X8c6cFi8C7RypZ3WWmyL21TAVYhtr8+sf9/vQSh+
         UPlJD4uBFoPEkIbmlAA4tQ64CyagWf2tx+saAltJdlj5G/l5n/y6cOqZUpNBQKH3OgzD
         x8VP6mSIpIficgQZpq/Dqb0+bdCbUtDbKaCqbSn0GyWM3aeRsqJW4jNIx1bhTl2H0YQi
         bViYKTvOeU5H7fqqa4eWvc4ajthsTVNyXuTzKhyhaZcfbPLvkokeTFHa7BX1wOL5/ors
         MIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vZ2IWI/k4qZa4EahwhPSNTvUQYvuitE72QlYYtVYq6M=;
        b=KNIUR91Yckg6zf7rQWhC4eUjAWBWr5EJQWyI3d1laeHYaY86VPBfLrnaLvrODweDVJ
         +u6jFFid1BC3ZBBaJqFpP81EBaXwYyByVib5cLGlShck1TlySVYi31aqR7EzF3BJSH5H
         3xv3Ydd2QU55GOqmDx71uSzly6zuVWK35WIxrk77b4EqPSi5asScEwHHWoXDQtBoDHPM
         jhgIUQrVsbRxGe8+2zEOXNahj8DumH+v/xUkh+r+DEoWoPXFs/nGY6wvL3pBOQLtWaDy
         aJKuLcR9KrfKmlfztvECgvBoLSg9FjtOv8LEvbgbm3KHmwjLDUQnIinRSWWcwOVjNoXk
         ZoZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYhe0ebnzr9BRGZnni18HQ6kaVkRZ8ympxt0cwLJNb/V/a4f87n
	QujBFAkOX50cmDwmdQnTX3U=
X-Google-Smtp-Source: APiQypK9dHK2ybKubAp5ahcMnw/7S94o3sYyL+giRgtl0fBsCw/IS+NwkGicN2wWrVidZuITCfSsJw==
X-Received: by 2002:a19:5f04:: with SMTP id t4mr5888774lfb.208.1588783382965;
        Wed, 06 May 2020 09:43:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:852:: with SMTP id 79ls463972lfi.8.gmail; Wed, 06 May
 2020 09:43:02 -0700 (PDT)
X-Received: by 2002:a19:f815:: with SMTP id a21mr5781679lff.155.1588783382127;
        Wed, 06 May 2020 09:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588783382; cv=none;
        d=google.com; s=arc-20160816;
        b=KVnGdBKQG99UY+UXIltjDqFkbzzCx+hlqE80O1YnvpBLS6EOTQgdo/6DQZe9o/i00/
         PhrQJZFiBfaNPtVz6ASyim8XG+V59pn12FlOX8LdEsTyNA1Bz+/K9OGr6kTO9cfCUm/C
         lh4s6QwiEHIvS3wrWJTtFjX0F66Nnf6v5q724lqHN/FfK4/0gS/piq/XJMpBHjwd8ggT
         WoFhxYfktpVKmCUNiuicxt5CEg+C/GcS/k8eYhpbXofzUu0k1pfgmlY77W/l9oigtYXG
         d1JO3kB6ECztjsnPMRzxYYY0yZf2cNoYFfL2KqCsIC5d11iWjfmIu3lU1ceZwZQUsoGu
         bCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:autocrypt:from
         :references:to:subject:dkim-signature;
        bh=tPX8DHPmd5UKz7Wq+e8MPuqaBI8mY59QNVTHZtaHlKE=;
        b=Uw7b/fivp8Ok2wOFxDWvhPEcVFZCpyP7xFy1SIOVfvfyjqNxoi6ll8Jh6iO6jTv2UL
         edINOwq+v9REIqORn/zSE0ZdoVez8rce0uBvW4mhOEgXogLDOY32L2Vx0mFYQPAFBy+w
         dMvwd2faQK9+48l4ZOXQnsfQynPALFcpGT/CV/QdpkLNGe6c9+lyoPdAXpBw+5mdNKHX
         QlcTjjr1YPHacmHtSO/Q67CZjC19ZYxVuuE25ZssgzF5hYYIQghY92wuISHPmzWDniw3
         OQ2f4hmfnGYJiAAbD1EQfBJsYMn31WkUb3q9fzntZcdxXsh6uMOaNDdBQV5ZPHWGjo88
         zGyw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=RFHdf3Li;
       spf=pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::342 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com. [2a00:1450:4864:20::342])
        by gmr-mx.google.com with ESMTPS id x16si132293lfn.0.2020.05.06.09.43.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::342 as permitted sender) client-ip=2a00:1450:4864:20::342;
Received: by mail-wm1-x342.google.com with SMTP id g12so3495061wmh.3
        for <jailhouse-dev@googlegroups.com>; Wed, 06 May 2020 09:43:02 -0700 (PDT)
X-Received: by 2002:a1c:3c42:: with SMTP id j63mr936403wma.118.1588783381178;
        Wed, 06 May 2020 09:43:01 -0700 (PDT)
Received: from [192.168.1.109] ([2.234.171.104])
        by smtp.gmail.com with ESMTPSA id h74sm3099618wrh.76.2020.05.06.09.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:43:00 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] hypervisor, arm-common: add initial support for
 cache coloring
To: Jan Kiszka <jan.kiszka@siemens.com>, Marco Solieri <ms@xt3.it>,
 jailhouse-dev@googlegroups.com
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-5-ms@xt3.it>
 <2bec9973-da05-eca5-5afd-2908762c20aa@siemens.com>
From: Luca Miccio <lucmiccio@gmail.com>
Autocrypt: addr=lucmiccio@gmail.com; keydata=
 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
Message-ID: <3b5fe52b-9c01-2849-1d4f-a4b674b393b7@gmail.com>
Date: Wed, 6 May 2020 18:42:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2bec9973-da05-eca5-5afd-2908762c20aa@siemens.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ih49Ick6aSsz2ypp0jMgKRR3TELO8xdzp"
X-Original-Sender: LucMiccio@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=RFHdf3Li;       spf=pass
 (google.com: domain of lucmiccio@gmail.com designates 2a00:1450:4864:20::342
 as permitted sender) smtp.mailfrom=lucmiccio@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ih49Ick6aSsz2ypp0jMgKRR3TELO8xdzp
Content-Type: multipart/mixed; boundary="p2Wj0hozWPkiEedD24uqeGefjzHyV9g7h"

--p2Wj0hozWPkiEedD24uqeGefjzHyV9g7h
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 5/4/20 8:33 PM, Jan Kiszka wrote:
> On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
>> From: Luca Miccio <lucmiccio@gmail.com>
>>
>> Use a bitmask array with fixed size for the cell's color assignment.
>> The largest amount of shared last-level segment cache equipping an Arm v=
8
>> cluster for the embedded segment (i.e. Cortex A5?, A7?), which contains
>> up to 8 cores, is 8 MiB with 16-ways associativity.
>> Now, assuming the coloring algorithm to be the same as we support, i.e.
>> smallest granularity with 4 KiB pages, we compute that up to 128 colors
>> available.
>> For this reason set the amount of colors supported to 128.
>>
>> Colored regions defined by the flag JAILHOUSE_MEM_COLORED are mapped
>> using the "colored" version of paging_create when needed.
>> The colored version of paging_destroy is used only when unmapping from
>> the root cell since we are assuming a 1:1 mapping for it.
>>
>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>> Signed-off-by: Marco Solieri <ms@xt3.it>
>> ---
>> =C2=A0 hypervisor/arch/arm-common/include/asm/cell.h |=C2=A0 4 ++
>> =C2=A0 .../arch/arm-common/include/asm/coloring.h=C2=A0=C2=A0=C2=A0 | 22=
 +++++++
>> =C2=A0 hypervisor/arch/arm-common/mmu_cell.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 62 ++++++++++++++++---
>> =C2=A0 3 files changed, 79 insertions(+), 9 deletions(-)
>> =C2=A0 create mode 100644 hypervisor/arch/arm-common/include/asm/colorin=
g.h
>>
>> diff --git a/hypervisor/arch/arm-common/include/asm/cell.h
>> b/hypervisor/arch/arm-common/include/asm/cell.h
>> index 9c6e8c6f..c5159b46 100644
>> --- a/hypervisor/arch/arm-common/include/asm/cell.h
>> +++ b/hypervisor/arch/arm-common/include/asm/cell.h
>> @@ -14,6 +14,7 @@
>> =C2=A0 #define _JAILHOUSE_ASM_CELL_H
>> =C2=A0 =C2=A0 #include <jailhouse/paging.h>
>> +#include <asm/coloring.h>
>> =C2=A0 =C2=A0 struct pvu_tlb_entry;
>> =C2=A0 @@ -26,6 +27,9 @@ struct arch_cell {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 ent_count;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pvu_tlb_en=
try *entries;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } iommu_pvu; /**< ARM PVU specific fields=
. */
>> +
>> +=C2=A0=C2=A0=C2=A0 /** Color configuration as a bitmask */
>> +=C2=A0=C2=A0=C2=A0 unsigned long color_bitmask[COLOR_BITMASK_SIZE];
>=20
> This field can become generic...
>=20

Yes, I agree.

>> =C2=A0 };
>> =C2=A0 =C2=A0 #endif /* !_JAILHOUSE_ASM_CELL_H */
>> diff --git a/hypervisor/arch/arm-common/include/asm/coloring.h
>> b/hypervisor/arch/arm-common/include/asm/coloring.h
>> new file mode 100644
>> index 00000000..9404948f
>> --- /dev/null
>> +++ b/hypervisor/arch/arm-common/include/asm/coloring.h
>> @@ -0,0 +1,22 @@
>> +/*
>> + * Jailhouse, a Linux-based partitioning hypervisor
>> + *
>> + * Copyright (c) Universita'=C2=A0 di Modena e Reggio Emilia, 2020
>> + *
>> + * Authors:
>> + *=C2=A0 Luca Miccio <lucmiccio@gmail.com>
>> + *=C2=A0 Marco Solieri <ms@xt3.it>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#ifndef _JAILHOUSE_ASM_COLORING_H
>> +#define _JAILHOUSE_ASM_COLORING_H
>> +
>> +#define COLOR_BITMASK_SIZE 4
>> +
>=20
> ...while this is probably arch-specific. But could start with a generic
> define as well split that up once some arch with a different need comes
> around.
>=20

Considering my comments on previous patches regarding the architectural
independent coloring interface, I will use this as a generic define for
color_bitmask.

>> +/* Max. number of colors supported */
>> +#define MAX_COLOR_SUPPORTED=C2=A0=C2=A0=C2=A0=C2=A0 128
>=20
> MAX_COLOR_SUPPORTED =3D COLOR_BITMASK_SIZE * sizeof(u64)? Or should
> COLOR_BITMASK_SIZE be rather derived from the number of colors? But
> those depend on each other and are not separate tuneables.
>=20

Yes, MAX_COLOR_SUPPORTED =3D COLOR_BITMASK_SIZE * sizeof(u64).

>> +
>> +#endif /* !_JAILHOUSE_ASM_COLORING_H */
>> diff --git a/hypervisor/arch/arm-common/mmu_cell.c
>> b/hypervisor/arch/arm-common/mmu_cell.c
>> index db618960..912d9399 100644
>> --- a/hypervisor/arch/arm-common/mmu_cell.c
>> +++ b/hypervisor/arch/arm-common/mmu_cell.c
>> @@ -13,6 +13,7 @@
>> =C2=A0 #include <jailhouse/control.h>
>> =C2=A0 #include <jailhouse/paging.h>
>> =C2=A0 #include <jailhouse/printk.h>
>> +#include <jailhouse/coloring.h>
>> =C2=A0 #include <asm/sysregs.h>
>> =C2=A0 #include <asm/control.h>
>> =C2=A0 #include <asm/iommu.h>
>> @@ -46,8 +47,29 @@ int arch_map_memory_region(struct cell *cell,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 err =3D paging_create(&cell->arch.mm, phys_st=
art, mem->size,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mem->virt_start, access_flags, paging_flags);
>> +=C2=A0=C2=A0=C2=A0 if (mem->flags & JAILHOUSE_MEM_COLORED)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /**
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Identity mapping is =
necessary only when remapping to the root
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * cell during destroy =
phase. To check if we are in the destroy
>=20
> I'm not yet sure if I get that case complete: When a cell is destroyed,
> the root cell should get access to those resources it had before the
> cell was create. In case of colored memory, this would mean:
>=20
> =C2=A0- the root cell had a colored mapping over the respective memory ra=
nge
> =C2=A0- the root cell had the colors that were later assign to the non-ro=
ot
> =C2=A0=C2=A0 cell
>=20
> Now, if the latter case is true, colors will move back to the root cell
> (not yet sure if that is actually the case with your design, but it
> should be). Once they are, mapping a region back to the root cell will
> "magically" establish also the stripes that used to belong to the
> non-root cell.
>=20

In this design root cell has no concept of "color" and it has no color
assignment either (yet).
During cell create the hypervisor removes the memory assigned to the
inmate by using the paging_destroy_colored, so only the correct pages
are removed from the root cell.
During cell destruction the hypervisor needs to remap *only* the pages
assigned to that cell and since the root cell is 1:1 mapped we need to
create a mapping that is strided both virtually and physically. That's
why we have the identity mapping argument. This will "fill" all memory
gaps created before.
If I got your point, you said that we can remap the whole memory region
to the root cell. Am I right?
In that case, yes we do it but, as I said, we need to do it with
paging_create_colored and identity map enabled.


>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * phase the control is=
 made on the memory virtual start and
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * col_load_address. We=
 cannot have a scenario where these
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * addresses are equal =
because:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 1) virt_start =3D=3D=
 phys_start.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 2) we assume that co=
l_load_address is configured so that it
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * does not interfere w=
ith memory layout.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 3) if col_load_addre=
ss is equal to phys_start there is a
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * wrong root-cell conf=
iguration.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * It means that in the=
 previous wrong scenario col_load_address
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * overlaps some root-c=
ell memory space.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D paging_create_colore=
d(&cell->arch.mm, phys_start,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mem-=
>size, mem->virt_start, access_flags, paging_flags,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cell=
->arch.color_bitmask, (cell =3D=3D &root_cell) &&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (mem=
->virt_start !=3D
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 system_config->platform_info.col_load_address));
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D paging_create(&cell-=
>arch.mm, phys_start, mem->size,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mem-=
>virt_start, access_flags, paging_flags);
>=20
> BTW, the good thing about having a generic cell->color_bitmask would be
> that this field could be fully populated by default, and we would no
> longer need to differentiate between colored and non-colored here.
>=20

Yes, of course.

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iommu_unmap_memor=
y_region(cell, mem);
>> =C2=A0 @@ -63,8 +85,19 @@ int arch_unmap_memory_region(struct cell *cell=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 return paging_destroy(&cell->arch.mm, mem->vi=
rt_start, mem->size,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGING_COHERENT);
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Do not be confused -- since paging_destroy* =
acts on virtual
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * addresses, paging_destroy can be physically =
colored, too.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * We need to destroy the mapping using colorin=
g only when unmapping
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * from the root cell during cell_create so tha=
t the correct
>> regions are
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * removed and then used from the cells.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 if (mem->flags & JAILHOUSE_MEM_COLORED && (cell =3D=
=3D &root_cell))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return paging_destroy_colore=
d(&cell->arch.mm, mem->virt_start,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mem-=
>size, PAGING_COHERENT, cell->arch.color_bitmask);
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return paging_destroy(&cell-=
>arch.mm, mem->virt_start,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mem-=
>size, PAGING_COHERENT);
>> =C2=A0 }
>> =C2=A0 =C2=A0 unsigned long arch_paging_gphys2phys(unsigned long gphys, =
unsigned
>> long flags)
>> @@ -91,10 +124,20 @@ void arm_cell_dcaches_flush(struct cell *cell,
>> enum dcache_flush flush)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NUM_TEMPORARY_PAGES * PAGE=
_SIZE);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* cannot fail, mapping area is preallocated */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pagi=
ng_create(&this_cpu_data()->pg_structs, region_addr,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size, TEMPORARY_M=
APPING_BASE,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_DEFAULT_FLAG=
S,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGING_NON_COHERE=
NT | PAGING_NO_HUGE);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (=
mem->flags & JAILHOUSE_MEM_COLORED)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 paging_create_colored(
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &this_cpu_data()->pg_structs,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 region_addr, size,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEMPORARY_MAPPING_BASE,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_DEFAULT_FLAGS,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGING_NON_COHERENT | PAGING_=
NO_HUGE,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cell->arch.color_bitmask, fal=
se);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 paging_create(&this_cpu_data()->pg_structs,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 region_addr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size, TEMPORARY_MAPPING_BASE,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_DEFAULT_FLAGS,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGING_NON_COHERENT | PAGING_=
NO_HUGE);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 arm_dcaches_flush((void *)TEMPORARY_MAPPING_BASE, size,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flush);
>> @@ -120,7 +163,8 @@ int arm_paging_cell_init(struct cell *cell)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!cell->arch.mm.root_table)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 /* Init coloring configuration of the cell */
>> +=C2=A0=C2=A0=C2=A0 return coloring_cell_init(cell);
>=20
> This is only added in patch 7.
>=20
> We should try to preserve bisectability whenever possible. Reorder or
> provide stubs so that things remain buildable - and also runnable!
>=20

You're right. I will avoid this in next v3.

Thanks,
Luca

>> =C2=A0 }
>> =C2=A0 =C2=A0 void arm_paging_cell_destroy(struct cell *cell)
>>
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3b5fe52b-9c01-2849-1d4f-a4b674b393b7%40gmail.com.

--p2Wj0hozWPkiEedD24uqeGefjzHyV9g7h--

--ih49Ick6aSsz2ypp0jMgKRR3TELO8xdzp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+VQtGnhP9TTQ2NnBI/rjb1Ch6KsFAl6y6RIACgkQI/rjb1Ch
6KvPAxAAgPmSLaZoxD4Fh3g4SuXJSuN8TS3C/6g+f2GIY+SSLJFmKx0h3qOIOqgE
29zhqi0g1N4/k/GrDAswXVe00AxePnR4FkT3M0Tdhy8d8eyjO9rtXWBHHLaQ/ghy
KlJYhDDEDJ3xK70mngYLkp5ZFP1VvRmSyDxS88lNdnX3IXoVqFpTLESR1gKlOhi2
/dwRAEAtOvbPLkKwZbW/8BKXGQk4bt7PzhmGLNeh7ycdkRY23aorv+oHI9GqJcl/
j9+Ai4XoHS0A9BqEliLloV3MqdmPe6PLM68qJmwB9e5im1mkFzPmm2gKWCPJARPW
Fu9yzWZv46ysDrJbwSUMM4XIxXkQTmOcno/zcRnhav9iYl1b54AcjvmNRBJSsTbP
qy0RcfQNADxbdbie9SyCdQ1aNy+UlOKK5kFjsVqmdDfyDPl2ztquJfQ49M04f9bN
X61a4+qiBOARdR1YsHVdz0IuLFjIoRg/3FQQ87zmYiPcuEFs+/v8E7ShJBWdLvWF
X2K33YUp3WFt1AOYmia8OBzrm3x/d8UOhd06ERC45Vy/EfwXrJUAg60eSGyNizMr
+w+dhXBApWk6dILEvRoJgg/ibwGbBrPH23YDQNP6owgq0GMqnJJI0SzB1XM2zzvb
08W7+7eyZXhnewiXsSGs3tY2ZYgcx/ltXcA3vJY+4jZe4AzNrlQ=
=+a4v
-----END PGP SIGNATURE-----

--ih49Ick6aSsz2ypp0jMgKRR3TELO8xdzp--
