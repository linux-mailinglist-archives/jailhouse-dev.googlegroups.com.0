Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBFPUXH3AKGQEV2QYKJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa37.google.com (mail-vk1-xa37.google.com [IPv6:2607:f8b0:4864:20::a37])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A001E45F3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 16:32:54 +0200 (CEST)
Received: by mail-vk1-xa37.google.com with SMTP id s206sf9200194vke.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 07:32:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590589974; cv=pass;
        d=google.com; s=arc-20160816;
        b=YCGAiAdpkES98bxtbR0CrIN76eFpLx3oWUNzT9a+QJlHX+0lU3Jt6lxKKnoN+xlpzd
         mG+wIymgSw6aJu169X4VFHtjGXWupzESEHG0kUj3FTh0uuBjIVZNTg13pE4+YIec51XU
         LeyQdXZHKwJ7MjaYZ/D9tRF3++JW07iPzsBDMdHnzxRp3lGRBjJSsglpgS0du88USIan
         eI8wjukyXEMuopUPbuf1HUowwH5uOLdec68fzquwvIEedsQkMQ5UixmnikMfHW1JoGve
         JIsCJcvoQQRXpSk4wzFvHDfPm/wZqhOphAaQyPRwjQUjT9vJSbF0pOjkUKywsB2MjW48
         /u/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=lIj36zLR40Nlum79ECHwOJdE56iPRsuhnFa1WKiut+c=;
        b=bJl7Z/Cjs6n4rdO61UNNrJuejDkqod0pySQ3k1ik2HqAh1C9zni8533fl5j83+R+H1
         65zVx7/vgRs5+GIZcg53LjVRQzPvePFb06Wwk3LlAWDGEGrUqXlYwt1kDIQKS7aKJipM
         sGojtgpzvrgs63qdjTioDFF9jgW+D71RJev0WIH0ktSdbyYj06LfNkZxs8PzSkGluowW
         qe3orwBjYcMjhEpXKISvEWN0NLyn0d2rf4+ft33Cok4mQ5muuDxTDObWpHh+MR7WM9bR
         V4+Eh00f6tYeQ5ro/J4T+LycNAu/AlFLD/ZQ0yg/FLPhCWMVM7eZqNm6tbGkzUlFUz2K
         RflA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Wz7UFx03;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lIj36zLR40Nlum79ECHwOJdE56iPRsuhnFa1WKiut+c=;
        b=qJoHkB4Fw1b5pb/tt/rrAZqwhEQmbkOuBSK7jmjto12UNs8Z7dqSMEJaNmFUKiqrsY
         nS4jzxXcvEStQYOvMCnbixUlluzv1aF1Gl2oBXLmSQCK24eXjThmBVeRq5Tvz5U5OyoR
         n/IsOpE7ZnscCPCleN8AEgxdWh0zG1h4PoVwPkiKEEpZ+lA2s63d+mvWxDO49r7GeKcg
         SrqdSasHhuhgL6/lBEpIpFPKGIQKMOZswHMx4IeQ+nFmA6jOHvaEV4oKvozx5gjfAQzB
         GrBGLJtYBHRYoIH15Y+DrVePVBkp1smOCGCb8P2LEmLHpDsfCVvN73ysOIHcRDGXe7Gz
         VVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lIj36zLR40Nlum79ECHwOJdE56iPRsuhnFa1WKiut+c=;
        b=TryNzh4k4+11OliB4kCqRUeSXMHcJ5+Y2ApYIi3H2s+JFRyG/gbTMjw96nqJUOWuR2
         MadtkoJB73yBDBC4f+697k4LSLCR0GjiyNDa831PcCz/3U29vOrNpUqCrEd8SrMoOOe3
         gKqT2LBnCfr5uQHrWl8ytJsnyTywwX+PKrHeGqRhTRcZPyxZnVF1/56xjOECtbTn0aOW
         qSvVCAqDAwGcLkNgRWn1ipkhVVF5OdBO3SSNtRs998aVXLOw7igjyQNw4uqBK5VN6pTk
         sTJP1q8LV2WLsqW7woo2ho2iN7r3RX0HyVS4T6Kj9T05iW1EIvS0/MV/jQrKUSnhjd7B
         SkCg==
X-Gm-Message-State: AOAM531z+D279alfDJWlgYsHrfrLFgUNMgmZkD/Huwpq1COm3U2EoxQe
	rBivD0xhBVgBQh9egLyno6s=
X-Google-Smtp-Source: ABdhPJyBK3mUUOOEqN9kSskEYgm47fZMYpoEJ332UKbGcNY20vV3gX663WE1SnVOPyYPqZUuZPBKEw==
X-Received: by 2002:a67:12c4:: with SMTP id 187mr4918684vss.100.1590589973772;
        Wed, 27 May 2020 07:32:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:3092:: with SMTP id w140ls1555948vsw.1.gmail; Wed, 27
 May 2020 07:32:53 -0700 (PDT)
