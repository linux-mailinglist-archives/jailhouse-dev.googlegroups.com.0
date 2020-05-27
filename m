Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDHPXH3AKGQEFSYFCFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 700EB1E45B7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 16:22:05 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id l26sf890111wmh.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 07:22:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590589325; cv=pass;
        d=google.com; s=arc-20160816;
        b=IIrW5TKJp+SRiZOeJjGmjtmEuiBboULUyObaPA1YLc2wb67bbwXV21cZwnn96woZhe
         ewnHxvgeXGUJcVCIMdin9JP4iTg3l/fSYmCMHyX6cVQ7cBTQijRkf5q727+PH3Z9VqAn
         HIMPcUJv/Xb0z+LQF8gtSyRp3d5IHagG6+fTd5YqGt5oevBRq00hFjz/Dv+hvqtD6KEE
         15s2fPFJdEjqHM6fXaQEEUyLOL3OaxzCDNgCmNh5R/8IsNMhDWEGKH/hJIoeanVaO84P
         OsitotM4WGCqVBZ+fLblNPulzy24Ce2gNHIPT31kmN8fxdE7M3QKQ7520ulNn6B8NBc8
         I74w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=Uq2JbzPvVOsVE9Ok6N4RSQXkKzho+idYktQvVh3RGZU=;
        b=cJjYBkqjrpqGiGSCz9Jnk+f3pTrvfuuNpFmswUfZLM4XXs40vYw6r061QS1es9tQs3
         tVU5BhCSidg5kzLS3QXBwVqWDvoWCO/I/RaKPKB6KSGfddgd/FrHZqOP4h2vtvLlOOIi
         wVOrUpu/J3zQkKpBJuOEvjum6Gh37c/+HXrcmn0s83LdokseHj6/KY5RjxoZpyUhvhUU
         p1Ai2PfFRTQxKWE3JbYih2NMB85seTdRan9o008r7yQztiCdA613ZDFAsmpxkwmu0tlR
         W+TbKfjsbLulhLTvfJ7A4et23O2IJ5DyOXJZF7Uk7SxBzLWfGbdtdFdn2OADKBGO5N0u
         ZSbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Uq2JbzPvVOsVE9Ok6N4RSQXkKzho+idYktQvVh3RGZU=;
        b=PFjCo1VdF9gGPIoLAM3HhqxukMIi1tHW4hkV5M5HQ4Z5uM0DUpvfGeRb6ISOR5XmPg
         ZC+x5RedIyQQX9rs/FRK/VAUiTTL/eqEeUTbQUUh1w6OOUSWnXjOrUqMbkFq4HXdoiRX
         j86TJa1cRmvtv52crZLNph2+sb2CJ6VRq6sr0Eq1F1AOW5p9aI6XF+oRQ4gNzubek95u
         Fn1wySyYa9wl88Tdh9e44HFai+3nbf7tFomFVL7GTDWk6d8erPOhvSGAtBdYmYAJCd2s
         gGciemkLeSe5bzMvpIxPP5Ar2hpAYvnX4Hchp+upXyLV8BbqV5XA4fj7b+YS0DNEjTX6
         avUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Uq2JbzPvVOsVE9Ok6N4RSQXkKzho+idYktQvVh3RGZU=;
        b=IdcH+eiyWo9mvTvXyD6TGZsa6ODTO/xj3AXeS9Q1Tm9a6UxHAiLqwUPR4O7DAFpsxK
         df089yJ4Gd+Hjwg6YFPCR2L7DG/IbR70ilqbk4/K6A1aVE204gTKXtdaXvwDc2GBAEEd
         KFNYhiEF8/9F5oaXIQxWN0PMH50zhSKQOVVHhv6H3K2b9MoY/Uh4pudAbTgqpBs9JAwP
         MLjboPdsTzjRbYpQX2tu5t7ClBermxKvjOFKY7lQMzlbOXtE1lq1m3hnDwMbnqsgVXvG
         RLd5eCxRV14SzAkcMIBy8IPFEopbM9+OgFXNA1aieZZRBdj8D3Ky/jLacKXotDoPTxUg
         1+Mw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533B6F2cmmqkU7r14Wc04NE96RCl5ix5b0G377vCt99LRAfVgEV5
	jDgr2+WoEDYvveCQ2aE74uo=
