Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNOM2DVAKGQERHHVSIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id E62D38D714
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 17:18:13 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id k2sf1987799lje.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Aug 2019 08:18:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565795893; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZBc+TOQwD1909RR5TJ/QmSco94McEBqil9HU7Vst+QnNcOMjLoL2bU1irfr4JZLOiZ
         sBwIvoAj8hiYSCC/jorehZ3DRULlwaonaMSBH+Qlsr5OSJUdLGAdPezgyMN4CCiyw4rV
         vZJh1aslRGBopdU0bRMxb90oHMYrUNcRIrP48Osu+q9eqBAlARpFtj15ujKowuLEXPaU
         srbJhyFMS3W7cCLaboWeBJArILDdNdTHfa5fG2I+dNl8I5mpcAL2j6w87xO1I1rkNEXd
         TaS6z7oqysuz0z/nZOn85mU0esCLA4PyLyD7OGLQ7eDZFwrN+mR7gwZSbpwdOJHKrvR2
         39bQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=qlDqTevep2p/+6+P4ncFWMqcqJPT+id+7amCZ3A+7zU=;
        b=Mdb42LBgLCwX8KNIuzhglRr2XLIQ2k80U0hTbzGJ1Fs86vjo9ue56iAEWkTLgVlhzm
         nYL2+rBUwHCIukpbGRT/DJopT/PSRDgAl0d2Nvxb1HBXkkY9VcPJ/8p6hZ9fjgmviM9D
         PFn9XZKVBitzTWauan/pIpJl+7Jpl89jSMmw3f8MixoXePtAEkXNNEfiuAjeHUascGlm
         3oQc/ozWp0BZFDgkFRx3VQuxj+x6GHRHuHQOmAKnayLglXGht0qd0ObkJB9OayrHPsLQ
         bkpjjQVFck4+S2i7YrsnvxYGeMIHec287vbnrtxLFJVJfgONsYNSwiOb8dWlMvVRjI+Q
         sbxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qlDqTevep2p/+6+P4ncFWMqcqJPT+id+7amCZ3A+7zU=;
        b=pTrzGqfVy1hwwA04OSuZb25XvnXPxlhQxsnNAOwGzGI7t7chQvtAMerYirxDELFtCv
         DhxRqOXsMB1rs+xunTiLKTgNIueJ+iY44H8UFydkFBCBHSSZ/Yw1GQOl8BIcuM9t/dXQ
         LKP/zYPiTZemJALfgL0ulDaLObQl36surKawqYi/6y1nJXFuvFRCruDF3t4DvxFJsDi4
         AeGMhUjZd3S6DfEo/wqVOpYTHGdELJWD+ou6qkygUL7hnMp4cQO28cfwOTdH4KhOwxZR
         EcCEksL/n7SGQ6DeS236HUGL20jf4/B5bGREiVkJaeFmN/CojyWt9W3Pj768lj5pRo6v
         JLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qlDqTevep2p/+6+P4ncFWMqcqJPT+id+7amCZ3A+7zU=;
        b=Rx4Okkp7rx9jYLivEVlaPHwX6JuQkjyzjTBBVuhS1F0EGlxav1dKvxMogbrNpo8BcX
         uppGhNzfmMUmZsORMSfB+t4j5YhYQzqNhTgD6P5p2a/Rs7dxClKUwmEyIrVmtjI23DBE
         4yXuqWIm5t4e05aHkxKoAnW/F+J4Oxwqfi7ulw/enfvEl9e4w4zgG5njYr5QnvV6UNG/
         OgM+IisXdBUjcEvumfoRJyIvo7E8v5+/v50TzFb5a/OyEKwZvFCuQD82hD20NInUIYmh
         8e15xmQBoEaZWgByM89/0JaB4doWCjF7888BEtTAM8ul29fLPqYeKj9SJz3NT/hPeSCm
         Q1NA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX0ji2ox3iBjlncyGfk3AREHum6vq6G3Z9Dqu8G0trWDM47XAgr
	hsTb5PskYtxOYFvYYf0WhSU=
X-Google-Smtp-Source: APXvYqwBxXc2536nLJ4DtLiDOKW6r2wLln25CcR1waN6zf4ZX563bjoX6gb/tHxcQwMV5nkJZOfB5A==
X-Received: by 2002:a2e:c51:: with SMTP id o17mr149541ljd.157.1565795893527;
        Wed, 14 Aug 2019 08:18:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6f06:: with SMTP id k6ls242696lfc.5.gmail; Wed, 14 Aug
 2019 08:18:12 -0700 (PDT)
X-Received: by 2002:ac2:43bc:: with SMTP id t28mr4232lfl.14.1565795892713;
        Wed, 14 Aug 2019 08:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565795892; cv=none;
        d=google.com; s=arc-20160816;
        b=EMLql7f977KRcqZrIsPkGB1bMSTniKC7WOZyuW14LDSiEpf84PzhcbrXwuJbCRxk0B
         3rv1sMPodCzx5KgT0ruTi2Ejx1vK7DEZ1iVQoxrqRi5IfM/seoEOU1zhxNLbPTKytDwa
         TI0f0PPF80iiU7H/0rhoNSLuJgJ6IYRcAiNofNuerXdOEm9WOt48RoFnN4hnCHtlNG13
         5Be3bAn03xNSzH0f/9mp3dWG790ZCNQ6rD+VmBcWApq08Qfta/HALu7Q18sYs6brL2k+
         UgU6mkqQBwtyHsedmQBqxJsuoXIovuNV7bmBuc+iNOPuc0qS5lbsJP4z/yjz6KoI388i
         XX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=JbnnpunyoQEoBTw6RjTgRdiuHFBUyVest4HISvI/ckc=;
        b=FOZjbTAhvpBQCJWQxxeqWSXn4PYAmrNK3FW0jHu3fPlc1hpZYttd/8eHgPlBhsjxXY
         IyICfAC55lNlw9N1q1vJoC/9WpqMEmU+mcFWwMnWM4cdMlSbPALgTKRlmfluYHHeGkYr
         EL8RQQ3T4OBfzJOGI+J3dkmjp+POkyxJEDMFrJvBKVIV/h1sgTAUPkxtRISao2rXESTP
         KXe0M29oi91iEz1KleAMvnlAXuQrN2wQeCc7xPcm7EGs0zMigPaNDNneSFOyxO42KjZt
         MT2RIhxFD4qngJNuDtc7H59HUBPRUdXHT1I+pi0NrRPNGO9R2g9Sta+jiMurMBRG8zlO
         f3eQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m20si4830lfh.1.2019.08.14.08.18.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 08:18:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x7EFIBNF006311
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2019 17:18:11 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7EFIBNr015494;
	Wed, 14 Aug 2019 17:18:11 +0200
