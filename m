Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAPW5TUAKGQE3TZRUDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAE85CE18
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 13:07:45 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id e6sf6743926wrv.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 04:07:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562065665; cv=pass;
        d=google.com; s=arc-20160816;
        b=AndVabgPiu//DA4hYQprWFaS+z7AM9Up5GyzQE1D8EjAmrIkLGF5WvR3gqWcnwM8ZZ
         L8/VRUDZB6HHcefI2IqgLWql/RBsflVhrRd9ulGrqsmaY1UNyhiX7dTg07uvgis+QReg
         rOHL8HdLsaCMYrUfJmor0XTIt1gmgJ3OW4zW4Fp/Ir/cgDTZKOppvTKYPCHw5I9JpWrl
         LMzTH8uamUCF8Rd6/OWCEUTLp/jp1xVrZPQVlzAQSf9W3xCECOWlocP7wlE/DKmKYHM6
         OpNpZdOHlFfID07f3DXTT2IeSP6sN53A/uqZTBwfD5iMjNTeRoI18+Fuwn0aiv5ScSMm
         LImQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=0UNZsjmMa8WgQlKALYDSHT1OYgenWZmR/Q4RIFIIkN8=;
        b=P3pxGy8RVWdQJ/1pLg8qvHETMkuMgYZaeRohiTLtsYgYcCcpZgDw4y2csLfYv0Lo9W
         MOafeXN8bbMuwqnYDNWRchv2mZl4qKRHAjkc0/M8bTtYfUPfQDGOdOkc5KiPs6HAyEJR
         pua9kFa0wBaUk+whpclk9hHsyuZ86cLcq2i/A9h0apGpAGy49ojN/NgQvgkj/pZ7DLvX
         pPx7VaGDYX58/4VFd3ptZLIv14A8LVt5MwuuhMMX0yg6urXLg7JarGlJqOwdk4oClUUn
         byCDGrrnlOctWNUb3klHvhHslVM4vSeQYbYCTCdCXwSs3EMbX6bI+g94Ym19+bipSayw
         ErHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0UNZsjmMa8WgQlKALYDSHT1OYgenWZmR/Q4RIFIIkN8=;
        b=fdt1whT3cVO6OwmW6t/09Y6UNa6HSYCE1gzKNSRTl3ItjS/5+9VruOvTN1fumRUoLX
         VdgMpQRabULoxo6vKWFs9lpHJneKNeub/XeV78x6GCkEh9VqW10QXq9fkMEeJKSiJq/1
         Rnj1yzeWJ5gBym5omYgAdsRTaMpWTL4RgZjCMvzVOU5XgB+41IgDXEEu7SNEzVdmrxlI
         mtD90qqCsc3mbJW9E5DIgFFTxJcaf8507ODo2KHNYW+BmyhLDSaXi4vUoH2/GuGTlV6F
         1kz4M6WOHr56fdD8D5Rs04IOdjBz2t8xxVRfXxQ9+vEhoedde0nc7InTrTQ6Jnbn7ntL
         muwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0UNZsjmMa8WgQlKALYDSHT1OYgenWZmR/Q4RIFIIkN8=;
        b=esUMdCDmbFaPzue1xvkyoR3NMzz/TNj9J/T3vms+uebmOMv3SidCEiv/4dvLCMX2Io
         2rtDC6TsWaHpkKj84qUBi2fnT2uF6fJilunNh5fwHXCbw+1ZJJfM4dkrwdgMqz80AJoL
         8d9hguFCco5c1zBaY+6EhSCQpHTMEOOoFwp+kpKqUVr/JvkBPZXn/osgRXJUVOnjO4do
         ro7sqDSPuktrN4fZ2KGpuJ26x91zpv+ou7u5RNYp/5uHgvgybdywGLOF41klvxz4esE5
         ZVjsSpk2nzJz4jFHavj4b9vN7Iy8Cf/k8s33MJVMQR1fCbUd2lND2E1AvVKbvle3Map0
         Ca8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUzBxwhhXwnHzMIkQocpqn+aManX3pKVp3wvq4x9uTeiXZ6cAEY
	at2k2eBg3tp7FBmLGaWX11k=
X-Google-Smtp-Source: APXvYqwgxl+yI/ny744bUXeUduMk/oir2RPQL7i7KPcoyNP6zsfv6CD+t8xQkMhT64F0J5AGX6Fy8A==
X-Received: by 2002:a1c:5a56:: with SMTP id o83mr3060429wmb.103.1562065665460;
        Tue, 02 Jul 2019 04:07:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6b50:: with SMTP id x16ls1790212wrw.10.gmail; Tue, 02
 Jul 2019 04:07:44 -0700 (PDT)
