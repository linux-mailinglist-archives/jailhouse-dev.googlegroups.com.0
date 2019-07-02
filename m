Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBB24U5XUAKGQEI24LAOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D99D5CF34
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 14:13:32 +0200 (CEST)
Received: by mail-qt1-x83b.google.com with SMTP id r57sf16066943qtj.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 05:13:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562069611; cv=pass;
        d=google.com; s=arc-20160816;
        b=f2O098dGRX/Ve+YML6imSX9tVk+4b8a4jAivtIa6uTaKCwca28w2Juop74b/cT8xgE
         rnLfVuKFx+6xyDjWuFEGTTUN8ZDUCoRr+DI5wnV4JzrXYIXlQMIC3zm3SuPyn17U/GJM
         IN+y/DHhlzeFEmMv5fEG4fYv2P7ZtKqx/qRHfv5oe+ktf8imGSWzioB1+iNIIC63YzhE
         huhKDsDWhtkfht8ZqrDiemRCBFNslEI+3sGV5bijcyTv3rUlGxOpq60XLkSktbpbuW8q
         4ixqB1tyN6mzuKh1yF14HcGOVX+MxNY4/+2l6TYUGoWGFUI2E0omEIshXImlJT0uW1km
         tRtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=oXNjmR3Sw0tN4x0f8SF4Wanapf35jb7ldMlNJiF4LCM=;
        b=bHqAK5ny0oqFdSyXz90mzuXs1DchFY9RJsZmwZ/OqHoXsqAnu3cDQKWnGhnaYHoX2R
         n5bhX7QPlZ/zz29JJ+PvCYA/NKXwHe5eLL9u5IWb/beOCdlN/guZpSQ5cqVQ9IYw0Esf
         k5QlFmfAg1YWnRNzqT0B9B2QfhrhF2QpP0rXeb3/xSGg3/+4VKknGVYS2RVrC8Ovk5aO
         TvCepQJd51/QUhAiXau9JVDiGXOrWjR34INT84Vj+L3kd+1GxwAcMBbWPDz4cw44ySIG
         V3P9k/6aiwnRq0ehRtBf0xLwJ4IG4kWFLiuNiO5XSlNBwzll9/7F5Gzb/LZZ1QOR3+TB
         bFnA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DzZd4jg5;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oXNjmR3Sw0tN4x0f8SF4Wanapf35jb7ldMlNJiF4LCM=;
        b=IzVqaVHWZWU3G4EiWc3Rz1F3STnyN5s0RuibFgStvYA/l2APRT7QJgwV3ZqGCeNn1O
         mdj4miJPhmz1V7KUk6iJ418fVHUPlg6bCdyEiFLtl1F7fm2ZjDVfsEeyRb4rN5iEodjs
         ALrvQIgri1zrBjG8KRCSghju3b4CXkdhrblxKOC/QZrLBdNPehPbG/6inWWVCP5dFnVr
         ZX6lezhs2wYUG9G4A1YO5KmM5Lgrx1Uk2xy9SyPcWqKttf0NhMIjR+ZeA1sdsrR3YdW9
         Junyk4QVH7nGwoIs17ZiAbyKSS5xjrfSaMiGU9jpt/3aYHKodwwUp2Ju+Ue+teTHXZr9
         psMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oXNjmR3Sw0tN4x0f8SF4Wanapf35jb7ldMlNJiF4LCM=;
        b=sXIM+209Z8ssxZ5YMCHcDBNlypQqLJWR+qgvk4MEyctAXJD43iG65Znun9Aaoriash
         dfz43uHsJraK6Lv6MNLS2cO6Y0MKjRUPHWQNq2XCMRoRbzSeQnh4Eb7NEA+I8cyF40J/
         MJ1GH3qvXGEbOoKnIdlgS8VwrQczmx6qY/3wz3c05P99u1b+cFjUqlekYJZQqxGOyHny
         4wJ0Q59T5fNIF9ZS3Z9QStmVPTaF7AKOtKWgdoDWjjbsnzeNk3pSe8+qXvo7ZLtOlcJA
         oi84aDUiezSRCE4bgma0sFxaVv0/2PA9wSl3Aun08RR688xsBrXKa9dXc90vuHqbplEZ
         6nsA==
X-Gm-Message-State: APjAAAXccyVhireE0N/Tj3hS32ypA/a1/somC06jIOEjWffOdRTvAbKP
	5u2Fef5FmJdqzHF3WkVElF8=
X-Google-Smtp-Source: APXvYqzgz9CUfOUorIvsnNjD6in6gQ9ohY+KAIAQe2Pu5RpdbyWNqnp0SgjjG/TTSATlYHj6qcUcmw==
X-Received: by 2002:ac8:319d:: with SMTP id h29mr25314574qte.6.1562069611643;
        Tue, 02 Jul 2019 05:13:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:4e4c:: with SMTP id c73ls4594704qkb.3.gmail; Tue, 02 Jul
 2019 05:13:31 -0700 (PDT)
