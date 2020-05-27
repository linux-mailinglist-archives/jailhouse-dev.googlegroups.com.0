Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBUIXL3AKGQEIWQWUSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C81E4713
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 17:15:18 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id x11sf926499wmc.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 08:15:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590592518; cv=pass;
        d=google.com; s=arc-20160816;
        b=BKADzTlTmSTpHULpO5KjGVDo6CFwxPAFgO/EDCYVsl9xlWKHCzaPhWvulX1H18TIEh
         2I9enls6HA1IR1rJz+NjN7d8d3LfHjNu16pAZ0GypDsMBK/sIQ0T2iySWY9eDwm13ReO
         09lEKBvMagvrMFyznyL9E4mZLBRH78tZQhLgoyia3zfN3dIWRyOfPVR+zQu7jRmqcCOv
         WQVqohsy/HSmjqBssHox0dhDijOjia3d3JNHOrrbPknCPmHuE34oNvEWmNBwaD6SObzP
         f+X6Xf4hMPdlaWytXuvCTuaCB6zP9+NwQXOoda7jrmcnrqlHbrSU+VbBQQ4eHEzdbB1d
         Z6vg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=5to0JH2wOL+SGumO3aXJw+fTPS0ZOFTKrXFhQmi7viQ=;
        b=rhwOa79GVIsXruY59Dd/do5sd+Gdf3ut4krIZxJW+G2Yzk4SvXIF4akIl7CjNLLEiO
         oivmydQ2IIz6F9Mr2DvYI0WTVTNQkF2I2+/gPeAwJfEBfOUZiGL2E0aL1ORT2pq0KoiS
         LxOxtAnWch9AvzzSffIkOx1Sl1T5B3ma11fjhwPdydlyEDj1Y1vvHolKVwCRiRXP6Mo4
         5Ns0hP9alwghzaSqGStPBTjehcxgcSgihb2ZIQZF3n0CxV16cor48WqrsVIImSKkjBwg
         L5NjpPYfj2DWP2nF/IHgLKdF5sUU2ztCFqbPaolzs2WzugQr5FdoSbKk7ul0qgD4ZjiG
         E1HQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5to0JH2wOL+SGumO3aXJw+fTPS0ZOFTKrXFhQmi7viQ=;
        b=SNDVgrabGT/4gm1mQ2qQyIITIiNruS2Ewbg4R5aLt0xmfjFXeFND0r1tDqBzboBZcv
         pMBx047+h7p3/t83QluNighX0RCzfJRI5uVeeC26jYSQrDfl66mHN7oJAS14PoaQdY7r
         jvNdP0DCaaLPimebSZqbRlVbL2vp2Ki1ElULMdpFeD0Z7DUjQ29uNKK1tSs5pWkFfE4h
         Bacg4HTmjKaknLcHaq5gzmpt51PM00+KVrEahcNTRzvtK2O9lNEWmnz4ygl328ys9ApL
         DQlwqck1SwcyeouOWysBgDMCiM3N+EmtgQ0AECbLvwLox9G32Dd9YWED42I9DlGiG4Ka
         a3yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5to0JH2wOL+SGumO3aXJw+fTPS0ZOFTKrXFhQmi7viQ=;
        b=tuPP4urAJ4Qs+cA1VJSF4kYsSIHPL/Nj70bYx+FXJpJUUHCWLL5/lQj5ztBBI+8wIZ
         Oumyl164kmtvDquxXm4wWbSTBJ+xrI86sQihN5wlxAODpPH2WeCyMO7kazomB3JZchMA
         IB5ugCNt13Ub7kjzoZBQ5RQ5zax7Y62QLC6KX4oLPAgPjny8nIOo9FNF2hxynQ8/1qYm
         dBzJen3Vq2osY2zW2B4Uxjo9blvb0FQdpyomF4lT8Zo4c3LYONY1doMbCWMfRolev3jL
         Nek1ZG93EiKDghRxUZ8ZLZwhjnCwj2DoVA23pJJY4c762fuWVI91Y8LWIQgUKyP3Nwkn
         C/Yw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5337af2AWQwNIjPxXLrRmltpyeS9rt6Z+hkvYTZDfIl9rt23lwav
	cI65JJ+R1Kn2yrVs1uKOx6c=
