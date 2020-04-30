Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBFWIVP2QKGQEVCFRRBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 625BF1BFEE8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Apr 2020 16:43:35 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id n127sf687396wme.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Apr 2020 07:43:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588257815; cv=pass;
        d=google.com; s=arc-20160816;
        b=GR48g1ziH2hz1WHiv5ETv5/BOA6tM4ZGKGpQ6WI1ePkiRy2/+v92L8hVscBp7Em+SB
         rHA3ae56FyesMrXmstJbTFTK9wkSdgZE8HP8wdvya7W9UQVjQ8DBeN/vUG/Lh6Y9dcCX
         kLPp+oRS2hLpS9Wz6OfDQ+0R2NpdFpxQCel2fHLzYKJ+M9AoI37ItcP5k9vTaSp3ICFe
         c9COnxDigHipGjmvUtus8BPOoYgZl6r5RgvgbAAnHufxfp1EpSEQ29vMo6fGZmTMmfOA
         lw2+YgUrA158OK3PeNXPEeB+/hbWbhYaAHL0Eekqq35brWL0J53mzIfG8lbPbZmw/MyC
         v20Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=CUKygXh5gkquPtVoscBYNiEzUUPp08mL1zqIxSKvpsg=;
        b=p+AvnvsUsdALJp4ceOhNgcKiYg3o6Eu2DF/Hj5ExeFJLpIh16kZH5drf4zF1iKZmnb
         qmf8jvL2YJvvvt3VyDlFBia1BZNgZzqcWa2fAtZjTy5gP7KMECzhdQyWnyemo6hdBTAp
         3FH9NCHhJzLcLmIoZg9dcrZLl2Ug8ouRYWW7VnlA+dxit8YZgvB9JcSfyOBIewaPuN7F
         gqgMDXvfdTULZYOe40MyG0PGCnbIMZsEYn7A5SL4mfysQzKpeAucsSEiz7P5grAOXzIN
         aU1cndIy/a6kpU7VjPvdl3wp8OUEKDCpsANIn4s55zLC2OnCgoD6VuDCQ/KhHAVb13tf
         Gm8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=MN0feZi4;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CUKygXh5gkquPtVoscBYNiEzUUPp08mL1zqIxSKvpsg=;
        b=aKFshb/cMHl88u9ky4pXStehgM6yP2lLeGan7fWahKzzclYXPHgWjSCPQjhQCl4cbq
         fXvGttqC/p+fi1K9si7wDnvdZTTD0hmfwRlIjYTk+/UT1F+q0PPEQRroUzeMTmpV1H8K
         2BCCf05kSV7hB2zf2xK5A1Bmi8Io/Lcr9lLpOjHlqOgspWfruQfjLBsvAViup29kPJPq
         NLJaL5fByJvouEWNGKTHC75KcqnMD5gmLdGbiGsO30a4KXYFR8X6hKmeRu10DTJIXjTU
         J72hZrUWdRaECCL1afCTxESlslbPyk6wVG+4bYPeflpLIcjVjb9WBhjW0ynL37rq/+bq
         C/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CUKygXh5gkquPtVoscBYNiEzUUPp08mL1zqIxSKvpsg=;
        b=tIP53vCwz80+cIYVEe1QLFLHfgLRZ2C/yZgYzxDiOklkQwIjnWuaVxVKFtpaD1aR0C
         fDFCVtHAdiKuvHrvlreWD/oeGWtclm7u77jkS+j9+L7Gdo/VtJfh6inLBf5EOFyOZ4wK
         LXv2wQkMhfJlF/ZkRnUq3xBkg+g2DHS0Gtz8rY6S0O83tHsbP+5NzvrqDkiZskhiBB57
         oJNTcaRCTCxKpA+Wun95DHdaNTiyqhPCIouuWZXvmaz8xDxtnNoGwyAOzJHpCqTIBicn
         dFgumWRE1dkUdkfBMVZjkkUxxBLMm52b4AfFrJBV1s0QRC2ajvrIv690svqcscdcmDOd
         UMtg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYal0sj4gPIEdgXD1DrYRQCrvwenNPJNFzF0HNmCHuKb6CCka9l
	UTGsxZncKGqnJ2ZlinejbfQ=
