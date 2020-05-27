Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBAH7XH3AKGQEYLOUOCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x538.google.com (mail-pg1-x538.google.com [IPv6:2607:f8b0:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 136451E4689
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 16:56:02 +0200 (CEST)
Received: by mail-pg1-x538.google.com with SMTP id k30sf12384316pgf.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 07:56:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590591360; cv=pass;
        d=google.com; s=arc-20160816;
        b=aWo8GKq8fSgC5R6exU9fcaSjQJgIlnK09Vz5GQ+aaHx3VwM8LzKEB3AjuvoAkbwDc6
         xrNSf/ZhRh4O9bXsH1CDVlA2DpgX8sS2EubpTetCyWw1c5yK9QOQbeRk6CiczLaQyb9J
         /V6wnV7eTc958dm5D/UggH18CBh54pAcDsjXvmG3IHzD/k/PLKwCjKaDUhE/kmwD7xYc
         Qw/HOtP+VTVaiWGrBiaytpqV0AAm+6Wdg3sLnpesJhBo8QYI5agZbe3/LoKnApx/qxEX
         CTFlgK7HsyFbILo/+FahFDEeeSzdg8850ydTmQJ78VDc6G0ZhVUydogf6JKe3qURZh9K
         CSGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=PhD2BuJs21sBH4VzXVu5zJAQF3csJr6cLWjmsS4kzyE=;
        b=yDlhmuIVc/YfWOdx9GNaKwsJZfyCx7jQ62/bddDVLxI7hH73auX5VLsfp0UDJbmOpo
         BPbcWFTJYgzTSivsqQPiHZ5BlcLp9QLYW9gtPxYt6cFbukHfxzM1ZaQ03RRCZImXTLsp
         2LytXTgCFj2Kmm92YnnH2R2i4QHtT/w0QZQKke6uHd7fQx+TynRKKayx6vN7rXQHPNo5
         riFYpj8rU4PhCMXW2Q5i33K3CVEnSW96NpNOnML33eHesS3KYdOe5QA2/6FKfW3Cc0aS
         sly0B20UYNuZOu06SA8snw3L0ar1EMFdisDBz6mHK9TWuCA0/ip859+jbjemcjeysbj9
         SnyA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MsoSfL5g;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PhD2BuJs21sBH4VzXVu5zJAQF3csJr6cLWjmsS4kzyE=;
        b=XyDW1JkMbeGzrzFkMqzSr1iK9CERuTgGCw5eTh5iFC3dI5Or/CRBVvOO+oZlSe5/Sg
         y8RN3LBDYqHAdGokM0X5IPtoTSgBz0tMeK6aaEnxjmOTXKwEFYA52pwz8JFXYbPASFPO
         uofwjer21Caf8fqNaeSETlAe86XMRPLKR+vdFRGTkSIqtJzecFZQON9jjMLXtnlXYnWs
         hkJBcdsDsvczMeTszGC3yUcavP01OHvFXC59FQHF3toFPQv/aIpOx3qDAem3KotZ0Uw/
         FQJAFVkWFtWxVACud/mIVNGOc32vf+wfMNMXRNM1mdd+MRolaFxK71UjG/kDXZ1rAwo8
         ZFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PhD2BuJs21sBH4VzXVu5zJAQF3csJr6cLWjmsS4kzyE=;
        b=nwuIe7B93ow4zzK78PuMqD4eH/TTf54vRNL6nCp6m5rGCssucS9mCGNy4/Zb4o7LkI
         Y0LtlMhcR5o5V5HMa7gsRIih5GlpYvBY4RsYPb5oMiDBsa0CM4eiSLgLDHcK1tY144Kr
         ClHvWvKhJV1RTiBtGid6GeWbqpW9A0t1zKygTt4T/nZ6naD7m4O+h1hYNrvnugMZ53yD
         x8r1lVVVK3XQUgT+aSKYmLJOXb/1ytF9/+huziBAVdg3LYFvigXqBrxVu7Uxt3FWJ1ih
         8MRA7kHeFBMTyv6GS04VbUF4EyoKd2DSsWLXuv135aeS0Zx0l0ypPrgyIMrjpHQX8Dfl
         vB+Q==
X-Gm-Message-State: AOAM533CnA/lVmSFm2X4ESnUumwRXxUUvdsmwGNhHGNMMiSNVcAjGW+y
	ahil1AqDjp3gcxWo2WH5tlM=
X-Google-Smtp-Source: ABdhPJy4kSwKivwWkTPCSldBd/stsse7Jtm9HHN0ilECF13gsRNSBTnsza2eH7SGgnZZ6jXeJl1aaw==
X-Received: by 2002:a17:90b:1482:: with SMTP id js2mr5658057pjb.54.1590591360756;
        Wed, 27 May 2020 07:56:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:d015:: with SMTP id z21ls3632374pgf.5.gmail; Wed, 27 May
 2020 07:55:59 -0700 (PDT)
X-Received: by 2002:a63:520f:: with SMTP id g15mr4469940pgb.317.1590591359853;
        Wed, 27 May 2020 07:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590591359; cv=none;
        d=google.com; s=arc-20160816;
        b=RHkzK94mLWXAMYMPUHGtZ9u79X2btQ4fYhoA/7hmg+t7y2qrYQd3JytPYTyhMR8cPo
         qg+G9dd3d8MzSFJpHOmQJm/mcVCGR6mtvXdJxr/ef/6a3XBdnEo+nMlXcUEpJ5KLjlF6
         FJvoumOtSsab/S85GdAflvDpiLvXoQppv1srAM37RzLAZzcGchNqdiT1HCu6zVejbRq+
         WjHH1CkXNnHxsC76DX8h1lHDecqWdsBzidDrc9cnZXt7dfHLjEqY8CvtJV+Xwmv0PHC2
         0Zl0EzP75MO/gaB2w3SL6wfwxKgbqeofi66e9f85dYF6Yz36NdBwhf2uqeImsCU2SiTz
         lcsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=VrWgYJ3hTX6kiPXeZ95F+ORsQKFFxN9bHEbMC3gOekk=;
        b=MFY6/mrXJ8lQJTcrH9fr44BsfZT7LlSEbbybsGY4w4TWpBREnzb+a7PA/NNOWtyArj
         xdy4Z/Ub1HDakabt1kAhtxX7LhzPUVsnRq4EtnTY/4d4LiXkANxbUa0twOm8i17Dv4oJ
         MvADo0G6w8pLmG0hZa5bSbZqnhHRr5BtbeeHjQKAa/G+vIUJO6ZnC190Y5VUfmjLSXdl
         3RookIsw/Lpngjxxul/xdEa9345vdMyWwYNK71Qk+sY5iLMpqFkNX9giftFCls+hL4AO
         J7b0sLG2m+m47o7Qt00N9KsguWSZjKzyZgUMES067XZDhS52bdGQQeEUfDjvNbp+hE81
         51GA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MsoSfL5g;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id b8si168915pjk.2.2020.05.27.07.55.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 07:55:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04REtx3f036037;
	Wed, 27 May 2020 09:55:59 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04REtxRs027260;
	Wed, 27 May 2020 09:55:59 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 09:55:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 09:55:58 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04REtuH9100884;
	Wed, 27 May 2020 09:55:57 -0500
Subject: Re: [PATCH v1 4/4] tools: ivshmem-demo: Pass peer_id command line
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-5-nikhil.nd@ti.com>
 <98bf4c5b-9812-d2d4-8da0-c887b44277b9@siemens.com>
 <eb224001-86c9-593d-b4ab-d0ae168fcbd8@ti.com>
 <1d841e18-8a4e-0c00-4a57-1a74bb461fe6@siemens.com>
 <c32c3837-b0d6-c48e-221a-4202923d945f@ti.com>
 <08222d8d-39d1-1514-2259-891f95f20697@siemens.com>
 <46dce81a-e841-4adf-7c81-5e6abbe8148c@ti.com>
 <e75c66bb-048e-15d3-1a74-075829c9b2d4@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <5a7a1e18-93dd-6bb1-8fba-ccfd91f2c8d5@ti.com>
Date: Wed, 27 May 2020 20:25:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e75c66bb-048e-15d3-1a74-075829c9b2d4@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=MsoSfL5g;       spf=pass
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



On 27/05/20 8:18 pm, Jan Kiszka wrote:
> On 27.05.20 16:16, Nikhil Devshatwar wrote:
>>
>>
>> On 27/05/20 7:38 pm, Jan Kiszka wrote:
>>> On 27.05.20 15:53, Nikhil Devshatwar wrote:
>>>>
>>>>
>>>> On 27/05/20 7:18 pm, Jan Kiszka wrote:
>>>>> On 27.05.20 15:28, Nikhil Devshatwar wrote:
>>>>>>
>>>>>>
>>>>>> On 27/05/20 6:41 pm, Jan Kiszka wrote:
>>>>>>> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>>>>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>>>
>>>>>>>> Number of peers available on a platform is different.
>>>>>>>> Do not hard code the target peer_id used for interrupt.
>>>>>>>> Parse this from the command line argument.
>>>>>>>>
>>>>>>>> This de-couples the dependency between number of peers.
>>>>>>>> ivshmem-demo can be run to communicate with desired target
>>>>>>>
>>>>>>> No command line, please. We can do (<ID> + 1) % <Maximum Peers> as
>>>>>>> target. All that is accessible via the register interface. But
>>>>>>> then all
>>>>>>
>>>>>>
>>>>>> I believe, as of now, only root cell can communicate with peer1,
>>>>>> peer2,
>>>>>> etc. Non root cells cannot communicate with each other.
>>>>>> Please correct me if I am wrong.
>>>>>>
>>>>>
>>>>> Not all targets have been enabled for the "triangle" setup, but if yo=
u
>>>>> look at qemu-arm64, e.g., you can see that pattern.
>>>>>
>>>>>> (id + 1)% max_num_peers=C2=A0=C2=A0=C2=A0=C2=A0 logic won't work for=
 a 3peer scenario
>>>>>> where
>>>>>> root cell app(id=3D0) wants to communicate with baremetal(id=3D2)
>>>>>> e.g. qemu-arm64 has these ids.
>>>>>>
>>>>>
>>>>> Then we need to adjust that. It doesn't matter who sends whom, just
>>>>> everyone should send something and everyone should receive something =
in
>>>>> the end.
>>>>>
>>>>
>>>> In QEMU, root (id =3D 0) linux-demo(id =3D 1) and baremetal(id =3D 2)
>>>>
>>>> 0 should be able to to 1 and 2
>>>> Here you should choose if you want to communicate with baremetal or
>>>> linux-demo. There is no way this can be automatically figured out.
>>>> That's why I added an argument.
>>>
>>> Every peer can talk to every other peer in those setups.
>>
>> Oh, that's new to know. Sorry about confusion.
>>
>>> It's just that
>>> the demos are built in a way that each peer has a single notification
>>> target, by convention, not by cell configuration.
>>
>> But if you can pass the id and communicate with any peer, that seems
>> better than the limitation that root cell can communicate with only a
>> certain peer that is described by how the ids are alloted in configs.
>>
>=20
> Not sure if I get the point already:

In the current qemu-arm64 configuration, It is not possible for root=20
cell to verify communication with linux-demo and baremetal-demo both.
That's because "the demos are built in a way that each peer has a single=20
notification"

This is the limitation I am trying to get rid of, by passing an=20
argument. e.g.

ivshmem-demo /dev/uio0 1 #This will communicate with linux-demo
ivshmem-demo /dev/uio0 2 #This will communicate with baremetal-demo


> If you link ivshmem devices by
> using the same BDF, there will be no communication restrictions. The ID
> allocation is static, to make it stable, but there is no semantic behind
> the number. The only constraints: IDs must be unique (obviously) and
> must be < than the configured maximum peers.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5a7a1e18-93dd-6bb1-8fba-ccfd91f2c8d5%40ti.com.
