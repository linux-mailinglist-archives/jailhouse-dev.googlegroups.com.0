Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJ4I4LTAKGQEPV4POPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6941AE24
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 22:37:59 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id h2sf14521836edi.13
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 13:37:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557693479; cv=pass;
        d=google.com; s=arc-20160816;
        b=SB3lwbAKn4KXjiRmhUt7CXqrp8cNacdCXeqB+azsnstX8PJxYClI+6LyMs4criiE3q
         +cSV6uNrhzjQGVX22BuEnyOH9YZrHuK/5SwZ5wRxSmgox6O7p5UpY+82a+frgF/604ac
         zphUFE7Mg+PWoGFb2/FvXOZaqlsop67tEJJUPVeA0JlHgML/NUDEk7TJzyPzDwAC9hWY
         s4g9NIs31Oacalj+cuu5yx0T8CFlU3pNPbL6P9Vpit3xw7LFOwkz5cB2IPdSzjhzBDie
         dx+iQwYX+BHcuLqnfp94qrFqMU2NAKmbGqWTyz/ncACyUwuKajZVAfEphYtCgCC/HBfK
         QzWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=ktsxCYuHYWJh/1yED18pf6wszI6N514Tv0Ee8wXSzw8=;
        b=i/kV3qYwHQkI4CmlXwGHEA1s0ys0PV3eh5qg5oni3YTLjhc4Jji9n0uQ+qWc0uuy2k
         rcNq9DnfIy9PyYE/K0Ol2rvB/SOEXfQvMH27+1HzMpODOa1nrqhQWoQSnvVneQA36gjB
         KHo63AsMm4Ye0X/r/XEwJIzTn0b/TPdb1pBpm+zY56BHSEZQMF5jMLJ1cptwwhbue5Fa
         UwUCn9BzrEVKOw5jmHn/yhliVY7DiEozr2QD4cAKduvjw+wApBw4xlOXyNxKeTL/ei3x
         XdC5vRN5Kdd79Hy2NRjKcgexhv9fjrmnP1moAKNWkbiv/uSmmmb3xN/x2cA13xnbSRiB
         nLNg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RQlekO3Z;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ktsxCYuHYWJh/1yED18pf6wszI6N514Tv0Ee8wXSzw8=;
        b=mOOM8R9nEVucXnhekSa3dzJkvIuyrlZ1+O7oLTfv1/HKbqUOakV2fy2DKMBu+tzjA+
         JgQGQeiNufaM2/rbZxP4OkUkc5A4k+9AT4cZFU3hhnKFO6YEIAchUa//NVDTxygn9KdZ
         RhSh7HBB08DC65NP2bflCcmm/8SgrEbtNPqF11gkcfwZ9AaEDskRNN3X/sHULuWSMyTW
         a3MyO5Yv/2r7lgdsk+BNZl02d5QlWX4eF3ZAh9t6GzVXBjgw5vEWFXfJ1Uzf020xicon
         Z5Njze62ok0/axDUTinu/MkAHToWtTQiZT4jdTOBmsGyceeTmvrBwZGVDgsQ/CE4piWC
         vTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ktsxCYuHYWJh/1yED18pf6wszI6N514Tv0Ee8wXSzw8=;
        b=pXJJrpust2MCElNd61Kr9ewMGmXs+ghV5fGtV4kjSk9JvtJPq6skIKwZZcDnB5XCNA
         ILt2QdbSADYyGZ7fG+CYiMLr9xCKt0Bk9A1nE8IG7v88xcTIurxauAWFhH8VSUXjpsHP
         Yxx++TUWjjoRiFwIctD/G3TeiyHPHgXMUKaw9dtrc6O2C3h0mKs82o2y1bUaZCi3jbzR
         pSA6DlRRUUnlzdbepwpqZ6ed3JlNJw81G9RlbJw/4B58mMaFMD66AUOuyICqxVPsGzIQ
         kCyQWrQ/SLyhF5y1X7R81ecyoPcMIRfArE2UhZB9V0w1LXxm7l7E+EI1jkqqdEr2oooo
         Ze5A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU50LJSyiBCx50lnDQ+uWD9LFTnfsAGOf1oeFV16dGx2eQrDtJ8
	pfQWIbcms/4A36SMv8e2WAE=
