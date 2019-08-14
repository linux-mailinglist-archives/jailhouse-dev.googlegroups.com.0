Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPOL2DVAKGQEYZT6WYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D0D8D709
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 17:16:14 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id n3sf4106174lfe.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 08:16:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565795774; cv=pass;
        d=google.com; s=arc-20160816;
        b=IIMDU8br1eR7uqjhAlGfnwegrvoXlSsGkVztDAUinlv0hBpwyD2gfYAnfwbeAEEQbY
         MxiIUFwL4jODw21zWph532jozYbrq37m8KgGHEU9+DzmK5V91A6PCY4eKK6IHCJjZ7jq
         sDJnPmNy7+BHsjovmNLKn0l8biQDuTwFEsmD+g6ANr4wD8lPLSrcosP4YyejtOhuoDlZ
         we3jaPzLsiR+J/7xPng7ahzDqi4y7ijo0HaMfUoM5TIYRVyrOnsvikugPmGuii37L6BG
         9p49xY69gv0GhsWngp/SDbMqeqdoAyN8eO5XU8kEvRPfJbpdQo6lxCVDiuVR0de3fve+
         djag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=MbyJrajaCSWmI74sKX9HQ5m9je/NZx/EmYyEu2OhMis=;
        b=CdvgwjDTw98Os6BzJA7o/2BLbmik1xs0OpRAQ/fyfBAMD8e7jBMKVjyM09NS39H828
         YSR1tWXHa+GdFyrEMj4kT4GHpO65FK88RxikHk6TGgbk4kos07CJj6ls11wH7TbjfyHw
         DmQqjC2jYl0377+s6KWFuJz/fLkbSNee+gBKQmG4UcrPUHjoDdqDYwVcPSLHyCLon71U
         /XqUEAtDpcyLQiiWDh6lsfrCVIlOjtikieuCdmuyaxnLxBWguvS7YUEUuYCupFoliq42
         ZRGOA27XP54dbq7Mq/eInYyTTpvpNpwqD4nSDpceAp2KHEayYImMtN5ZkgasLHV3fkDF
         UaFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dbCZbvd2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MbyJrajaCSWmI74sKX9HQ5m9je/NZx/EmYyEu2OhMis=;
        b=QLdTEkBBiL3cpFG7o9Axupf1+2G4//N9qlhaW0BJ7RoJCrHiBLK2zWyimksqgVSZzL
         5dCVmuD4QFOHrqpGjhdiZJznvXsCPDEjSvsauyb7E26cls8WiyFiOgGP3IbNE/EjDnWr
         DMCRPtKmBzHn32BlY66lHT++Pdgw14809O7Kg9mPxIDBC+xwW5ZFWw8Oy8Av7rTgTM5T
         vT0PzQudGKra1GVG9/7vz2JlKPTp/cvvYlBeAdMsBmwoHtg2M+XbJKE/obNNJJxkX+Bl
         nqJzbQMeh2c+DAccffJmhHFoINhfFaKtxFSEpjNLEHVgizaHc+gffkR+Ad5z8cNrTfr8
         bRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MbyJrajaCSWmI74sKX9HQ5m9je/NZx/EmYyEu2OhMis=;
        b=ely38FbB9m4MkjFKTtj0G2ZgVcW1BGlR3SsoRUxFbyUc6gZJ8bkyHbSYrV5EoGjn9f
         hvw8vJg1OyvQfOoBKiuP6fpb5+TLfFWHExG4jMzP2wEDUoyu1RvW9BKyWqMgvTZdeMnQ
         LDTw4yzKZPbnvbOzUB9HSIDZag+D9NBSDvDcbSq5c8kaiTqhXjbRS3lSJ8V08zBeQh8E
         LEIieQWL47NjSQN+ubl5gQnCDYBWzlbIFADKqf0UwVQfi+JxU42JJ8QGeh3Ym9Jyy6mJ
         kXN34F0o1nOqM2DyH89g/8eLXLXtLuiSaDZhoBQFHfqIW8GvedpkSe/LHfvNtsf/nPuH
         CaIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV3Cy7Y5IVJe+zkx6UQzOpVJUGAF1QxbaqxoqT8WX2z2goOKEeK
	Jn7uBDOIxFEok/gRj+vriVI=
X-Google-Smtp-Source: APXvYqyvVDXEmpjUdGvy8Ic7kR1X5rzHfz2JWJQN8VgqhxveWaHoZ9BrjWf54b4b6y4GMkXUnAAMgg==
X-Received: by 2002:a2e:80d0:: with SMTP id r16mr153688ljg.17.1565795773914;
        Wed, 14 Aug 2019 08:16:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9950:: with SMTP id r16ls305429ljj.7.gmail; Wed, 14 Aug
 2019 08:16:13 -0700 (PDT)
