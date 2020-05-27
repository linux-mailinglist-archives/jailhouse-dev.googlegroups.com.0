Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW76XH3AKGQEII4SFZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB1C1E4681
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 16:55:24 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id z5sf11281672wrt.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 07:55:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590591324; cv=pass;
        d=google.com; s=arc-20160816;
        b=ipFF8vZp4YdwZUMK5uDeER43R01h2/izdSjZHjWKEaLKL+fPvTMvfg/eTLNFaWTqVN
         dqP1ZFdHck14gHX9+vz6bSOf457oe2aq+/oKKVuoYtE6azxwVu64Q3sMLQyoSlBhc1gs
         6X0g4wXJfAR5c2FFkVzsxkYXBPOG00u7aFoo6nopRKFHO8tOsTtxZ+FqJ4dLp58AD5An
         htxp1YtxsWo+O/w8ZhE4tnI/7AoP6MLoMbroc9FIgeFD7Mssv0nwsjN2EDT/eXrBsj7K
         SfqgFfKA8Z2FcvQUc1Fqz7wqwhjYnNoG11c4/72VZQf9hIISa+vY5cUuNGHzy4IxeYPQ
         smJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=FANnkYXs4tqs+gFlOeT4nioebZfjS4JJBSdxBeXYqfs=;
        b=qKUvb1g46QfyXzi22Ss35yswWv56pOEskP9pZZCEikeNmwDCRKgvrECVoHVJcBgF90
         ljaACxx5reFctAbDlA7O3a3y1vcF/bGqND4nir9Eum1hpSJ2u1Gec0kwv3V4iX2oWI74
         GAofq9FHfMQHfAZqbr0ctQ8bafyJPIDg8YFGoeo/lBSul6eiJzg3hV+5B/Bbbwn48/LY
         hWV3EXbpbZbu6XeoTmQeTog70dk3LgnfZZO1prW2W19kUxHr2q6OTFghyCGYmVsinhsM
         OZMF43f/ELconbiFSSWpe7jAO8peITMkhtR6zYqzRwfyY6dsCEGSezRFBbQVc9xO0rmZ
         hiSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FANnkYXs4tqs+gFlOeT4nioebZfjS4JJBSdxBeXYqfs=;
        b=m5Ucc+Ijhw5nSDu2koXODRCoFVlULnoreVZIL8F14X/FfjiUmkgmAPdEw0oxlAZ+Ea
         HRdvgrSdVBJPefLgCPRN64Huw7wCEtJZBORobKAKCUjoioW1hhlYyj/Npo/MhddNfmHJ
         2Ql1x0nv2ix8Cc5FgIirW5KnGKXr0Xg7Cu+/TbpO28E+KiZAXKrBTmHC0v0hLCCyW2If
         NzJknqmgR8YyL5UVS8CSwQDB+7DQss2n4PbWBFC8cN/8ipIqx3f4NfxXV8sik//+hOy7
         aV0dVCsNomzQmzzMlmqbVbKss7/YX02U30CVXqHoRfQo8cafHcs3VZZjEcB8YRjvoRld
         DTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FANnkYXs4tqs+gFlOeT4nioebZfjS4JJBSdxBeXYqfs=;
        b=CMdlj1DsrcHc5TTYd4dsF3ESVtiXxzIQtbvOha7bguJOX4rj656kTSs56WCB/PSJnn
         dr1hGMyWj2F6Lt3WL/0n4bPYoMPKPzgMaIaO14o6tBTfo8sZ4vh7gxdPqLNmQCd7c0K/
         bMUwX/hGuGCwPh3cFm2yBgpRlsBSaudQc4h1Djdeo8BaLZrhemfq+3ZXOwf8JKEF9B6g
         MEP61y+lZfYEZKG1qW744mmsK/6j7LI2KQYZMuE4AzwmGXegk+sTnCKEnikilzR60wmz
         3ttf9ievnUmgzsKgGWZNQszyzN+fjSfja/43fb+GjP9IJYbuNjH9yNpUEp0vUKICiOYh
         CQSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530nYLMvJCVVGtKGf/CwuqWlIxJL7xPNZfQ0szNnITtTWlAk34Bn
	03IQe7iWKG8kOrgBLhm15l4=
X-Google-Smtp-Source: ABdhPJyCfC1YS46Ez2I3spLjgAAgrgoSwU51r4LTRTsM1i+Lx/JD0Th62/BLckFBaAaynPiKGgeZew==
X-Received: by 2002:a1c:dc05:: with SMTP id t5mr4886348wmg.112.1590591324097;
        Wed, 27 May 2020 07:55:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:62d6:: with SMTP id w205ls1663950wmb.1.canary-gmail;
 Wed, 27 May 2020 07:55:23 -0700 (PDT)