X-Google-Smtp-Source: APXvYqxk7xUswLdOZxDRwnoJw93bwuwEuiTXlQmJydr1AqFTDa4SgINc2y/xXNgPE1Kjm109yowOHQ==
X-Received: by 2002:a50:ba1a:: with SMTP id g26mr25726948edc.90.1557693479617;
        Sun, 12 May 2019 13:37:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:2f91:: with SMTP id w17ls425485eji.16.gmail; Sun, 12
 May 2019 13:37:59 -0700 (PDT)
X-Received: by 2002:a17:906:1dd5:: with SMTP id v21mr18977558ejh.142.1557693479114;
        Sun, 12 May 2019 13:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557693479; cv=none;
        d=google.com; s=arc-20160816;
        b=zwofEpvjbMgcgcvkayO3iV0PuK96o9PJ3NfhvgqrhvyQDuNFPDyMqsfc6ykydzkjUZ
         6kXEIiR+myDo+hSRn9qy6gnPNgH1VK+60yPa+2RP+rmlFHxe6c9jykBPEGMIFRXZviGP
         GIV0WqYgOppXPFaQ1roeG/BuM8MPV0j6sKPh4922+2xXM4mJ06ge6BK9Kr6EUOv6lF3X
         Tn7uA6p8VmFSfnfcTF/TnKwWFLT2tbm4U34aUoi/x7qtqZMXDHsvXGCWwSC0y6MvTt+d
         2q3PtAXXDMfSFXdAlImcP3BiE2jqbEOzEqUzy6KPKFWKrlVdkD7ktOhJQWpb/4ad+84a
         cTbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=qoBEYN6QX6rc35RxH1C4NGRbgh+HAHDKDbAJtWoLbMk=;
        b=ODaeHZiGPMX38Y8tHOXESRp11DLSj17Xgt+0yV2Aq5Adq9mdgu38ZEPDur/VQqnD1r
         3NVbGbluUym07ik0UoF1nwbcWuu9NFcj3w94oLV+jTG3uUUY7LYNQ2wGds1c4CrA4E/G
         OP0yikqwY41uqZ856/4f72w8JQ502lAlPsIJc5MI359zbXhdvGy4LA1q4Jf0c+1U0Hg9
         IVvUcA20YW34C1vJtCxQu+5+6JhTM4Ddh7lV1dpO6HRSsPkKHJqhbJeJizmSw9CI655p
         +1fojZx861r7feY0osBKhW4KmUSZVpbt5uWflLzlM4tZW+xRvGpMct3JYaDFlkTb3AAs
         gUHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RQlekO3Z;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id n9si657840ejz.0.2019.05.12.13.37.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 13:37:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 452G3p56L5zy9f;
	Sun, 12 May 2019 22:37:58 +0200 (CEST)
Received: from [172.23.4.153] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 12 May
 2019 22:37:58 +0200
Subject: Re: [RFC PATCH 4/4] inmates: x86: activate SSE
To: Jan Kiszka <jan.kiszka@web.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
 <20190509210726.23168-5-ralf.ramsauer@oth-regensburg.de>
 <9e20c6a4-6e91-a547-8040-1e9fbd9614cd@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <9f486f2e-b7a1-eadb-3c20-2a70e6422061@oth-regensburg.de>
Date: Sun, 12 May 2019 22:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9e20c6a4-6e91-a547-8040-1e9fbd9614cd@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=RQlekO3Z;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 5/12/19 12:01 PM, Jan Kiszka wrote:
> On 09.05.19 23:07, Ralf Ramsauer wrote:
>> Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
>> hex2str or cmdline_parse routines). Inmates aren't able to execute those
>> instructions as SSE is not enabled and will crash.
>=20
> Actually, this not only fixes automatically injected SSE instructions,
> it also
> enables their broader usage, specifically when doing floating point
> stuff. We
> should add a test or demo case for that.

Ok, should be easy to find some reasonable test cases.

BTW: How should we handle SSE/AVX exceptions? They're currently not
catched and disabled.

>=20
> I addition, I would like to see AVX activated as well, where available.
> For that
> we also need to enable the corresponding bits in XCR0.

Will have a look at that.

One last thing: is it okay to just stop the inmate if discovery fails,
or should we set an appropriate cell state in the commregion before?

  Ralf

