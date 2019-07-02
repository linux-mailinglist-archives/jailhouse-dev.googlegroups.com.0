Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBHG25TUAKGQEIXGWOFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AE25CD54
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 12:08:29 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id z6sf15847630qtj.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 03:08:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562062108; cv=pass;
        d=google.com; s=arc-20160816;
        b=abp7/HjOKKtual50Qc9t/sGz3ANL7WeyUeoEEPpVq9yB1IljuG03eEU7qzzxgVLAXx
         WbBh+Mfmt6wT1110++QX/S3gT6QDue+zZ41pTaFlFMEVZg9oFEF4Ik1MmSOSwyt518tj
         EiJa3vqNejDTvawc6QArhHiLtj3jQt0h+pFAcIXfVad2eFqv3vWsydyEbJE+RSpKehk4
         /Lh18fYiR0kpPY1EgeynztD3s+mHUnp7wEpsJpN5dGVqtSw7xI+enqUpoB94QAZAQlqG
         hRxWlDaBxGJme4D1W8iKqvLmyyHIjv16C9+iN4Te7PeD1MBQ34TkI+5NPhGLVrJjMmAe
         h8ww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=FGaDKjunOOL5VU6pJ1pnxBchLm3D6D+eOswJ2ecm3QQ=;
        b=RhQPFuiHzwZm9BErDnI07UIlk9AGXhS9cgM/7pBI/ok+Y08Aj4tDAexNbU5PxgyA5J
         RuXFHAcFcVjU+qicA1HauzXRFrAptQuQouAsPwW98HbUEAc7JRFa43pQpd4EYwfnRIQO
         NqEIEl/5bKuu1wX8JHzxouYQDJPHbcoEcmgV3+ZEM/FJRUQWlt8HRbpaKdqt4Wkjuy5O
         gI0NKFx1NT4jt1eKnPZ9d3/S6NuP7ZrM6ype3Uf4PuftYVZrdksuBdq5p3pXOfKqy3RE
         bfU8lYXJ5li0UW7Y00MTMSFFWqX20Sdffk5BmIHQMm2y7qmCSYc6SDH+FTuHFEZibc3t
         9NuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="vN1LKSa/";
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FGaDKjunOOL5VU6pJ1pnxBchLm3D6D+eOswJ2ecm3QQ=;
        b=IgqxBWIbg8VVeKkerNv6JqZ2Q5fj4jF+zE0RBnIl1tYbpHy/t74Me2VRSgZBuiKQ5R
         KZj4wg1em6bzaQDFZQxtFfQhmuEKgIlQn+//uVp/5otPedVISj9B4NfqNw/Wu4/5nRcI
         vPcAWQqfef4FfnKzxlIC3wCzHQmwSfLyXfiIf3uP/NUOP1u9CjQt7Q0CMSsG5rSTCCWG
         d/kw+N1d/nBfPuYv55sclRSAoXjrpWmNodS+XmSMYGsvX32vLFbh6biyttMyDViL5G3C
         Whb5cuI3BMMFlf/jEH9TYjSbNLjBDfeyNH21fUwC/vICrg1HiPjDGV3xcF5MxLwxELqf
         bcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FGaDKjunOOL5VU6pJ1pnxBchLm3D6D+eOswJ2ecm3QQ=;
        b=BHNEzY9XV18EzKQAmcAi9h4PmLILkyHZjeGZKXPFPpRa+d8cQCRTWaU7VNsJoKG2SE
         b7kbc30XfD2wWpkkzntgxzdPyOnND+MpKzWegNxozk7IitYx79BL2RAIDL/nbPjMrIgU
         zda6Vxz75epfwr44twz9U9SC+F3AmKXTz/Oc9V5D1RRBDl08cU8RqgEVD44RLkj/WocK
         +hkWj+CU3xNTH9NR8pv4A0SUhFLEe0+NUvuADTJnnPmPhZh959Naq8JjsiCbkKiKd0Bc
         iPVQi4kfdNZm/MftIaQB9XYzw2PKcwNWWD71VoNKxPsqqY3FkTpB28+0kYzXyC5eCY8l
         BVSQ==
X-Gm-Message-State: APjAAAWQPtwC9Mxy9yap+K+BSUavkCAOqqugCAWVNd6llg59f30iqq1c
	rruTCQsOlTyW8I3w/x4Favw=
X-Google-Smtp-Source: APXvYqxaPQamsVe7+MrZxjKcRfo/hB9F/ZUV0tR8FNoZ2f3lDVwWmNcpbL0uDgH2SL4v5pEeZrG/Ww==
X-Received: by 2002:ac8:768b:: with SMTP id g11mr25419386qtr.182.1562062108412;
        Tue, 02 Jul 2019 03:08:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:91ab:: with SMTP id n40ls2322822qvn.4.gmail; Tue, 02 Jul
 2019 03:08:28 -0700 (PDT)
