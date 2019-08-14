Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOG32DVAKGQE32SGTCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3108D770
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 17:50:16 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id f9sf53592154wrq.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 08:50:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565797816; cv=pass;
        d=google.com; s=arc-20160816;
        b=lvOaLNCYXL9mW6cKOrFK7VlcsLoKU5SfdoCLOHlITn3Yz1CRG/nBpOseGKghap0t9S
         EEGiL5DkaPvxc7a6We4PU/XR2twbhp34d1hvGMUcf4wAtGNvwVwIhvuDW9eKt8FvyN4d
         sSe+0jg/1zOiNR+GRUCws3ecgi0/eSxhRnWbNpLTPKlU/stPOdgnrBfjKRK7ZgJYsbeH
         8XG01BoCvByb++JP6GYUWOSX2QJCUwlQ+h1mFhuacCzFk3HeCo3I8KcEGL9MZ0A4lWF2
         tpGQXE4DTubK2tSAv0fei8vb26ItLKgw3BIoqcIdNgD3DByN2AcBmfb146WOXSHJVydh
         20Kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=rwBNoaXbepDE3P4lMSeAr0+oH1Ne5LBeX6bmGFfp6v0=;
        b=OVGWywoQUw9udo/6K8/nuFvhyIVpKO15QYL/P64MBGKQqZ6VoJ7WBCE5wA+jReJn3O
         Ycbu+aEjVC/Rh8v1qovZmL5wUBYJfUsjohwgInTws8bCMsgbie3CUVjR8kp8mEY+6/V0
         oCwmvWoQHUVnKCgBPmSKo2cda8A6llwDkGj0uQuhNoB4uMZlcP2Ns0ag73ja+Okp/OVG
         RTKsx06X9vafzCDOZdf3/RSiVT/OnV34MRJ12wfX/vKGpnyD5DKpiONcZSN0XFsL3e6u
         HEsLkZ0y9Iv2ug0+oRnA8XBikojMWoJKqPvlb53vnI1DWIP+W4dly2eRK6zT9lxDyW4A
         tMtg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rwBNoaXbepDE3P4lMSeAr0+oH1Ne5LBeX6bmGFfp6v0=;
        b=TEqzKqERkIaxLFkNxdMnf6b3m/Sy54/rKbI7Bmw5LM9vnr5j0f+pj4J6bSzhTo9Gjm
         Z15JtawaTEqihJGOH45KXsw2FVnkNMhEwn8cjysZdGiZsnhWZI7f93PmdE0iE7cMh3gL
         AyB0D9sHvDWIYsGyMv4YFxi6Usmxl+TXyFNnu4Bkgyx8Jv0LBFee6OjKV2zJGLXZ95Nu
         nX7e0jHZ1P3UVlGbfnYMlJGnI/1tfRhyYx1zcMOYWruamn3whaMr78U2h3boOcDEKq6z
         qVojMd+vtHlbS7ih1/fTYJ4obP3rphTo/TGAfbUzz7ch3XHFknTPnej546AUtXPMNmRL
         AEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rwBNoaXbepDE3P4lMSeAr0+oH1Ne5LBeX6bmGFfp6v0=;
        b=WpUDG+Vuo3VZqgdsDfEUhUIqINOxzxC827Yt1lQbgeX03zhh6F+k2GTmtL3Ru1YP0E
         WxlAd/fe/I8U83l1gWKOmykOv4fSnHZNZesv0ZyAYDXe5l2uuS62SpQOSWUbfi2jpOdl
         6i2GjJO2d5BkA4OfILlUdVrLYoi0lszk0/6Z6JB2faRbwF/uDsznGq9B0asabG5IMVnn
         DAvk+meM9Ml4eogxolXQPBt8pIOIGfXWAWW94Q4/lbkbjMD+l+mKOxgsCoHK6n19Gv0w
         vfSfyoD2+1aA7vTWixRdGfLsDA2OfM2DoGqGNjycKFJCoDePiU8Rxe+FPkkS14cAtp9s
         MlHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVkf4ZYxWR88aHKUhRwhyDjT4QyD1Gs0QxCgQUIvyzR9noPGP67
	DfEBQds1Jjzsel0Vjnjpfcc=
