Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLXP575QKGQEEVTD5XQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 82479284516
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:50:55 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id h17sf3333396lfc.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:50:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601959855; cv=pass;
        d=google.com; s=arc-20160816;
        b=JPTe9Z6C22+zSSOMdIkgY200105lI8+Ivij6kM0ZGkx1NzCpc9g+76zl/0v2AWBxQX
         1G5saPwaGxPt3q8jOofeKgkq6RlyIvcVpd4JHiDw2UYNkus23N9zSIkF7bFbJf5h+3LE
         UowQREOilKh+ns0uAPOXq1302flgEdhdOuqdmX9hwDCSbGdf1wUOYOPMmYhnvpF2spJp
         ednfodWZPT8/QI+3FZCaT1a+jYDXhNXJWI02H09LCqQbiRorZ1pB2qndh2bx3QGengrr
         3Rmr4MOsQsHre/9OV2DfXaMJud2Oj1M1b4oBeNLthoO6lnAWjHe2xePbUxfhAAegbhTc
         w/og==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=6HVKHCCpo3/0quBhdRtZnf5kVUceRDQgaz9p+xm6rKY=;
        b=o1nT1L8PB0fVwNc0lRjnwWFkuKy+ivi9ncTEnB4P1QYsRRyOfclHRF5WaKiDQ4/oRO
         QocEyVPumBKSdV1VvykKU6X6z1OFtdQWARutoR9NXB82wy4/TL6Broksrb1r+waR5h1K
         R8LuNW1rdN/+oRHv7yH7iqJ50m+qLwF4kkGbmrjyO+edcV667uA0NgDfEGNKNRZcxPRp
         raKtEE/Rldk4LaBY2jY42m7mIxLZhT3c6qnPsUj/+UbQx6SYjd5VRQ/oaoXae0pppCET
         prqgupEPIj8zwpSxUwNXyI2ZhUlVJGTSk87dEcmfxBbj/+WeeNBlkAOvfQpUE2zNMQbb
         0Kww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6HVKHCCpo3/0quBhdRtZnf5kVUceRDQgaz9p+xm6rKY=;
        b=ISWXcH/dJw5JE15dPgnOhOaAHryZLCzxikJc23nnc0ifbKUvdFPP1wIuu2J1fXPXPu
         s6X0GOmTaoOGpE7rFk47ZAEKiVSMfSU/vyEDktPpCHT7EW6J7XFBPkvSjl8Nk6BBLLrj
         dpn14+x7N5nxv31I19L6iQlY/Hxx7voUe2v5Uo/4zeP1bb52gAKOJj+hkVNKO7B/+MZm
         cfjC//ZCWGQgcPSF13NemsdI1I3XlCVWy+AFtK5PH0tJ3O1Jm0j+4yzX2Hg4j0lriI5k
         zpQyMAbBfHviZXwOn1mkENrn3AWMWmbqqM9Qjoaui7Hx/qtbEYK3qV9wgbb7W0l+DVyy
         qKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6HVKHCCpo3/0quBhdRtZnf5kVUceRDQgaz9p+xm6rKY=;
        b=cEHQRJ+V2b2kIeekOAw5ULIJD6uIurjfkhoyW7ZeE2Q5OOIvai+komGnzqEn1ALvWM
         DfqarPkX339UznaYT2tyyEw802Ch5Yh/HEcwBUZlRz5p0TpdYdifSUtADWJc51zwERcx
         mjvHppRLgpfnpeNx4lkdAu8AgOm80uoDqokHZbsQ+IaHHVARDVfcA7mg4gTkrUVqMxBk
         e219MGW5M+7B2ZHYypjD9N+oNa3jsHx/gDY3GQS1R3Jdpillm/wM5Rea4xUSQ2r27JW/
         X4qBb6W07N1q6mzzQTNz9M9FEBHHmLzPvolPcIC2rAO2EyUOHdgVw1fQOAmFJU7WiNPe
         S6oQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5334n5PorpT7PCQuoUC5Wk0Phu8WOYTUMame9uo9L/JTIP5twC+l
	hXulcZAR/9V3Hb3Rhbsm+qM=
X-Google-Smtp-Source: ABdhPJw99qsCGqE136jnF0R1qE0yks/FhabTf9QHPsjRZoThhTNVhzbRHmtOyXct/oTc6U4oDnAdDA==
X-Received: by 2002:a2e:1444:: with SMTP id 4mr935558lju.218.1601959855019;
        Mon, 05 Oct 2020 21:50:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a556:: with SMTP id e22ls1446000ljn.9.gmail; Mon, 05 Oct
 2020 21:50:53 -0700 (PDT)
