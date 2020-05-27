Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBGULXP3AKGQEYXL56EI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id 182CE1E4EA8
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 21:55:08 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id u6sf581477ybo.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 12:55:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590609307; cv=pass;
        d=google.com; s=arc-20160816;
        b=e4Na4wKcxdBb/odGFgW/w6U6Q2g6QJiOXI5wbq5GALwZqUknzKShbAkJYye/NuNm+s
         hz4qjE8xOZOh+LwyH92IPJeyWONFtqDpVUw2uoqvMIbIzT7ifH+H6yj+ePWlmkgECFdQ
         eosrP1SuqMydUHa2tPQZDcCPezIJ6XXW7RfpM5aJObd1Ax2JiNxeHincKBqwhCMJkzKS
         g82+KaWqWXGfxSB5NDHk9nhjAjKvBI8yC4xNNB9DatTBBxrOPpvvgQn27QNyau/bsJn/
         nobi8pD/TNQro1IiEAfjojeHn2+hbAD9TYME1s7zvjhlx2O7KgVrQup+2eiiw8Zznif4
         nREA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=gtEM3deU037zZzXs3AYaapDUsA9eF6r1FHFeHKB7IA8=;
        b=SEgGcbw4LPvt5QoR5D8cD0lWDoPg46gYUIjTJ7vyPS5q3TiAiHJRZEmFoZx3BtDVvy
         XOSqGD6veXuN7LLRBDoAIOyOvSzJTOdL3taWVszxtv2VNwOof1WpokZ+uqoHCLcyl0S/
         uFAJatWB0V4vvarK0I/U2ABI95crxwMnPwtYhzwOKmUqI3a6ZI4xoOtG171S3dAitXDu
         +m3BIG/PX6j5prjVundx5fSQ0zgYiJugFZ2ezijVJWG8Kthd6Lsp1wbw6W8Q0zXG5RN6
         37wUjO/DePl/X4odi0WOgAse/a2jyad6c2IfP44EI+CWEupvsHSkT84zB2tL/gmzsewR
         8Ktw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LN4Y8Rdj;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gtEM3deU037zZzXs3AYaapDUsA9eF6r1FHFeHKB7IA8=;
        b=cJv9CKH/1cDsV4FQqt3nKPu2ZpWywrN0ABo7JYubP7yI6+Ll3xyTNTLpu/K0qcZV4Q
         IKfYjmWdRDORp7AKQ7YSTGoEqRlF98Bo4gG8ZnmAS0z+8SqldI7BydAw293pSayLFQ1L
         GjNzVyYdOhSNjq8C7yxm8be+1nMKkGGWagvrIotgOScFU0gD+DHcHHz6owlBzpjQscBI
         P4b3/e9EShOB7asasdGBQLR7s+arrlB0W3MNB6nVCWVMKRrj25AhLwgFBQSbvuevI0mb
         DS8CleKP5aEiQfyQ+12ZOWGcAaedj8BGfGupMRBVLoaD3kW+515cdpsem1QY/d+OQnjN
         telw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gtEM3deU037zZzXs3AYaapDUsA9eF6r1FHFeHKB7IA8=;
        b=VgyWxb0rePkIUilSdxRfoWZQKxQVEfc21Z0aegvbJMh1h0i+UiPdrJi0mHTYoK/zSP
         8DYGXx4vb0t4Di1cPpiBZGbFBB7DTwg1Bf/v5krTxS+tvyGQwjt3PBuoEbvRd4oRH+2J
         MxiOBsVHxGfzsPPotr31lYU7Le3i59YgQZ5nytHoRBbFg1rPNrgC5JsGm1P7UGMAHlhS
         qsk0yh9zZNiU71fANKdM3Vsk1kN/BDeI+L2X7/tgwtFDoOCftfGWkQad90OPfWxKymAL
         aCDO5Se1XIYSvZXPna8Giz0CdCcfoOuHhfNOdfCDcZTVV4S2roZRg2xFM9W6EtOSKqgB
         cQDA==
X-Gm-Message-State: AOAM533OEo7qKcQqcyqRSotd+6tqFBJ9akPiIzzKlqN+AoFttDho1DEh
	ZQ7/gZ0LAvcnnNoLqQmNhnc=
