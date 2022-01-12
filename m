Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXOO7WHAMGQEWWA4OCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B42148CF2F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Jan 2022 00:42:22 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id v18-20020a056402349200b003f8d3b7ee8dsf3631329edc.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jan 2022 15:42:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1642030942; cv=pass;
        d=google.com; s=arc-20160816;
        b=mmaKsFO7YWpINRR/S7D+lr83UF/KcMcfI7cd+Wpl/hsE29KCL3KJSV+Ts6Q2Ox54kv
         bNhXloSIOoPN4kobe/elFvXoHPMriJim7OTnHHV77bjyrAVeY9xBtijjwc8ifqn9HVFn
         8f74NXuZFplE1sYhTMqftqSETsRTq1VJT3uUoYwiF6wbHt74f2qMlazVWAxmUOHG3uWp
         Ms3av0Xg6/TFCKlc+yfggtLQce4KXGl/SE6UWTlsOzqlCf/Qq2d7fvQtT4cwHWq/ll3J
         MxfGIEA/iBc6+YOrCm6myGNtYLz8YOhrbSR+4H8f/K8hQyvTp1BMw66ijaW8Ky/a4TkK
         4ixA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=LyJzxHCQ0PzZ5Q0b4IVBr4zo0Wu0LCUhkrHb0YN5L/o=;
        b=juySjIcbI2/r/ic2OyxKkzFUIDD4FLkf5Tanqvl4RmzohanQz/uD3NmRJ4BvOtSmy1
         S2B9z63X77E5ZiSwltwm/yojv29IE1vhV3OZj39N4pV1qNAw83O7Q57pstSLCnUVnuZu
         91OIKqAFRfdE6d1sSPgDoFDb14NOQbvmqXGiVyES9NN+2hGuZm+acFfrDQbLph2Zs1KR
         LYy0S6dTu145wxVfpz+je24RErA5oODiUYEarOZGJgDBvtUPncoI2spEDfegcEJGXeif
         FS07uJMKxNeBbfXVSVJ0wrVn0jN/dCHjf6LhMrZyFH+5NcTNpKQ1dEgPeKjmLSSScntO
         b7bA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=MYjtFLrb;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LyJzxHCQ0PzZ5Q0b4IVBr4zo0Wu0LCUhkrHb0YN5L/o=;
        b=keiMMGIRikkR50dQIgL1S7xeXUNhBEx8uBHAXSvlWD3X200PkAgi3i15/S+A5Q4SVB
         +iklmFjp6jho2YoGf5dpJpn3T5odyvEAh2zcpgbuLArBOK2uqB3FlxR1TS7EXBtAcNcL
         9YtfXkAtkDnMdiwYcBHA/eEGopCDHun3LWzpHmwWYONwuiV6j5iDvoZnV5UE/bQSv4rm
         N7HiSInV3j4/o6qzslgJNJBRl6QYr3k0+K6Uh5hE6CbBahOgFzWL5IWZFcXB1vz8pGr3
         efwPaGzfcqy7yBdV5UF4PEjlqdtHWZzIrvcN/Y3mEu/naM0l/0Q+WCKzXaO2vD1mE5RX
         l+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LyJzxHCQ0PzZ5Q0b4IVBr4zo0Wu0LCUhkrHb0YN5L/o=;
        b=ARVR0RaYS3rhoR4m5PsK+SGtEwUrjA4XnkxibWRj0mHemH3Ial0xFicQn1UKxA9Y8X
         NWwzrMukJQ4PUqFpkTzTmftZgMYw8hnOr/NCKX++iFLzFxaAaUXH43lmdmHHX1+M+3bg
         fGp0i7M39SzpNM8jEo/MnTPPHOI9pvm+j0m+/RlxrtQVGXrHm/rLfEqtrl89u7/8tUco
         LkDLv0zGzh3fsqHT8uRzbQ+gaPQsvNmClolctoM4HFjSYyZN3tkkd+jiZkGks+XX1glD
         H1R+2g74dQw3eRtlk+YrYt6XpI8SncVCb2e5lvCvNAl5JTORnMnKLAbnY+YShsRd3xWp
         AFiw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530mJAvf0uUBhAaiYVlqpOHAcdN4dkVkTaU5bTVtr7rYV80j390L
	k5ykTBTnJHTr86RfZWt9gMk=
X-Google-Smtp-Source: ABdhPJzUyEzy6T0BT/xydqMT5CxraU45CyqS8LpgeZtDHQTjxOwx6qKKBkOL36h98GoWlbGU/Ham6g==
X-Received: by 2002:a17:906:f2cb:: with SMTP id gz11mr1534237ejb.574.1642030942080;
        Wed, 12 Jan 2022 15:42:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:2750:: with SMTP id z16ls5406edd.2.gmail; Wed, 12
 Jan 2022 15:42:21 -0800 (PST)