X-Google-Smtp-Source: ABdhPJzQ9MxJS/Kme+/wpcg48YlMfu3fr7SR9OTJyoxmfveMRgHgGXmkpQBzXgSENMRuo1G47NDWRQ==
X-Received: by 2002:a05:6000:ce:: with SMTP id q14mr27543615wrx.105.1590592518542;
        Wed, 27 May 2020 08:15:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ce:: with SMTP id 72ls3829500wrc.1.gmail; Wed, 27 May
 2020 08:15:17 -0700 (PDT)
X-Received: by 2002:adf:ef47:: with SMTP id c7mr27455288wrp.57.1590592517733;
        Wed, 27 May 2020 08:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590592517; cv=none;
        d=google.com; s=arc-20160816;
        b=I2s9M6qGUJBNLxUZj7pi/B2oeVCiJ6sfthoo07TO20aDGSJgodrFe06DaGO0aOS+Vp
         h5Ngzs8b7crYfNvTsRzfcl4/Chp9sm66XicA76Fb+5TBnYSk0GoOdQWa+l98qUt1E+zE
         erusHWpycZo0VP4cQtZLEoepO7y92z5x7DWOU5OagV7Wl+pbVRb1NeSN/Cq4sdymjUbQ
         4JXNa+fcQpm+LGWO62O/IlAJIzOQ8lV4tqu3VSz4BqZq7OqPFxJWgnVOSYrgN6I+Xib8
         9r8/N0FgGuzlfEc3RZTnHnOkw3N3P5Ny1EDGiO1kcLNJ8iVHjbUo6JVzEWYL/wdAoVWq
         JYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=FWni7xHRuY0AZmzeyw6oBsRJc1YB/ItvaohcEaQSuMM=;
        b=Ocm86nSJZ4XLMsxu0OekK2CfJaTzMcd4wnBMjcoHaCtD9oFfPpyyRj5mJDGJ4zN7YT
         IOy3ixVH1Zu0GuPI/qlZeFXeQNy4O1JlvGRArSBH8/AS338is/VNkfSeQZ1ecTaBggEL
         DVdx7BLXPCCtMB2P0uZBhhBWGG2F0oucvXoSCk7MYpSYfdjIGM9nETdGCphmseZP9vvC
         gc06De01S13oLdOmnen+94M7pcLuITRqnoFunxU97jr3/i0i/JQwb1+Cihdnn6yFPfOy
         IML9q12mQxq7lF6pbuBXSKXB77HePi3PLts+n2wd3f4OPP/fq3r0D6sm2oNtXuDcs0Yh
         SRrA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id q72si162824wme.1.2020.05.27.08.15.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 08:15:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 04RFFHJj003118
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 17:15:17 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04RFFG5Z016845;
	Wed, 27 May 2020 17:15:17 +0200
Subject: Re: [PATCH v1 4/4] tools: ivshmem-demo: Pass peer_id command line
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-5-nikhil.nd@ti.com>
 <98bf4c5b-9812-d2d4-8da0-c887b44277b9@siemens.com>
 <eb224001-86c9-593d-b4ab-d0ae168fcbd8@ti.com>
 <1d841e18-8a4e-0c00-4a57-1a74bb461fe6@siemens.com>
 <c32c3837-b0d6-c48e-221a-4202923d945f@ti.com>
 <08222d8d-39d1-1514-2259-891f95f20697@siemens.com>
 <46dce81a-e841-4adf-7c81-5e6abbe8148c@ti.com>
 <e75c66bb-048e-15d3-1a74-075829c9b2d4@siemens.com>
 <5a7a1e18-93dd-6bb1-8fba-ccfd91f2c8d5@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bfe4f2c4-269d-0929-9ebf-673548d2a5e8@siemens.com>
Date: Wed, 27 May 2020 17:15:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5a7a1e18-93dd-6bb1-8fba-ccfd91f2c8d5@ti.com>
Content-Type: text/plain; charset="UTF-8"
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

