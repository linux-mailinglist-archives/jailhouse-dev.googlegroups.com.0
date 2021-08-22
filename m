Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB4HLRKEQMGQENZ3RGLI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5DB3F4188
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Aug 2021 22:39:12 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id a201-20020a1c7fd2000000b002e748bf0544sf1071561wmd.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Aug 2021 13:39:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629664752; cv=pass;
        d=google.com; s=arc-20160816;
        b=RnU3c7GI2dED/PKGWspnuHfKhHsoNEIg4y7sB1rQGtglYRAJArsaRsG90a+vjR0uXN
         IDoK+74W8Nhb9JoRa8bA/P+cm1ow+dj6S8/Qtsk8IofYxfw7TyWerik7scurR3Qi/Nm5
         CiWkTVscNJwdW8PCHkTuSto97h6WjQztdtzPqhyZemFPk4D0delEI1D1JFhthz1N7B3w
         rt7WlKBQcp9tbNdFH4JEKUzbJ8G02Q7iVFL/5KT8nm3vciC9zUqa/+p0Gjyr3dzzIFF7
         vQKgolcTnOkoI2ajPS5G0Nv4z6e2X+fVers8OxRv45Ba0H+cXaCpni2Skh7+4lVUECVf
         nlDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=JvNPkckElEX5FTfBqvvtZSJgPOcFKs/dU0Q1zjhqh+w=;
        b=XF/stY5LldtLZqZkFKek/nPQq/psjJw3ao3KZJuY0+ti81SEmRC+F+HibvnlSN5YM4
         KaMzBfyFlvXvtZkNhUCgFoQoCUVlcLTaA308X9RpNGXOKtpOi8Arb39owJWB52Q6WOyU
         OxvrQNTtV0JsN1fW46IiUJh69D4wfubMoFI9Hh0MlR1wY71HAxe8QoqC0F0InPk+G+aE
         W+7vrX3S6ndEPVUoq5O2sF6kUL4jFISRM2/mZrGI7PRj8AuU2Ii9ZTp81OaUJgMz52QB
         pPd1FkuO6XIoY8zqdZEEbi0CGZTFmQNfU0LDNtiAhBq20/V9tNcIlyu8t3oEGOdPwtVx
         lDjA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=QgLaozki;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JvNPkckElEX5FTfBqvvtZSJgPOcFKs/dU0Q1zjhqh+w=;
        b=AXV54VowaYtivRYEVxG0326NIta0ABo49jiCYmy3pbFeQKqJ6jVb4MztjWlYNEzgrI
         zfIsW1aFqXtV3Riju2CkoYGPBN/QzYxmgF5OSK6dMR3A2seeyPsxc/gfwprHgGbMjvaW
         ihrqtrmggtvEVM3RQxOhFsAF8Gn/6KDHKECUHfiN3A3cPO0nET/wO1UoRJTb0n5dzMI6
         jApJBUY8uMkNYPQr7r42bQ09TaI5YVu3C0CnlbTzver+qmv+hADhx6EcOr1qku3X4eXK
         do6TTEuHjChyFPdr8lShvnzaHGGJ1S25SxH5nCsefTGhCgiidCpPdHwmeESdZT90W1F+
         hDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JvNPkckElEX5FTfBqvvtZSJgPOcFKs/dU0Q1zjhqh+w=;
        b=WQUeKMGPEneM0kcgh3O7QsClMd7zs8vxTnnthmd5aulhrQgBonhU1wBDWn29AGaBlU
         JOexwZTA/JOk/O3EUqOVLbHAwce1Mjmb4XIHxZCKSfCuEbRUY6X14wmaD6hXvgSDORTE
         IHnYJ+ElhlxbyZEf/BEAqjR3eOJGhedW/kxMaJ7V9iPQzVGnJIU70V/Tz9CzFACmCVsn
         3RIC8EdBQBn+MURjFNMpqZmBzDRCM3PmZoxI02kBvjaYgrB16fdzyMd0Yrr2SXTkSO3y
         +MsCI6/1rsZPFrSSq8Nvz46oca+0QJ1BJ1sKwn3WNdnpM8CLU6qDfm4OjRBZQ5Lj8ROM
         0RTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533hVEHSEJlcmsjauZensDGjgNDTi3euBlZbYVHaWvY4aNn7zpBu
	Z6LUeExp4Bdmoonqp3K8ywM=
