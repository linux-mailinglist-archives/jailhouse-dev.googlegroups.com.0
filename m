Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBSXBXH3AKGQERDMG5ZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53f.google.com (mail-pg1-x53f.google.com [IPv6:2607:f8b0:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B7D1E4488
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 15:53:16 +0200 (CEST)
Received: by mail-pg1-x53f.google.com with SMTP id c14sf1083153pgb.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 06:53:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590587594; cv=pass;
        d=google.com; s=arc-20160816;
        b=i/2290hxlImYbFZfzkJyNmhSi56K5eeQGKA4Wy+5osZfZpJDlw7Q7BEqi34RzEmnZs
         U0quzLgsv8FOBGrN2n80nFo68ZzhO5Ek0HPr65MW/PWm/v/TDwMNovF8dnyHaBjr90WQ
         xO5BdhWBPIxjlvTJs1NpJ3N+uRcLh8USVfcXtCxXnhRzUugRMSKDePU8VauYupkOcKy6
         LpAH7oWL1RaAOAaKGc8wb+avaeoCfJ3rdTkBNoZ9M2KikIyl4Rr4osT2McwdcevKemgd
         TXVB3PEupraXgQIwnYIo1e9zcobEEpvEYVBNDyGafr6TXtb+Hl3YKvHy/+Z9L2uUXK3O
         ZGUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=GHnPGGj/UxjdaXFaD6Neh4ZbpBBGt9TWSJIkLt6Kszs=;
        b=UtypyO5mtA+sBnCXzSXoYf8YKm8i24AXkMMjCbmJMe0SnXHfIrDJYZjqPfLGYEPVLn
         x+4XxGSMAXyrRil2q0NHJQNR+a/Hkkzwvn5mY/yblcLV2lnY6QEWLx34cMMcTcWsxqtL
         jsi/DHdgM4jrhyWaGeek9VUKIWpXLY6OFBstjfEEyHLq3MravWWfZGR1IMPeQ9j7flBA
         v4rru6xwJZaiMMHD6G2gs9u85gAmlYt15YemHON/2QALGnb3CPUsik8/S/YXSMprySDa
         rNauju9lDxTJK3qx2yuYW5Zsayrgqq6W8/Acc0foDjQwW/fa8AP7jQTIePsyV3SP5nbU
         R6Iw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=q+KQHNXW;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GHnPGGj/UxjdaXFaD6Neh4ZbpBBGt9TWSJIkLt6Kszs=;
        b=ZGLFMy8TtbmCNJ28edLOWzg4IQXq9j9rgILKw/llhgZrYnQyKnxeA52TDu2TKWqMrW
         sCXglqp69x0ARZxBPOyPwtcC6wJn6cP/L786mZoiJfug1OxXwWCbwAaUM4SoVImFiCJt
         osonhJ2ej6gDMwNOMfo2ZDFKNjlM/bMCc7fjtybsxXiGLirtZ8H8DmhR4GjENmuVTM/D
         navLDGBqDJpPzHxSByWqmTRTLRcIy6Jh87uV9FXqA+20YOjmuimX3mzQi3v1hsTh8L2R
         6+3QflIvox1etW0dfgM/sYYoTl6CDIq5OHWDK+Qzmob8RB3BVRqVNAYAZMRctvcZINdZ
         p76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GHnPGGj/UxjdaXFaD6Neh4ZbpBBGt9TWSJIkLt6Kszs=;
        b=F49AfGhTpQ1Y2DrFaz6rwUaAkGF1HZaq3K0hN4CHwrJF7Ot9+F/OKJlq29fpYx3k0i
         QQ5+bjXULPbXnhhM1spVssMrORo1HdRZuJ8eMkB1fNvNzUH72mYWtF3mB9DEvTmGv+VQ
         A7m4SgDMoMMRNGMVfx3UqGa5qUSMLTFuetS0Oedm0gI/uBHPUIgj/S3BaIXoxpxclt9j
         GvZwl+S7fVSfVm8nt2URYwkD0d41A9c71EeO0EO7BvCo8uOrmIxavyRbbCB2pul67i/u
         g1KFHmAN/4T/71Vr23/Cfpb/EiwdFXVo/bil5EywPn/7ZXvRz5G8p9t6MWde5U+XwoSI
         BadQ==
X-Gm-Message-State: AOAM531LHlKaD/9gTNrSHgT8qMfOdZizzwVefQVDDlio3Ei1L7Nj1GGq
	sf5uytW1oiRGKccyQ3mLHoY=
X-Google-Smtp-Source: ABdhPJxr0qPcpFWKRUgdTaImiLWqWmo6mdwVoYNJzRCp9SVggKtcAcLT9OSC/hyPEAQRGbeYbBBpfw==
X-Received: by 2002:a17:902:ec06:: with SMTP id l6mr6100404pld.193.1590587594800;
        Wed, 27 May 2020 06:53:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:d684:: with SMTP id v4ls6142440ply.11.gmail; Wed, 27
 May 2020 06:53:14 -0700 (PDT)
X-Received: by 2002:a17:902:b685:: with SMTP id c5mr6346593pls.154.1590587594182;
        Wed, 27 May 2020 06:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590587594; cv=none;
        d=google.com; s=arc-20160816;
        b=RsPeydnhmKkNxHAZsM0XFnJrjINoJ4mngLavFuakX9f0MG1EKChSbXtfh9tPSlFmOP
         U+9vjxWz1llpHbBLHPz8AliRzufy+9XuhxxzqPnleMYRbo2bOkOGUBVIueamwD0KyhnH
         2VYyhsRy0Ta3eDXJV3cA9TTw68l6wv7kdMQOb2kmU3VU6OXwsd8s6ScCU3QQ9iJYmqvN
         SczDVvYlKj7THcls08b2edMctBr3f9xn2jC1JUms6OkRj5WHUzWQ+20GvizQYzaZdkcY
         8blFefmWw8P7QSJd8awirEjwcoLrCdJqA+A0rWxP/NbgkFUtCRIrv7zJtr5pTUPceW/o
         OQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=NVJ1umvhtPrrLTgos6B0xrqixNr7DqkPpQe4em0Mxok=;
        b=H1Ll9xr/RYOeok3mR+T9aXo5CZrbzBlXNFAMMXu2bHSvvBlVR2jEJDMv7oIah98LMl
         PKfqUaYookuLZpa2zboPKqYXCm6xvyrEnEOsSfJUQDO935kXzKocUXLvXt0rKW0XPYJo
         doqPMV8Hhkn4XftvDcP3L0ss+cYX57aOv8q6Xz8K9hHpKaxWCJrAZBkjlLi1XW5V7v7v
         jnPGFhRJ6h0+XQA0hoJzg0P3wO9ZbxND7QynClcTob/9/KOY0fTaPLCRE85lGA1hoWl4
         TDb+ICLei/sA4/nhiAVwdH1+0o8Tz88a1xixjGJLoG0MOvPP1imdhe82QIcELZ2GUGCM
         aylg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=q+KQHNXW;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id j204si304532pfd.1.2020.05.27.06.53.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 06:53:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RDrDw5029739;
	Wed, 27 May 2020 08:53:13 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RDrDiT051947
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 08:53:13 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 08:53:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 08:53:13 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RDrBtv114775;
	Wed, 27 May 2020 08:53:12 -0500
Subject: Re: [PATCH v1 4/4] tools: ivshmem-demo: Pass peer_id command line
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-5-nikhil.nd@ti.com>
 <98bf4c5b-9812-d2d4-8da0-c887b44277b9@siemens.com>
 <eb224001-86c9-593d-b4ab-d0ae168fcbd8@ti.com>
 <1d841e18-8a4e-0c00-4a57-1a74bb461fe6@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <c32c3837-b0d6-c48e-221a-4202923d945f@ti.com>
Date: Wed, 27 May 2020 19:23:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1d841e18-8a4e-0c00-4a57-1a74bb461fe6@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=q+KQHNXW;       spf=pass
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



On 27/05/20 7:18 pm, Jan Kiszka wrote:
> On 27.05.20 15:28, Nikhil Devshatwar wrote:
>>
>>
>> On 27/05/20 6:41 pm, Jan Kiszka wrote:
>>> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>
>>>> Number of peers available on a platform is different.
>>>> Do not hard code the target peer_id used for interrupt.
>>>> Parse this from the command line argument.
>>>>
>>>> This de-couples the dependency between number of peers.
>>>> ivshmem-demo can be run to communicate with desired target
>>>
>>> No command line, please. We can do (<ID> + 1) % <Maximum Peers> as
>>> target. All that is accessible via the register interface. But then all
>>
>>
>> I believe, as of now, only root cell can communicate with peer1, peer2,
>> etc. Non root cells cannot communicate with each other.
>> Please correct me if I am wrong.
>>
>=20
> Not all targets have been enabled for the "triangle" setup, but if you
> look at qemu-arm64, e.g., you can see that pattern.
>=20
>> (id + 1)% max_num_peers=C2=A0=C2=A0=C2=A0=C2=A0 logic won't work for a 3=
peer scenario where
>> root cell app(id=3D0) wants to communicate with baremetal(id=3D2)
>> e.g. qemu-arm64 has these ids.
>>
>=20
> Then we need to adjust that. It doesn't matter who sends whom, just
> everyone should send something and everyone should receive something in
> the end.
>=20

In QEMU, root (id =3D 0) linux-demo(id =3D 1) and baremetal(id =3D 2)

0 should be able to to 1 and 2
Here you should choose if you want to communicate with baremetal or=20
linux-demo. There is no way this can be automatically figured out.
That's why I added an argument.

Regards,
Nikhil D

>>
>>
>>> demos should be updated, ie. also the bare-metal version.
>>
>> Sure, can I hard code the baremetal to always communicate with root cell
>> (ivshmem id =3D 0)
>>
>=20
> No, all demos should then use the same pattern from above, consistently.
> Luckily, only two implementations exits (bare metal + linux app), and
> that for all archs.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c32c3837-b0d6-c48e-221a-4202923d945f%40ti.com.