X-Received: by 2002:a05:6000:11ca:: with SMTP id i10mr3615585wrx.56.1562065664862;
        Tue, 02 Jul 2019 04:07:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562065664; cv=none;
        d=google.com; s=arc-20160816;
        b=S205IY0OdK99XhqnYSJDrrG+0DsAfRmxrabO64UwfsttLwyzTLGjvz5PqfHrK/g78T
         yyV0B0H3+ZYSTZzJSFKvFP932Mmwj4iFIK1qfbwpSU1bHIqwc9myOoaomrYvQLdFRzRE
         6gmRoKNxKYff8bWrxNgi5fvfLn3ySttn5Yns8bmm7eVA8WAL/CtVHNimf4vVtnGKADYb
         +kVmDcm3BqzduhLbp4wRDBcyHpLczqDdRWiU6HqCRdYCyFmOCB8apwAwy+hYv2xgUyUI
         RxCF1AqE8QXKWFykxTDpnEJMQvtAyF78TX1bGpyFQ3xkj7iO9WJI8y42fCgdINd5HUf1
         +0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=te3+TCqOc3KJCI93fuHvJkGOPxGaEQz3XLr53M7JJr8=;
        b=PrZN6mjRaj+/PBqD2rTaU3DPaD6I9ujVdOlzOkwThW2Zq8vLr1Bo3T64DW0biQLwiB
         wQJs+Lfu5tnmPyG0qd9XTjfSPBRj7SbO+Xd7R/4eZpOMLmoFS27ae0uOuQIZs3gLnlQL
         vCFXo84l9t7YlBiZcE3OAQmhfr6t9G57Pl1lid6IKtixSGH+4IESLsgZwt1FHz7SRGyv
         rQORmAPM6PIkqHIaS8a6OfDaQCANBa88DxCOq5gmPv/c6mXaF/pw/J/a6u3JXqLRNVJu
         QD8lZIJ1haQ7VS15zpFhGSO8tmMU9s5qxDErYav5U9J43cmuL5ks4znE81HmPU+vJxA1
         0vMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id s24si184720wmc.1.2019.07.02.04.07.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 04:07:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x62B7iOh025245
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2019 13:07:44 +0200
Received: from [139.22.37.246] ([139.22.37.246])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x62B7fUN004257;
	Tue, 2 Jul 2019 13:07:42 +0200
Subject: Re: [EXTERNAL] Re: [PATCH v2] core: Fix aligned_start calculation in
 page_alloc_internal()
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>
References: <20190701072933.10751-1-p-yadav1@ti.com>
 <ca30179b-8ffc-b273-89e7-568d2d4fb541@siemens.com>
 <dca8f6a9-6f76-f78a-2cdb-3b0203789bfb@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <56facc6a-8b1d-be1d-0e5c-ee7dca3785b8@siemens.com>
Date: Tue, 2 Jul 2019 13:07:41 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <dca8f6a9-6f76-f78a-2cdb-3b0203789bfb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 02.07.19 12:08, Pratyush Yadav wrote:
>=20
>=20
> On 01/07/19 1:05 PM, Jan Kiszka wrote:
>> On 01.07.19 09:29, Pratyush Yadav wrote:
>>> Right now, page_alloc_aligned() can fail to give aligned pages when mor=
e
>>> than one page is being allocated. This is because the aligned_start
>>> calculation is flawed.
>>>
>>> Taking an example from a test case, let's say 8 pages need to be
>>> allocated. This means an alignment of 15 bits. The mask here is 0x7. If
>>> the page pool's base address is 0xffffc021f000, this gives us
>>> aligned_start =3D 0x7. This start is clearly not aligned at a 15 bits
>>> boundary (3 bits after shifting by PAGE_SHIFT). It is exactly the
>>> opposite. It will never be aligned except when the page pool start also
>>> happens to be aligned at that boundary.
>>>
>>> In the above example, the address of the pointer returned was
>>> 0xffffc026e000 which is clearly not 15-bit aligned.
>>>
>>> This change fixes this problem. Add align_mask to pool_start, and then
>>> zero out the bottom mask bits. Adding align_mask ensures that
>>> aligned_start is always greater than pool_start.
>>>
>>> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
>>> ---
>>> v2:
>>> As suggested by Jan, simplify aligned_start calculation.
>>>
>>>  =C2=A0 hypervisor/paging.c | 12 +++++++-----
>>>  =C2=A0 1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hypervisor/paging.c b/hypervisor/paging.c
>>> index 16687a89..4a24c1f6 100644
>>> --- a/hypervisor/paging.c
>>> +++ b/hypervisor/paging.c
>>> @@ -105,13 +105,15 @@ static unsigned long find_next_free_page(struct p=
age_pool *pool,
>>>  =C2=A0 static void *page_alloc_internal(struct page_pool *pool, unsign=
ed int num,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long align_mask)
>>>  =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 /* The pool itself might not be aligned as required=
. */
>>> -=C2=A0=C2=A0=C2=A0 unsigned long aligned_start =3D
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((unsigned long)pool->base_=
address >> PAGE_SHIFT) & align_mask;
>>> -=C2=A0=C2=A0=C2=A0 unsigned long next =3D aligned_start;
>>> -=C2=A0=C2=A0=C2=A0 unsigned long start, last;
>>> +=C2=A0=C2=A0=C2=A0 unsigned long aligned_start, pool_start, next, star=
t, last;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int allocated;
>>>  =C2=A0 +=C2=A0=C2=A0=C2=A0 pool_start =3D (unsigned long)pool->base_ad=
dress >> PAGE_SHIFT;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* The pool itself might not be aligned as required=
. */
>>> +=C2=A0=C2=A0=C2=A0 aligned_start =3D ((pool_start + align_mask) & ~ali=
gn_mask) - pool_start;
>>> +=C2=A0=C2=A0=C2=A0 next =3D aligned_start;
>>> +
>>>  =C2=A0 restart:
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Forward the search start to the next=
 aligned page. */
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((next - aligned_start) & align_mask=
)
>>>
>>
>> Thanks, applied. This should finally close the merge window for the rele=
ase.
>=20
> Where do you usually push the patches to? I can't find this one in master=
 or
> next on GitHub.
>=20

Forgot to push while pulling hairs over dt overlays, again. Done now, sorry=
.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/56facc6a-8b1d-be1d-0e5c-ee7dca3785b8%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
