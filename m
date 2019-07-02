Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKNE5XUAKGQE7QIGBWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF235CFBC
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 14:46:34 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id q25sf1336421lfo.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 05:46:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562071593; cv=pass;
        d=google.com; s=arc-20160816;
        b=hNCCx21tIJdWepw1iNR+RlRl34pwy3l++gc961Wu3bgmo6hGTE6n76dyCuJ+9vReSN
         v7QpmfEsUnvu5195zkdVfZ5zhNS+sof/sltQCpjBnaIE8Zn5xm7jQazj3mgr/mB61een
         3dcORfl8h8s+UZznVo3csksjHdDR2wU5XRZaIzNXB8fEV1Im7QobMoT4btKVI0ptbz5W
         UqckEl3GPMpZTxdPYQ4iV4+ERzbl/wvLLbBNVmkdCx0/swN8XGBqK7rHYjdgkAGOkpOu
         kAiTtbW1lExrig3Mi5WFbP9EGnuMJ8HradEn0QFnT9sRq7aZTAfBtdbcmUUoJy15Ces+
         8IsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=G5aGiAVfP3KeNvdNA84scgBrwBsNGdwsLEmTYqrKm4M=;
        b=y5gEudr3/CN25j3QV7d+TQ1hXntEMw2LOR+BwdGbGoVYF4I/9vKMwXexIgQkDRyZZS
         Uf0o4/Q28oQk6GgkJdauhaG1dj0yIZp9he6i94ucso19FVBbkrgX3C19QtGxNQrtu+Kc
         J+tAkTh2YTCqY2K/dL44T2iv99nW+zyDg/W83iPsFka4H3okXuPOmFLzIBarv9NHOx22
         GJoSb4kQze1wIC8MMb8Fl7P+Jy81HwO36/jsMYBEyrTuVDpj6qKh08OqElxMZuHKO+VU
         Jz2g8sx2roE+V2QLoEhu1t8isMrKZ0r0tqX8b4grXQbR9QVeiBvMKNcqGex2uBrshg4c
         wMXA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G5aGiAVfP3KeNvdNA84scgBrwBsNGdwsLEmTYqrKm4M=;
        b=Vzf+WVGRXTPRXGWjXWf3USB2PdAbtcFIZVstIdM7jcLzYLo+uwrfsWN0ndOGPIqesA
         OHpVBm1Cs+TfT22LAZLGC/z0D+52wXL+6tMWfhMHxaRrx3QN0TBfay3/W9mP3xG4052d
         XH8Y5t1Ds1Qf/ISe33FijFiFFoH1AOHbtQvA/PYBzQaPHSJnyjEip0WRqVwWFzb/jz2A
         anMkK/HDvA2VrKU3ftm5aMIQgbsdPCFXbA2G+0NoqObM6KipySlb4jBqL1dISG5ahMGn
         z1d0sOcrATVB2Xkq1fl/LRLDf5oauYWv0906UDP2MsDUc01akmzEw/PxvxB2A+A9aemU
         XKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G5aGiAVfP3KeNvdNA84scgBrwBsNGdwsLEmTYqrKm4M=;
        b=WiB6b+CFCBMGT63u6tbFGFVcxoKMprjTAijgow9wXrtvzAWZU/M37VZKUSFvTYwZK+
         rx9dIphkXijZ+NNyVIHUSKVTQOo2r/P9CJsluLjGXTzOpFLsjna8beWIYLC/XQkSXhZX
         ANxllZyk8MRvjTjcWVC2SSw1OytkN0SJu6s7kJIOIFKVwxBMZLkDomcBR68/S5gpNOhg
         wG+Yml6OWCQZhKrYSf3fPlrIPftUR9e4CGSwZcm2R5EtSN6MH1cSEZLo8C0U2S7wTSpi
         c4FON29Ov7v7Hx+JI1vvAMNdYJnT7maGcb/H5rj5ZKhhCu5uzkYrD/GBMByNcRc56beO
         l3tA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVoBnKupFB3nrU6aYsRvmSH//Mc4aH+Lcjd9QwMXzmv6Cz/mFkJ
	xFJm9G4TyPFu5agZL7S83Fw=
X-Google-Smtp-Source: APXvYqwdE8UQ0zBIsy7vyH2kT6spLrffj2mHCopG1+EqDk5+3KIa9ebFUmm2LEADRjUkepnt+ymMRg==
X-Received: by 2002:a2e:2b01:: with SMTP id q1mr17257888lje.27.1562071593639;
        Tue, 02 Jul 2019 05:46:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c213:: with SMTP id l19ls937684lfc.1.gmail; Tue, 02 Jul
 2019 05:46:33 -0700 (PDT)
