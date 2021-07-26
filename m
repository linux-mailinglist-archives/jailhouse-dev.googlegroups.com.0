Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRMN7ODQMGQETQBDZZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F30F3D5B91
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Jul 2021 16:29:26 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id p12-20020a5d68cc0000b02901426384855asf4794620wrw.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Jul 2021 07:29:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627309765; cv=pass;
        d=google.com; s=arc-20160816;
        b=LDdL2S6zEGesNAAhr4/OlCApnY+XKZek7xzTz0uI9bUOebGYpKLeQWMDIiIhMwj5X6
         zGvFj7N24UZsPkbJjr07LiKSS9XxaDQtJ65MuPO9nG9dHgcVZXdqFw9+eku93rNtpf3y
         gxzPJikH2sG7Gdc/H9zNOc2pZn8sszsBWAjy93mhe7wJ2HhWg7JLZ9SugiNTbTDqSo6K
         gwZrOIb5Zg89ljEk4FTq5lwqm98BIGwWTFK8nqsplem24mRhJFpuNKxJQV6/HS3dhZzq
         o6lMErm8Cm02Cf2r5OO2PxCb2/dAfzVpGoiUhoUAqZZqKs+gnp3rxgRCSX2yFbIVUTGn
         ruww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=MuQVJY7jWBlQwyEHeEAyaVlpNz5CsJJt3j4EspdDboc=;
        b=Kio6xcbzJZKs9W33VDTKyxT4am+PRRLTxYuudbTMQ7zaGf6zZMHpwqRzrXTIvsB/aM
         q6jJ63dW61JEhyaYaFJP4mykLpajjrCoH3H02glP9mi56/EOTwopZvbDZnxq8uz4tEO3
         j5oJm9mIASeHT0PrGonbkKaHG05xL9OhGp0+ZrZ4j4Yyn6w3Q3/6zWkAlMMcB3qKOWiT
         UwsK5u9W0/3umr71o2o7byHLdSi+Cc/TbhibgzQ82MOevAv2RgWBlGQdtHdQYMIJcKcN
         NQWdggeKXFZnKfnau5dhfiIOzXU0xB8HBCBKHtRA2/CGqZMqXaTmYaCohEps9AHfI0FH
         Tbcw==
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
        bh=MuQVJY7jWBlQwyEHeEAyaVlpNz5CsJJt3j4EspdDboc=;
        b=hM27P3Z3b5sIbi/OFCunE5VeYFhsb8zsuX4+CVBjyZ0zK3JGPXsmqWGuS+5kcYBUSH
         UNvANNkUhyMJbDnWF0+MSq0jJkdkkwgIylECfl++4Tx8b7RYxfPGyrCVkX9kE6rnxApb
         iY3lNEikSNUWWRGLC/GP8kxiamMCVPz+kwpgrxIvrgP7b1BNh8tGU6XoaHQSuG4FhA/z
         PgPttNJgHoLyO4RfuLLHictuZ6HfPj8UQ8IV24Pp+6tPmjoNfX7yavb2/bDCFUvXUING
         gGGzHWrwo+ZY9ZNm9DN1b1Vb7TQ+eoc47pUhmuM7nALQmQ9A0EC4p77x9CqHbR6uvE/p
         CdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MuQVJY7jWBlQwyEHeEAyaVlpNz5CsJJt3j4EspdDboc=;
        b=gV2lzkH6NyFsytCAwz82JnEUjBbk3IwvNF+WoaL4cdDL61iTPYDdZFZ2+DNRohzBAw
         fM5XsPzwIQjNtutCtrWD9FIWbRUufPem77qv6l+4HHhm419GKm3B5y3oqi94H/Bmvr4/
         gOIsKkvwFrGdl/EjVEe1H9vp7NE74v50RdjRtClRIxNyl4R/8tdq1wY9V1SYnW+p/FPQ
         K0c7xVI623ZilMSd9WRZ6Vyz3+8l1yeX2Rdf1xfa4irHlVVtpt+qrbMlVdnJpV2CC64Q
         8/TfJTV9/7efl63ZN+AHW8RnVzVbMqE5iIGzmiCWKd6lNhayMdPyC150Zv/qptKqp0eP
         wR/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530/k9RTSZsSDwM7S1/bjGc1pklmcxLS7jgdicBEk5rosNSBG6og
	nNwbypNzPE8jcRpnaSVVC/Q=
