Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGUDQX4QKGQEE2ZP5LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 92807231C1B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 11:30:02 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id f7sf6436101wrs.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 02:30:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596015002; cv=pass;
        d=google.com; s=arc-20160816;
        b=Lb1qaFZboAPwuaQb+ZnVODifupliwE9uMmcMjO0PpWIZ5ezSVyCbJAkaWMiqUPNRKW
         z2dkJw3ex0ANk0WqutKaKY+iWBUAKurkZeOiE6W91rRxIVFJqRU7/6v5GaTklzxxaELe
         D5ag5A9Sv+T7ljjv6eHBkCfkR9EQw6UPnj6QJuRwnLbnXSAiagZNHVxCSk28zKfych3U
         x8Cb8qdQRYMEMMMu1Du6SYM37vrYHVo4/JdVsY68708ju+VR3MB50zYxatHcReRzqg3w
         mN0Y8dA4emXAJXoRHg5nDxsSYeaUjSksrOYheJ4XkpQrBNPrfH0lcOXOcaJZbMC8GLTs
         RMYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=/nK37qoZuXmG/1WERQ+kk6Tq+lD72epX7AD0LdyR7qs=;
        b=Wi3+kCkPgj6Y7IDxHbyG6qqod/ijqMDZS3WSk/T1CBCScTj1ik9TYTDA3J/d19snIi
         QRJuQuFip/1d1A7V5vFzPtpfoHoPXk7uRQgeJ2xmvEQKpk11K3b6dh0BnCxkH/2Y1Y4r
         hKJ9Ds0e8hstTyOG+3V3t+AVqqXtqDIdslmZiLbJHWT+XDZ9/izU2/+DG+ywjc51PF2w
         Opj2FsZxxw3uujZ9T31213vQLXQrPsFqu3uA1J/QvchDvSBGY0P31A7FSrrCwjpCDT1r
         LqSaMmyezHrHvP9bbhyuzoUMR/FvEC9u9bGBvUl3lv9liPqF03wog0l1rHiwYx5o/1ue
         Wgcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/nK37qoZuXmG/1WERQ+kk6Tq+lD72epX7AD0LdyR7qs=;
        b=NK3rtPbdvsihKlum1dCqMhDlz+OagDnrOa87zLu4V2HGjffIiuCp3NFO4SMiTCs+AU
         Wc/iyTxlrjplG0CJOH1jgZ6O9DRJDkdYCMpV2zfYZ0yHA3MRl7euVRQG2AXrkpQKQqeN
         CtSAGVWVIlZbTxp1/Y5T9dnBzzsrg5ycMH4GpTMeWVu14XHZrgBsbXcTNA+/7QOmaWMJ
         P9v/ay9IM+SEW6agJOdmcebwITkxVlpy7gw9+4yQ9Brkrsobmzp2Z1VRO2+LeQ0GW8Zw
         WnADislviWmAzWjHBsdRJc/Hxc7fSxCe/OfGL5FmNbym4YVpJt9VukNqpyHbzdGTQiTU
         huUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/nK37qoZuXmG/1WERQ+kk6Tq+lD72epX7AD0LdyR7qs=;
        b=uazCEuf8WjmTJ+Y9wZGFJRccJu/MaC58o0yfDERoXTWcc88HhTeM6nw0wZ1/bT56U2
         S0gLbTkE41lRZ1wbGR42RrwxAshxbqMD4/clZE+hcJEQyDWoNvSX02M453V6EMZjH/bF
         G/z6lxx6z4GrYL0MI4k93nUbm7FhXaGZEw0fyjnqhm4w7S7Pngb3op14KkLfhWDYs5XF
         1fViTjLSmwp/FbFou0jczrNjtlM8uOlpkFcdJGjyWmgP+8FHU2r2UsbJFd8OnygZpVhu
         Cg2J8upDEUkKiBxTob4igw3WWlCAZUXs91T5ToN2BI7EUCVlmNSgJtEG3Pn/ktHVeLnn
         wN0w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5339OVqcioh8cXeIWF0+yB7NBlaDC/yoCgZw9x9d2QCCPZu6X9p6
	7LwBPGGL9olDNBbn5AZrbrY=
X-Google-Smtp-Source: ABdhPJziJrJglN0bPnICAJWITJPj61u8pTw/O2oHL3OsxgCSK/5hxQEOi1HzoPix52+7et3nQ3IZQA==
X-Received: by 2002:a1c:ab06:: with SMTP id u6mr8298113wme.55.1596015002281;
        Wed, 29 Jul 2020 02:30:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6407:: with SMTP id z7ls317364wru.0.gmail; Wed, 29 Jul
 2020 02:30:01 -0700 (PDT)