X-Received: by 2002:a19:8cc:: with SMTP id 195mr15125447lfi.150.1562071593003;
        Tue, 02 Jul 2019 05:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562071592; cv=none;
        d=google.com; s=arc-20160816;
        b=1D8eoLeVZFdI6w3vRwafR5EJYbFuejusrVCEpCkSOBE1I81/HfIrGyIi+QWUKIVzNW
         nWZYPH/dU4E/tkF7bVyECSDGNrI7lNojF47wEXmQF5t8XONlKOSDQsxeSiI4yzM3BRZF
         K2tAzEnrcYHqgu6hwtXd/JYEfDjYsglZqDOwlbfN4NVctJoai4XVhW+7QMMg4v7fEeQ+
         QkeZrUE2O5QGzFtGSUC22dJyQ1vtY8VZknAuEYtpWFBI2uCLijdjeyd3YADqawiy9dPa
         Wy0yt3p22cs5x31xJ6SCQY/cgX/BKXa5tzvoJ2MJVTXeJ7FzTcYUNoZmmh9IF2OYBscn
         PZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=4spZ55hC6ROWrYfOT03/uMWgj6QZLNWgewr2usZtV2E=;
        b=mXgGQ6hLgz4FLyjsfPaS0kFtOKCfba44TZxuyPtjF1eT9gpf0HG4AupvHExYYRmhJj
         iRIz2KaUrL6l/M5nYgdpmvB0NzsSAoC2ECg89RQLSL/3zpNUpMNtV4u7BNxPa8C5yy3D
         2xODvZtD4T8a7iszVHDSvqx82bKl9nNzdbne5UR4C87IIRvbek8LDiqPSHhJismPYUsf
         DM1XlbsVxodzoOa4QPmQT4PndgUErcXBtYmbokP9jawzpop9TnZMwvWzHiMtL5EJc68k
         xPyAU751nKirYYFgJmJHKmUO4bMYQ7DCbF+IZHToCPU2XsmUtg3/xECkOKBjjbcVsbKa
         dhvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h11si901486lja.0.2019.07.02.05.46.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 05:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x62CkWY4020328
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jul 2019 14:46:32 +0200
Received: from [139.23.114.160] ([139.23.114.160])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x62CkVcU017447;
	Tue, 2 Jul 2019 14:46:31 +0200
Subject: Re: Locking pages allocated via paging_get_guest_pages()
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <dfdf9509-c3e4-e700-e3f7-56cb1e189048@ti.com>
 <d14057fa-470c-5347-cf1c-9816694aab85@siemens.com>
 <6a5bfa46-03a8-caf0-1636-45f9f10f7f64@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <073b1c06-b362-4a55-13ab-9998f5f9be99@siemens.com>
Date: Tue, 2 Jul 2019 14:46:31 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <6a5bfa46-03a8-caf0-1636-45f9f10f7f64@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 02.07.19 14:13, Pratyush Yadav wrote:
>=20
>=20
> On 02/07/19 5:26 PM, Jan Kiszka wrote:
>> On 02.07.19 13:50, Pratyush Yadav wrote:
>>> Hi Jan, all
>>>
>>> The pages mapped via paging_get_guest_pages() are mapped on TEMPORARY_M=
APPING_BASE, and the mapping is over-written when another call to the funct=
ion is made. This produces a race condition when two cells have two drivers=
 calling this function. If one driver is not done using the mapping, and an=
other over-writes it, bad things could happen. Of course, if it is the same=
 driver in both cells, you could use a global locking construct for it, but=
 neither is this a very clean fix, nor does it solve the case when two diff=
erent drivers are in play.
>>>
>>> One alternative is to lock TEMPORARY_MAPPING_BASE until a release funct=
ion is called to release that mapping (using, say, paging_release_guest_pag=
es()). If the base is locked, the call to paging_get_guest() can block. Thi=
s is problematic when the locking is too long. Another option is to return =
NULL when the base is locked, and then it is the driver's job to re-try.
>>>
>>> The second alternative is to do away with TEMPORARY_MAPPING_BASE entire=
ly, and use the remap pool instead.
>>>
>>> I personally like the second alternative better.
>>>
>>> Either way, all code using paging_get_guest_pages() needs to be updated=
. Luckily, it is only used in a handful of places so it should not be too d=
ifficult to update.
>>>
>>> Thoughts on this problem? Any better ideas than mine?
>>>
>>
>> I think there is some misunderstanding how mapping in Jailhouse work:
>>
>> paging_get_guest_pages() requests temporary, per-cpu access to some gues=
t pages in order to process a guest request synchronously. When returning t=
o the guest, that mapping becomes logically invalid, even if it may stay ac=
tive until some other call to paging_get_guest_pages() on the same CPU. Thi=
s pattern both avoids locking needs and exposing information to the hypervi=
sor that should not leak to other cores and, thus, potentially other cells.
>>
>> Mapping things to an address from remap_pool is to expose hardware resou=
rces permanently to the hypervisor. That is done during setup, not during r=
untime. Thus, no locking is needed here as well.
>>
>> Now, how do your needs not fit into this model, and why?
>=20
> Yes, there indeed was a misunderstanding. I thought the mapping was for a=
ll CPUs, not per-CPU. The current implementation works fine in that case.
>=20

Perfect!

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
jailhouse-dev/073b1c06-b362-4a55-13ab-9998f5f9be99%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