X-Received: by 2002:a05:600c:280c:: with SMTP id m12mr4890035wmb.92.1590591323354;
        Wed, 27 May 2020 07:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590591323; cv=none;
        d=google.com; s=arc-20160816;
        b=ZTQ5VoYg8HXGsuOGhT/TgLEC0/AzEYlwVazZvSsN/8oDzv4ZYxKHAs9uOennER1JGM
         0SoGsEPZwCqFLwzywDj3xvsSScwnQPkTV5inQUdSA7AvvbZK931dNLvbID17LxDFMkEf
         rYHlvQRxfA0abJYwBumkjtL9o6sFNdXmUX9WiqJ+HIPCpH2rwx8all4AF2WYwkLj7Yjc
         yS336TGVRC6M3HZ1xptNPys2kUCLf6kt0KoANzyud+NlvcUmiRdLJwNnYN3/0YWsB3fZ
         nFOrScAYaZ7oPmudDofLfhoukhoAsuv/0TnwqPoxR3EQ+Nt1iYnmOfX5uZGli70Of/mI
         Gh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=e9syqhI8wLWWtu7w/1uOD47ftFhDBji/6+mPC4fkxx4=;
        b=ThWloeXtkowSIulrFPMnHoHTLwCF6YHeZUPui3FaNE6K5HP6BJDXz65GvoXuilNp1A
         Y+I+3IhUO0XZW/GPFvPGeyXc2hfJIGpUNCLV1LcyLQpj2nI1GZepwEGABeRyDT0HRXJM
         BtyWYzE8awqaF6YB8pZqJZk929K4TrbZhRhzsoNrcCWF1dgmEBjNo+mKmXwK/t4jVAl7
         IgK+1oWtgjw0zWoaxrTmjDPae3Nr5wLj3yWCEt410K/2wWHye5kBavoeJkza7SbsJunO
         db/QKgeEGkuqheSWMJMx3ENKrpH6/WsfjYAT1XCqKpda0bqDSg+JjKn1HcSkMGOOnIIC
         yIBw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q72si159362wme.1.2020.05.27.07.55.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 07:55:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 04REtNXQ003733
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 16:55:23 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04REtMqW020749;
	Wed, 27 May 2020 16:55:22 +0200
Subject: Re: [PATCH v1 2/4] configs: k3-j721e-evm-inmate-demo: Add ivshmem
 capability
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-3-nikhil.nd@ti.com>
 <6e2a0459-3707-99ea-27b0-184f643d27fb@siemens.com>
 <8e7b50d6-9c6f-3538-2042-94db463f20fe@ti.com>
 <68e2bf7f-cd61-47ed-5ef1-f928d010a95c@siemens.com>
 <84192fc2-2559-0b21-559c-0d06123ea670@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <78b9273e-8799-d6bb-b9b2-95161b3c78a5@siemens.com>
