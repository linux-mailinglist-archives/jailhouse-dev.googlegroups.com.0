Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBEGI43UAKGQEWUTNXFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83e.google.com (mail-qt1-x83e.google.com [IPv6:2607:f8b0:4864:20::83e])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9EF5B47D
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 08:11:29 +0200 (CEST)
Received: by mail-qt1-x83e.google.com with SMTP id s9sf12562828qtn.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 30 Jun 2019 23:11:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561961488; cv=pass;
        d=google.com; s=arc-20160816;
        b=qoOEg3EHgcnU+HrYzdj4TRjVwnoA5FaB34ONDz/gPmvqUoT1STh+WWIigT4mO+5uiq
         6xJ+dawiWRkQqMeoEIN1FxPGWbp4phHuzuonMuDQwA5lnctWFZ3g5C23FG/b2n0yirXn
         7HaGCQvUAaQXR4cNrnE4PIOLZJmJIs8a97cYQsXiN864P8AnPBYC9mQcbaUiiVaCm6mh
         s6A03NoMZXiBJ7W7xmRxBioD3WS57klGFbaSGnH8muUuhnzumnm1aFT2OnVgdii/IwOx
         ElHbj2ONiBRzkD/nY0zHq5ETuTZyOQwRAyXZaVSn94Y5sK4DAL/UQJ4xxeyv5a9JmOaH
         o6Dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=6q48dUe7UdYxJCOsNQv9cjd7G9zltcXb+ZYR0H8pDbI=;
        b=K3xKfRmJAt1duDPHl74T/ATm5eiLPB+G2zd/21sV6qfzFzCnzPAmXmR4WAwRQsd1/9
         0weOJKSsWdKCFOVh0+Nt2/1ZC6OzYof4Pq2wWlD9YOJQWgobHlxZqFEciMnyj3/BnPwv
         EmGsKLjAeyUFrgmhg7kXTfC30Gn2lQZQFHxtBmxvwxJLFUi/B8KBmWKwt3uHwbrfnKlY
         eFSFCjkzCDc2MNWgtAxHXrDLsxkI8ZpCfbYLxudYMuQmLc9X3DY8ZsmX60BBrGvakTCh
         YoCFneCrqYYMa3z4enJM29Z/6j2wreGL6zE+BinSA2FcVdvhCdGDTo6EvARw2gWV5LMH
         BBWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FuZ+zHb7;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6q48dUe7UdYxJCOsNQv9cjd7G9zltcXb+ZYR0H8pDbI=;
        b=ZniEN6EhUwFmP38YIepo13df5EuyUuz1mH4xMQFe04eii8Um0S7G6djG0ILhg6+5wD
         o0xS75qLiPUfSzOeZS87AeEDMzaDubMVsy9fw9HpKNc0ujx5pE11Y1PxlLqDA96LRVL1
         ihLvIgQLdrmlm/3byc2/RMhWRtuKr2ouMYHEgPFEPD5hUREoy5O+39u99eWA4TahMJnU
         pqHSf7r8WytOuSPLkgALaPQfqjFIYVnNTTEhYBdexb2ahyMuk3fuCntIBBTnRlT1Dmpk
         rVCXSPMt4jvbdQfgkLbo/Ivx6mK35jgKnrAoBs3GWczqASR5rqzFJKjRYyHgIE5sZS/p
         5rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6q48dUe7UdYxJCOsNQv9cjd7G9zltcXb+ZYR0H8pDbI=;
        b=rq3LqB+95kcq9aJawAKLKt8zE11iG3kOBhmG6+pfNIwjaXskODWtVZQB3NFWLV7FpZ
         7GENDHNXZ28g9DGFw7LwvmQb+qcxDEyDGMumS+wHjnMAZKgf8TMrCuVGsWwXsTbtGT8k
         DrDK80uu5jsVBKb2fSXaHYepmq2grMuZnjj5A2f024jYIkVAhJcWWi0SPDNerqifQ+BN
         9TXhO1qPU3N4TEJ3vLJA/T+SKnTAM/ERYzNCPlfogi1xsNNlhGQdWoxR48wCeG2+adXp
         BlKvmYF8GMSRRTjrs+V1gtVYAysxQGdQ0BDx52Ni3vsFP7KwSKpDTzYaI9WEcOCeCTAG
         3/bw==
