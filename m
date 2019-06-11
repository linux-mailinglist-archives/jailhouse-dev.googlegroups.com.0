Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBY4L77TQKGQEG3F2N6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4308D3D08A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 17:16:52 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id z202sf581944wmc.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 08:16:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560266212; cv=pass;
        d=google.com; s=arc-20160816;
        b=viO5gFRTYxwmBc5Z1tJ9iy9qeA5IZWmuwEMyNW5OPNoZMRvmRVOdi6AqfaMgxqmhdp
         gyaqsAzaWHuCnJ6StiOo21yXtUosS9MCmbPhU6d8jtOcXCcArrSMAbTpaZbtaf4fIJcz
         F6zt/mRHEUp8Qlmmk7rQTaN3hTuBm8iKVNHQcSd7azbAIolp2W6Id8/JHBU6xfSdE9oA
         JVnQC/M5Ao3P2eaT1gAa3UhWuPg2UWNiCtH0ZweCIilIiiM9rht1SI9YNapOPBMTryWP
         Q26lvKTZ8hURth+4AkPpxdJUGhy9CTq1sjuttCC1hpVtF6gENYY6MwFe3HkCYO0Gig1w
         0F9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=maWdo6Www9UngVus0lJL01W55ahcz650qP1k66zpV7A=;
        b=f4i3IFhRNHLpYomY3Lvbn3EFs6MXtdv74ctloRuIM4Rs/bP0x2t42ZQX8dFtNP7wNr
         fUFGuwC1cJxDygEFBDPH9nObgEfFO2ffxxoQom4KHFMn9CILfgfRnzHhPqFGy5sBNXyE
         VflkSUVblurXE3t8agOgG722HgIdR4GIZKZFSzjNoqLt5iTtj555CznEGUl/kKvMKUER
         +G1+1rtR/bvHo7d6t+doGkm53pNDxGC7GIHDI1Faq5obpYBGAqlL5T2WxWh6LgMTyRae
         92nH7rwQipPOwtoDIz6VgkhSko/Y2DlrwlcprkukQY0yuU6x2dC3pMjAcHvAHF/sV7pH
         P+HQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=uSFmGxWC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=maWdo6Www9UngVus0lJL01W55ahcz650qP1k66zpV7A=;
        b=OQbfuJtPYWQs26PMgx/uXZBe/ra9WUE9LmrLJbPr0SYO2RbjrlQqFPBrZKtn18FHKJ
         B/9zNQ2ydTgKvMpw7Ikah4cZkhRPhdE92qdzqQbCwTqv1ZthTbnZzqgiGhTNJKAsEUUs
         XwMI77QDCznkxc/JrzqNJP5WoN8naOfGf22QIPFp/HB/Wyf8Cx57DSguKdT7AN6wSLPj
         3JraQKchp34UhzUGnrmeZ1hmRGdG6GqtrPGDEOwqhHtnX8tqgtnL+tkv3xv6bCdqW8AY
         B4dEWN71LsxcF0q4duV7rJcSiAU1/R0ujt9sCJ4q0Qo3tyrPMPE/+piotJUGRomDk1wl
         jMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=maWdo6Www9UngVus0lJL01W55ahcz650qP1k66zpV7A=;
        b=HtNx9XF5hywUqgUPP3/qKHO7o1Bt9sXTal+OE0UJFFHd7mkEGl24zdQjc5Xl7m6T2l
         fPpa7IfySCCpZSfGvDVNZLdEiZNJORp5Si1Yc/+OCHJUcmX94ADoq6jBJrRNa5h/++Dc
         Wr/nyv4uIZkvbqGWaATWIdTV398rZvHb5dFDABp8OdKhJC2EG3glYlTEZ4HFv1aRBkgd
         xyU7pFyvarx5EIxyhh3DLrIz2YUeC0szPCfnjZISJ1gjU2N7RC9f4/jk7TU7T3WpRsce
         aYiQvsGpSn7pzCwHf/S3Wb7p8U/uUfw4TnEM93J3Qp3tzA9QTHO64sVTSNOZZ1OUuwu8
         0p/A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV4T2P9KkhEIoKyTncf/H07GcVmQY4607qFArAyoyFonHjksx5U
	sipKybQ7IH8xwThyNUMmPvs=
X-Google-Smtp-Source: APXvYqwdrGZ+nw47ZZZC82qPyx2AQ45lnsty/RBJqJlhtVXr3KdmbHhyqNQ39yeAgBj7y1/sGgZR1A==
X-Received: by 2002:a1c:c2d5:: with SMTP id s204mr18667165wmf.174.1560266211885;
        Tue, 11 Jun 2019 08:16:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ef4e:: with SMTP id c14ls4664110wrp.5.gmail; Tue, 11 Jun
 2019 08:16:51 -0700 (PDT)