X-Google-Smtp-Source: ABdhPJyoZZYiPiBx+OTztnuHKsAi3lK8OaGLYPRbI+TpNoZpFxImS9+iOsHaiVfhC/+nKLcCxIC3pg==
X-Received: by 2002:a25:abb1:: with SMTP id v46mr12362804ybi.418.1590609307042;
        Wed, 27 May 2020 12:55:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:8684:: with SMTP id z4ls3179264ybk.4.gmail; Wed, 27 May
 2020 12:55:06 -0700 (PDT)
X-Received: by 2002:a5b:5d0:: with SMTP id w16mr12530403ybp.110.1590609306492;
        Wed, 27 May 2020 12:55:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590609306; cv=none;
        d=google.com; s=arc-20160816;
        b=hzm6MRT1zVaOIRcmI8KUz9SHTEGu22cfWpbVvzgVH9S6Mgl9xF1BA4HvTzr6btafn0
         xChlDGZ6Rxl0ls2VK5kLokctXxMcMcKO/ZJdtcEsAkOD84AVb6b5kq2kuadjyBO2QSEm
         hn/cS+E/sVMvLhMnYH4jq+W01UV+C+3/pXIzXaeJwAvsnk4TJ73qpYKybMAzQ5m4hGfD
         ptDpPnBmiSY+fC1jJYMKBNgSTrpyDGwL5XqGL37XdEms0xRqU09kpcOYHTYwsYWbZV+Q
         Oa6y+Hc7MnupxTgei1T9jSzCbyqVCwT0jUVvzW+Q6eJaGsGvjg9KiRgH4V+bzU3+nC+I
         qmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Eo7Z83OR9tB24/yj5iYWgiSNhNW9RPOlidVN68DI3fs=;
        b=E868nRLD+eikPlZPnwCNSPpC9bqy4wNKjV5A1ZpyrUdH3eiobJq2nk9yuKDuAzBKqJ
         T6p2MLm06CHnsO/bkpXzq2IUSwcoVQvUGiWofMPTiXgI+22JiNSmTjly5/ZeMjZGjzPc
         Bzz8HHOWLNBKEd8cVZusGoJryXaDJUqZMFeZ3h/2XIU1J6AR9okjdo4+btP/z7/yOHzn
         FiCOHob2BUeyWpbL5litI3IpseZ930UhRNxXTSxxLOElU2fWl1K8gg1gJM1Gb15unmlg
         nq3x2rjmhczZt5Lq3kAc29epnFqDJhX376Xp86yrIcsdCNXsRq/WycJvgoI58PsyPhKh
         1GOg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LN4Y8Rdj;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id k11si72138ybb.4.2020.05.27.12.55.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 12:55:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RJt5X0027023;
	Wed, 27 May 2020 14:55:05 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RJt5jH119230
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 14:55:05 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 14:55:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 14:55:04 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RJt2TL102828;
	Wed, 27 May 2020 14:55:03 -0500
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
 <5a7a1e18-93dd-6bb1-8fba-ccfd91f2c8d5@ti.com>
 <bfe4f2c4-269d-0929-9ebf-673548d2a5e8@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <880c56be-a9cc-8afa-c1e7-1ecefbe99694@ti.com>
Date: Thu, 28 May 2020 01:25:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bfe4f2c4-269d-0929-9ebf-673548d2a5e8@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=LN4Y8Rdj;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
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



