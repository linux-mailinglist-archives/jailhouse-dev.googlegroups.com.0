Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBL5Y2DVAKGQECUUPX2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAEC8D649
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 16:35:28 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id q45sf6336145eda.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 07:35:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565793328; cv=pass;
        d=google.com; s=arc-20160816;
        b=c8Y8vnHAoEnnIMFgv7Q6t9zKiepxo2KuFpzIomENfKeYqqsXEqhUOUWzS2cS+a0lPL
         UhG2HpDgiXZmbWFfxZN+UnC0sql5gpKTcVTu2l/YsosJsv+PbcRRnl9fasc/didy11DJ
         jeGf1vya0FaVihFoF4g7NFDYu/hr1AgvLRj8ls6uh+iYh0Sva67EAv8L2kGlhtbNvFyz
         R7MsGJ4S+HTfQE+D2C963tHbcQJYgntS2CAahVq3pPx6QLBrVRd8e3HzeGaC72oU1ljl
         cjnnU4QE0gk/DEEYmRZf0cIGjxtZix4wZVbSUQJ74ykK99NoToxRI0xMdh2WXsoxOiM9
         cTGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=B40tDgC1c9ai3w/EGTvPRyRVWg8RufCZYhcZuYnTKZk=;
        b=Gh61mJFecT1rFHsmWYUgN8c9D87T1jkTUJQJHrmBbUMpUqehtw++DFQVPEZjkwl91r
         GZKkr6EtFzB4X5VwCPtj+cFr3rRYbs3A6BfWmsa9ysPzrSzsW7AWE4jzGXyq1fqnHYRT
         gYeptnr0EkSXBcuZQ1jV/26v6IwSEABe1bUY9CTQJ0/FnePki/FY2qoK1iIAc2SxncaH
         56c6/AU3mruQvSXpqcxxBw4bWlRUz+zewvUMhyuQiw3SiCySoaZ765mZpiwPPEjoS23K
         JXKxLHlftfLzc7jBRnOcNsRKw8+cbU1dIghV+eXDq/2S2xIaVZjv8cagR2fz0GYl8i9b
         xqhQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=B40tDgC1c9ai3w/EGTvPRyRVWg8RufCZYhcZuYnTKZk=;
        b=by1/0U2vQPalTJ9e6nY0hAGkboyBuwfq75HTIKQaB13DFmiuZgRXEflQ0qx0QpMR8i
         QPk8SVSY8zfWlf8/z7VcxIF6w1k2H0nHOshTQPTsuFP6B1PQaYJV328MWQre7YvxkU4N
         G3vKRbdQHexDOdDhsU8C0CCym6bksueQSgK31+0cUdtVkxSN1dvQHeet+4/tCduRcuzh
         PJcxf9/bRFWTUjsGhGm9IQ9y07veUOBFET1IDQmfiVq7ifJlh/6EA3M4R9PmRcKQGkY1
         NfL9CcUBMZlQWOX4+vBX+ziRl2pieDuxxl3d+T3vC/HZ/7Qyam9bA9n6GLP0i3Er8XLh
         yesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=B40tDgC1c9ai3w/EGTvPRyRVWg8RufCZYhcZuYnTKZk=;
        b=Nz5sll/u72iwyPPUFVTDql3WmdemUZSMN/aonGOs6PyM2O48oWbT4YVbrBS/hZFPDB
         r0Jnkuzem1eFWJthrs1/2eGUWIYTYBZq25n6xQYW6T+4UXguNGlRWR+9N/ZQHTM9k4VB
         z0Umncme1SSGIfKus3FFwy7oCgn5RPH4cGA8p3Gmu/8vbvObXBBy+IkCUfy9rPuSzet9
         mcxQDQOhO5yyABWNGFJMNjGX/S9p4WIf5w1na71QrWVXhUxiYfondjmZptFJsVjzZZDo
         /yCyf0ZK/Fep5VVhgmTrLZ45BrlzE7IfzvoVA0ahtVn/UIVr/fFuDAKwXFeTqxtWy26Z
         NbSQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUKEEfKGdkTgJ7sSP4urhiQxwVlJLFw9/1+PeCs8vw2ZwMaCFwI
	yatgzilKSvfh0ULZ/L5k7q0=
X-Google-Smtp-Source: APXvYqysYfeV2qyd5QshPnDWFGsfwp13kHUFeF1IrpHaLGy445qIBqltMu2tb5pM4MmzSicCO3m1Sw==
X-Received: by 2002:a17:906:489a:: with SMTP id v26mr41188724ejq.234.1565793327932;
        Wed, 14 Aug 2019 07:35:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:2cf:: with SMTP id b15ls642644edx.3.gmail; Wed, 14
 Aug 2019 07:35:27 -0700 (PDT)