X-Received: by 2002:a67:be05:: with SMTP id x5mr4634931vsq.35.1590589973228;
        Wed, 27 May 2020 07:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590589973; cv=none;
        d=google.com; s=arc-20160816;
        b=Ff8w49sy7dWOFrhIHmVy/tyvFcTh9Rq8oMl39On/vq996REjT/pun8bC5oxDYGaV66
         aE984kuCh9ds2ZCAAV55UpoYKMrdRe/fDyczoMbogSwQIoDUK3l38Lz/5AOspANfkhEw
         a0mzkcTpo6IAFsr3Yg2aQkGMEhEIrnE92F+x1iyfcZO2t9qkutiC6io88ZV9mWf1Hag1
         2qonlBoE6K6beubk8np8rHEeQqwXZP/R4C5Cvtb3i5n3g//eoG05XLSae71NAYuEZH+z
         0nux6Vo9m3VVOm14T2kidM7PgkEQSj/l2zCPWPuxXeB/Q6AHaElfBKYd2OKs55d+8Bds
         dWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=UljqG/IqcgUhsZF7UqSUS5fivAnAjQ3QWhRqp9IywNM=;
        b=Subim8OcBqYw0uKqS0MI+h0XyH0ZWaBEB+iQy6VKx0XlG4YtzwEhvecMDDGT4MoRFf
         x8gYosdiPah/UTFgNJbk8LAsPbmOtqkaoWJmIsbH7Lmyt73A4vOTZbBZNb4J9gtEeZMX
         8A9rJnEl6fRqXqo1V5oPsXLUIOvtc0BHmly90gNYL/tuYmZaBN0fMpjc0R9J6JOt/Gvw
         rE6O+eFP0tjS7yS3SXgEC7quJDtY2XceSSOz5/TwCNctxQ+PSDtE++BDibWTV/kLyqCK
         +WjpjE8QugBAHXtyw8qcjYoUkbmGerJJCYH8vk58ByaMbUcufc6Et2vYp1JksVHN3gSp
         VQ6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Wz7UFx03;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id j5si334671vkl.3.2020.05.27.07.32.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 07:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04REWq8g029214;
	Wed, 27 May 2020 09:32:52 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04REWqpv050768
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 09:32:52 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 09:32:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 09:32:52 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04REWoMp057834;
	Wed, 27 May 2020 09:32:51 -0500
Subject: Re: [PATCH v1 2/4] configs: k3-j721e-evm-inmate-demo: Add ivshmem
 capability
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-3-nikhil.nd@ti.com>
 <6e2a0459-3707-99ea-27b0-184f643d27fb@siemens.com>
 <8e7b50d6-9c6f-3538-2042-94db463f20fe@ti.com>
 <68e2bf7f-cd61-47ed-5ef1-f928d010a95c@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <84192fc2-2559-0b21-559c-0d06123ea670@ti.com>
Date: Wed, 27 May 2020 20:02:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <68e2bf7f-cd61-47ed-5ef1-f928d010a95c@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Wz7UFx03;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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



On 27/05/20 7:52 pm, Jan Kiszka wrote:
> On 27.05.20 16:09, Nikhil Devshatwar wrote:
>>
>>
>> On 27/05/20 6:55 pm, Jan Kiszka wrote:
>>> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>
>>>> Add a virtual PCI device with IVSHMEM type (id =3D 1)
>>>> Create IVSHMEM regions for 2 peer communication
>>>> Enable the vpci_irq for doorbell interrupt
>>>>
>>>> This allows to run the ivshmem-demo baremetal inmate
>>>> inside this cell.
>>>>
>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>> ---
>>>>  =C2=A0 configs/arm64/k3-j721e-evm-inmate-demo.c | 63 ++++++++++++++++=
++++++--
>>>>  =C2=A0 1 file changed, 59 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c
>>>> b/configs/arm64/k3-j721e-evm-inmate-demo.c
>>>> index 7440a258..e09c4850 100644
>>>> --- a/configs/arm64/k3-j721e-evm-inmate-demo.c
>>>> +++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
>>>> @@ -20,7 +20,9 @@
>>>>  =C2=A0 struct {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct jailhouse_cell_desc cell;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u64 cpus[1];
>>>> -=C2=A0=C2=A0=C2=A0 struct jailhouse_memory mem_regions[3];
>>>> +=C2=A0=C2=A0=C2=A0 struct jailhouse_memory mem_regions[7];
>>>> +=C2=A0=C2=A0=C2=A0 struct jailhouse_irqchip irqchips[1];
>>>> +=C2=A0=C2=A0=C2=A0 struct jailhouse_pci_device pci_devices[1];
>>>>  =C2=A0 } __attribute__((packed)) config =3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .cell =3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .signature =3D=
 JAILHOUSE_CELL_DESC_SIGNATURE,