X-Received: by 2002:a05:620a:482:: with SMTP id 2mr24870186qkr.479.1562069611357;
        Tue, 02 Jul 2019 05:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562069611; cv=none;
        d=google.com; s=arc-20160816;
        b=CdnihRnjFFxfra9lJn7RytNHOP4/YdnidXacn+SA7sewObY1YU1BlssTYQ8l/Xw0/T
         lmPRoFMTzAD/jLYWuRljiFqSpSFkmzgh6RasOhPkJnhL0Fr3I1wJrTFAdNreunO92/Yj
         h0iRTNn/TaONM/7KUpANY3OJgeW3uycDP7KrTfS+nXNxS3MbuXQY16wMbMt35RHieK1E
         Wu3BPlFW9sDGRBtFtYgPbJcZdSysghCwjqb7dFCb075EZDx4HIG/2fmQ3x04pUMxdTf+
         jj83CiiApfa3W5GJGNpC93s7/BP7uPPMh4N8YimJh+o7tm1EIEM6+Xr3WyBBagIgiT2l
         fEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=hC8cdaAk6fgxo7py5Y0VNgV6Nwkd7gqaLST3X7jx6Hg=;
        b=OZMkuh0AWazg2tjjch/YjKkh+u0D0eExThDo4CL2JYTE61izjtOzG/ZMKJe7FU5OcW
         8F2SciRvt2r9puL9t1ffR9chSVwl6/u+VV4wU2kxamlqVgkuumz6mMGccCf6TmfqgeWl
         9RWrffoIqD26j47z7c/RpMdvvqlJVsrmbr2DGBy+81d50Wa7rUFvXZGOnLXwccuNFwML
         YqUMSLXjupIdHwT1quIN6tzmYV9ObgkXxTjENfhbyfKprMqeRvWGVrz7a1VDbPNJ+txI
         4VPIjYdNCMi5ozY1cjAMENU+p6sprNoAIE2PmxSCRsiOYLWitETQL3TIS2aUY9JXymYp
         dETA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DzZd4jg5;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id c188si698719qkb.2.2019.07.02.05.13.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 05:13:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62CDU4Z047479;
	Tue, 2 Jul 2019 07:13:30 -0500
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62CDU2a080423
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Jul 2019 07:13:30 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 07:13:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 07:13:30 -0500
Received: from [172.24.190.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62CDSg6114080;
	Tue, 2 Jul 2019 07:13:29 -0500
Subject: Re: Locking pages allocated via paging_get_guest_pages()
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <dfdf9509-c3e4-e700-e3f7-56cb1e189048@ti.com>
 <d14057fa-470c-5347-cf1c-9816694aab85@siemens.com>
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <6a5bfa46-03a8-caf0-1636-45f9f10f7f64@ti.com>
Date: Tue, 2 Jul 2019 17:43:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <d14057fa-470c-5347-cf1c-9816694aab85@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=DzZd4jg5;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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



On 02/07/19 5:26 PM, Jan Kiszka wrote:
> On 02.07.19 13:50, Pratyush Yadav wrote:
>> Hi Jan, all
>>
>> The pages mapped via paging_get_guest_pages() are mapped on TEMPORARY_MA=
PPING_BASE, and the mapping is over-written when another call to the functi=
on is made. This produces a race condition when two cells have two drivers =
calling this function. If one driver is not done using the mapping, and ano=
ther over-writes it, bad things could happen. Of course, if it is the same =
driver in both cells, you could use a global locking construct for it, but =
neither is this a very clean fix, nor does it solve the case when two diffe=
rent drivers are in play.
>>
>> One alternative is to lock TEMPORARY_MAPPING_BASE until a release functi=
on is called to release that mapping (using, say, paging_release_guest_page=
s()). If the base is locked, the call to paging_get_guest() can block. This=
 is problematic when the locking is too long. Another option is to return N=
ULL when the base is locked, and then it is the driver's job to re-try.
>>
>> The second alternative is to do away with TEMPORARY_MAPPING_BASE entirel=
y, and use the remap pool instead.
>>
>> I personally like the second alternative better.
>>
>> Either way, all code using paging_get_guest_pages() needs to be updated.=
 Luckily, it is only used in a handful of places so it should not be too di=
fficult to update.
>>
>> Thoughts on this problem? Any better ideas than mine?
>>
>=20
> I think there is some misunderstanding how mapping in Jailhouse work:
>=20
> paging_get_guest_pages() requests temporary, per-cpu access to some guest=
 pages in order to process a guest request synchronously. When returning to=
 the guest, that mapping becomes logically invalid, even if it may stay act=
ive until some other call to paging_get_guest_pages() on the same CPU. This=
 pattern both avoids locking needs and exposing information to the hypervis=
or that should not leak to other cores and, thus, potentially other cells.
>=20
> Mapping things to an address from remap_pool is to expose hardware resour=
ces permanently to the hypervisor. That is done during setup, not during ru=
ntime. Thus, no locking is needed here as well.
>=20
> Now, how do your needs not fit into this model, and why?

Yes, there indeed was a misunderstanding. I thought the mapping was for all=
 CPUs, not per-CPU. The current implementation works fine in that case.

> Jan
>=20

--=20
Regards,
Pratyush Yadav

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6a5bfa46-03a8-caf0-1636-45f9f10f7f64%40ti.com.
For more options, visit https://groups.google.com/d/optout.
