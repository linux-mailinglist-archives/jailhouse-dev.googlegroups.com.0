Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBROQ2DVAKGQEOQO5TWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id A96DC8D729
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 17:27:01 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id o13sf5208701wrx.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 08:27:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565796421; cv=pass;
        d=google.com; s=arc-20160816;
        b=HDejN/Mn4MUx+4ItpcWyasPe4A8WR+gerSlT4kOHkclJ9GwWLl9146ZC7UR7LUhnqB
         vzTmLIIENRQM5ui33PURPsyQzMtVoC5LloUYiF4Q9Z3bsYFfqccJmKaxn6GjHA4wWnIH
         nIx6p/0jPXdmefBGUq99AeWzUcOgvWVQKIzETAkOm9ZvlffaRSskfkDhJqrN9TGMKapm
         /pZB7P3dLru2ctC/pBuY1UGi5hoRpPIE5Isx1h0+6t875uSyOFQ0Ql56lwjenGEFibGf
         w6Ti83o+yWNhk9fOo5ISh4+guVbhOE3YJLD7kyEYHBZmWYIC3poCA6BhuyvWxizto2xd
         oCWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=FxY3BHNsDWjohFu1q2bEA5yiK7CIPAWDt/ZE9vjTYv0=;
        b=Ac3txgxcCpjvL5gzkvUUoPxA2pj+ZoJk5EtGmcnVl5/sKHYpsAaQZ8eXn1NeWHm7us
         f/HsQtRVMVAH3X1e5l7m2a9rpc/qQZ/i3y8BC2KqW3DnIngTv82atefZgsfRbU+Nj5RX
         l70wZVDNrHvnprZCIihP5xS0zj+oCcjEOZ7Bc5j+NBgu1J7McyKHRZo+3BUyDkWjKLYI
         MGqRW20ZcRkLqjUwbvzHR5/8p6qSKGcM4ftZw0jLFsNIvpavO+xs0od3aJg9jXZ4muK1
         0IoZOyk3vO/hbuM5SJctMBHMu8N+oWuGk4Mgxc3zkqep0QbJCulsSIxl6ctvUT+keVwk
         pOhg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="P1X/sH+q";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FxY3BHNsDWjohFu1q2bEA5yiK7CIPAWDt/ZE9vjTYv0=;
        b=DqUoFwW3TBzg6VGGTd4Eo0vVpOGC9gLiWsooo0LmqvR1GU5V/z6JXmjk2eOXS6ABhk
         DQnn9pi9r/GsLa0nXPg5UhspWqina5Jp4pmxJ1i2jQjTZ9nNoTKiVtSMXb566e6Ymmqh
         i0GTAeKWOEPkWY6/WWEYM+LyCQyG1sQo1GMNXLfjfXIPFHPpR925/AKY3n2ekVDdabC4
         ALuj3O8vqTkfIcTPbQPlXAze8xxEI1Mks/w3SGF8T+5H4SGx79JfDWSaOkU8Z7HrowOP
         Koe2LWBsplNBsCObhJREdJtHTvgcbPmG23RlGQUKd6GgfXMphuUvQ2ajTQa50zGChe83
         6U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FxY3BHNsDWjohFu1q2bEA5yiK7CIPAWDt/ZE9vjTYv0=;
        b=NHwt7ZnzS8YgaLUOLG+cxstCIB30TTgnvuhI+H+VrJMJqYhOQiRGP5YqjC/Gb07+pB
         Y8CFD5PgVYjq9sYaxSkqKd/tWTksweGI+51tQG77SK2HmYwmTj5/VcL/qO1vM4vegzsp
         I7ifQmcjs5VRUxGkA2IKl1Cd9L9Ua7vD67s3g4jrZuEMuBnmd4JaRNcgFfR3yDptPQ6w
         Ta8h+Vq995dMVkoCcVtWafGatl5TJ7Pr83n7LzcZrQlXoWwMYfInAIOBQJLgQzamg7Ca
         hiN5irpCL267nOYZ9U6Hni1WpBrafjKQN1Y3hP/wPFdeGHxt4T3qW4kh6b0MdeXC7LG8
         ni5Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU9mgSNOoMPXGnmA+OYveUy2X3OEw5JB1+T76xNvuYm7S3wcgPF
	9qwAan0EW3ninYj6JkzsqzE=