X-Google-Smtp-Source: ABdhPJzXRFjxqePo/nt+DTV1UplLapXk2t9gKqU9QYR+8wXdSoXqEi+gN0aaAtAa/rA6L8xku8vTfg==
X-Received: by 2002:a7b:ca59:: with SMTP id m25mr26896358wml.74.1627309765827;
        Mon, 26 Jul 2021 07:29:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cc8a:: with SMTP id p10ls3007116wma.1.canary-gmail; Mon,
 26 Jul 2021 07:29:24 -0700 (PDT)
X-Received: by 2002:a05:600c:511d:: with SMTP id o29mr26471474wms.26.1627309764627;
        Mon, 26 Jul 2021 07:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627309764; cv=none;
        d=google.com; s=arc-20160816;
        b=oRW0J/jNdGhha5xOdMLLd6jiKmMpqDBG3VH73oRx9LG7x93FE3ibpSBy1Y8A1rJBxb
         a/Xk2jdWwM3IJLoVnws2os9oxLLJzZ3oZxOnNNw8wzS05tS0KgEhPpQeM+E8Cni6lH6x
         M3MLaHymxOS/bYhjX3K1u5MuHwCCCnHr2L4mNeBRtYh2aAggJYPkoUDrFtQqKgDWHmVT
         vLjvi1qi6k+7NUwvIAXy/bruZBa8Uh1g5hCDIZ8sKZt3JneI/Z70zhvyQ2b3A0oXfnZ+
         XfEnpjaZEsdZz+VAAPVJeKnSYkNBL7Gh/YBE/qONl3yZKnJfOBdiRSXcgkgeH8AnpcUC
         BBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=fw/rFn0V5wiKFGSn6zBsVgjxh+hpw6pUqKW0cJn4Tc4=;
        b=MxPqwVHQXcHdqQNh/F91Mppe1ipYETNgNaEqBzr+W8oxSI8vVq7C3Df6Ry5h+6/5mI
         MK6+b+OdesUnis0vfiQCRVlI55j52lon1O5puvNyAK15UU/9J/zU19Mhk7dTZX3Rb66Q
         /iVuKcWSceuKEA/jQMCMPnshlDWFHKLrHNGrJP5VkuegPFw7KJc7e9g7Pm/MH8tYXoA/
         lL4pMHYgxdMDZDEV4DDXUHnNCOSXZHd4ZzYozJU+QpO7K+Z78GQ7oRAEAW7v06sIMzVK
         tCtVj3oXPMuDlx7BCmgv1/Qj9lq6mqMPGpP7snrnX0fkhhpxN0EqEFbRrr3ULzDCizFu
         NIQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y16si5975wmq.3.2021.07.26.07.29.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Jul 2021 07:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 16QETNMo005174
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jul 2021 16:29:23 +0200
Received: from [167.87.33.191] ([167.87.33.191])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 16QETMx0025205;
	Mon, 26 Jul 2021 16:29:23 +0200
Subject: Re: [PATCH] ARM64: Set the right set TCR.(I)PS value
To: Dongjiu Geng <gengdongjiu1@gmail.com>
Cc: jailhouse-dev@googlegroups.com
References: <20210726100546.30332-1-gengdongjiu1@gmail.com>
 <07afe6db-18e4-8dce-a4f2-434bde1afe44@siemens.com>
 <CABSBigSq2QbUbQjNyd=t=71i3cianys_EreCVBCP2dzfqqR+eA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ea765444-4e6c-66f6-15c6-1ffc9b0bd130@siemens.com>
