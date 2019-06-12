Return-Path: <jailhouse-dev+bncBC33JYE2XMMRBJVFQXUAKGQEJEFZPKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vs1-xe40.google.com (mail-vs1-xe40.google.com [IPv6:2607:f8b0:4864:20::e40])
	by mail.lfdr.de (Postfix) with ESMTPS id 029C643023
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 21:29:44 +0200 (CEST)
Received: by mail-vs1-xe40.google.com with SMTP id u17sf732935vsq.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 12:29:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560367783; cv=pass;
        d=google.com; s=arc-20160816;
        b=tfo5szYsM6UDrcl3k+8kupDyL3VeB13FjVNLpr32hhuu8u/ThBqQLR7d/xxpwlXV/5
         19RTvH0iHFjDp1fhnGwgeOJkSjv/P1W4yZRtf7BRegS6SDREUTnnj529imQpmoQ5zqXy
         ouyV1PwxLS4qLvaHteGGjPjReoKgeIK9Q7AYvcNQtElck8OKFNCJni8VLEpXROHjUH36
         d0Mh9pDeAFGHkObsR2r2scYfTba+vmJ2zeqIGGKiXIdoyhVZoHS9VZL2Ss8V9wZg8lgp
         sPv4eCtWfLllGGf5adCCnC5rGbWPqK7aKQnKn3cKVoU1K7HaZT3v03rA1F0uaczNYbhH
         sjYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fPDdFRJ8yASah/ZOpeGSTpMtLBDnLP1j0p3ul+mejG8=;
        b=FO3Bv+ToIyZLh6BmDrSVU68G22w1KxoxohsFy6UgrUXV0LDdkispvGJyMcaHTWP4Vo
         ntVmIIH0VKzFOypFKw8bj1VKspuMfJQFpNM0NOWmUtk0GB6rujcXIS87n6BfvRUrrYiU
         R7LPcU6krQTmUynfymKRnSucgZC9XBPRyPwQKGQ5W5eTsCxbTAUj2F8n6T8cAGHvsNFd
         vIE+llcN26HZcq57c+1okphJ4RsWa3UxqfLrSTC/3D1WEhYprypVbuVA+7eEmGkdmPmf
         2ik5m5FgO5gh/m+6AEIk3MZDq3UXmHCliCOYRdEf3f+77b3buCBxzJgEpyNd504lq9i7
         OxBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C4rpTq4s;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fPDdFRJ8yASah/ZOpeGSTpMtLBDnLP1j0p3ul+mejG8=;
        b=r9w7hihfP7eulBd6LWIGsPBAH0rMDryekiYgQHpLxJ5sNYGij5oX1mTtbYwENSo+rw
         sfcTYIW/SVqkFO0iqM1J7wbD+XzHVPOz52jUbk9tAybDjoJD/6wJHdW91v0U/DNI1PAd
         LJ/0+JI4/Ueobn6+iT+f3p3qMBuI2IYFGulgMnrcLnEXK/lG/+Tkbu5pNnxzUvRDuEHh
         +gWkiAy3xH6/AxxHZDxhV8Mk38vdlLPW13zPfxaYnFuFk70quBWIYSSGxpAT3ERl6FP4
         UG9FMBhhkvxhA/n81tfO5wMj/wLNuepibAhMIO+olNhu3xx3F9QRaWZfPQS3Prn8a3JA
         Jizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fPDdFRJ8yASah/ZOpeGSTpMtLBDnLP1j0p3ul+mejG8=;
        b=jAho2VKRDHAloZWyZ87v/Idy3fD+2ot7vA+6kamqQcRO6zBb9M8y5U0O3aEzuZpIQO
         SLD2eIrme/Z61w5iNJdw3oP6QAtOxujqnd9Up43n0u3N65wIJ+9dNCMB5evut8wEmy3r
         g+mopMk35d0NncV7ItvD2RJg6hmfrv9NXez68m51KEizMU1AIibzr0ruk+Grgel9VemV
         2wAEISwax/tUiArZl2fyFBm5iB0dE2srAfu4vR8gVV+T71FozHLFBGYlBcVm3h+/R9SV
         c7o/A1AMDB7VraarrL4U76O9ZeEhFOKjd1l891i7qROyuVj6AqqLU2hUCVAeceeLZbtf
         lV+w==
X-Gm-Message-State: APjAAAWC2Ze3AfCOex+mdxGiYcswPvjW95zT9TzFZTsWX3N5qpwQD52q
	3yPD76qfyZgRsnkyXKlqwS0=
X-Google-Smtp-Source: APXvYqzzuTSnRhKgA3xp+z/WrCI+8n/1vALLGtLSJPtjK45vDpGSVyIN8snVyKNDZHHYkRouA7VnFw==
X-Received: by 2002:ab0:18a6:: with SMTP id t38mr14227085uag.83.1560367783080;
        Wed, 12 Jun 2019 12:29:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:a80e:: with SMTP id r14ls136917vke.16.gmail; Wed, 12 Jun
 2019 12:29:42 -0700 (PDT)