X-Received: by 2002:a2e:b00b:: with SMTP id y11mr143787ljk.159.1565795773083;
        Wed, 14 Aug 2019 08:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565795773; cv=none;
        d=google.com; s=arc-20160816;
        b=ys8VAD0+EgE7dyRTatyL+G/zrPjAMj7SUWXmOyF8WD2Ds3c9E+SP0ud12BAv5P4UGy
         3Ns2ORFxqMLkDqssQPimaJTdgWzQgOER3qY6pcuMSi/m81VslVCYjahUzUOG6y7uggEc
         UakbAgGU8qLgk20krKOUbNb7CjcGKsFRM+n0LWJPJD6IQwfYunff95Ow/8h3EZ7/UtoM
         g6BcPyfy+cPmkdAbuLqJGApAfv4rVTBLxpPCibXjsxiAgEGudZo6HO6izG9hTGQ3/eoI
         wCh97CsJBDBRBb9s6pgAk1caBuiVSMY1TUGFCLmZ1JYN9JAIdMV+BbKuODTc2OLxyy47
         VJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=ffu5kg+TUrG7JojD1B3S9zHw++e+DsfUMbMlq6YcCkg=;
        b=IIrFRZR/uNlpEq1RLb/P+dT9vto/4Y8R2KjjlANJbTWQUA6KFJnJac/O+fMs6SSz/b
         Ccf3zCx34mZxojIVznHbuhA4lFMWizOmTPcBibBkE6Wa+1C0Nhckt1SA0XdH9v01nW3/
         9ohuprRubf2S2T0e3TJRxBdSgC0Hq6gwYpNb7BrLJVewYur9IeVMVuxQJevkVy17gWJT
         yCKS/jl4D9cSkZ3CxYUcLlaynzDADV59yC0PeTasqXMij8O+Q2zMS9+YaPuay8FysWLq
         TR8A2mvvWQe6Bv2YE/EZpqwJo2SXARmYnJX00Vhw6sKBfLCZMTMrT87uF320dMt2G8yU
         /nWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dbCZbvd2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id s14si10832ljg.4.2019.08.14.08.16.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 08:16:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 467tT76smszyJs;
	Wed, 14 Aug 2019 17:16:11 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 14 Aug
 2019 17:16:11 +0200
Subject: Re: [PATCH] driver: Account for renaming of lapic_timer_frequency in
 5.3
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <3ba1c1ff-a96b-bc2f-49d5-86ae7f032528@siemens.com>
 <274f6f7f-401d-d275-4b53-dd957cd641ba@oth-regensburg.de>
 <5d66e114-6e4e-1b79-ed67-364455c048d5@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <54d5522f-16cb-0ebf-b93a-821d13da7ce8@oth-regensburg.de>
Date: Wed, 14 Aug 2019 17:16:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d66e114-6e4e-1b79-ed67-364455c048d5@siemens.com>
Content-Type: multipart/mixed;
	boundary="------------CD18CF4C84FA02B7E2548023"
Content-Language: de-DE
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dbCZbvd2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

--------------CD18CF4C84FA02B7E2548023
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