Date: Mon, 26 Jul 2021 16:29:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CABSBigSq2QbUbQjNyd=t=71i3cianys_EreCVBCP2dzfqqR+eA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On 26.07.21 14:45, Dongjiu Geng wrote:
> Jan Kiszka <jan.kiszka@siemens.com> =E4=BA=8E2021=E5=B9=B47=E6=9C=8826=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=886:22=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On 26.07.21 12:05, Dongjiu Geng wrote:
>>> According to spec, the {I}PS should be never larger
>>> than the CPU hardware implemented physical address
>>> size(ID_AA64MMFR0_EL1.PARange). Otherwise, it
>>> may lead to some unexpected issues.
>>>
>>> we can refer to DDI0487G_a_armv8_arm's description below:
>>> If {I}PS is programmed to a value larger than the
>>> implemented PA size, then the PE behaves as if programmed
>>> with the implemented PA size, but software must not rely
>>> on this behavior. That is, the output address size is never
>>> largerthan the implemented PA size.
>>>
>>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
>>> ---
>>> DDI0487G_a_armv8_arm: Physical address size implementation options
>>> ID_AA64MMFR0_EL1.PARange Total  PA size PA address size
>>>         0000                     4GB    32 bits, PA[31:0]
>>>         0001                     64GB   36 bits, PA[35:0]
>>>         0010                     1TB    40 bits, PA[39:0]
>>>         0011                     4TB    42 bits, PA[41:0]
>>>         0100                     16TB   44 bits, PA[43:0]
>>>         0101                     256TB  48 bits, PA[47:0]
>>>         0110                     4PB    52 bits, PA[51:0]
>>> ---
>>>  hypervisor/arch/arm64/entry.S              | 14 +++++++++++++-
>>>  hypervisor/arch/arm64/include/asm/paging.h |  5 +++++
>>>  2 files changed, 18 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entr=
y.S
>>> index 3f4ee871..99738f28 100644
>>> --- a/hypervisor/arch/arm64/entry.S
>>> +++ b/hypervisor/arch/arm64/entry.S
>>> @@ -388,6 +388,16 @@ el1_trap:
>>>       isb
>>>  .endm
>>>
>>> +/*
>>> + * set TCR.(I)PS to the highest supported ID_AA64MMFR0_EL1.PARange val=
ue
>>> + */
>>> +.macro tcr_compute_pa_size, tcr
>>> +     mrs     x9, id_aa64mmfr0_el1
>>> +     // Narrow PARange to fit the PS field in TCR_ELx
>>> +     ubfx    x9, x9, #ID_AA64MMFR0_PARANGE_SHIFT, #3
>>> +     bfi     \tcr, x9, #TCR_PS_SHIFT, #3
>>> +.endm
>>> +
>>
>> Why a macro, why not inlined?
>=20
> Thanks very much for your point out, yes, It's best to inline rather
> than macro definitions
>=20
>>
>>>  /*
>>>   * These are the default vectors. They are used on early startup and i=
f no
>>>   * Spectre v2 mitigation is available.
>>> @@ -460,8 +470,10 @@ enable_mmu_el2:
>>>       ldr     x1, =3D(T0SZ(48) | (TCR_RGN_WB_WA << TCR_IRGN0_SHIFT)    =
 \
>>>                              | (TCR_RGN_WB_WA << TCR_ORGN0_SHIFT)     \
>>>                              | (TCR_INNER_SHAREABLE << TCR_SH0_SHIFT) \
>>> -                            | (PARANGE_48B << TCR_PS_SHIFT)          \
>>>                              | TCR_EL2_RES1)
>>> +
>>> +     tcr_compute_pa_size x1
>>> +
>>
>> So this is aiming at devices that have less than 48 bits parange, right?
>> Did you stumble over such a hardware? Or is this rather about devices
>> having more than 48 bits? Sorry, still trying to understand the details.
>=20
> Yes, I have a board with ARMv8 Cortex-A53 CPU, the Cortex-A53 CPU only
> supports 40 bits[1],
> not 48 bits=E3=80=82 And even some ARMv8 CPU support  53 bits parange, al=
so not 48 bits.
>=20

But the problem is around parange < 48, right?

>=20
> [1] https://montcs.bloomu.edu/Information/RaspberryPi-ARMv8/technical-ref=
erence-manual.DDI0500J_cortex_a53_trm.pdf
> Table 4-56 ID_AA64MMFR0_EL1 bit assignments
>=20
>     [3:0] PARange Physical address range supported:
>     0b0010 40 bits, 1 TB.
>=20

OK - but the raspi was apparently still working, although out of spec.
Or did you see something breaking? Looking for a classification of this
issue ("ugly, but we were lucky so far" vs. "never worked with X / when
doing Y").

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ea765444-4e6c-66f6-15c6-1ffc9b0bd130%40siemens.com.