X-Received: by 2002:a1f:14c1:: with SMTP id 184mr33827739vku.69.1560367782619;
        Wed, 12 Jun 2019 12:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560367782; cv=none;
        d=google.com; s=arc-20160816;
        b=QyVbwWBEvrx67G/kyzshoPYLrBltwt0JJWNTPKcKHw8hOFh89SBQJF9dDTaKQtpxky
         G4Dk5PqNmra+fp1YzQ0XbCfdiDqv9iHZzBhzj+24c6SP2QgabX9IIs4+Dh3oXEFg70hX
         tvD23n7htihdmWJnvhhxxuaUkol7kAzA7UipoPeqCzi0YF+13w5ptXISXFGTcd/WKwmp
         +tyJbVbjSsx0Pun5vKLBaunoSRlkSNhBTeWd8L0IuCaN3cfPrSZhcZ5CgVXv9iN0yBpu
         0zmI7HYQySjm4dfo9XtnisDpY5iBKZBbbf2E6qjnBnYfrhOudSi+TsWIalNyYvSiJHq3
         OBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=POoseuutX1tNjeQO4Nv5HyQI+My1WmJgOQRvTdjvmpk=;
        b=deTI4DPvzVOglcBbgPyT3IjDzyAyT57wZwUXRJFHH2JQ3lIpi9jplQQKdX2t+OX4bM
         n6Aiz1rJn7OMZawpxIvPm6FeelNhZQBgDacVljhs7Yf4BOKJV3pP/S2pcq6aP3s9lxTQ
         kcDqEnrURLcXBAKIxP30y8wRR5oA/toEZ2y2CG3w/UJp+4EsLGvdKdOfQTipxnQJbBX5
         Nci9XwJUXLinZGKEAIeC1NfqQtHILxgnhkZCioWBa8dyD+TxFP0ZPKUFm9mYvbiM8Pdn
         TZSOJHW+pjcx3Y1uiokNvV5r4gC8czxiOKw2VO7UBa+LVWgt/S6DeURTyKzSkKmye4Hd
         8O+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C4rpTq4s;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id q12si22717uar.1.2019.06.12.12.29.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 12:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CJTfF8045231;
	Wed, 12 Jun 2019 14:29:41 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CJTfK6013849
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jun 2019 14:29:41 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 14:29:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 14:29:41 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CJTeEc117479;
	Wed, 12 Jun 2019 14:29:41 -0500
Subject: Re: [EXTERNAL] Re: porting am57xx jailhouse support to v0.10 version
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, <jan.kiszka@web.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
Date: Wed, 12 Jun 2019 15:27:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=C4rpTq4s;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

Hi Ralf,
Thanks you for the quick response.

On 06/12/2019 03:12 PM, Ralf Ramsauer wrote:
> Hi Vitaly,
>=20
> On 6/12/19 8:45 PM, Vitaly Andrianov wrote:
>> Hi Jan, Ralf,
>>
>> More than a year ago I was working on Jailhouse support for TI AM572x
>> SOC. That time we used v0.8 and everything worked fine. Presently I
>> started to port that support to v0.10 version and found a lot of new
>> features. The mane "feature" that you removed "mach-..." and introduced
>> "units". Because am57xx requires to have custom init and cell exit
>> functions I think I need to create am57xx unit.
>=20
> Hehe, upstream first! :)

I will as soon as I get it working. I don't want to do porting work for eve=
ry new version :)

>=20
>>
>> If you remember, the am57xx had its own:
>>
>> int mach_init(void),
>> void mach_cell_exit(struct cell *cell) and
>> int arch_handle_smc(struct trap_context *ctx)
>>
>> so, I have to implement the corresponding am57xx_init() and
>> am57xx_cell_exit().
>>
>> Here is the old mach_cell_exit function, but many of the functions it
>> uses disappeared in the v0.10 version.
>>
>> void mach_cell_exit(struct cell *cell)
>> {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cpu_set) {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_entry =3D
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_read32=
(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4);
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> }
>>
>> Please could you help me to find a example of similar function for other
>> platforms I can use to implement the am57xx_cell_exit function. W/o it I
>> cannot bring the second CPU after a cell destroy.
>=20
> Almost exactly a year ago, I removed vexpress support. Vexpress used to
> have a similar pattern. Before I removed it, Jan converted it to a unit.
> This should give you an example how you can use it.
>=20
> Have a look at aa9a67d63f326a89294781acb7b1562f54b0538e. Does that help?
Actually does not. This commit removes vexpress support. It would help if i=
t converts vexpress to=20
use  unit framework.

I think I have an issue with SMC. After I destroy a cell on CPU1 the CPU is=
 sitting on wfi loop.
But CPU0 cannot wake it up. I'm debugging that path now.

In v0.10 there is no arch_suspend_cpu(). Does my am57xx_cell_exit() need to=
 call some equivalent of=20
that function @v0.10? If yes, than what is it?

Thanks,
-Vitaly

>=20
>    Ralf
>=20
>>
>> Thanks,
>> -Vitaly
>>
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/27491b3c-0b03-0ba4-da94-6a8cadb28006%40ti.com.
For more options, visit https://groups.google.com/d/optout.