On 27/05/20 8:45 pm, Jan Kiszka wrote:
> On 27.05.20 16:55, Nikhil Devshatwar wrote:
>>
>>
>> On 27/05/20 8:18 pm, Jan Kiszka wrote:
>>> On 27.05.20 16:16, Nikhil Devshatwar wrote:
>>>>
>>>>
>>>> On 27/05/20 7:38 pm, Jan Kiszka wrote:
>>>>> On 27.05.20 15:53, Nikhil Devshatwar wrote:
>>>>>>
>>>>>>
>>>>>> On 27/05/20 7:18 pm, Jan Kiszka wrote:
>>>>>>> On 27.05.20 15:28, Nikhil Devshatwar wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 27/05/20 6:41 pm, Jan Kiszka wrote:
>>>>>>>>> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>>>>>>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>>>>>
>>>>>>>>>> Number of peers available on a platform is different.
>>>>>>>>>> Do not hard code the target peer_id used for interrupt.
>>>>>>>>>> Parse this from the command line argument.
>>>>>>>>>>
>>>>>>>>>> This de-couples the dependency between number of peers.
>>>>>>>>>> ivshmem-demo can be run to communicate with desired target
>>>>>>>>>
>>>>>>>>> No command line, please. We can do (<ID> + 1) % <Maximum Peers> a=
s
>>>>>>>>> target. All that is accessible via the register interface. But
>>>>>>>>> then all
>>>>>>>>
>>>>>>>>
>>>>>>>> I believe, as of now, only root cell can communicate with peer1,
>>>>>>>> peer2,
>>>>>>>> etc. Non root cells cannot communicate with each other.
>>>>>>>> Please correct me if I am wrong.
>>>>>>>>
>>>>>>>
>>>>>>> Not all targets have been enabled for the "triangle" setup, but if
>>>>>>> you
>>>>>>> look at qemu-arm64, e.g., you can see that pattern.
>>>>>>>
>>>>>>>> (id + 1)% max_num_peers=C2=A0=C2=A0=C2=A0=C2=A0 logic won't work f=
or a 3peer scenario
>>>>>>>> where
>>>>>>>> root cell app(id=3D0) wants to communicate with baremetal(id=3D2)
>>>>>>>> e.g. qemu-arm64 has these ids.
>>>>>>>>
>>>>>>>
>>>>>>> Then we need to adjust that. It doesn't matter who sends whom, just
>>>>>>> everyone should send something and everyone should receive
>>>>>>> something in
>>>>>>> the end.
>>>>>>>
>>>>>>
>>>>>> In QEMU, root (id =3D 0) linux-demo(id =3D 1) and baremetal(id =3D 2=
)
>>>>>>
>>>>>> 0 should be able to to 1 and 2
>>>>>> Here you should choose if you want to communicate with baremetal or
>>>>>> linux-demo. There is no way this can be automatically figured out.
>>>>>> That's why I added an argument.
>>>>>
>>>>> Every peer can talk to every other peer in those setups.
>>>>
>>>> Oh, that's new to know. Sorry about confusion.
>>>>
>>>>> It's just that
>>>>> the demos are built in a way that each peer has a single notification
>>>>> target, by convention, not by cell configuration.
>>>>
>>>> But if you can pass the id and communicate with any peer, that seems
>>>> better than the limitation that root cell can communicate with only a
>>>> certain peer that is described by how the ids are alloted in configs.
>>>>
>>>
>>> Not sure if I get the point already:
>>
>> In the current qemu-arm64 configuration, It is not possible for root
>> cell to verify communication with linux-demo and baremetal-demo both.
>> That's because "the demos are built in a way that each peer has a single
>> notification"
>>
>> This is the limitation I am trying to get rid of, by passing an
>> argument. e.g.
>>
>> ivshmem-demo /dev/uio0 1 #This will communicate with linux-demo
>> ivshmem-demo /dev/uio0 2 #This will communicate with baremetal-demo
>>
>=20
> Still not sure if we are on the page, but maybe we are thinking about
> different scenarios.
>=20
> Is your desire to allow a full demo (interrupts seen on both ends) with
> only two of 3 peers running?

Yes, exactly. The 2nd peer can be either linux-demo or baremetal.
Depending on which one it is, you will have to pass separate ID for=20
sending interrupt.

> Or is it about permitting > 3 peers? The
No

> demo setup is currently like that:
>=20
>   - root cell running with ivshmemo-demo app
>   - non-root cell running with baremetal ivshmemo-demo
>   - non-root linux cell running with ivshmemo-demo app
>=20
> If one is missing, one signalling stimulus is missing and one signalling
> reporter. But if you run them all, you can see that everything is fine.


Regards,
Nikhil D
>  > Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/880c56be-a9cc-8afa-c1e7-1ecefbe99694%40ti.com.