X-Google-Smtp-Source: ABdhPJyzGsTMSUhsE23NHg8cVjvUMLCEL1YRT9sLQJ8A3igKcsj9o8kOH2DVtc2gGZo+L4QabwDDFA==
X-Received: by 2002:a1c:730a:: with SMTP id d10mr13480333wmb.59.1629664752646;
        Sun, 22 Aug 2021 13:39:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ef0d:: with SMTP id e13ls97321wro.3.gmail; Sun, 22 Aug
 2021 13:39:11 -0700 (PDT)
X-Received: by 2002:a05:6000:128d:: with SMTP id f13mr7186173wrx.244.1629664751480;
        Sun, 22 Aug 2021 13:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629664751; cv=none;
        d=google.com; s=arc-20160816;
        b=W18vZ63qCujwkjdXM+Hkt4Dm9vPMTN8mSqgPeJJOkJIIoXkLRQwxus/ZKg5lbBXujs
         4k8jmEgKWpYNLgeHDRw5Lnd5Pmfcuh9m6qz1I+wUqFBkQOhlo2d76jIPx0iGNjsaCDAz
         h7DQfe1zEbecuQE4wSwwsaIkGTJnUNusOLmNsgSVhiMrXIxHhm1tncwJLsvBcco01iP/
         cb37h1ZilzIeZmnkG197lYtKGeCVPkoSZrxB3sp8ydKqs07Lp1iv87QdDP1U+oXBrgX5
         t1iWozCWZOr2VOz6dZm+5AM5xGo01UgZsv+pN0+3biRXZpAb9PaWh2emd1OVtvRxOYR+
         50lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=KxlLVXK1OryBltZwW7W39jhoeW3c0qo6/ODI1S1ulS0=;
        b=j2kw1Lc350waVMV/JoZBP3Ytl1YUD+onLwQoIDif4lmYVVePVf+V6Yv3IJjGRTAV8c
         Ez5jcMyYgcn6UXGalK6PmcNvZM2b+MZl9a91x7Cc5ESSaUGrlUrsTjEUHFnJ4Z/oAa5z
         8GOw7ylSdkVhvUeGba/2QBahRJkKrxCTTeJ8Qvbs5dMSSqMKJOBfxcaxxUBZtFhSigZ5
         ZesAIrTzrL0hVNtyN9bZixToKwquGCqme+Uj4FdrD4ZyDPzkbxWL4LACZGjjJwU0dJVx
         ytalAFNWs5RnJc9f2D5hkH659DAWJHG81rYRfP9v8go1i2XDgUkVXI4Qvr+IxVot3gSw
         PMng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=QgLaozki;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id w3si1458505wmk.1.2021.08.22.13.39.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 13:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.227]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MP384-1mhGC218kW-00PK4w; Sun, 22
 Aug 2021 22:39:10 +0200