X-Received: by 2002:a05:6000:1241:: with SMTP id j1mr13266418wrx.63.1560266211389;
        Tue, 11 Jun 2019 08:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560266211; cv=none;
        d=google.com; s=arc-20160816;
        b=RvCn4moTyhWRuM4MFKPe8ZOM9MAowtF2nLfA3x9psSk1VMcuz4KuMlybJLcPdGG/xP
         ni8/y5AL772bzSAeBrHFtwXEfP6ljriU5LurWjcHFCptawqS8C2z14WNe7SSCzejffvu
         Liyy9IGzOwcilz6CD8f4svGWspqFqO7/gyDaKZ4ZYo4kJnFCoi/6xjGhWOrRGJudWA9p
         UftS5YE6Sm4GNiAqM3480bqVMi3ISqxJCSN0XCCU8SLh6ugLOTFu+3Uxm0bW2HdaOSnr
         G3y0OUrgPTJh7h60QefXg5wKhjUpUgIATmJsSKQ8c5ydXequk5ikjGYo4otGVk4X3kwD
         kGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=zRmTTpbbmb1BvBy0NnziCjoZ/C6tlscYNkhnvqYGE6c=;
        b=fWpSWFjfX2uONXDgwCgQZL4nTitJ18ibbnK7rGpoU6fqP6/1BErAn8uq8ny4FsWMn6
         EpPIiTvkfSp6ja2hD4TK7kQ5uJ5V1cG04MiSAxV7kuYGgrZFS5t6GssANP5/4ERhyc/w
         q4xnDSSeeTUXKawq34BkpFCR4ViZ/hHW7MjF5miWPEGQjbDbNqfhyZnpnfyBLpQgDxjt
         02GbRqdWzFGB/0041SoPDBQ+tYEXc7H/kJUlhBgAE9+BUTA2AFdAudzf31mRtGVpD0iT
         SMRyaH5nwFoDpkMKPGdzJ13QVwzPHA+Jy7vNMkkfPS23gRFTqqXjFJ009UCm3hfnRQ18
         yygw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=uSFmGxWC;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id j1si175346wme.3.2019.06.11.08.16.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 08:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45NYWR0LK6zxxh;
	Tue, 11 Jun 2019 17:16:51 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 11 Jun
 2019 17:16:50 +0200
Subject: Re: [PATCH v3 01/10] inmates: x86: use correct types for
 pm_timer_read
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
 <20190610230330.21419-2-ralf.ramsauer@oth-regensburg.de>
 <3e76db5e-9fca-3064-27a2-fb8da0249692@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <2a46268d-4f8a-2b23-2ad0-2f7ccfa8d5a6@oth-regensburg.de>
Date: Tue, 11 Jun 2019 17:16:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3e76db5e-9fca-3064-27a2-fb8da0249692@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=uSFmGxWC;
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



On 6/11/19 5:07 PM, Jan Kiszka wrote:
> On 11.06.19 01:03, Ralf Ramsauer wrote:
>> If we should ever compile timing.c for 32 bit inmates, then unsigned
>> long is
>> the wrong type. A 32 bit type (aka unsigned long on 32 bit) is too
>> small to
>> hold the result.
>>
>> This ensures that we won't hit a bug when enabling on 32 bit. Once we
>> will
>> enable timing.c on 32 bit, we will have to implement 64 bit division
>> intrinsics.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 inmates/lib/x86/include/inmate.h | 2 +-
>> =C2=A0 inmates/lib/x86/timing.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 8 ++++----
>> =C2=A0 2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/inmates/lib/x86/include/inmate.h
>> b/inmates/lib/x86/include/inmate.h
>> index 7664570d..e4f75206 100644
>> --- a/inmates/lib/x86/include/inmate.h
>> +++ b/inmates/lib/x86/include/inmate.h
>> @@ -241,7 +241,7 @@ void ioapic_pin_set_vector(unsigned int pin,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 enum ioapic_trigger_mode trigger_mode,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int vector);
>>
>> -unsigned long pm_timer_read(void);
>> +unsigned long long pm_timer_read(void);
>>
>> =C2=A0 unsigned long tsc_read_ns(void);
>> =C2=A0 unsigned long tsc_init(void);
>> diff --git a/inmates/lib/x86/timing.c b/inmates/lib/x86/timing.c
>> index de41fc35..d179da0f 100644
>> --- a/inmates/lib/x86/timing.c
>> +++ b/inmates/lib/x86/timing.c
>> @@ -92,13 +92,13 @@ unsigned long tsc_init(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return tsc_freq;
>> =C2=A0 }
>>
>> -unsigned long pm_timer_read(void)
>> +unsigned long long pm_timer_read(void)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu =3D cpu_id();
>> -=C2=A0=C2=A0=C2=A0 unsigned long tmr;
>> +=C2=A0=C2=A0=C2=A0 unsigned long long tmr;
>>
>> -=C2=A0=C2=A0=C2=A0 tmr =3D ((inl(comm_region->pm_timer_address) & 0x00f=
fffff) *
>> NS_PER_SEC)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 / PM_TIMER_HZ;
>> +=C2=A0=C2=A0=C2=A0 tmr =3D ((unsigned long long)(inl(comm_region->pm_ti=
mer_address)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 & 0x00ffffff) * NS_PER_SEC) =
/ PM_TIMER_HZ;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tmr < pm_timer_last[cpu])
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_timer_overflow=
s[cpu] +=3D PM_TIMER_OVERFLOW;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_timer_last[cpu] =3D tmr;
>>
>=20
> This is not yet consistent: pm_timer_last is still unsigned long.
>=20
> Do we need the conversion in this series already?

Nope. It's just a 'reminder' that sth. is odd there. But we can ignore
it. Same for 2/10.

Just some assorted stuff that I hit when (unsuccessfully) trying to
enable SMP on 32 bit.

  Ralf

>=20
> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2a46268d-4f8a-2b23-2ad0-2f7ccfa8d5a6%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