X-Google-Smtp-Source: ABdhPJwBj6PX7wlez3V1BjVpWPeU2ny/bQwi9fq3Kwik0OY6neYfV9ZkqwLOnFkaZgsLJnUgdq/icA==
X-Received: by 2002:a05:6000:1185:: with SMTP id g5mr8322275wrx.39.1590589325200;
        Wed, 27 May 2020 07:22:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:96c1:: with SMTP id y184ls487619wmd.1.gmail; Wed, 27 May
 2020 07:22:04 -0700 (PDT)
X-Received: by 2002:a7b:c18f:: with SMTP id y15mr4752859wmi.40.1590589324408;
        Wed, 27 May 2020 07:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590589324; cv=none;
        d=google.com; s=arc-20160816;
        b=LkI7YWiGCNGMMC3ksAqAM7j0ylCcA2kfdgcD9cPGfLafmsSghMW5QGElbEBfzfUNgx
         wkAT/3qDJYXyKU8unrIIvpNKnGTL0/7tZXqZp8pRLteOnRfFiCGPzQMOeuOwspQjR/KZ
         e7LmPxnoCbxdISefb0Qh6wOmSKTuowxdutIBdZGN69Uvl4bJ0xs1NjqM33hPpXJ5M37L
         GNVYkDTBncrt9aDGR+3JwlwltM+wzlNbFqVMR1s+Kfb9raeJxPfLwvAbrD9H8396fXZ2
         riOl3idJGpFEtVeIV0m4ygebrEev6C6WedgeVUklPzuAAshXPmYgBSEOlQ0hNItvV43J
         Ur3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=4H58Lfp2Gk6oKOgelOmjC/GCp8dOk4sTWcyrQpp7lgc=;
        b=aaSrs4FWA28QL/DkX9XvFjoVi5MDpanYA7fDokw9q14QIe2g+HEMh4bKPLIyjA6Go2
         uQvs1bgP1kwD4I3XaxEliOowFTK9+aAskCTowOgnzdDUqhyz9VVZ5+McnoIckh0JwmrN
         uUyFkk43ClwSvuWMLxsblc7GtgVBvAwXuuVTZKL1o66kN8ftrQxt4DDFSQVH+7oGHQJz
         ErAkk5jcm65SI4gg4NYaeUMAX/OcMHbSu21pzDYzdXyCjpnOXAdlV+tBlY2N7mSS1XsG
         eDJUhPM2QVt0MfX88XBoj7eTUMovUvkDqKpZrrHmzjyju28JOICRstlpuTwLpagpDwSd
         BLhQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y65si61123wmb.0.2020.05.27.07.22.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 07:22:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 04REM4mn027474
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 16:22:04 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04REM3iw012717;
	Wed, 27 May 2020 16:22:03 +0200
Subject: Re: [PATCH v1 2/4] configs: k3-j721e-evm-inmate-demo: Add ivshmem
 capability
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-3-nikhil.nd@ti.com>
 <6e2a0459-3707-99ea-27b0-184f643d27fb@siemens.com>
 <8e7b50d6-9c6f-3538-2042-94db463f20fe@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <68e2bf7f-cd61-47ed-5ef1-f928d010a95c@siemens.com>
Date: Wed, 27 May 2020 16:22:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8e7b50d6-9c6f-3538-2042-94db463f20fe@ti.com>
Content-Type: text/plain; charset="UTF-8"
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

