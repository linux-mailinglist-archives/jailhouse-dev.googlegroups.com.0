Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBP6RS74AKGQEAVU2J7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED2B218B7C
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jul 2020 17:39:44 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id v8sf52953230edj.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jul 2020 08:39:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594222784; cv=pass;
        d=google.com; s=arc-20160816;
        b=MEh0Ww82wjfWjFUFPMfKyp2RJRQ8AH4LgyDGeTbf7oRoic1NyMy+eghtSV+Is3tV+D
         r2F7QDkMIF32ee4OUjwwy3Q2NkYGWBP4RIysK/5lgCPwoSBMaJEwok4S9YvLyH2cmtUz
         +Y+9O/x7PAKyHsaCl2W1tJniRDZN0pejb6S6V3dld2dHA9XAScfj3jhVK4TJfgmorYzo
         RmZqFuov1M3OctwB686Uto17g75Gt5hLq5oPdvdfWFFFnosRWJ2Y2xRSEdy/9A/9Ugij
         ImR45wfuXfKgHd9fACI/ZvxX9pkc4T+WFgDruD0VVeDsdrKu1DvYwXDTFKcce+M/Jvyy
         8iNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=GJM0eGtjCPLFCn7kqhsYfJnu9EPJviQkE8ufkZNsuSA=;
        b=XR1VuXY7ts+c33/agpYiCt+tZ+sjDfO3JlpApZx9nEvModXVHco91vnw4xyV21mRvX
         iMDddiiffGkW9/IeHzy2bxj6JjZW+BgmCh8Q+wt+iMaG29jMZPp8HZqAg1YDipSnPAJc
         t054aIP+II+9SwkeDIXWaP93yL/qs4xknPT+FrUO7g8CQTyFH/5NR0i4aUffmLd004t7
         S6BJBET+hfR9pOl/g+tfjE46nD5SkP/4TuugNmVWKGw/SAIYYd+i/oNKZ9eNjdt75zB8
         uLxiAKIIKv3zCIFwq+X3p7YqCR3TXfdtfnbxc3EScIyTAsqfTRoUokU47lbi6h+nhof4
         sVTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=JmKsekaP;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GJM0eGtjCPLFCn7kqhsYfJnu9EPJviQkE8ufkZNsuSA=;
        b=OLLpIZrI/lLdk12AQVU8+i0y2th3aavkeyoG8X3ZhfS+cTsKG1K0Gp3TBeXdANjH9r
         Ob9xkZ2r7pn63CkGl1tOBSCt2cMop4FQQGzQk4VVh1BjVrHnivHRl96JYzIeG+ZTtQe4
         7rMIooZSyFhQoTigmG/DZ1AlSNUJRyXsLjix/nDqt/3sFxEGUIOVgWg1GEu+ywbsh3Wn
         f1hDeKPV73vbaUiYI0mx6c2oZUHoBjQqkRAjXCC8vkEK1yINYzSK8rWFIXfbZG8lPLkr
         zU9sYSLB/jOLT2v56WKIj92lfy+SCD3ELR/m5sTceHxCIfEr5+slEpdrUdhtwOXoQnyj
         l+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GJM0eGtjCPLFCn7kqhsYfJnu9EPJviQkE8ufkZNsuSA=;
        b=hciHNHYKspxLZxMaS4zPe2OJyVJk7WFxFLN93bNm3qrUrXclUp3QNRbVAfuD3dpgan
         HoRNt1YEjPv8REsIr6dks8JG8E1bY6pFF8yzDqWG76G/DQujDNO19Tqnsa6j5owZ9TvJ
         j6ckvwUTULBeP0eMyx2jaLXcjIcYH+N2XtK7pVZPcJYXJYLG+CqkodSmReCxnxuNX9i5
         wQpUeR5PCf1wbyKCcDOAUEh67ExbDVALdck4MbAWiazKybxzwwgkjMrHSsWtX+ZOFktQ
         RY/QX4rD26JK4/c2rv1s3Jwgjw/lAWjTFnbw6pwvndjwCqpV2g9kHtcrt2mkRC447o8Y
         gmtA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5312YKn8di/hHVxxk+iX3pdVwguuR4s3fwd5DvO7qQGK9ZgyLBqC
	vCWBlFIO9Hk2hWfPyhKVHb8=
X-Google-Smtp-Source: ABdhPJxE/RyMwyvzL3KoHg0T3J8YRLtHqu56VlQ0b2TsgDnYwxp6ORjp83ivcXDC1QJ5R2VvbUpHeg==
X-Received: by 2002:a17:906:71c6:: with SMTP id i6mr54407085ejk.103.1594222784218;
        Wed, 08 Jul 2020 08:39:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ed8e:: with SMTP id h14ls3298188edr.2.gmail; Wed, 08 Jul
 2020 08:39:43 -0700 (PDT)