X-Received: by 2002:a0c:94a4:: with SMTP id j33mr25720584qvj.135.1562062108120;
        Tue, 02 Jul 2019 03:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562062108; cv=none;
        d=google.com; s=arc-20160816;
        b=LruXXMuYF3eusbtyN5jUk2aPCnMbAA+MuDkN1vJha01lMUXBhX46JcU980Gn6dA0Zq
         jM6Z9h+O3U+mLKwL+gRLuNfXL42DVCM5AfzKddnBkXco9dSeJ+BEOicP6I1ownDZnbhq
         DvLo9064P1+1ASISfqdtsBtSfzulyCdD90ENUA9xfQ/jHM6+9HVfENOvdEU4hmfAHdzb
         v4bn1u0Z2xkfHntVG5kpgBqCyItW5vvCShs62Bw5AZeozQExT0BShMwiJf/TROwckOTU
         t/t9N/dIJ+9XQmfGgbtCU7zknqMZa+ytQEWLSgVHjFdRlsG2LLxl0cc/90E5bYkW2bYP
         wuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=apehNs1KwNJN3j3Px/6Tj/ab2xYj+KUzd7YUByMxRsg=;
        b=Et7xLQb3em7LYOywDLD11Lg68B8d9uNgMCd2ziZ66Rb/P5gR5YifLVVpwMVLmTyIzB
         sX1alx9l3GLIva48yd8ckKNwIyj0bY2vHIm62nU7xKFWEFDejaaYfM3lV1zgs9bFmY0H
         Stap8JYxqkFFHnQDvrPDZ21E/V6VdqoywSH5P1+Zw8Q//oEDzTc94HRDI1sNSY+KQ7+e
         AQghHLu0jh8rkIi+C/uFE28DOMcao7NQlyWyRUIPcZhRhY2alNzr1vwsGIdtko7koRZU
         z3uwDaI1naD33BfnmjVXT7H220BWvPDpZC5XzY2vs95cqi0u3OQ0ZqBp+fYwdhOmmvA/
         jOPg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="vN1LKSa/";
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id y53si707724qtj.1.2019.07.02.03.08.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 03:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62A8ROg101617;
	Tue, 2 Jul 2019 05:08:27 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62A8RHs070430
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Jul 2019 05:08:27 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 05:08:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 05:08:27 -0500
Received: from [172.24.190.229] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62A8O9X074780;
	Tue, 2 Jul 2019 05:08:25 -0500
Subject: Re: [EXTERNAL] Re: [PATCH v2] core: Fix aligned_start calculation in
 page_alloc_internal()
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>
References: <20190701072933.10751-1-p-yadav1@ti.com>
 <ca30179b-8ffc-b273-89e7-568d2d4fb541@siemens.com>
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <dca8f6a9-6f76-f78a-2cdb-3b0203789bfb@ti.com>
Date: Tue, 2 Jul 2019 15:38:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <ca30179b-8ffc-b273-89e7-568d2d4fb541@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="vN1LKSa/";       spf=pass
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



On 01/07/19 1:05 PM, Jan Kiszka wrote:
> On 01.07.19 09:29, Pratyush Yadav wrote:
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
>> This change fixes this problem. Add align_mask to pool_start, and then
>> zero out the bottom mask bits. Adding align_mask ensures that
>> aligned_start is always greater than pool_start.
>>
>> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
>> ---
>> v2:
>> As suggested by Jan, simplify aligned_start calculation.
>>
>> =C2=A0 hypervisor/paging.c | 12 +++++++-----
>> =C2=A0 1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/hypervisor/paging.c b/hypervisor/paging.c
>> index 16687a89..4a24c1f6 100644
>> --- a/hypervisor/paging.c
>> +++ b/hypervisor/paging.c
>> @@ -105,13 +105,15 @@ static unsigned long find_next_free_page(struct pa=
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
>> +=C2=A0=C2=A0=C2=A0 aligned_start =3D ((pool_start + align_mask) & ~alig=
n_mask) - pool_start;
>> +=C2=A0=C2=A0=C2=A0 next =3D aligned_start;
>> +
>> =C2=A0 restart:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Forward the search start to the next a=
ligned page. */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((next - aligned_start) & align_mask)
>>
>=20
> Thanks, applied. This should finally close the merge window for the relea=
se.

Where do you usually push the patches to? I can't find this one in master o=
r
next on GitHub.

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
jailhouse-dev/dca8f6a9-6f76-f78a-2cdb-3b0203789bfb%40ti.com.
For more options, visit https://groups.google.com/d/optout.