X-Received: by 2002:adf:80c7:: with SMTP id 65mr29596788wrl.246.1596015001414;
        Wed, 29 Jul 2020 02:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596015001; cv=none;
        d=google.com; s=arc-20160816;
        b=j5DZ4s77QHcVht4+X1UvyZNrhYBkDmnLrsEtXr8BQtBlwVndPXkG3sd7L9mIX3KFit
         78kR6DUzQh5ABbBFLsSguQOb9Rc3nMATrrsYiqoCWhpoyQg75btAf+NIg+tna2ucc+AU
         O7sC9sFuW8ph8xylS7dcxL7eucmeTRK2zTSg4TmoMr2kdKI0jJU8R7JCrdLDT9nVu+sZ
         JNQLDBJ1/dTjRD45jgkTdHoz7v6PDIUTlh/4/YcdvumurBiHh6m+o5OlMNtM69L3GOTu
         VTFchUlZUBdXcSYoI1NfyLZfKhD9/E/eM6mtAO6jlbyE0I2RFIWY1dkjKW4cWQnUWOfa
         c7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=b0Ad8LakXxAz9DcXsDEdaJ1e5JsVxAzBdj1jeOaFIdQ=;
        b=CgYspQ5uKUyKqkZf+kaRhRAU3wMD9iQEt4KQ7DjG1XaAEO1hXhOmeF7lErqrboR4iH
         yf1ye1WnRkoMDTTZd1qxFR9Duoh5mbDNNwI6Le/gYjBqs/JZyxOcqFjzKBdwS+o7DgOQ
         g7ZpwJWX32zEknWIo1eK0ujttgzcIt/p5AtoIC1rn+vO6kbrXJWlL1Bh4hXjONh++YPH
         3A8SW9NIHZAfK4R3o+ycYHbw1p3q5926z11sH8s5jc6dAn+J9jpbb8aVxr5HDsKoZoYs
         BV0N6jqzr8nlqH4d26LleJozV56Aqhkwyg1BNZp6ly3Sv6IcSpDEhA8kUMPqTQHJ/EXJ
         mDhA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id l18si100938wra.5.2020.07.29.02.30.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2020 02:30:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 06T9Ts3U001960
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jul 2020 11:29:54 +0200
Received: from [167.87.13.2] ([167.87.13.2])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06T9TrXE000711;
	Wed, 29 Jul 2020 11:29:53 +0200
Subject: Re: jailhouse jitter?
To: Peng Fan <peng.fan@nxp.com>, Angelo Ruocco <angelo.ruocco.90@gmail.com>
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jose Martins <jose.martins@bao-project.org>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <38ffb4dc-20d6-3404-cc61-ea08ea8066f1@siemens.com>
 <e0b6c5f5-89a0-6e29-6700-e5d5064d4672@ti.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
 <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
 <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
 <CADiTV-1oJBD+SkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w@mail.gmail.com>
 <b96f90ad-23bc-db73-9603-f9eb640804d0@siemens.com>
 <DB6PR0402MB2760B4463A03D7FC4EE3E4E988780@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760EA5C808D0A49208E7A9788720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <640c6eb8-07ca-c354-f888-abee87ff49b6@siemens.com>
 <DB6PR0402MB27609A148CE4F1B5DC105D3088720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <8c4f35ef-1b12-e08a-6d20-85d7c6c0fcad@siemens.com>
 <DB6PR0402MB276063FAB38B540E81ED7D3288700@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1dffaed3-aec7-2bd5-7046-88059813c63f@siemens.com>
Date: Wed, 29 Jul 2020 11:29:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB276063FAB38B540E81ED7D3288700@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 29.07.20 05:28, Peng Fan wrote:
>> Subject: Re: jailhouse jitter?
>>
>> On 27.07.20 08:56, Peng Fan wrote:
>>>> Subject: Re: jailhouse jitter?
>>>>
>>>> On 27.07.20 08:25, Peng Fan wrote:
>>>>> Hi Jan
>>>>
>>>> ...
>>>>
>>>>>
>>>>> I tested the SDEI on i.MX8MM, it shows the jitter became smaller.
>>>>>
>>>>> Without SDEI, the gic-demo jitter is 999ns+ With SDEI, the gic-demo
>>>>> jitter is 124ns~246ns.
>>>>>
>>>>> Indeed no more vmexits.
>>>>>
>>>>> But the max jitter, some times SDEI bigger only when program start
>>>>> up,
>>>> mostly because of CACHE WARM UP I think.
>>>>
>>>> That is one source. If you add a warm-up period, they can be
>>>> mitigated, though.
>>>>
>>>> The other source might be last-level cache sharing. If there are
>>>> cache-miss counters, maybe you can check if those increase along the
>> peaks.
>>>
>>> Yes. When I add stress-ng in root cell, the jitter became larger sometimes.
>>>
>>
>> I've seen the same on the ultra96. My cache theory should be validated,
>> though, because I would have assumed that all of the gic demo fits into a
>> core-local cache.
> 
> After thinking more about root cell color, when booting jailhouse before Linux.
> 
> We are not using 1:1 mapping anymore or we could use 1:1 mapping with many
> pieces of small ram area.

I suspect Linux may not like a device tree with hundreds or thousands of 
memory region entries.

> 
> So I think the first 1 is better, but when use kmalloc for dma usage sometimes,
> it will bring issues, because not 1:1 mapping, unless we let all drivers use
> dedicated dma area reserved and not colored.

We will need an SMMU for colored Linux instances. That will make things 
appear 1:1 mapped again for Linux.

> 
>>
>>>
>>>>
>>>>>
>>>>> Will you move SDEI support to jailhouse mainline?
>>>>
>>>> Once the to-dos are addressed. Any contributions?
>>>
>>> I'll read more into your patches and check the to-dos you listed in
>>> the jailhouse commit log to see what I could help there.
>>>
>>
>> Item one (SDEI probing) is almost resolved.
>>
>>>>
>>>> BTW, did you have to patch ATF for your experiment? Will you upstream
>>>> that patch?
>>>
>>> Yes. I'll upstream that. Quite simple, I only enabled one SDEI private event.
>>>
>>
>> Perfect.
> 
> Sent out.
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/5116
> 

Great! Let's see how the review works out, then I could try getting my 
patches ready for upstream as well.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1dffaed3-aec7-2bd5-7046-88059813c63f%40siemens.com.