X-Received: by 2002:aa7:c583:: with SMTP id g3mr68665516edq.228.1594222783509;
        Wed, 08 Jul 2020 08:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594222783; cv=none;
        d=google.com; s=arc-20160816;
        b=DvqATMNZYh0Jq6caAwSnfYVKEF6wluw8TNiGbnDgHCKj9qUCbdDxcrjk5OFA9qAqpF
         ALOLJ/9YqC1SShg+EjWoD/ZEMWkn2EJEenAboDg/Vl7THu8z9N4uyznYO230gG3oPpWs
         rEvEbA9ztrQ6odNbRzmZyA9sPFquh0p1hLglduGY51xxtdKd8wWlXyvkHwYnE0r0n/BH
         FGvk7simSqn9LhjSYr8O7NABSwUFycfHGD7/G/T0tWyEgGWFzjXVDbWbq7GTRoWtOFDm
         At7Y+0oQdcNpsbcJs7eJOm553He189EIeXLFb2dm1y/nnb3KOWDqX7kc/VFvScC1BYZ7
         WP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=HngNMnwRmEpHsCccMdjeUWW6/PSVz3xeI2vtDuM4VSo=;
        b=Y6R0M6Q89yGbv3oeyS28fUxBMef3JOKcmZBeQv46xAJ3nNwSA/DZ4g92lYJuuYp2vQ
         FZqwhycseVJiNxoP9/RjKO8Gm4yOD+Fp2r85a0La3DZy0HHUxUCBzG4mN8ir2UG2VBu/
         b7V8E72uSXS5P3FUMZc+AzaLdvj02GYXQufNGXLlMl6U3vThrY1GYm+5zchx6oIxZDk+
         bcjLlW7XPLgPRsPvMbv+ME9DtGg2XgZPhTI6FYPrHiAESUBcWOzGPk+gjVyPr3CRWCCY
         T3kH7mhbkNnilg1+nGwOyKXepua9jeDGvoijf/quCWtcECtI5tSFsRMdbTjlTZNcW5RQ
         gUMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=JmKsekaP;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id 63si12522edj.3.2020.07.08.08.39.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 08:39:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([88.69.98.93]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2xrq-1juI663xoS-003nik; Wed, 08
 Jul 2020 17:39:43 +0200
Subject: Re: Need help to run Linux in non-root cell
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Moritz Walker <moritzwalker@live.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AM0PR07MB54269B1C7307A5B79790C05FB26D0@AM0PR07MB5426.eurprd07.prod.outlook.com>
 <8ab1063f-b7f6-3a1e-9d48-6e99e6104a3a@siemens.com>
 <AM0PR07MB5426401B20187DA3BAB56C4DB26D0@AM0PR07MB5426.eurprd07.prod.outlook.com>
 <2b34a9fb-b90c-ef4a-545e-ec0ab7620c78@siemens.com>
 <77cfe59d-589c-99dc-e3ef-bd2891d3daf4@oth-regensburg.de>
 <73b73089-a90c-f26f-bc2f-ce716bb1fafb@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <8d864c50-172e-bc18-accc-c9d478aa05b5@web.de>
Date: Wed, 8 Jul 2020 17:39:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <73b73089-a90c-f26f-bc2f-ce716bb1fafb@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eX3DOB5xzJsIaJvDADEcHVjtn8m7FoD8tAs0hyuzuuiLSrTEYfz
 XwVt/vUq+4xPz+SojQUkluZj3Bk4lKM8SfZ3fRALgzLxZgPm49wD8o6fjKhbnVdfFWxyO90
 /Zn3B2ooYnUGfg/1DXqI81MIQHHcw9Y4jMX+bziVkiJDdZvEu8McCE3/VUf7Fspk6atLmr0
 Okd+7Ct87mvROiQyswEgg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H5N575Vs0A8=:vmaKUHkqxr2bn2U0xCeWHY
 JOuJLLWjEvq8vRJyrrroj7u+7le2LwBh8MgNVn8kDs1PprzrIer1Dp7M/f+QlmEVcuHiJr29N
 rB+WIcsJiURnhsMLp4otR8xqzFtGjgVtNOSrdCkYWIbDsBgS7ON2Nj6kPAYEtvJTh0PuWrZuc
 gxgiMhVJOBAHubgsYH4lcoLZAWsnNTb/GsDFfWSdFNsXwzy9GsCqfquO2KbikeJVV7Lk6xLBg
 dZhuFvZHIkfQFP2ydM2VHfQBUgColF1wR/EvYAtVtcl7RdLN2+GNgKIjxINbJNGGvRZKHYSms
 EFpRn1aQRE9TwO8jSNjyQQfwjtoAEEupa/GtH+GLe4tZVetc2AtPbKmVqvFz87xgxkkeTTyGc
 ANVbrPCeqCQHOOdbB3bZV/FVjR2bMU5PiYJmcHTh8exzoVd5zd5yR12ziD6o1yWzZRb7DXrMm
 hSpT0zK8syqIIpkFCUYRbht+AV+yZt4IhFNSZMZui3tHwONydX3TXu1shfy8r4dvx4wblvR9h
 0+eC+hI71brsxxYYRoviBWXAUvx+MVeiCllY3M5vXoHmBwpd0HKt6QkC991bw57G4TVonYP7R
 bOuFxFam39ECt+5bM4vDiIIJar5bjhAWjVr8nu4JLH88iL4+NYNmYfxqrVGxLl7KpY5pKAMw5
 cJoIHvy+sJZeYXTQtG8SFvsnrxP24wwsijahs6XVSnRC7eEy69rSHet893cN63Q/mbNlwp9eF
 UI97CMXOx5xzVzvGWlx7J7TOLAWp7OBzGcW/Gq38d+wgYz1gbKMlr53P3H4B8Fdnb5HeE1rGA
 rZSOoA50skJYYspooifF3Y1va2tHoqs72oHKrKCf1ELF2dBqDRnkYhDiwVwdLlPIfE+pGhDGf
 0ZsWWRk9vkl4hFUdjgm1jHZ/RU1GMwDC0UP5kZ59OmM0tT4q2TZ1v5yXTrFAX1gBwZVbLXmFm
 oJ7fvmKRKWSp1GmKUmVUHNgsfFpagyA/zms/sNVrfL30+OZHNrLTY3Aj5BwPlOchIXVFPbaRi
 e+Blv2xA+KvNaXZHE8DnlG8BR/wHYp1V6ti9PqPBR/FJMljDTFetcM5hDPOtZz0h3I2Pep0wr
 qMJqMyIXYk+9TVYXvpQZmSZI2olo2qh8slqiqljNNO+JrllMMXPefqAm3oQuMN208qriyYQDG
 XMuK3WilUcpFzrbOphGZV7EQM0GBIGmnr1wUSQK5F54cNipki6MvLAdbIBPME9/Gb6u2se4le
 bqiqDSCfgbKZY2e1MXe7cfq9wmEHGZxWKyXqsNQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=JmKsekaP;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 08.07.20 16:37, Andrej Utz wrote:
> Hi all,
>
> On 02/07/2020 18:26, Ralf Ramsauer wrote:
>>
>>
>> On 02/07/2020 18:17, Jan Kiszka wrote:
>>> On 02.07.20 18:07, Moritz Walker wrote:
>>>>>> =C2=A0=C2=A0Smells like a regression in that branch for non-root Lin=
ux. Is that
>>>>>> =C2=A0=C2=A0562b04e51bb5e2f04bf175383080333237067c63? Can you share =
you kernel
>>>>>> config?
>>>>
>>>> Yes, its 562b04e51bb5e2f04bf175383080333237067c63. I=C2=A0 attached th=
e
>>>> kernel config.
>>>> I also tried the kernel from jailhouse-images (Linux version 5.4.17)
>>>> which leads to=C2=A0 the same error
>>>> on my AMD-machine:
>>>
>>> Ah, AMD! Please see
>>
>> Yeah, AMD. It isn't always only Intel. :-)
>>
>>> https://groups.google.com/forum/#!msg/jailhouse-dev/1wRKIiGN0GA/_p_NSIB=
pDwAJ
>>>
>>> - in fact a known issue (hardware misbehavior) that we didn't workaroun=
d
>>> yet.
>>
>> Yes, just wanted to mention! Looks familiar.
>>
>>>
>>> Ralf, Andrej, any news here.
>>
>> Andrej?
>> It's already been a while. Didn't we already have some preliminary
>> patches for Linux?
>>
>> As a hacky workaround, you can try:
>>
>> diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
>> index d36c2033..5160d37d 100644
>> --- a/hypervisor/arch/x86/apic.c
>> +++ b/hypervisor/arch/x86/apic.c
>> @@ -350,7 +350,7 @@ void apic_clear(void)
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Finally, reset the T=
PR again and disable the APIC */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apic_ops.write(APIC_REG=
_TPR, 0);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apic_ops.write(APIC_REG_SVR, 0xff)=
;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //apic_ops.write(APIC_REG_SVR, 0xf=
f);
>> =C2=A0 }
>>
>> =C2=A0 static void apic_send_ipi(unsigned int target_cpu_id, u32 orig_ic=
r_hi,
>>
>
> Or as an alternative apply the following patch to the kernel:
> https://groups.google.com/d/msg/jailhouse-dev/1wRKIiGN0GA/P5YeS3oqAQAJ
>
> @Jan: Any ideas how to bring the mentioned patch (or something
> equivalent) upstream? I know its a hack and will add proper CPU family
> checks, but the linux-x86 folks still may not even touch it. Meanwhile
> AMD gains market share and as such more people will try to run non-root
> Linux with their CPUs, run into this bug and request support here or
> decide to use other hypervisors.

Code-wise, I think you can simply set the mask bit unconditionally right
after enabling if that is the software-expected state and that is just
not available on all CPUs. That code path is not timing sensitive.

But, in order to explain where this comes from and what will happen if
not doing that - at least over Jailhouse -, a verbose commit message and
likely also a code comment will be needed.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8d864c50-172e-bc18-accc-c9d478aa05b5%40web.de.
