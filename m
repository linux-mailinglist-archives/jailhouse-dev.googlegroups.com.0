Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBREEUPZQKGQEYFBA4IY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 37996181624
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Mar 2020 11:49:41 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id p17sf498216wmc.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Mar 2020 03:49:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583923781; cv=pass;
        d=google.com; s=arc-20160816;
        b=lhvjpjs2J0ActOkjiRXCnZXvMpoXyKqUT5CsTmhsQKc4a8ub+UkRgYl+eXpD8kzNGu
         SFilHEX1TZqmDKgVxp/FsDkCRvyUGN8A6SUJ2xJVpiTWWd5sTxtvKMZgzveUpn/pSrIa
         7/XLe5q/oP8ySk/iqA60WvQ3Wp07AiuhaJianMZ8KaEWb6C84NjbQpTiUAppvEOQFyw4
         TbYsMdUwhtsxKsDVmcxyTF4aScL4d7y3RZx3mdC4Uely1Yl+nJgoE7XSu5gq9Uco5GCH
         UMAlO24hUvDHq8ZNM/MTA8r+mAtfIjsXe1v+b8D9ZcFaFBSoDFLY0kHvd50ql4cHtV0v
         Boag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=v9FJuHEqgndSSX5ozcP/v+dokJvuWjH8moGC/kOBdyE=;
        b=sL0B8GTdJXqw6i31bGNPuot9vvsVlJHbh5PqfJW03FtcbZ2IunuaDElLZgOeHd270z
         3ZXBhCir19vfHninMQGaVjcChoS2FZxO8MKXOWfAIk/Gcqoss+5Js6pI+G+yLcA9mbVR
         GIO+PQSoeqpZRl0anP9wSJQzpVL3+5M3k+98GF9cpcTQBxnX9N2jHb1YoW/hg7apRlVk
         YYLT2AtBngAzA3zMozY1vp6X/cB5mWL2FcVfEDRkG1mB8m5lyL4f1h5+QLlwTpUJzVLO
         tgwACdkDe4SWyWwRZQCZIirQ/Zw7dVdF1NU8oaFT9fB3OxEm98ankooNnk3pO4spT6VX
         7TaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v9FJuHEqgndSSX5ozcP/v+dokJvuWjH8moGC/kOBdyE=;
        b=Po2WYNCtW0I6HtMn7pzhSJWGg5Vb88GGKk7RAmHE7H9OEuAR7KZ541r2UDPBUmVZBf
         3GPaOndIHifSs5aP0/UE8rNTUYHaHlfzLOmWGnw4qsG2wcTGa8f244yrUPXTi1JOOnVR
         6SQX7IjKm49wCc1DF9quGMcCkRnFgmWYnQ0c51bk4elQ5H+86GU1aJotNhbZOQxeDYlt
         1JCFMQPL8VZEWyp2OJdSRg/sA6A9WbpEiJsGm6dfdjbW/Ai3wWVTPhEptaslgTVU4VA3
         x9RvRl++DRZohCjQEW0SjjHhMBIuU4324degXRgzdL4eklMbI/L3wEw02ZjWeD8hwPj8
         qrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v9FJuHEqgndSSX5ozcP/v+dokJvuWjH8moGC/kOBdyE=;
        b=Scx7oXxffoax1cNhFXKZwGRH49pG4xgYxYRXiepwVz3XwD7YXokVnPMYTvf/DpEw3b
         nCi0MqYK1Qi+wKeqquZaUF1j/isiwhWNLbVvlEsy6NtsciwFckaVqNMV3v71wg4kFfbO
         ggKbjbHlu8Scz/18ISNq7+VABW+IiMbEoIRitXJMj/KJtSaCxUmZkTNjKhsuq5U2rDqU
         m5IT9DQAAD4t66ZvNubKjkuaoX9JjdLysFfIGiTJog+AnQ4kjhgndCG4ePjQO1+gkT26
         Hvn9M7lqHUmZu0OwY6uZuSPZwRLNwYfeG9i02NrPl4DKdzY3iPcTlPERPkmmyzCE0/qr
         rt1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ006L9kZUCB3uBBEpexvmmSHr0EInYPdLbVIHNOBV8aJavocIZC
	mzj41pRBv0lFfT+OElZKpL4=
X-Google-Smtp-Source: ADFU+vtLmKeijh6u5gizg9kiMrH8e9WeVg7W2PdfYtFCka5k89VF6EtfWs87xt9rvHkIkzn1MmJ0wg==
X-Received: by 2002:adf:aa9e:: with SMTP id h30mr3940260wrc.288.1583923780965;
        Wed, 11 Mar 2020 03:49:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:cd01:: with SMTP id w1ls772207wrm.0.gmail; Wed, 11 Mar
 2020 03:49:40 -0700 (PDT)