>>>> @@ -30,8 +32,9 @@ struct {
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .cpu_se=
t_size =3D sizeof(config.cpus),
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_memory_re=
gions =3D ARRAY_SIZE(config.mem_regions),
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_irqchips =3D 0,
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pci_devices =3D 0,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_irqchips =3D 1,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .num_pci_devices =3D 1,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .vpci_irq_base =3D 195 -32=
,
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .consol=
e =3D {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 .address =3D 0x02810000,
>>>> @@ -48,6 +51,33 @@ struct {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .mem_regions =3D {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* IVSHMEM shared memory r=
egions for 00:00.0 (demo) */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p=
hys_start =3D 0x89fe00000,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .v=
irt_start =3D 0x89fe00000,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .s=
ize =3D 0x10000,
>>>
>>> This means the kernel is configured for 64K pages - rather uncommon and
>>> problematic in many regards (just had to turn it off on AM65x because i=
t
>>> breaks userspace [1]).
>>
>> Yes, indeed.
>> In fact, I was planning to send one more patch on ivshemem_uio to map
>> a page aligned register memory[0]
>>
>>
>> At TI, Jailhouse is integrated with TI linux kernel[1] (which is
>> different from the siemens kernel[2])
>>
>> Can you please point me details of failures with 64k kernel.
>> This will help me to convince TI kernel developers to turn off 64k
>> paging because of whatever issues that might occur.
>>
>>
>> [0] =3D
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=3Dti-l=
inux-5.4.y&id=3D30061ab0dcd216ccf20fa9bc426b575feaaefcb4
>>
>> [1] =3D
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=3Dti-linu=
x-5.4.y
>>
>> [2] =3D https://github.com/siemens/linux/tree/jailhouse-enabling/5.4
>>
>>
>> Regards,
>> Nikhil D
>>
>>
>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .f=
lags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p=
hys_start =3D 0x89fe10000,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .v=
irt_start =3D 0x89fe10000,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .s=
ize =3D 0x10000,
>> [snip]
>>>> +=C2=A0=C2=A0=C2=A0 },
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 .pci_devices =3D {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 00:00.0 */ {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .t=
ype =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .b=
df =3D 0 << 3,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .b=
ar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>>>
>>> This constant assumes 4K pages.
>>
>> Shall I create another macro like below?
>>
>> #define JAILHOUSE_IVSHMEM_BAR_MASK_INTX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0xffff0000, 0x00000000, 0x00000000,=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x00000000, 0x00000000, 0x00000000,=C2=A0=C2=A0=C2=A0=
=C2=A0 \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> Also, as long as the memory that is getting exposed by the registers
>> regions is less than 4k, it should work right?
>> Maybe I won't need the above patch if I do this change.
>>
>>
>>>
>>> Given all the problems with 64K, I suspect it's better to switch to
>>> standard 4K.
>>>
>>
>> I am afraid that might need lot of convincing.
>=20
> If you have convincing performance numbers on 64 vs. 4K, I'm also
> curious. :)
>=20
> Findings so far:
>   - https://github.com/siemens/meta-iot2050/pull/7
>   - RT seems to have latency problems, that's why you already disable it
>     in your config
>   - in the past at least, btrfs had a page-size dependency, making it
>     impossible to mount it on a 4K-machine when it was created for 64K
>=20
> And I'm sure there is more. IIRC, SLES used to be 64K on ARM64 but gave
> up as well.


Thanks for these details.

>=20
>> Till now, I am able to get the Jailhouse and ivshmem working nicely with
>> 64k pages. Need to check if I have introduced any security holes, etc
>=20
> As pointed out, the MMIO register region is configured by default for 4K
> pages. The PCI BAR mask can be adjusted to account for larger pages,
> though, but that is missing in your patches yet. Jailhouse should be
> fine with that, it was "just" not tested so far.
>=20

My takeway is that switching to 4k makes sense to avoid failures in
various software components as mentioned above. I will try to push for=20
this change in TI kernel. If it goes through, I need to modify this=20
series to use 4k page size.

In case this doesn't go through and TI decides to continue with 64k,
I should modify the series to handle the BAR sizes and then will you be=20
okay to accept the cell config changes for 64k?

Thanks for the review.

Regards,
Nikhil D

> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/84192fc2-2559-0b21-559c-0d06123ea670%40ti.com.