X-Received: by 2002:a50:9e84:: with SMTP id a4mr1819774edf.358.1642030941024;
        Wed, 12 Jan 2022 15:42:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642030941; cv=none;
        d=google.com; s=arc-20160816;
        b=1GmLldaKMPMgkBrSORXaKELiGQth4tImSKpHzH3VRDWJjFul5HiuCktEkevAf2T4b9
         byaIPCFM+pNCsrCLw6timtJ+Avm1FGwhAFmT0abxAb3imJedFnwjTvb2e9liGzaG7DBD
         kGbp5948xaNAte/U+XZVos+yy4c2aWtuJzLUyE9Ms2xfFLQTFuBerm8tgxQiXk5g2zeZ
         ZpLuxEwFNz2YyooiTG6VRlBUtLr3esSzomAGWttgs1oS0RHO8/t0YAa7LB/zxQMYBrHr
         Vezbg9zOwo629q9KS+ubBS51r2+V/CkbROfOSs9PJ0o8EJsRib0Q78o8kYIr84vsNMFy
         kN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mf9UoyvkRRha3I2RwebhQx/HCCKN+VNWC8WkOKmF0Uc=;
        b=cjyjQeauRCTLNlxeE5bbgEY2oraCBVq+iJf2TBjPPPuWLGXe6wQO7pNUjgCcXdC1oH
         DBOf4QDpTh5N9IIITlxc9NNjQnm0B7r69X6RJw0o1ePRhK2qGoSYBxqfYhF5ZnM+ll/V
         cMdxYj0NQzGrgeWX8tSSE/Z+arKl75C/H4WNNJohte0Eo/qQ0LixjRUt8l0yK1xRF54h
         JMBiY7DkfunDpPMrQQJyaLaDPhCyt1YuetRmR3HcTfn/QwAIGzqQuwnNyOhA5DlrCgOs
         7HBO7pRUO7a23aPxfJd+tSEp3gsTMUsM4/UCE6oZwhaQBWqwBlodR335Ffr3i0xan5+B
         3weQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=MYjtFLrb;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id t11si33768edd.3.2022.01.12.15.42.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jan 2022 15:42:20 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4JZ3y43YZhzxwD;
	Thu, 13 Jan 2022 00:42:20 +0100 (CET)
Received: from [IPV6:2a02:810d:8fc0:44bc::6156] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Thu, 13 Jan 2022 00:42:19 +0100
Message-ID: <a636946f-a28f-1aed-3050-87df64b1eba7@oth-regensburg.de>
Date: Thu, 13 Jan 2022 00:42:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [EXT] Re: [PATCH] hypervisor: arm/arm64: fix build error
Content-Language: en-US
To: Jan Kiszka <jan.kiszka@siemens.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, <jailhouse-dev@googlegroups.com>
CC: <peng.fan@nxp.com>
References: <20220112065619.19432-1-peng.fan@oss.nxp.com>
 <b96280bc-3f0c-c959-ed29-e23e7b07108f@oth-regensburg.de>
 <c53301ae-6590-1d58-083b-1de362fb12c3@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <c53301ae-6590-1d58-083b-1de362fb12c3@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=MYjtFLrb;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 12/01/2022 19:50, Jan Kiszka wrote:
> On 12.01.22 14:54, Ralf Ramsauer wrote:
>>
>>
>> On 12/01/2022 07:56, Peng Fan (OSS) wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> With gcc 5.15, met the following error
>>>
>>> hypervisor/arch/arm64/control.c:33:9:
>>> error: =E2=80=98memset=E2=80=99 offset [0, 255] is out of the bounds [0=
, 0]=20
>>> [-Werror=3Darray-bounds]
>>> =C2=A0=C2=A0=C2=A0 33 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 memset(&this_cpu_data()->guest_regs, 0, sizeof(union=20
>>> registers));
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=20
>>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> I see the same error on gcc-11.1.
>>
>> My local workaround is to add -ffreestanding to hypervisor/Makefile,=20
>> as this avoids builtin gcc-magic such as undesired inlining of memsets=
=20
>> with constant size.
>>
>> We already use -ffreestanding for inmates, and I guess we should do it=
=20
>> for the hypervisor as well.
>>
>=20
> The kernel uses -ffreestanding at least for its (generic) string=20
> functions. So for us maybe
>=20
> CFLAGS_lib.o :=3D -freestanding

Which only helps against odd optimisation /within/ that compilation=20
unit. It will not affect users of exported standard string routines.

   Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a636946f-a28f-1aed-3050-87df64b1eba7%40oth-regensburg.de.