On 27.05.20 16:09, Nikhil Devshatwar wrote:
>=20
>=20
> On 27/05/20 6:55 pm, Jan Kiszka wrote:
>> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>
>>> Add a virtual PCI device with IVSHMEM type (id =3D 1)
>>> Create IVSHMEM regions for 2 peer communication
>>> Enable the vpci_irq for doorbell interrupt
>>>
>>> This allows to run the ivshmem-demo baremetal inmate
>>> inside this cell.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> ---
>>> =C2=A0 configs/arm64/k3-j721e-evm-inmate-demo.c | 63 ++++++++++++++++++=
++++--
>>> =C2=A0 1 file changed, 59 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c
>>> b/configs/arm64/k3-j721e-evm-inmate-demo.c
>>> index 7440a258..e09c4850 100644
>>> --- a/configs/arm64/k3-j721e-evm-inmate-demo.c
>>> +++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
>>> @@ -20,7 +20,9 @@
>>> =C2=A0 struct {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct jailhouse_cell_desc cell;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 cpus[1];
>>> -=C2=A0=C2=A0=C2=A0 struct jailhouse_memory mem_regions[3];
>>> +=C2=A0=C2=A0=C2=A0 struct jailhouse_memory mem_regions[7];
>>> +=C2=A0=C2=A0=C2=A0 struct jailhouse_irqchip irqchips[1];
>>> +=C2=A0=C2=A0=C2=A0 struct jailhouse_pci_device pci_devices[1];
>>> =C2=A0 } __attribute__((packed)) config =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .cell =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .signature =3D J=
AILHOUSE_CELL_DESC_SIGNATURE,
>>> @@ -30,8 +32,9 @@ struct {
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .cpu_set_=
size =3D sizeof(config.cpus),
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_memory_regi=
ons =3D ARRAY_SIZE(config.mem_regions),
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_irqchips =3D 0,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pci_devices =3D 0,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_irqchips =3D 1,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pci_devices =3D 1,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vpci_irq_base =3D 195 -32,
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .console =
=3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 .address =3D 0x02810000,
>>> @@ -48,6 +51,33 @@ struct {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .mem_regions =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IVSHMEM shared memory re=
gions for 00:00.0 (demo) */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ph=
ys_start =3D 0x89fe00000,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vi=
rt_start =3D 0x89fe00000,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .si=
ze =3D 0x10000,
>>
>> This means the kernel is configured for 64K pages - rather uncommon and
>> problematic in many regards (just had to turn it off on AM65x because it
>> breaks userspace [1]).
>=20
> Yes, indeed.
> In fact, I was planning to send one more patch on ivshemem_uio to map
> a page aligned register memory[0]
>=20
>=20
> At TI, Jailhouse is integrated with TI linux kernel[1] (which is
> different from the siemens kernel[2])
>=20
> Can you please point me details of failures with 64k kernel.
> This will help me to convince TI kernel developers to turn off 64k
> paging because of whatever issues that might occur.
>=20
>=20
> [0] =3D
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=3Dti-li=
nux-5.4.y&id=3D30061ab0dcd216ccf20fa9bc426b575feaaefcb4
>=20
> [1] =3D
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=3Dti-linux=
-5.4.y
>=20
> [2] =3D https://github.com/siemens/linux/tree/jailhouse-enabling/5.4
>=20
>=20
> Regards,
> Nikhil D
>=20
>=20
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fl=
ags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ph=
ys_start =3D 0x89fe10000,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vi=
rt_start =3D 0x89fe10000,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .si=
ze =3D 0x10000,
> [snip]
>>> +=C2=A0=C2=A0=C2=A0 },
>>> +
>>> +=C2=A0=C2=A0=C2=A0 .pci_devices =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 00:00.0 */ {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ty=
pe =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bd=
f =3D 0 << 3,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ba=
r_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>>
>> This constant assumes 4K pages.
>=20
> Shall I create another macro like below?
>=20
> #define JAILHOUSE_IVSHMEM_BAR_MASK_INTX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0xffff0000, 0x00000000, 0x00000000,=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00000000, 0x00000000, 0x00000000,=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Also, as long as the memory that is getting exposed by the registers
> regions is less than 4k, it should work right?
> Maybe I won't need the above patch if I do this change.
>=20
>=20
>>
>> Given all the problems with 64K, I suspect it's better to switch to
>> standard 4K.
>>
>=20
> I am afraid that might need lot of convincing.

If you have convincing performance numbers on 64 vs. 4K, I'm also
curious. :)

Findings so far:
 - https://github.com/siemens/meta-iot2050/pull/7
 - RT seems to have latency problems, that's why you already disable it
   in your config
 - in the past at least, btrfs had a page-size dependency, making it
   impossible to mount it on a 4K-machine when it was created for 64K

And I'm sure there is more. IIRC, SLES used to be 64K on ARM64 but gave
up as well.

> Till now, I am able to get the Jailhouse and ivshmem working nicely with
> 64k pages. Need to check if I have introduced any security holes, etc

As pointed out, the MMIO register region is configured by default for 4K
pages. The PCI BAR mask can be adjusted to account for larger pages,
though, but that is missing in your patches yet. Jailhouse should be
fine with that, it was "just" not tested so far.

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
jailhouse-dev/68e2bf7f-cd61-47ed-5ef1-f928d010a95c%40siemens.com.