X-Gm-Message-State: APjAAAXFojbdAuMcZQ+S17DyQfuPwoVUMFf+/kAulPulOIItXiZfhSAq
	/t7H5kBj5/dZvn7kv7RJDBc=
X-Google-Smtp-Source: APXvYqw4QK2rscSzp7xahLRcs3d59+n0fx94P9HomDafZgc/FD4zMjO62Dbjb1Foqa51MwdXJhJDxg==
X-Received: by 2002:a37:9904:: with SMTP id b4mr18442373qke.159.1561961488535;
        Sun, 30 Jun 2019 23:11:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:818:: with SMTP id u24ls2405539qth.5.gmail; Sun, 30 Jun
 2019 23:11:28 -0700 (PDT)
X-Received: by 2002:ac8:18fa:: with SMTP id o55mr19160632qtk.275.1561961488216;
        Sun, 30 Jun 2019 23:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561961488; cv=none;
        d=google.com; s=arc-20160816;
        b=d0hRbSATMS1a3b+jkLX5q+NnTGljYoiKJtEZagrLIqz2s7fTDBPeotpGcIy2pVlt04
         rftS1FQUYKxSZxpqpnUUVxIB8NL0CsRoJxyAH//11aTG7P5VMOH2cEVkEbpzbfWNY5js
         LGY+q1IrBVX0Pa2JfLqiAnzu2N/5kyq84svR5dGkZ4JJBLSJcMPkF2xcP5xF0xIdj5aN
         2+EGwDJLE25oHwjY6+uZISZJao8tYddxayO/CzRs4lmUB5DnKZNFLrUEzZvfZ4TEsoA3
         WwoJtOKFRD2EQjExrdD3/GklsF4ranaJRYl9y5+Z13mdzW4OMzXrF42ZgKK5kLaB94Bg
         oWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=+2WcayEO7k4WY92BBi5a0vUyy/KRxAejw/Pnd3KzaOg=;
        b=lVZI7Bkidl39hEKPfwor2mHSIZjda4W1CgsG19SGQwBtC1MJpvtD7z4N8D2oI9WO8t
         d9x7VYic+AWmH3tv5o7ZNUBPDMlYx7gydyaPt/EPubQ7EesU9UNHq5+1oeHNAvmLMvZm
         miQpx8ZAdu8RBS73brjMoXoFqW8G6BrL+qr+XtaH9JCiwDvyHNNMMND+TQKRcZVXOPKX
         3/EtSinHGt5QxJmRAjNGtein8ECrtfeHtnRdMzwO4hjji4DJQNmmAdRLT+K7QqyKdX3z
         peRZHv6YIYImhLbo6SCYlpKQ9qEyC+GMa5zGP8tm0rvD5Vfod6ckyMOLJtAbx3R1t232
         YutQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FuZ+zHb7;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id o6si342358qtj.3.2019.06.30.23.11.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Jun 2019 23:11:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x616BR0v070699;
	Mon, 1 Jul 2019 01:11:27 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x616BRxl025236
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Jul 2019 01:11:27 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 01:11:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 01:11:27 -0500
Received: from [172.24.190.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x616BPXP014260;
	Mon, 1 Jul 2019 01:11:26 -0500
Subject: Re: [PATCH] core: Fix aligned_start calculation in
 page_alloc_internal()
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <nsekhar@ti.com>
References: <20190628153601.20850-1-p-yadav1@ti.com>
 <75aaa37a-7df3-794a-6372-5db258137555@siemens.com>
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <2ccad38a-5696-967e-2363-4410849dab17@ti.com>
Date: Mon, 1 Jul 2019 11:41:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <75aaa37a-7df3-794a-6372-5db258137555@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=FuZ+zHb7;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted
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



On 28/06/19 11:31 PM, Jan Kiszka wrote:
> On 28.06.19 17:36, 'Pratyush Yadav' via Jailhouse wrote:
>> Right now, page_alloc_aligned() can fail to give aligned pages when more
>> than one page is being allocated. This is because the aligned_start
>> calculation is flawed.
>>
>> Taking an example from a test case, let's say 8 pages need to be
>> allocated. This means an alignment of 15 bits. The mask here is 0x7. If
>> the page pool's base address is 0xffffc021f000, this gives us
>> aligned_start =3D 0x7. This start is clearly not aligned at a 15 bits
>> boundary (3 bits after shifting by PAGE_SHIFT). It is exactly the
>> opposite. It will never be aligned except when the page pool start also
>> happens to be aligned at that boundary.
>>
>> In the above example, the address of the pointer returned was
>> 0xffffc026e000 which is clearly not 15-bit aligned.
>>
>> This change fixes this problem. First, zero out the mask bits. This
>> makes the address less than the pool start, so add mask + 1 to it. Since
>> zeroing out the bottom mask bits means the maximum reduction in the
>> address can be mask (when all those bits are 1), adding mask + 1 means
>> the resultant address is always greater than page pool start. In fact,
>> it is the first aligned address after the pool start.
>>
>> This calculation fails when pool_start is already aligned. It gives
>> an aligned address, but it is the first aligned address after
>> pool_start, not pool_start itself. So don't do anything in that case.
>>
>> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
>> ---
>> =C2=A0 hypervisor/paging.c | 18 +++++++++++++-----
>> =C2=A0 1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/hypervisor/paging.c b/hypervisor/paging.c
>> index 16687a89..5f5d0066 100644
>> --- a/hypervisor/paging.c
>> +++ b/hypervisor/paging.c
>> @@ -105,13 +105,21 @@ static unsigned long find_next_free_page(struct pa=
ge_pool *pool,
>> =C2=A0 static void *page_alloc_internal(struct page_pool *pool, unsigned=
 int num,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long align_mask)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 /* The pool itself might not be aligned as required.=
 */
>> -=C2=A0=C2=A0=C2=A0 unsigned long aligned_start =3D
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((unsigned long)pool->base_a=
ddress >> PAGE_SHIFT) & align_mask;
>> -=C2=A0=C2=A0=C2=A0 unsigned long next =3D aligned_start;
>> -=C2=A0=C2=A0=C2=A0 unsigned long start, last;
>> +=C2=A0=C2=A0=C2=A0 unsigned long aligned_start, pool_start, next, start=
, last;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int allocated;
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 pool_start =3D (unsigned long)pool->base_addr=
ess >> PAGE_SHIFT;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* The pool itself might not be aligned as required.=
 */
>> +=C2=A0=C2=A0=C2=A0 if (pool_start & align_mask)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aligned_start =3D (pool_star=
t & (~align_mask)) + align_mask + 1;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aligned_start =3D pool_start=
;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* We need an offset from page pool start. */
>> +=C2=A0=C2=A0=C2=A0 aligned_start -=3D pool_start;
>> +=C2=A0=C2=A0=C2=A0 next =3D aligned_start;
>> +
>> =C2=A0 restart:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Forward the search start to the next a=
ligned page. */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((next - aligned_start) & align_mask)
>>
>=20
> Good catch! Can be done a little bit simpler, though:
>=20
> aligned_start =3D ((pool_start + align_mask) & ~align_mask) - pool_start;

All right, I'll send a v2.

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
jailhouse-dev/2ccad38a-5696-967e-2363-4410849dab17%40ti.com.
For more options, visit https://groups.google.com/d/optout.