>=20
> Jan
>=20
>>
>> Enabling SSE is the same code for 32 and 64 bit x86 and straight
>> forward: Lookup SSE availability via cpuid and enable OSFXSR in cr4. If
>> SSE is not available, stop the inmate.
>>
>> As we have a common 32/64 bit infrastructure in place, and we need to
>> enable SSE on every CPU of a cell, simply place it there.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 inmates/lib/x86/header-32.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
>> =C2=A0 inmates/lib/x86/header-64.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
>> =C2=A0 inmates/lib/x86/header-common.S=C2=A0=C2=A0=C2=A0 | 12 ++++++++++=
++
>> =C2=A0 inmates/lib/x86/include/asm/regs.h |=C2=A0 4 ++++
>> =C2=A0 4 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
>> index d789e5f5..f5fa258a 100644
>> --- a/inmates/lib/x86/header-32.S
>> +++ b/inmates/lib/x86/header-32.S
>> @@ -74,7 +74,7 @@ x86_start:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmp $SMP_MAX_CPUS,%edi
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jae stop
>>
>> -=C2=A0=C2=A0=C2=A0 mov $0x01,%eax
>> +=C2=A0=C2=A0=C2=A0 mov $X86_CPUID_FEATURES, %eax
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpuid
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shr $24,%ebx
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov %bl,smp_cpu_ids(%edi)
>> diff --git a/inmates/lib/x86/header-64.S b/inmates/lib/x86/header-64.S
>> index 2ccbd169..775cf6d6 100644
>> --- a/inmates/lib/x86/header-64.S
>> +++ b/inmates/lib/x86/header-64.S
>> @@ -78,7 +78,7 @@ start64:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmp $SMP_MAX_CPUS,%edi
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jae stop
>>
>> -=C2=A0=C2=A0=C2=A0 mov $0x01,%eax
>> +=C2=A0=C2=A0=C2=A0 mov $X86_CPUID_FEATURES, %eax
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpuid
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shr $24,%ebx
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov %bl,smp_cpu_ids(%edi)
>> diff --git a/inmates/lib/x86/header-common.S
>> b/inmates/lib/x86/header-common.S
>> index ffede16c..afc01104 100644
>> --- a/inmates/lib/x86/header-common.S
>> +++ b/inmates/lib/x86/header-common.S
>> @@ -54,6 +54,18 @@ __reset_entry:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .code32
>> =C2=A0 start32:
>> +=C2=A0=C2=A0=C2=A0 mov $X86_CPUID_FEATURES, %eax
>> +=C2=A0=C2=A0=C2=A0 cpuid
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Check availability of SSE instructions */
>> +=C2=A0=C2=A0=C2=A0 test $X86_FEATURE_FXSR, %edx
>> +=C2=A0=C2=A0=C2=A0 jz stop
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Activate SSE instructions */
>> +=C2=A0=C2=A0=C2=A0 mov %cr4, %eax
>> +=C2=A0=C2=A0=C2=A0 or $X86_CR4_OSFXSR, %eax
>> +=C2=A0=C2=A0=C2=A0 mov %eax, %cr4
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jmp x86_start
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section ".boot", "ax"
>> diff --git a/inmates/lib/x86/include/asm/regs.h
>> b/inmates/lib/x86/include/asm/regs.h
>> index a004fdd2..f6fb4d85 100644
>> --- a/inmates/lib/x86/include/asm/regs.h
>> +++ b/inmates/lib/x86/include/asm/regs.h
>> @@ -42,9 +42,13 @@
>>
>> =C2=A0 #define X86_CR4_PAE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
0000020
>> =C2=A0 #define X86_CR4_PSE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
0000010
>> +#define X86_CR4_OSFXSR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000=
0200
>>
>> =C2=A0 #define MSR_EFER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xc000=
0080
>> =C2=A0 #define EFER_LME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000=
0100
>>
>> +#define X86_CPUID_FEATURES=C2=A0=C2=A0=C2=A0 0x00000001 /* Processor In=
fo and
>> Feature Bits */
>> +#define X86_FEATURE_FXSR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 <=
< 24) /* FXSAVE/FXRSTOR,
>> CR4.OSFXSR */
>> +
>> =C2=A0 #define MSR_MTRR_DEF_TYPE=C2=A0=C2=A0=C2=A0 0x000002ff
>> =C2=A0 #define MTRR_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
0000800
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9f486f2e-b7a1-eadb-3c20-2a70e6422061%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