X-Google-Smtp-Source: APXvYqzQZpEES2o6lx9iRnjhGxqE87F6t9sSGBTg2eEtwxV7ecjc1nbVHWHjFtzlIMRM7Xoi+i1LOA==
X-Received: by 2002:adf:f710:: with SMTP id r16mr395464wrp.81.1565797816609;
        Wed, 14 Aug 2019 08:50:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c44b:: with SMTP id l11ls950077wmi.0.canary-gmail; Wed,
 14 Aug 2019 08:50:15 -0700 (PDT)
X-Received: by 2002:a05:600c:551:: with SMTP id k17mr9315558wmc.53.1565797815949;
        Wed, 14 Aug 2019 08:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565797815; cv=none;
        d=google.com; s=arc-20160816;
        b=b2L4rzZtrZTmVYfiSFqYSFD7mxj0HYvGFizpEhktlZsMjgGrsOgvP0vMeC43nZkMxw
         h3QyjKLIQsETzVocDwLNsi1bahmMnWMWgsd1/SgWA12lR469KYDsNH++Kpl/xAx6rtGs
         SheK9Tup690Wpc0YkatSS0XiLjb3q6vr/wX0q29VsUyRkh8LDEtJFImPbS0tMgcQxym6
         f4aMo2CvtiDJt0UQaqe9bp7AWIt/59gNMQlOayKBeVUaiC2O5YhH+ODvvIYmWoUaazlW
         +LojPXEYAFK5yiItUzNiOxsMOuhG8AQeN6Ttj7jFT4k+HhuoUUNy7myKBDmVu6/maoZ4
         hD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=FNlvq8hhWCTwOOKyI4ZmAJcPG1j78MjnLYpdj/0PU1M=;
        b=NnpX9kKj+6b/Yh62V5mNk9AyiWt5cZPG4tjA5hwUXmHO7u4pNuNuqeml9MCXP1PRKv
         xZ1xuLcVl/7JGol3Qln/E5TwuQ6q9/MQh8nREHxU1SF2A8lTOpPnTBG5O7W7nQv2uXbS
         lpZCV0WfA+PU+vWed92hjDtWtknXMrY1ynvw84IGNj4cLBeCsm9HKN77LOs5oYJOiZWO
         WLVvyJgO2FeVAyYATij/fCEx64u5j01Z2gVxUWY8X8xdcIac9UTZ59a7StLBlnKMWEYv
         5wn/zlSoNUJwqAOMJ9Un8QDCmuIlZJpg6Q2qudq1Ia8UYseuFBtZaY7ukQoQpgcJvuj1
         dJXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p4si5958wme.2.2019.08.14.08.50.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 08:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x7EFoFxo001070
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2019 17:50:15 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7EFoFTj031195;
	Wed, 14 Aug 2019 17:50:15 +0200
Subject: Re: [PATCH] driver: Account for renaming of lapic_timer_frequency in
 5.3
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <3ba1c1ff-a96b-bc2f-49d5-86ae7f032528@siemens.com>
 <274f6f7f-401d-d275-4b53-dd957cd641ba@oth-regensburg.de>
 <5d66e114-6e4e-1b79-ed67-364455c048d5@siemens.com>
 <54d5522f-16cb-0ebf-b93a-821d13da7ce8@oth-regensburg.de>
 <29a363fe-0fb7-debc-56fd-986d88c990a6@siemens.com>
 <484bee87-00a2-9121-6a99-77949b5fbf5d@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d497494a-95aa-82fa-c9b7-29c74e395c78@siemens.com>
Date: Wed, 14 Aug 2019 17:50:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <484bee87-00a2-9121-6a99-77949b5fbf5d@oth-regensburg.de>
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