Date: Wed, 27 May 2020 16:55:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <84192fc2-2559-0b21-559c-0d06123ea670@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 27.05.20 16:32, Nikhil Devshatwar wrote:
>=20
>=20
> On 27/05/20 7:52 pm, Jan Kiszka wrote:
>> On 27.05.20 16:09, Nikhil Devshatwar wrote:
>>>
>>>
>>> On 27/05/20 6:55 pm, Jan Kiszka wrote:
>>>> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>
>>>>> Add a virtual PCI device with IVSHMEM type (id =3D 1)
>>>>> Create IVSHMEM regions for 2 peer communication
>>>>> Enable the vpci_irq for doorbell interrupt
>>>>>
>>>>> This allows to run the ivshmem-demo baremetal inmate
>>>>> inside this cell.
>>>>>
>>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>> ---
>>>>> =C2=A0=C2=A0 configs/arm64/k3-j721e-evm-inmate-demo.c | 63
>>>>> ++++++++++++++++++++++--
>>>>> =C2=A0=C2=A0 1 file changed, 59 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c
>>>>> b/configs/arm64/k3-j721e-evm-inmate-demo.c
>>>>> index 7440a258..e09c4850 100644
>>>>> --- a/configs/arm64/k3-j721e-evm-inmate-demo.c
>>>>> +++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
>>>>> @@ -20,7 +20,9 @@
>>>>> =C2=A0=C2=A0 struct {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct jailhouse_cell_desc cell;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 cpus[1];
>>>>> -=C2=A0=C2=A0=C2=A0 struct jailhouse_memory mem_regions[3];
>>>>> +=C2=A0=C2=A0=C2=A0 struct jailhouse_memory mem_regions[7];
>>>>> +=C2=A0=C2=A0=C2=A0 struct jailhouse_irqchip irqchips[1];
>>>>> +=C2=A0=C2=A0=C2=A0 struct jailhouse_pci_device pci_devices[1];
>>>>> =C2=A0=C2=A0 } __attribute__((packed)) config =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .cell =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .signatu=
re =3D JAILHOUSE_CELL_DESC_SIGNATURE,
>>>>> @@ -30,8 +32,9 @@ struct {
>>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
cpu_set_size =3D sizeof(config.cpus),
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_mem=
ory_regions =3D ARRAY_SIZE(config.mem_regions),
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_irqchips =3D 0,
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pci_devices =3D 0,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_irqchips =3D 1,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pci_devices =3D 1,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vpci_irq_base =3D 195 -3=
2,
>>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
console =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 .address =3D 0x02810000,
>>>>> @@ -48,6 +51,33 @@ struct {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .mem_regions =3D {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IVSHMEM shared memory =
regions for 00:00.0 (demo) */
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
phys_start =3D 0x89fe00000,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
virt_start =3D 0x89fe00000,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
size =3D 0x10000,
>>>>
>>>> This means the kernel is configured for 64K pages - rather uncommon an=
d
>>>> problematic in many regards (just had to turn it off on AM65x
>>>> because it
>>>> breaks userspace [1]).
>>>
>>> Yes, indeed.
>>> In fact, I was planning to send one more patch on ivshemem_uio to map
>>> a page aligned register memory[0]
>>>
>>>
>>> At TI, Jailhouse is integrated with TI linux kernel[1] (which is
>>> different from the siemens kernel[2])
>>>
>>> Can you please point me details of failures with 64k kernel.
>>> This will help me to convince TI kernel developers to turn off 64k
>>> paging because of whatever issues that might occur.
>>>
>>>
>>> [0] =3D
>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=3Dti-=
linux-5.4.y&id=3D30061ab0dcd216ccf20fa9bc426b575feaaefcb4
>>>
>>>
>>> [1] =3D
>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=3Dti-lin=
ux-5.4.y
>>>
>>>
>>> [2] =3D https://github.com/siemens/linux/tree/jailhouse-enabling/5.4
>>>
>>>
>>> Regards,
>>> Nikhil D
>>>
>>>
>>>>
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
phys_start =3D 0x89fe10000,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
virt_start =3D 0x89fe10000,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
size =3D 0x10000,
>>> [snip]
>>>>> +=C2=A0=C2=A0=C2=A0 },
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 .pci_devices =3D {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 00:00.0 */ {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
bdf =3D 0 << 3,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .=
bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>>>>
>>>> This constant assumes 4K pages.
>>>
>>> Shall I create another macro like below?
>>>
>>> #define JAILHOUSE_IVSHMEM_BAR_MASK_INTX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xffff0000, 0x00000000, 0x00000000,=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000000, 0x00000000, 0x00000000,=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> Also, as long as the memory that is getting exposed by the registers
>>> regions is less than 4k, it should work right?
>>> Maybe I won't need the above patch if I do this change.
>>>
>>>
>>>>
>>>> Given all the problems with 64K, I suspect it's better to switch to
>>>> standard 4K.
>>>>
>>>
>>> I am afraid that might need lot of convincing.
>>
>> If you have convincing performance numbers on 64 vs. 4K, I'm also
>> curious. :)
>>
>> Findings so far:
>> =C2=A0 - https://github.com/siemens/meta-iot2050/pull/7
>> =C2=A0 - RT seems to have latency problems, that's why you already disab=
le it
>> =C2=A0=C2=A0=C2=A0 in your config
>> =C2=A0 - in the past at least, btrfs had a page-size dependency, making =
it
>> =C2=A0=C2=A0=C2=A0 impossible to mount it on a 4K-machine when it was cr=
eated for 64K
>>
>> And I'm sure there is more. IIRC, SLES used to be 64K on ARM64 but gave
>> up as well.
>=20
>=20
> Thanks for these details.
>=20
>>
>>> Till now, I am able to get the Jailhouse and ivshmem working nicely wit=
h
>>> 64k pages. Need to check if I have introduced any security holes, etc
>>
>> As pointed out, the MMIO register region is configured by default for 4K
>> pages. The PCI BAR mask can be adjusted to account for larger pages,
>> though, but that is missing in your patches yet. Jailhouse should be
>> fine with that, it was "just" not tested so far.
>>
>=20
> My takeway is that switching to 4k makes sense to avoid failures in
> various software components as mentioned above. I will try to push for
> this change in TI kernel. If it goes through, I need to modify this
> series to use 4k page size.
>=20
> In case this doesn't go through and TI decides to continue with 64k,
> I should modify the series to handle the BAR sizes and then will you be
> okay to accept the cell config changes for 64k?

Configuring for 64K pages in the cells would be fine (when addressing
the BAR mask), just wasteful in case there are 4K behind it. So I would
accept that as well.

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
jailhouse-dev/78b9273e-8799-d6bb-b9b2-95161b3c78a5%40siemens.com.