X-Received: by 2002:a2e:b5b0:: with SMTP id f16mr1103424ljn.316.1601959853689;
        Mon, 05 Oct 2020 21:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601959853; cv=none;
        d=google.com; s=arc-20160816;
        b=BaYAS/PPNrorPF0Nx7s3Okk3+/74y23yL9Kq6CdaAQB74xWWjXOuFfXp9tB6KyiHbp
         0oatnrbScLAmP2v3tlt2zBS0dngLIjppdV2kUO0IQw1By0i5YsYjFmj0KXQg8ATwB3V8
         /jMdCWZ3Q7j+UvvRDyTpZQOnE18Ydkpv9WYbFxuZAmT/zj7lgYHpJ3vZY/kppI9H0V80
         gL4WsrSLNGOEm8Q4QaLkd2jXsYNQF2FJedEdeQtO+LuYHTjvI02tfUAz9Byrj8CHIBFE
         eYiUwl4HC8zJ6ZWxwHmk6kqFTTsJftzqMKNzPEei5dsuC+GQ2KZawF4JfVbdbZaHbBAW
         vtPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=nnJCCGpTSuoEvowZ2cjLQ6zwsIQ0kP3QcniQTJzmDFk=;
        b=H5EhTf/B+bg9j/Z1d2VNiEx9/F7dmft3F+2b2nXBr4sHS58MnTcHVbQ1ITUTaXpWAG
         wzTwwpvZZ86EtQf5of/DCdkx63E6VT03hI+9GZVefyEcc53j1RnaCddADvsYptX4drfN
         TJDr4Ca08CokYdw8fFDIn6omfxnmLVlE12vDi6m1Hj4DQmcOM09XnVUNeHaTo0w9EqT/
         bUu5ZCMOTSRnTWaGo83nWio3sujlmh4bOvYrGQEbs5JzoqNliUQK9Es+3gQRe22OBwZ+
         BTQrT2tEDkC850uoV+lmLlRXdlyYMMFlRDXnMs58xY88XLc2Sj29u89MEFN8HuF/Z279
         Okjg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id j75si72860lfj.5.2020.10.05.21.50.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0964opwk020511
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Oct 2020 06:50:51 +0200
Received: from [167.87.160.159] ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964omkL030125;
	Tue, 6 Oct 2020 06:50:50 +0200
Subject: Re: [PATCH 03/45] arm64: Simplify get_cpu_parange, add 52-bit case
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Chase Conklin <Chase.Conklin@arm.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
 <7434305f16589d47d0248ba127edd82bf234d9e0.1601838005.git.jan.kiszka@siemens.com>
 <AF18C444-D146-4E7F-9D8B-F1DCBD161882@arm.com>
 <3a2f9cd9-3cb6-611e-4cb2-642f8280ee86@siemens.com>
Message-ID: <a4e8e137-e632-c312-3252-261a03cfc46a@siemens.com>
Date: Tue, 6 Oct 2020 06:50:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3a2f9cd9-3cb6-611e-4cb2-642f8280ee86@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 05.10.20 15:25, Jan Kiszka wrote:
> On 05.10.20 15:13, Chase Conklin wrote:
>> On 04.10.20 2:00, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> Array lookup is simpler, given this input-output mapping. Cover the
>>> 52-bit case as well at this chance. This also obsoletes a couple of
>>> PARANGE constants.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>> hypervisor/arch/arm64/include/asm/paging.h |  5 -----
>>> hypervisor/arch/arm64/paging.c             | 19 +++----------------
>>> 2 files changed, 3 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
>>> index 67664efa..932dbb50 100644
>>> --- a/hypervisor/arch/arm64/include/asm/paging.h
>>> +++ b/hypervisor/arch/arm64/include/asm/paging.h
>>> @@ -101,11 +101,6 @@
>>> #define SL0_L02
>>> #define SL0_L11
>>> #define SL0_L20
>>> -#define PARANGE_32B0x0
>>> -#define PARANGE_36B0x1
>>> -#define PARANGE_40B0x2
>>> -#define PARANGE_42B0x3
>>> -#define PARANGE_44B0x4
>>> #define PARANGE_48B0x5
>>> #define TCR_RGN_NON_CACHEABLE0x0
>>> #define TCR_RGN_WB_WA0x1
>>> diff --git a/hypervisor/arch/arm64/paging.c b/hypervisor/arch/arm64/paging.c
>>> index db8314a6..cccce410 100644
>>> --- a/hypervisor/arch/arm64/paging.c
>>> +++ b/hypervisor/arch/arm64/paging.c
>>> @@ -26,6 +26,7 @@ unsigned int cpu_parange_encoded;
>>>   */
>>> unsigned int get_cpu_parange(void)
>>> {
>>> +static const unsigned int pa_bits[] = { 32, 36, 40, 42, 44, 48, 52 };
>>
>> Hi Jan,
>>
>> I think it's safest and easiest to treat the 52-bit case as if it were
>> 48-bit.
>>
>> The 52-bit case is a bit trickier than the others in that it requires a
>> 64KB translation granule. With a 4KB translation granule, the maximum
>> number of PA bits is 48; programming for 52-bit is treated as if it were
>> 48-bit, so having this indicate that output addresses are 52-bit is a
>> bit misleading.
>>
>> The real problem is that we set T0SZ such that the input address size is
>> the same as the output address size. When not using a 64KB translation
>> granule, programming a 52-bit input address size will result in
>> translation faults.
> 
> Ah, good to know. Will fix this. Also requires to cap
> cpu_parange_encoded accordingly.
> 

Fixed up in next. Not resending yet as the series is large, waiting for
further feedback first.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a4e8e137-e632-c312-3252-261a03cfc46a%40siemens.com.