X-Received: by 2002:adf:f2c7:: with SMTP id d7mr3967645wrp.104.1583923780208;
        Wed, 11 Mar 2020 03:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583923780; cv=none;
        d=google.com; s=arc-20160816;
        b=m2h76HURaapSvVf9SZoV6Pag97L6OJCPr/HRVZYTb8u9ta7XW3DQXUW7cmwID6GC2E
         K2u2uWJhNwwHk0DmKuYof4eXS660lCayFjFaZRRIwj+o+5r5PTnDHcamH6Cbte68Ew8a
         aXJ6YTQZrl0KgFXDFU3D98vDHPjVJj8EfpDD7C5QliDOmQAMbOw29GpB1cyL6Y9IFyOQ
         aGRacBSszfQmFvUfhkh7lvofc0LGz2+mZKQucwoFCvwr1wRGObhJP4UUzVDaCkPmVtTA
         Voi5EM/wDpvAArFy/2s/ACD1s6CUtivcyJwRI3m8d1wy8l3ToiuxzJjiuQm082aEVXbQ
         gWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=lZ6Gc/JSTRRyIpxrBYnxpljsHPh2ipBJVy6R91ixpOM=;
        b=rptjgPOAA6wnwWlVFkFyMrdAkYXcJZ4rve1Ip7QbBUI8+Pq6/dmSWuSAvN1vvuvO41
         NutUdiZjuthbplQrnTqFVZ9eloRT/KZvJqZOsHbT15tVMjFXkY1QpC7v36rq+i5cUIzd
         hlBmHrg0sWG8RtznPDjDmx+Jat8A7XG7X5WFhjs1hf0wgmj7Ju4rye8PyWKCFRKlbIWl
         LXW/DtHrvXOfmz9Ko2CS70QPaqiYkmpKHTQTBU3liQ1DVAkPCPQqq2tibUz4/9dGTNf5
         hxAaYwmK8bQAFFKpZFqKd4Yd9g2uQiAM2Qp74+qa8IRRYbi12fbh2pzgkRBTrRfi/Fbn
         kxeQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s2si78758wro.5.2020.03.11.03.49.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Mar 2020 03:49:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 02BAndce019373
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Mar 2020 11:49:40 +0100
Received: from [167.87.85.172] ([167.87.85.172])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 02BAndTD012771;
	Wed, 11 Mar 2020 11:49:39 +0100
Subject: Re: Jailhouse TX2 and GPU?
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Patrick Uven <patrick.uven@offis.de>, jailhouse-dev@googlegroups.com
References: <202002281443.01SEh8Ta028765@opswc01.bsc.es>
 <6a16a1eb-a0d7-da01-848c-107b56c6f114@siemens.com>
 <96ecb1bd-8761-dce4-e20a-d008e4b9dab0@offis.de>
 <9477704c-3573-bdfd-5421-3fa11028f460@siemens.com>
 <84b7007d-0071-4877-cf94-b084e13288f8@siemens.com>
Message-ID: <f8aeb318-3c65-85d1-f161-a088ab7f540a@siemens.com>
Date: Wed, 11 Mar 2020 11:49:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <84b7007d-0071-4877-cf94-b084e13288f8@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 11.03.20 11:47, Jan Kiszka wrote:
> On 10.03.20 15:57, Jan Kiszka wrote:
>> On 10.03.20 14:11, Patrick Uven wrote:
>>> Hi,
>>>
>>> I would like to continue this conversation, as Alvaro is most likely
>>> working for the same project I am.
>>>
>>> On 2020-02-28 19:58, Jan Kiszka wrote:
>>>> On 28.02.20 15:43, Alvaro Jover Alvarez wrote:
>>>>> I found very interesting your work in the jailhouse software. I'm
>>>>> =C2=A0=C2=A0=C2=A0replicating every single step for its integration o=
n the Tegra TX2
>>>>> and so far I got jailhouse running bare metal.
>>>>>
>>>>> Now, I was wondering - what is the status of the project?. Did you
>>>>> ever manage to run anything inside jailhouse inmate using the GPU?
>>>>
>>>> If you completely assign the resources of the GPU to a cell, this=20
>>>> should
>>>> work. But I don't have a TX2 to try that out. Adding some folks who=20
>>>> have
>>>> some in their labs and maybe tried that already.
>>>
>>> I was able to create a few scenarios which all did not work out as=20
>>> hoped:
>>>
>>> 0) Using the evidence port[0] of Jailhouse 0.9 for an old version of
>>> L4T. While this works, it is obviously a quite old version of Jailhouse
>>> as well as Linux (4.4). Is this the version you were using Alvaro?
>>>
>>> 1) Using the newest version of L4T and the provided kernel I was unable
>>> to build the newest version of Jailhouse. As you already mentioned in
>>> another message regarding this topic, Jailhouse tries to restrict
>>> support to mainline kernel wherever possible, so I tried that next.
>>>
>>> 2) At last I was using different mainline kernels on the TX2 without
>>> much success. Trying versions 4.14, 5.4 and 5.6-rc5 I wasn't able to ge=
t
>>> much more than a booting Linux which a console via UART. No HDMI, no
>>> network (not expecting an answer here for those problems, just
>>> interested if this should even work). Using the LTS kernels Jailhouse
>>> would fail to initialize (when using jailhouse enable some CPUs fail),
>>> using the latest RC I was able to enable jailhouse, but ran into memory
>>> errors when creating an inmate.
>>
>> You may see different resource layouts with mainline due to different=20
>> device trees etc. So, it's essential to keep an eye on /proc/iomem and=
=20
>> make sure the config is in sync when it changes.
>>
>> Furthermore, when you can errors, please use CONFIG_TRACE_ERROR and=20
>> report the boot logs of Jailhouse.
>=20
> Regarding the CPU failures during boot-up: I'm just editing the configs=
=20
> (because of a new format), and I noticed that the TX2 only supports the=
=20
> A57 cores under Jailhouse. I don't recall what the reason for excluding=
=20
> the two Denver corers was, but I suspect you ran into that. Try=20
> offlining core 0 and 1 prior to starting Jailhouse.

Err, sorry, core 1 and 2, according to the current config mask (0x39 =3D=3D=
=20
0b111001). But better check /proc/cpuinfo or /sys/firmware/devicetree=20
which logical cores are which physical one (FWIW, this Linux ordering=20
dependency is going to be removed soon).

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
jailhouse-dev/f8aeb318-3c65-85d1-f161-a088ab7f540a%40siemens.com.