X-Google-Smtp-Source: APXvYqzfnL+yxCNLICzXtsvUehssiZIgBMiwR2HhSXzua3//hWcO9kC4yXSRhmc+zggz2fp1z+A8lg==
X-Received: by 2002:a1c:9ec5:: with SMTP id h188mr4062892wme.176.1565796421412;
        Wed, 14 Aug 2019 08:27:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ab1b:: with SMTP id q27ls709805wrc.7.gmail; Wed, 14 Aug
 2019 08:27:00 -0700 (PDT)
X-Received: by 2002:adf:f812:: with SMTP id s18mr333271wrp.32.1565796420949;
        Wed, 14 Aug 2019 08:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565796420; cv=none;
        d=google.com; s=arc-20160816;
        b=P1zC3X2UEzw4tQ6IPhsjUTprq9VKbTHtqAjhvtuRmmAN2UYIYiVlw7kWQKYW4rfCCy
         k/8nM256JlPHK1IyNp3YTnV5uhVbbPnQ+C2D8xdwRMJDjrjldl4mIMSZKiDqd5aikyvF
         D+HE/jtOW0atI48O5W5jDpIVPSQknvgy7Fb2kjtwj1wbVv0lg3WiqOJOhmEij3GrVFIg
         /Ep9C8hMx4Z+tQJPjmLpLqIEUruIubehCfD5qXlcIanY9h9SIdNlmZqDjxxUB5ZYIhFG
         FuTEWsvi+ig+LnUyjyyqYwbXMZ8YXYWa/aaXPWT93ZDrEohFc0agfowD1Y9Ia03Ez/Vf
         gzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=UoxPTuwQlvep4DfQ/GPSzZUfmzLkZj0O7P5xK6vMIyQ=;
        b=XWdeQnrfymRLYamrrgVA6vYW/i4LaDmNcjrC7IAq963/J/dipn8cGaKxBpUH62xHry
         opgyTZiPASt4i+fXJ9aNfDZRfLd6qp+hTKZet/RWgq+jri+PYTbK9vd3vM4RH+qeA1Kh
         XGLQkUHSxqDSr4i5gCcEqCNc3n6mPM+DW7qass0PMKLXkm2wKPQJLbqghTtdjO31gOf4
         onSzaJiMfA+ntQDHJGMHvruXxtVfJOdK4OuXbW3LbCxmTPQCen87tngWnoHTKQwLjpf4
         RGG4I/UtxDSi0zo9QFv83BNJzHl8QMLEv+WPeHXnfqTS1iKD5vf5b3Kj2Au7eDcjTEuI
         XC6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="P1X/sH+q";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id q14si3805wmc.1.2019.08.14.08.27.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 08:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 467tjc3w2JzyJs;
	Wed, 14 Aug 2019 17:27:00 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 14 Aug
 2019 17:27:00 +0200
Subject: Re: [PATCH] driver: Account for renaming of lapic_timer_frequency in
 5.3
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <3ba1c1ff-a96b-bc2f-49d5-86ae7f032528@siemens.com>
 <274f6f7f-401d-d275-4b53-dd957cd641ba@oth-regensburg.de>
 <5d66e114-6e4e-1b79-ed67-364455c048d5@siemens.com>
 <54d5522f-16cb-0ebf-b93a-821d13da7ce8@oth-regensburg.de>
 <29a363fe-0fb7-debc-56fd-986d88c990a6@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <484bee87-00a2-9121-6a99-77949b5fbf5d@oth-regensburg.de>
Date: Wed, 14 Aug 2019 17:27:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <29a363fe-0fb7-debc-56fd-986d88c990a6@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="P1X/sH+q";
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



