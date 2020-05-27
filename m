Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBXPMXH3AKGQEN7EEOII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3e.google.com (mail-oo1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D5F1E458F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 16:17:03 +0200 (CEST)
Received: by mail-oo1-xc3e.google.com with SMTP id p6sf5700259ooa.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 07:17:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590589022; cv=pass;
        d=google.com; s=arc-20160816;
        b=i8NmRviixKXvBetAk5urwTQKLYb5knra1El0XKveR5RGXsVL+Akre9soDbMpC5tQQY
         F7hHiA9BPERmkIwXYjeaaZCAEUvCTfU1eMbzEZ5NGINFp0djS5+7/TO0p9TAMkNQf27v
         053/33jrmcIkpiZ7BnMlskAlaoor9SsYFIZoPFCZZlKOqBdkrKJSjkhAUp44kkUx5+QP
         Mc1fIfYB2X1iENEnBFxkGkOGu+QsK4Z6yXk/eqcNBMqS6gID0RUft9QqPhmX4Yjm0wmt
         GEeRctWcfP74KeayNv4rvJ3oqGp3TS3gx2XR66kUw056Yfmh9y1UxJFizD6PaU5s6LHJ
         FDGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=LgAjwoA+uqkbe5TZuW/FlH+h0zWbsjT/+QnxymCgmiY=;
        b=iYR2StfefRcROqwmeYrTw6BnDAn4ne9tUVusQbzU8rVs7ZQfWGOkL6M0saxoedTsuQ
         /yvnKF2qckT2ByCrjT9olUDBl4j2iVZnj3kgxl75CD1NUAuyfytnAvCslUD4Cnq0FTkY
         vHyrh+X2RTNIr+mtKKANl92fzSY1YZuJOSOgS8+1uoJ+Zs4co1uQCx2hem0WH1+HydXp
         TjSBZWDYrhRSe08sndkiXSqxWLH+uv7Lsm7hZPY5BHQGvp2G1SlxCG9AWxRwb7D8CEeO
         sVns24XoRZS7E+oy8N92D3iLNfuAkpQM6Q1F/w7ovwD+QgxqPS7QKk9xPt+I8l+dDmzO
         KgnA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zLkX2rdT;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LgAjwoA+uqkbe5TZuW/FlH+h0zWbsjT/+QnxymCgmiY=;
        b=mBK8xZUfjZcPxiX8GROFyoC15EY4dEbQWeCSrmit4nk+dJEf4bpEh0JPNSsBgNKrWY
         owUWjerHOIj8yMFCeLJrDahP8gLjz7w9XTUPIo3AWAbJvb4UWHmK3605Edqp3dnv1ulr
         Janf81xESiSftTmklQqSa/G9vyB8wAVoCiCyBJVwn6rDz7wXiz8QLb4vvXXxxg262FGI
         JIlDVfplyr/DwRpjIlArkI6VQT3QWHEKrhH1vELj69+kTIjEMAuKNVSBlHL6mTO1Y7+h
         b7DujYHRHOeHGRWeMKHhLAXWmwVLgenNJb3u4x/FyUPqVa8YDveCuI5mFRQVdU6khWHM
         y6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LgAjwoA+uqkbe5TZuW/FlH+h0zWbsjT/+QnxymCgmiY=;
        b=nCErjKCF05m+2GPqJUKS4XflMdayJqUckFWcajkVyHdihdKGBHTJMBeEiyG9NOK+Io
         g1blZcZgX/7xdx4+O2YsRJkx/7GogSJ1pfKHs2VbG5vGeOrYqmWTpO11B8vjIysnT0rS
         zrIkJc2GMuQlon1pOHt/N2r/e4Qphnm+8msrQYjCDu918jgo7rAokOXx28Rvm/EQgRBM
         UwAaNWO+kdQgnFeidtW0uIfM8whsBQ5LJw58m0h3z7mtCt3Tnj2rdj09V3ULGZGNc3hs
         3hiyEkI3hXHerrC19YJjqpbvXaaVKDROIa1dA0Nbl9b+jjsul1X+GouDfB3vtx1tUOVr
         YG7g==
X-Gm-Message-State: AOAM532h1HgejpJDhBqfNj2wpO6a2R+sr0B/c/by2Xz1Kpx8JbSwLm64
	8lYvFsqLj6H0qX1oaVu9oAk=
X-Google-Smtp-Source: ABdhPJxnWNbCGQDABjdJtx2I2yUlTtb9wElb6kGzPj5bwkvyK9k7zMa/miNqo4R8L8QTfuIFF0iTNg==
X-Received: by 2002:aca:210f:: with SMTP id 15mr2737857oiz.118.1590589021902;
        Wed, 27 May 2020 07:17:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:61a:: with SMTP id w26ls3130945oti.8.gmail; Wed, 27
 May 2020 07:17:01 -0700 (PDT)
X-Received: by 2002:a9d:4602:: with SMTP id y2mr4902407ote.199.1590589021368;
        Wed, 27 May 2020 07:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590589021; cv=none;
        d=google.com; s=arc-20160816;
        b=pl2i9ah7H1mMb/YyzG7r8LCtWtPg+uNUdr1uEDXS5hsbwGk9ywUUXs0QKKtM+rHcIs
         cNpchKZvNI1/50PTCfosSxWGv2Lc7w92VUaPfptnhb9NxdPRbkYO5Kn5cbVOks7ZDzwt
         1bAyeGOiIv//ImYe1K7wKAErCxyxoKFWRalkZcxEZLR/yhEs9wqTLPIT10Ql06GPsdHE
         L4sTyGg3Gq7PynZwOz3gnQIe1JiHe1G7pAI3wcSQ3vgDFb95qr0qn9hzbzHGjL8/QWtQ
         e+iXdUWy/ceBdWNcVG3aUZvfnf+qNSblXwtWKKQLugbPqewTM+RhzKm27W5QBqoCU8Ku
         rugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=s9LU0UWya0z3Ao9m9NOF8uMrPZGe8VEeoSOJGnSh8pI=;
        b=IoUHJSyyyNwkADiV79rNWykbQB69FVe+CwoaSkxugHpWVnMklLuYZw5uXqlAW2sg5B
         /kke2FBT+mgVhzNMD27ANQDFs0kxmUHNBelcJ9vU4+2pSAjcA7j4NDZQL+5OgkrDNgPv
         JZzOTBWoFWuWJv9T8ZwMW6m1qH11zdUmCzx6gi200mJ20vXwiT0OESAVv0twe6h5mEmn
         A9H2Tn8oilfeiAJwH0prJgCj490l7U9VRmlzhTdr/4R4rODqKl+BD6V1CYAjevs6uQt1
         YezJlxMCMza0yYUaZf2NMCLo36DqPMZk7NqJGz1Jbn7awwPyCYvbafNKZoD8wKpDiQBJ
         I9/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zLkX2rdT;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id l21si278765otp.0.2020.05.27.07.17.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 07:17:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04REH1Qw039102;
	Wed, 27 May 2020 09:17:01 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04REH10T027862
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 09:17:01 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 09:17:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 09:17:00 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04REGwZ9067859;
	Wed, 27 May 2020 09:16:59 -0500
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
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <46dce81a-e841-4adf-7c81-5e6abbe8148c@ti.com>
Date: Wed, 27 May 2020 19:46:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <08222d8d-39d1-1514-2259-891f95f20697@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=zLkX2rdT;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
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



On 27/05/20 7:38 pm, Jan Kiszka wrote:
> On 27.05.20 15:53, Nikhil Devshatwar wrote:
>>
>>
>> On 27/05/20 7:18 pm, Jan Kiszka wrote:
>>> On 27.05.20 15:28, Nikhil Devshatwar wrote:
>>>>
>>>>
>>>> On 27/05/20 6:41 pm, Jan Kiszka wrote:
>>>>> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>
>>>>>> Number of peers available on a platform is different.
>>>>>> Do not hard code the target peer_id used for interrupt.
>>>>>> Parse this from the command line argument.
>>>>>>
>>>>>> This de-couples the dependency between number of peers.
>>>>>> ivshmem-demo can be run to communicate with desired target
>>>>>
>>>>> No command line, please. We can do (<ID> + 1) % <Maximum Peers> as
>>>>> target. All that is accessible via the register interface. But then a=
ll
>>>>
>>>>
>>>> I believe, as of now, only root cell can communicate with peer1, peer2=
,
>>>> etc. Non root cells cannot communicate with each other.
>>>> Please correct me if I am wrong.
>>>>
>>>
>>> Not all targets have been enabled for the "triangle" setup, but if you
>>> look at qemu-arm64, e.g., you can see that pattern.
>>>
>>>> (id + 1)% max_num_peers=C2=A0=C2=A0=C2=A0=C2=A0 logic won't work for a=
 3peer scenario where
>>>> root cell app(id=3D0) wants to communicate with baremetal(id=3D2)
>>>> e.g. qemu-arm64 has these ids.
>>>>
>>>
>>> Then we need to adjust that. It doesn't matter who sends whom, just
>>> everyone should send something and everyone should receive something in
>>> the end.
>>>
>>
>> In QEMU, root (id =3D 0) linux-demo(id =3D 1) and baremetal(id =3D 2)
>>
>> 0 should be able to to 1 and 2
>> Here you should choose if you want to communicate with baremetal or
>> linux-demo. There is no way this can be automatically figured out.
>> That's why I added an argument.
>=20
> Every peer can talk to every other peer in those setups.

Oh, that's new to know. Sorry about confusion.

> It's just that
> the demos are built in a way that each peer has a single notification
> target, by convention, not by cell configuration.

But if you can pass the id and communicate with any peer, that seems=20
better than the limitation that root cell can communicate with only a=20
certain peer that is described by how the ids are alloted in configs.

Regards,
Nikhil D

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/46dce81a-e841-4adf-7c81-5e6abbe8148c%40ti.com.