Subject: Re: [PATCH] driver: Account for renaming of lapic_timer_frequency in
 5.3
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <3ba1c1ff-a96b-bc2f-49d5-86ae7f032528@siemens.com>
 <274f6f7f-401d-d275-4b53-dd957cd641ba@oth-regensburg.de>
 <5d66e114-6e4e-1b79-ed67-364455c048d5@siemens.com>
 <54d5522f-16cb-0ebf-b93a-821d13da7ce8@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <29a363fe-0fb7-debc-56fd-986d88c990a6@siemens.com>
Date: Wed, 14 Aug 2019 17:18:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <54d5522f-16cb-0ebf-b93a-821d13da7ce8@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 14.08.19 17:16, Ralf Ramsauer wrote:
>=20
>=20
> On 8/14/19 4:35 PM, Jan Kiszka wrote:
>> On 14.08.19 16:11, Ralf Ramsauer wrote:
>>>
>>> On 7/25/19 8:01 AM, Jan Kiszka wrote:
>>>> "lapic_timer_frequency hei=C3=9Ft jetzt lapic_timer_period, sonst =C3=
=A4ndert sich
>>>> nix."
>>>
>>> Doch.
>>>
>>> We have a problem if KALLSYMS_ALL=3Dy. Jailhouse will compile, but it
>>> fails loading the driver module with EINVAL, the symbol can not be
>>> resolved, see below.
>>>
>>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> ---
>>>>  =C2=A0 driver/main.c | 9 ++++++---
>>>>  =C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/driver/main.c b/driver/main.c
>>>> index fe752753..b3896609 100644
>>>> --- a/driver/main.c
>>>> +++ b/driver/main.c
>>>> @@ -100,7 +100,10 @@ static struct resource *hypervisor_mem_res;
>>>>  =C2=A0 =C2=A0 static typeof(ioremap_page_range) *ioremap_page_range_s=
ym;
>>>>  =C2=A0 #ifdef CONFIG_X86
>>>> -static typeof(lapic_timer_frequency) *lapic_timer_frequency_sym;
>>>> +#if LINUX_VERSION_CODE < KERNEL_VERSION(5,3,0)
>>>> +#define lapic_timer_period=C2=A0=C2=A0=C2=A0 lapic_timer_frequency
>>>> +#endif
>>>> +static typeof(lapic_timer_period) *lapic_timer_period_sym;
>>>>  =C2=A0 #endif
>>>>  =C2=A0 #ifdef CONFIG_ARM
>>>>  =C2=A0 static typeof(__boot_cpu_mode) *__boot_cpu_mode_sym;
>>>> @@ -550,7 +553,7 @@ static int jailhouse_cmd_enable(struct
>>>> jailhouse_system __user *arg)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config->platfo=
rm_info.x86.tsc_khz =3D tsc_khz;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (config->platform_info.x86.apic_khz=
 =3D=3D 0)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config->platfo=
rm_info.x86.apic_khz =3D
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *l=
apic_timer_frequency_sym / (1000 / HZ);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *l=
apic_timer_period_sym / (1000 / HZ);
>>>>  =C2=A0 #endif
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D jailhouse_cell_prepare_=
root(&config->root_cell);
>>>> @@ -897,7 +900,7 @@ static int __init jailhouse_init(void)
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(ioremap=
_page_range);
>>>>  =C2=A0 #ifdef CONFIG_X86
>>>> -=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency);
>>>> +=C2=A0=C2=A0=C2=A0 RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
>>> Here, lapic_timer_period won't be replaced with lapic_timer_frequency i=
n
>>> the RESOLVE_EXTERNAL_SYMBOL macro:
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 symbol##_sym =3D (voi=
d *)kallsyms_lookup_name(#symbol);=C2=A0=C2=A0 \
>>>
>>
>> Hmm, 2-stage pre-processor would be needed here. #if LINUX_VERSION_CODE
>> sees to be required then, what a pity.
>=20
> Yep, I have that exact case: 4.19.x + KALLSYMS_ALL.
>=20
>>
>> Want to write a patch as you have the setup already?
>=20
> Well, my current setup is to disable KALLSYMS_ALL. :-)
>=20
> But I don't see how this could be patched, is there a way to tell the
> preprocessor to roll out #symbol before interpreting it as string.
>=20
> The only way that I see at the moment is something like the attached
> patch (only compile-time tested).

#if VERSION < 5.3
     RESOLVE_EXTERNAL_SYMBOL(lapic_timer_frequency);
#else
     RESOLVE_EXTERNAL_SYMBOL(lapic_timer_period);
#endif

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
jailhouse-dev/29a363fe-0fb7-debc-56fd-986d88c990a6%40siemens.com.