On 14.08.19 17:27, Ralf Ramsauer wrote:
>=20
>=20
> On 8/14/19 5:18 PM, Jan Kiszka wrote:
>> On 14.08.19 17:16, Ralf Ramsauer wrote:
>>>
>>>
>>> On 8/14/19 4:35 PM, Jan Kiszka wrote:
>>>> On 14.08.19 16:11, Ralf Ramsauer wrote:
>>>>>
>>>>> On 7/25/19 8:01 AM, Jan Kiszka wrote:
>>>>>> "lapic_timer_frequency hei=C3=9Ft jetzt lapic_timer_period, sonst =
=C3=A4ndert
>>>>>> sich
>>>>>> nix."
>>>>>
>>>>> Doch.
>>>>>
>>>>> We have a problem if KALLSYMS_ALL=3Dy. Jailhouse will compile, but it
>>>>> fails loading the driver module with EINVAL, the symbol can not be
>>>>> resolved, see below.
>>>>>
>>>>>>
>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>> ---
>>>>>>  =C2=A0=C2=A0 driver/main.c | 9 ++++++---
>>>>>>  =C2=A0=C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/driver/main.c b/driver/main.c
>>>>>> index fe752753..b3896609 100644
>>>>>> --- a/driver/main.c
>>>>>> +++ b/driver/main.c
>>>>>> @@ -100,7 +100,10 @@ static struct resource *hypervisor_mem_res;
>>>>>>  =C2=A0=C2=A0 =C2=A0 static typeof(ioremap_page_range) *ioremap_page=
_range_sym;
>>>>>>  =C2=A0=C2=A0 #ifdef CONFIG_X86
>>>>>> -static typeof(lapic_timer_frequency) *lapic_timer_frequency_sym;
>>>>>> +#if LINUX_VERSION_CODE < KERNEL_VERSION(5,3,0)
>>>>>> +#define lapic_timer_period=C2=A0=C2=A0=C2=A0 lapic_timer_frequency
>>>>>> +#endif
>>>>>> +static typeof(lapic_timer_period) *lapic_timer_period_sym;
>>>>>>  =C2=A0=C2=A0 #endif
>>>>>>  =C2=A0=C2=A0 #ifdef CONFIG_ARM
>>>>>>  =C2=A0=C2=A0 static typeof(__boot_cpu_mode) *__boot_cpu_mode_sym;
>>>>>> @@ -550,7 +553,7 @@ static int jailhouse_cmd_enable(struct
>>>>>> jailhouse_system __user *arg)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config=
->platform_info.x86.tsc_khz =3D tsc_khz;
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (config->platform_info.x86.=
apic_khz =3D=3D 0)
>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config=
->platform_info.x86.apic_khz =3D
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
*lapic_timer_frequency_sym / (1000 / HZ);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
*lapic_timer_period_sym / (1000 / HZ);
>>>>>>  =C2=A0=C2=A0 #endif
>>>>>>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D jailhouse_cell_=
prepare_root(&config->root_cell);
>>>>>> @@ -897,7 +900,7 @@ static int __init jailhouse_init(void)
>>>>>>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL=
(ioremap_page_range);
>>>>>>  =C2=A0=C2=A0 #ifdef CONFIG_X86
>>>>>> -=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency);
>>>>>> +=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
>>>>> Here, lapic_timer_period won't be replaced with
>>>>> lapic_timer_frequency in
>>>>> the RESOLVE_EXTERNAL_SYMBOL macro:
>>>>>
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 symbol##_sym =
=3D (void *)kallsyms_lookup_name(#symbol);=C2=A0=C2=A0 \
>>>>>
>>>>
>>>> Hmm, 2-stage pre-processor would be needed here. #if LINUX_VERSION_COD=
E
>>>> sees to be required then, what a pity.
>>>
>>> Yep, I have that exact case: 4.19.x + KALLSYMS_ALL.
>>>
>>>>
>>>> Want to write a patch as you have the setup already?
>>>
>>> Well, my current setup is to disable KALLSYMS_ALL. :-)
>>>
>>> But I don't see how this could be patched, is there a way to tell the
>>> preprocessor to roll out #symbol before interpreting it as string.
>>>
>>> The only way that I see at the moment is something like the attached
>>> patch (only compile-time tested).
>>
>> #if VERSION < 5.3
>>  =C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency);
>> #else
>>  =C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
>> #endif
>=20
> Huh? How should this work?
>=20
> Independent of the kernel version, we have to set
> lapic_timer_period_sym. The VERSION < 5.3 case will try to set
> lapic_timer_frequency_sym, which doesn't exist and isn't used.

Ah, oh. Would conditionally redefining lapic_timer_period_sym to=20
lapic_timer_frequency_sym help us?

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
jailhouse-dev/d497494a-95aa-82fa-c9b7-29c74e395c78%40siemens.com.