Subject: Re: Share Memory beetween Linux & FreeRTOS
To: Cri Vitali <cccrrriii95@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <7b26fdc8-3ea6-4275-9c1e-bc8de873f906n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <7f63f09c-5ba4-4f07-80b1-b10bb8a4dee0@web.de>
Date: Sun, 22 Aug 2021 22:39:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7b26fdc8-3ea6-4275-9c1e-bc8de873f906n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HlZiylCQmRwv/mMCHNTn0AggYL/z7EB41Q9sK1wrAvQyvDte3jo
 Fou/TAeiS4YWfxN/SyJLTeh5V7F61H4sy9XzUtEStj7A8+ppIMJwG9W2SFqvdzQ1ZzoLp07
 3YExVvfKxaWCB0j1EicblqdwnxxI9YwuA+ns5K4EREhUBUgdqgvSL9UkbYPAiSToo1XZfcX
 /eyQarN5LOlwZTmR76BtA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OQU1GGObr9E=:vCPxSI+MxthgSFqyC7Jsse
 5S00m07wWpRdZak3TOf/MYFzdYBUZuaPNRQP5YE6G1biMhbP9lRiM/U6QBS9PqTRp4k68HvbL
 JFcjzA60dyCgAfFIhPi/enLTrfbTMWa2TIflVglIx8tvs7RMjMD/H2kZANRz2XoJd4Pg46aZz
 YGzdd/f8jQYvxn+8pDbOThPbbQgJXLZt3PbL8D4jauzKpsyTiKyAsvItGje+y04b5poP8JoLs
 hzjBG9SX4Sy9weE1AijV3Y9elzzOda4x6LUtH80sGSUvoZXDtOG7z4tsUD1oTwoQyQwOupMuX
 zQ/NacQDzRmSwoLe+Hz9HXbhIF0CGx+oWHIdCBOP53NmEEKabArOoItL1SJai7HmNEDCZnvDR
 wAWQ79Neh3rQsBpCwMcXJsc8d/ml+c8i/VIG3Hu3DRi5WCRu+L/p67XrROgZO8C8uRmOypaIy
 XT4BnhTU+XxlnEMbh4jZ2RZ32LofFI80z49kBWU2LOvB21H/SxUUduRUeYtaB66u0e3JLUDZG
 zJonKnhglimH5sxh/FBz28bCBsYhIk6ty4cQKdiPQlHYxtHL6b8BlqCFhZWo0rZnjMkmPgMp/
 u6AIlHu6lzJeNvQz5clMV9qHyasxyfViMnjRsERz3XRzXn81gDsw+xDWuwQu9ZCwLsBJ2Qroy
 pZIAnox7ycjgp/0FjgzjUPkD3necZW7HWSTGxRFdrX6fcaec4R5QVLYeYJ2yHpWiy+ylqdr97
 ds0zB8mgaE8N8b4xKKwVXU4h6E9ze4CxU5wNtl0CGtOJnByMxNULT/99yb5/Br1C7fNWeGV9l
 hGI1fPx64N1LhWFvvXYuLy6cfFDKwF6K5mDYuVLzRrVgzpD6kf8zqzSLX5SlcSXCrhVoBe1ga
 fJY+M0tF4m8eBAsjeP7XO/igkgnTOkdpVY2z6VhnZMZd/hNgiKzlqGcbwL3xdCLHHi9GCTsZH
 Vid4dlSHYInDv6+zMMp/DvXKvwqZTOQ14vbXOaktvTozXzMP5CnSQDx2wt00djyXFJ7qPLjYs
 6px1Q6y/6sf9j7E923wRejK1uE5cMRiaHfkhcuoIC+MKmrdGb/C1XnEWKYc52jH6VHwJfKvq0
 6+42n61u6dgOe9O2Xv/qAvXIilZ1tiEODMoHzawA729UpjJ7pAYuE4UOQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=QgLaozki;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 16.08.21 21:46, Cri Vitali wrote:
> Hello everyone!=C2=A0
>
> I have a Jetson tx2, where three cores are assigned to linux kernel and
> one core to FreeRTOS using jailhouse hypervisor. I need to share a
> buffer between one process in FreeRTOS and another one running in Linux.=
=C2=A0
>
> I read this slide [1], but it is not clear to me which solution I have
> to choose. Can you give me some advise or documentation for start in
> this topic.

Searching a bit further, you may have found the successor [2].

In-tree, there is [3] available. How simple access can be realized, also
without a full OS stack, can be seen in [4].

Jan

[2]
https://kvmforum2019.sched.com/event/TmxI/reworking-the-inter-vm-shared-mem=
ory-device-jan-kiszka-siemens-ag
[3]
https://github.com/siemens/jailhouse/blob/master/Documentation/inter-cell-c=
ommunication.md
[4]
https://github.com/siemens/jailhouse/blob/master/inmates/demos/ivshmem-demo=
.c

>
> Thank you so much!=C2=A0
>
> [1]=C2=A0https://events.static.linuxfound.org/sites/events/files/slides/L=
inuxConJapan-2016-Jailhouse-IPC.pdf=C2=A02
> <https://events.static.linuxfound.org/sites/events/files/slides/LinuxConJ=
apan-2016-Jailhouse-IPC.pdf>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7f63f09c-5ba4-4f07-80b1-b10bb8a4dee0%40web.de.