X-Received: by 2002:a50:c94b:: with SMTP id p11mr48097670edh.301.1565793327170;
        Wed, 14 Aug 2019 07:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565793327; cv=none;
        d=google.com; s=arc-20160816;
        b=liY1Z3TTGLrUotsU06NwnqxaJZKxp4R1X5i5DOATKb/+rBUECAPH3WPw1bPtFnULaN
         iuR0ncJ/I3zxcI5B/zNgrSTmRP4yDxCefpqB37KkCYpxmafrxrTB0f3F3wZQW9ucGVfL
         VqZ3yBoSbD5Mr/8xIfgdL/rxotWtBHo/GENp/vHDGX9prGTTJM2oeQs9+2QPAgXYpn/b
         E+ssdHddKVQLyq0KqiwpgWlAVgFCook4mvKSPszW4ZdvcsBKPr9ID4mE6d+xrDUdURCR
         PFDyqj7IDywSTLboRXIlllbjZs8g8EkN1C0SO+VkwuYyAkKqdh8HJmhbit9ZMOaEy6Yb
         MgNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=GTCJzSXg2D2NKhoGrTY6HABawAWZPsIgbzSZiBwE+6g=;
        b=HaiNSGVfqMxqQNX79/DcQ9DprXcx43H3gLjxGnlHLEJZRTqDvOvcvJO71l9lPnkyHD
         p/S12vMcWoCl92iOff6DIK5RHkaKyKB3HkrJxbs4R5SBNAFrmxCCuTX89qlI9ltbmLrd
         4JGknEtYmMMICXuHVf6DD+DzT3yrITHLdlidYclydn+HGDntC0riIQEWZEOY7u2Neeiw
         wGFu0sgy/Zwo6GlapEUcnNplPtq4c/FrsR6oWYKOVIpbv9uRajHZiqQr4j9iBnFLo0Nk
         Mgx+9k5O0mZMRykTKrXFFgEwrXUpilCCpNWm1lcP9fMRNil8u071lRVqe+NZgWzXRkoY
         r/BQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id s30si2964107eda.4.2019.08.14.07.35.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 07:35:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x7EEZQhE007872
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2019 16:35:26 +0200
Received: from [139.23.113.48] ([139.23.113.48])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7EEZQHQ007401;
	Wed, 14 Aug 2019 16:35:26 +0200
Subject: Re: [PATCH] driver: Account for renaming of lapic_timer_frequency in
 5.3
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <3ba1c1ff-a96b-bc2f-49d5-86ae7f032528@siemens.com>
 <274f6f7f-401d-d275-4b53-dd957cd641ba@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5d66e114-6e4e-1b79-ed67-364455c048d5@siemens.com>
Date: Wed, 14 Aug 2019 16:35:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <274f6f7f-401d-d275-4b53-dd957cd641ba@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 14.08.19 16:11, Ralf Ramsauer wrote:
>=20
> On 7/25/19 8:01 AM, Jan Kiszka wrote:
>> "lapic_timer_frequency hei=C3=9Ft jetzt lapic_timer_period, sonst =C3=A4=
ndert sich
>> nix."
>=20
> Doch.
>=20
> We have a problem if KALLSYMS_ALL=3Dy. Jailhouse will compile, but it
> fails loading the driver module with EINVAL, the symbol can not be
> resolved, see below.
>=20
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>   driver/main.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/driver/main.c b/driver/main.c
>> index fe752753..b3896609 100644
>> --- a/driver/main.c
>> +++ b/driver/main.c
>> @@ -100,7 +100,10 @@ static struct resource *hypervisor_mem_res;
>>  =20
>>   static typeof(ioremap_page_range) *ioremap_page_range_sym;
>>   #ifdef CONFIG_X86
>> -static typeof(lapic_timer_frequency) *lapic_timer_frequency_sym;
>> +#if LINUX_VERSION_CODE < KERNEL_VERSION(5,3,0)
>> +#define lapic_timer_period	lapic_timer_frequency
>> +#endif
>> +static typeof(lapic_timer_period) *lapic_timer_period_sym;
>>   #endif
>>   #ifdef CONFIG_ARM
>>   static typeof(__boot_cpu_mode) *__boot_cpu_mode_sym;
>> @@ -550,7 +553,7 @@ static int jailhouse_cmd_enable(struct jailhouse_sys=
tem __user *arg)
>>   		config->platform_info.x86.tsc_khz =3D tsc_khz;
>>   	if (config->platform_info.x86.apic_khz =3D=3D 0)
>>   		config->platform_info.x86.apic_khz =3D
>> -			*lapic_timer_frequency_sym / (1000 / HZ);
>> +			*lapic_timer_period_sym / (1000 / HZ);
>>   #endif
>>  =20
>>   	err =3D jailhouse_cell_prepare_root(&config->root_cell);
>> @@ -897,7 +900,7 @@ static int __init jailhouse_init(void)
>>  =20
>>   	RESOLVE_EXTERNAL_SYMBOL(ioremap_page_range);
>>   #ifdef CONFIG_X86
>> -	RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency);
>> +	RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
> Here, lapic_timer_period won't be replaced with lapic_timer_frequency in
> the RESOLVE_EXTERNAL_SYMBOL macro:
>=20
>          symbol##_sym =3D (void *)kallsyms_lookup_name(#symbol);   \
>=20

Hmm, 2-stage pre-processor would be needed here. #if LINUX_VERSION_CODE see=
s to=20
be required then, what a pity.

Want to write a patch as you have the setup already?

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
jailhouse-dev/5d66e114-6e4e-1b79-ed67-364455c048d5%40siemens.com.