On 8/14/19 4:35 PM, Jan Kiszka wrote:
> On 14.08.19 16:11, Ralf Ramsauer wrote:
>>
>> On 7/25/19 8:01 AM, Jan Kiszka wrote:
>>> "lapic_timer_frequency hei=C3=9Ft jetzt lapic_timer_period, sonst =C3=
=A4ndert sich
>>> nix."
>>
>> Doch.
>>
>> We have a problem if KALLSYMS_ALL=3Dy. Jailhouse will compile, but it
>> fails loading the driver module with EINVAL, the symbol can not be
>> resolved, see below.
>>
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>> =C2=A0 driver/main.c | 9 ++++++---
>>> =C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/driver/main.c b/driver/main.c
>>> index fe752753..b3896609 100644
>>> --- a/driver/main.c
>>> +++ b/driver/main.c
>>> @@ -100,7 +100,10 @@ static struct resource *hypervisor_mem_res;
>>> =C2=A0 =C2=A0 static typeof(ioremap_page_range) *ioremap_page_range_sym=
;
>>> =C2=A0 #ifdef CONFIG_X86
>>> -static typeof(lapic_timer_frequency) *lapic_timer_frequency_sym;
>>> +#if LINUX_VERSION_CODE < KERNEL_VERSION(5,3,0)
>>> +#define lapic_timer_period=C2=A0=C2=A0=C2=A0 lapic_timer_frequency
>>> +#endif
>>> +static typeof(lapic_timer_period) *lapic_timer_period_sym;
>>> =C2=A0 #endif
>>> =C2=A0 #ifdef CONFIG_ARM
>>> =C2=A0 static typeof(__boot_cpu_mode) *__boot_cpu_mode_sym;
>>> @@ -550,7 +553,7 @@ static int jailhouse_cmd_enable(struct
>>> jailhouse_system __user *arg)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config->platform=
_info.x86.tsc_khz =3D tsc_khz;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (config->platform_info.x86.apic_khz =
=3D=3D 0)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config->platform=
_info.x86.apic_khz =3D
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *la=
pic_timer_frequency_sym / (1000 / HZ);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *la=
pic_timer_period_sym / (1000 / HZ);
>>> =C2=A0 #endif
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D jailhouse_cell_prepare_ro=
ot(&config->root_cell);
>>> @@ -897,7 +900,7 @@ static int __init jailhouse_init(void)
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(ioremap_p=
age_range);
>>> =C2=A0 #ifdef CONFIG_X86
>>> -=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency);
>>> +=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
>> Here, lapic_timer_period won't be replaced with lapic_timer_frequency in
>> the RESOLVE_EXTERNAL_SYMBOL macro:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 symbol##_sym =3D (void =
*)kallsyms_lookup_name(#symbol);=C2=A0=C2=A0 \
>>
>=20
> Hmm, 2-stage pre-processor would be needed here. #if LINUX_VERSION_CODE
> sees to be required then, what a pity.

Yep, I have that exact case: 4.19.x + KALLSYMS_ALL.

>=20
> Want to write a patch as you have the setup already?

Well, my current setup is to disable KALLSYMS_ALL. :-)

But I don't see how this could be patched, is there a way to tell the
preprocessor to roll out #symbol before interpreting it as string.

The only way that I see at the moment is something like the attached
patch (only compile-time tested).

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
jailhouse-dev/54d5522f-16cb-0ebf-b93a-821d13da7ce8%40oth-regensburg.de.

--------------CD18CF4C84FA02B7E2548023
Content-Type: text/x-patch; name="sym.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="sym.patch"

diff --git a/driver/main.c b/driver/main.c
index b3896609..6f926f18 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -102,6 +102,9 @@ static typeof(ioremap_page_range) *ioremap_page_range_sym;
 #ifdef CONFIG_X86
 #if LINUX_VERSION_CODE < KERNEL_VERSION(5,3,0)
 #define lapic_timer_period	lapic_timer_frequency
+#define LAPIC_TIMER_PERIOD_NAME	"lapic_timer_frequency"
+#else /* Kernel >= 5.3.0 */
+#define LAPIC_TIMER_PERIOD_NAME	"lapic_timer_period"
 #endif
 static typeof(lapic_timer_period) *lapic_timer_period_sym;
 #endif
@@ -889,18 +892,21 @@ static int __init jailhouse_init(void)
 	int err;
 
 #ifdef CONFIG_KALLSYMS_ALL
-#define RESOLVE_EXTERNAL_SYMBOL(symbol)				\
-	symbol##_sym = (void *)kallsyms_lookup_name(#symbol);	\
-	if (!symbol##_sym)					\
+#define _RESOLVE_EXTERNAL_SYMBOL(symbol, symbol_name)			\
+	symbol##_sym = (void *)kallsyms_lookup_name(symbol_name);	\
+	if (!symbol##_sym)						\
 		return -EINVAL
+#define RESOLVE_EXTERNAL_SYMBOL(symbol)					\
+	_RESOLVE_EXTERNAL_SYMBOL(symbol, #symbol)
 #else
-#define RESOLVE_EXTERNAL_SYMBOL(symbol)				\
+#define RESOLVE_EXTERNAL_SYMBOL(symbol)
+#define _RESOLVE_EXTERNAL_SYMBOL(symbol, _)				\
 	symbol##_sym = &symbol
 #endif
 
 	RESOLVE_EXTERNAL_SYMBOL(ioremap_page_range);
 #ifdef CONFIG_X86
-	RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
+	_RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period, LAPIC_TIMER_PERIOD_NAME);
 #endif
 #ifdef CONFIG_ARM
 	RESOLVE_EXTERNAL_SYMBOL(__boot_cpu_mode);

--------------CD18CF4C84FA02B7E2548023--