On 8/14/19 5:18 PM, Jan Kiszka wrote:
> On 14.08.19 17:16, Ralf Ramsauer wrote:
>>
>>
>> On 8/14/19 4:35 PM, Jan Kiszka wrote:
>>> On 14.08.19 16:11, Ralf Ramsauer wrote:
>>>>
>>>> On 7/25/19 8:01 AM, Jan Kiszka wrote:
>>>>> "lapic_timer_frequency hei=C3=9Ft jetzt lapic_timer_period, sonst =C3=
=A4ndert
>>>>> sich
>>>>> nix."
>>>>
>>>> Doch.
>>>>
>>>> We have a problem if KALLSYMS_ALL=3Dy. Jailhouse will compile, but it
>>>> fails loading the driver module with EINVAL, the symbol can not be
>>>> resolved, see below.
>>>>
>>>>>
>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>> ---
>>>>> =C2=A0=C2=A0 driver/main.c | 9 ++++++---
>>>>> =C2=A0=C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/driver/main.c b/driver/main.c
>>>>> index fe752753..b3896609 100644
>>>>> --- a/driver/main.c
>>>>> +++ b/driver/main.c
>>>>> @@ -100,7 +100,10 @@ static struct resource *hypervisor_mem_res;
>>>>> =C2=A0=C2=A0 =C2=A0 static typeof(ioremap_page_range) *ioremap_page_r=
ange_sym;
>>>>> =C2=A0=C2=A0 #ifdef CONFIG_X86
>>>>> -static typeof(lapic_timer_frequency) *lapic_timer_frequency_sym;
>>>>> +#if LINUX_VERSION_CODE < KERNEL_VERSION(5,3,0)
>>>>> +#define lapic_timer_period=C2=A0=C2=A0=C2=A0 lapic_timer_frequency
>>>>> +#endif
>>>>> +static typeof(lapic_timer_period) *lapic_timer_period_sym;
>>>>> =C2=A0=C2=A0 #endif
>>>>> =C2=A0=C2=A0 #ifdef CONFIG_ARM
>>>>> =C2=A0=C2=A0 static typeof(__boot_cpu_mode) *__boot_cpu_mode_sym;
>>>>> @@ -550,7 +553,7 @@ static int jailhouse_cmd_enable(struct
>>>>> jailhouse_system __user *arg)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config->=
platform_info.x86.tsc_khz =3D tsc_khz;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (config->platform_info.x86.ap=
ic_khz =3D=3D 0)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config->=
platform_info.x86.apic_khz =3D
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=
lapic_timer_frequency_sym / (1000 / HZ);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=
lapic_timer_period_sym / (1000 / HZ);
>>>>> =C2=A0=C2=A0 #endif
>>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D jailhouse_cell_pr=
epare_root(&config->root_cell);
>>>>> @@ -897,7 +900,7 @@ static int __init jailhouse_init(void)
>>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(i=
oremap_page_range);
>>>>> =C2=A0=C2=A0 #ifdef CONFIG_X86
>>>>> -=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency);
>>>>> +=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
>>>> Here, lapic_timer_period won't be replaced with
>>>> lapic_timer_frequency in
>>>> the RESOLVE_EXTERNAL_SYMBOL macro:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 symbol##_sym =
=3D (void *)kallsyms_lookup_name(#symbol);=C2=A0=C2=A0 \
>>>>
>>>
>>> Hmm, 2-stage pre-processor would be needed here. #if LINUX_VERSION_CODE
>>> sees to be required then, what a pity.
>>
>> Yep, I have that exact case: 4.19.x + KALLSYMS_ALL.
>>
>>>
>>> Want to write a patch as you have the setup already?
>>
>> Well, my current setup is to disable KALLSYMS_ALL. :-)
>>
>> But I don't see how this could be patched, is there a way to tell the
>> preprocessor to roll out #symbol before interpreting it as string.
>>
>> The only way that I see at the moment is something like the attached
>> patch (only compile-time tested).
>=20
> #if VERSION < 5.3
> =C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency);
> #else
> =C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
> #endif

Huh? How should this work?

Independent of the kernel version, we have to set
lapic_timer_period_sym. The VERSION < 5.3 case will try to set
lapic_timer_frequency_sym, which doesn't exist and isn't used.

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
jailhouse-dev/484bee87-00a2-9121-6a99-77949b5fbf5d%40oth-regensburg.de.