On 27.05.20 16:55, Nikhil Devshatwar wrote:
>=20
>=20
> On 27/05/20 8:18 pm, Jan Kiszka wrote:
>> On 27.05.20 16:16, Nikhil Devshatwar wrote:
>>>
>>>
>>> On 27/05/20 7:38 pm, Jan Kiszka wrote:
>>>> On 27.05.20 15:53, Nikhil Devshatwar wrote:
>>>>>
>>>>>
>>>>> On 27/05/20 7:18 pm, Jan Kiszka wrote:
>>>>>> On 27.05.20 15:28, Nikhil Devshatwar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 27/05/20 6:41 pm, Jan Kiszka wrote:
>>>>>>>> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>>>>>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>>>>
>>>>>>>>> Number of peers available on a platform is different.
>>>>>>>>> Do not hard code the target peer_id used for interrupt.
>>>>>>>>> Parse this from the command line argument.
>>>>>>>>>
>>>>>>>>> This de-couples the dependency between number of peers.
>>>>>>>>> ivshmem-demo can be run to communicate with desired target
>>>>>>>>
>>>>>>>> No command line, please. We can do (<ID> + 1) % <Maximum Peers> as
>>>>>>>> target. All that is accessible via the register interface. But
>>>>>>>> then all
>>>>>>>
>>>>>>>
>>>>>>> I believe, as of now, only root cell can communicate with peer1,
>>>>>>> peer2,
>>>>>>> etc. Non root cells cannot communicate with each other.
>>>>>>> Please correct me if I am wrong.
>>>>>>>
>>>>>>
>>>>>> Not all targets have been enabled for the "triangle" setup, but if
>>>>>> you
>>>>>> look at qemu-arm64, e.g., you can see that pattern.
>>>>>>
>>>>>>> (id + 1)% max_num_peers=C2=A0=C2=A0=C2=A0=C2=A0 logic won't work fo=
r a 3peer scenario
>>>>>>> where
>>>>>>> root cell app(id=3D0) wants to communicate with baremetal(id=3D2)
>>>>>>> e.g. qemu-arm64 has these ids.
>>>>>>>
>>>>>>
>>>>>> Then we need to adjust that. It doesn't matter who sends whom, just
>>>>>> everyone should send something and everyone should receive
>>>>>> something in
>>>>>> the end.
>>>>>>
>>>>>
>>>>> In QEMU, root (id =3D 0) linux-demo(id =3D 1) and baremetal(id =3D 2)
>>>>>
>>>>> 0 should be able to to 1 and 2
>>>>> Here you should choose if you want to communicate with baremetal or
>>>>> linux-demo. There is no way this can be automatically figured out.
>>>>> That's why I added an argument.
>>>>
>>>> Every peer can talk to every other peer in those setups.
>>>
>>> Oh, that's new to know. Sorry about confusion.
>>>
>>>> It's just that
>>>> the demos are built in a way that each peer has a single notification
>>>> target, by convention, not by cell configuration.
>>>
>>> But if you can pass the id and communicate with any peer, that seems
>>> better than the limitation that root cell can communicate with only a
>>> certain peer that is described by how the ids are alloted in configs.
>>>
>>
>> Not sure if I get the point already:
>=20
> In the current qemu-arm64 configuration, It is not possible for root
> cell to verify communication with linux-demo and baremetal-demo both.
> That's because "the demos are built in a way that each peer has a single
> notification"
>=20
> This is the limitation I am trying to get rid of, by passing an
> argument. e.g.
>=20
> ivshmem-demo /dev/uio0 1 #This will communicate with linux-demo
> ivshmem-demo /dev/uio0 2 #This will communicate with baremetal-demo
>=20

Still not sure if we are on the page, but maybe we are thinking about
different scenarios.

Is your desire to allow a full demo (interrupts seen on both ends) with
only two of 3 peers running? Or is it about permitting > 3 peers? The
demo setup is currently like that:

 - root cell running with ivshmemo-demo app
 - non-root cell running with baremetal ivshmemo-demo
 - non-root linux cell running with ivshmemo-demo app

If one is missing, one signalling stimulus is missing and one signalling
reporter. But if you run them all, you can see that everything is fine.

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
jailhouse-dev/bfe4f2c4-269d-0929-9ebf-673548d2a5e8%40siemens.com.