X-Google-Smtp-Source: APiQypJnzEKDINYZj5Sma/MR0h+M566r+jkfwfC+AFZyJWFqQal7hD/4j5kPkH/oV7lpCVChIdDqwg==
X-Received: by 2002:adf:8441:: with SMTP id 59mr4399252wrf.237.1588257815098;
        Thu, 30 Apr 2020 07:43:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1f0e:: with SMTP id f14ls2243165wmf.0.gmail; Thu, 30 Apr
 2020 07:43:34 -0700 (PDT)
X-Received: by 2002:a1c:3182:: with SMTP id x124mr3599479wmx.54.1588257814376;
        Thu, 30 Apr 2020 07:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588257814; cv=none;
        d=google.com; s=arc-20160816;
        b=Xn4v2QzmkX1wvNhtR5UKf8W+yhoIU1L3U8Os2UPQHyB9lSFUDo/Ny1ZEQ1oT+HMwwL
         aBHhC7YACXVumHCKD8nuN4WBoNip5zROYwVcTcMzONAyq5OuFMHhP5uJH78IdhojI5bk
         +Bsq33VmKpCKlKwR3CnMQB+1WfnpF0qauWciHI0S1PuJzaXT5BP6OAC4gSYIlAYNeFde
         VJ4Ows1HLJs9PNV6GRInViUHknE9hCF+7/6nWFqf9Tg9LdBPGyJYVSifgCJqTBJ0jOVe
         Wq3QiG8iCU/GYUSabyfL6q9B78qyTgwdj4J7KeNvr1YbF+/EULDbM2SqGqgbgwZGdpgc
         rcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=rL9cLnzgT6YEHmo4H3Bpfogmods71y1GVGykwOpzDgI=;
        b=XKw2y5IIJaIuUY2iL4o/bHfwpEsrhYJg6A0mZWvKwd/X0fYdRcHKN6GdWT6HfX1BqC
         SJMl4X18BnqqIVqY09Lam/+z2NgtjrpuWl/mBpu2N09btd2neg7KCDxGdgXy7JDtdSU+
         JCebeELDjExCS8nZkBwMm9GWrp/n0rYh+sDCl9B7JubQq3cxxK+Xoo9rsDzmp42fF0EU
         iH6TkrruVvDBgh0kEDLgsDhoOsLeTiRJXO/5J2vSYxqNU1Xvjyh6IHa/yZsq3u7rwra+
         3tx5+XnXDneeMyQb8O5AmNbMy4UYhfb1BoYp02OEYqnnJZdfvpnT5hhygK2EB+6Jiiiq
         Rk6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=MN0feZi4;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id s22si106199wme.0.2020.04.30.07.43.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2020 07:43:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [167.87.138.152] ([95.157.53.180]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mr7am-1iqxmN0kGU-00oHMb; Thu, 30
 Apr 2020 16:43:33 +0200
Subject: Re: ivhsmem_uio driver update
To: Nikhil Devshatwar <nikhil.nd@ti.com>, henning.schild@siemens.com
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <7c89b273-d0a7-706c-651f-6e658933d93c@ti.com>
 <be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com>
 <5e63fd55-8606-3046-a2cf-2ba8efc80203@ti.com>
 <92c2a027-7a70-5d0b-d12a-45c54272afd8@ti.com>
 <d0581908-3ee2-ad16-6ac1-c0741ab0c6b4@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <a1f4405e-8b5c-9de4-5d8a-edad73cd8f96@web.de>
Date: Thu, 30 Apr 2020 16:43:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d0581908-3ee2-ad16-6ac1-c0741ab0c6b4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:hqvcWVNNzkOi4om4oltUPz1F6U/69FBLhHPPf8zktIk/OtIDZEq
 Hc/X3kIOwsgE4bqPll0p1YarvghkF3pFohaWU43vQEjaPOvEWFxRTu4H/acHbS7QhSKY5JU
 3Fb/6KzSzS797M5IeoyHax0OLwScDRnyH4t+ZdJKGBuh8gALwR6Bywxkd0VogWN1aJHsCuZ
 hZscQURlouVdwUY9CLq3Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1CJw7+S0Stc=:pliSwz08q2wtDv1G/xD9Gx
 CUtQo5wUP6U6YxpGFnp3VkyCPKYYFTedjIezAouHEEgJZzQ10VeLq/IHZcnzlEhzOgFbRi6fs
 5L0Q58HYbJOUSD4G/wJac0TB/VDryJr84a794ENRnE6Ta3DN1OU8Irra/xOrxzDpsxgaYpRgV
 xrDtsQyIQJP3LGvBg8Hp3s/6BIW0y5PmyQ9sJD/t4Ue8JJ66Bihh4B6Tnn+l3y7T6m5Eqb2HP
 3azRzq6dcRrNW2i4xUkSKVYc6qOaDBJvGSvG4XmgVEO8oZxfv4FMKCkyO2QGYkEJKk9psZhEK
 EMLaMZpJQxyqqG0VsWC5L9NJ0QIvv9aM9+qSK6GUt6howPAnvjNUirqeA63OjSKjmqYbRbFpi
 +0cp/Q1bbmmStbr17F5aM9Fq5iKhx4PQd0kM621oS7VISLSzFXuiRjQEla6Hq/D2OwG2uCU80
 rmFseIIgNSCRhh0Vxybm2N2kgFqGrTNJQRH78zoK7sZhntnFLw2OrY9rdFzLddaYD7kS9tMVD
 K3wUP4N0MyolwgG3PY1Hwt81itrJgdzB2g0ajbUZRLGWeo+Gikq7G9qWw38F6Z0+oxsxe2TJ8
 t56hGgAF3S6rSO+97Hm8rW3RLkUHMeqFNCGaNYhi2HwhhpDV3pzulm5A+aeYyBdD/AYb9UTTm
 xvEJZ54cEK7S/wVlzdvFRXRt3OUbZ/Fd3nkLR9k6y8J6QEUqizbbvcvvl7kYq267NHk4mydCd
 3N01aJz4ezj3lj1oez7GkaG42y8fMSXfgXETRGDorwHByv7v6HnJ1R+rsrAgaJbSaQVUCp0uO
 YCyRpgcPD1HYve2NMfelSbVPI0jPmNKhUThxcEpCv/qq5l/XaF0SVCHQTotYkb2NECTkBfp97
 J+dFmUzYooTAwtbE92l18l9mgq+6q2k0qdRR/gnZL3Yl25sz9fcaTdjeH0rGdaOvTmJ6oH6z4
 AMKPkH0yaoYkqUyFc7DNgx6VTP+KL/NNBJd5u0/WOUarKqb86gVGiX+rJ2WzXSC8OqAqN2Pl0
 gRyloUjFxt+lqAz1VGnbLTmRLRpP87dTS9W1oD06kpIeBoFoENJqtXAYC04ZfjoWbVSCYNJnV
 tAtF0bDO60zr+TaFP2a91X37qTe990wZQ+jQihQV9q+Cn5Fizg/ieg3/S/pR05rfYdDMwYEgo
 5yKl+96vdJ13K8KvMmdKuZHkO//pdALwngE98CT7bh3yVBINlTzZPaE7SwZIP4ZotCPGvd7pU
 YsMNVdwkBYKJh9i2O
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=MN0feZi4;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 30.04.20 15:32, 'Nikhil Devshatwar' via Jailhouse wrote:
>
>
> On 30/04/20 7:01 pm, 'Nikhil Devshatwar' via Jailhouse wrote:
>>
>>
>> On 09/03/20 4:52 pm, 'Nikhil Devshatwar' via Jailhouse wrote:
>>>
>>>
>>> On 09/03/20 4:39 pm, Jan Kiszka wrote:
>>>> On 09.03.20 11:12, Nikhil Devshatwar wrote:
>>>>> Hi Henning,
>>>>>
>>>>> As part of the TI SDK, we were integrating the ivhsmem_uio as
>>>>> external module
>>>>> from https://github.com/henning-schild-work/ivshmem-guest-code
>>>>>
>>>>> Since the ivshmem changes in the Jailhouse, that driver no more
>>>>> works (because of the vendor ID change)
>>>>> Do you plan to host the updated version of the driver in this repo?
>>>>>
>>>>> I know that the driver is already part of the siemens repo but it
>>>>> is much simpler to integrate an external module in yocto.
>>>>
>>>> Actually, that new driver is a complete rewrite, not just an ID
>>>> update. It allows to securely pass access to unprivileged users and
>>>> provides all features of the new ivshmem interface.
>>
>> With this driver, I can get the uio device registered but when I run
>> the uio_send and uio_read apps,
> Using the uio_send and uio_read apps from
> https://github.com/henning-schild-work/ivshmem-guest-code/tree/master/uio/tests/Interrupts/VM
>

Yeah, Henning already suggested to shut that repo down as people are
still finding it...

Please follow the *updated* description in
Documentation/inter-cell-communication.md regarding demos.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a1f4405e-8b5c-9de4-5d8a-edad73cd8f96%40web.de.
