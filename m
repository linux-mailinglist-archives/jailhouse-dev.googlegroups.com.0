Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNXQQOAQMGQE47XRN6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA07312BE2
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Feb 2021 09:37:10 +0100 (CET)
Received: by mail-ej1-x640.google.com with SMTP id bx12sf11295391ejc.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Feb 2021 00:37:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612773430; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ua+0th9fGSA8R/gy/2XtWrw1XlRxKcpDpf0U/SXpcTbIDwSS5RdSp+5uCLfHjEnAZE
         29/A/+gMWWycsMcHC6UlrZniIZm4fx925aKwhn/VRYKISXuPx0mZcPfpH8aWNNSamlmH
         TMlAG7dZ82gk8js9XZjZqXxwMuGqyCLBpYWy+gmVoWkbOWGpitrg8/ea0yH1OrT7w/gH
         76Zaa7bhR75fHxLcOaHgAvMSTZJm4I4AFkiRICyAqJkMTRwyym+FQaYZPPFLdjsDrRkS
         ua9cLyCMw/s7RwLFHMMhxbPHbqMhCl+KrjHZVnvy4CnMS9Wv3jWWfkGrzzOjTRltJav7
         gPbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=NT/6fyuPDviAnH6XyrKqshcoxf8EGY7QUhUx0S24yW4=;
        b=gTR/WfZb/rePHOsOtrLn4k2NeMUt89Pvl+fSBeZ1rPNMTq2Yz/y2HRn027KqZofGri
         LS6R2B1zGPr9+cf/JldzYRM6+3l2z/cFzM+beqhn9UzG8m5UPUk+29C4skkTxizrzMa8
         ZeCQh4CnlIz9ikrhR7WC1bFWNDy32zRiXEsWMc4Ds+VJaCUY9LDpLcanUCpsBAD4WiIx
         YY27jJgHu2WIuP0E3HpfzQTGZ41lYpOME5C1SABFMK20WBVUV3kM1KWDTnn/ry4pHq1u
         Nf9u7onb3xPgNbgmxLfEJxPSAF2ZufCVlUwifDDVlntAm/8ZZH7oSJLEfJ/Pv5pgfi3J
         o13A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NT/6fyuPDviAnH6XyrKqshcoxf8EGY7QUhUx0S24yW4=;
        b=huF3T6Fz9kEGrGJiSkVt9zSi4Gw+T57SAGfMXxHkynH9Jcq5P1YN1iv4xnbL9k7yhA
         8OI+GHfFko9cRE06hvr75nnna+I9n73I4OzQMbncJU0N+jsO11meep24TVSY0apIBBRy
         g1IynkHbf2mQuBdUYZDE2MDYj10CCw3p8NIZ4jKwHk56mT/HlZebwXUP7c5xZ77S+lLu
         W5yTqxx9/q/3syfrBwzoAiD4Gkeg4oV+sFvdTU5t241I4ZFzO5+9u5dvT+GVx280fdkM
         bTbTmf7wyHrXyhQEcAcW54OiTg3AN7dDbCEvB78gkST3JCEIWuzW9C/E8yn0kAT7r4cd
         erHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NT/6fyuPDviAnH6XyrKqshcoxf8EGY7QUhUx0S24yW4=;
        b=FPieESQemyBu1uDGal7lKDPTPEs39fH5oW0CoTKF891j4bUxnVtymPP5CfrkHhGvVu
         H4MY8f/wZ4wCZ74SeNeFPjccQoO6VWQeCq+12ofMOW5ZIQ28E03tokJKcqDdCoU6pNDs
         Jri5Hgi5CZMsbgnBcwQOfbyWbWMxleqVFrL/G6aYjajgMiN1kPxV103U0+A4GLepsxVp
         tl1M1l/7y94QpleVSEB2dTPdFFmkb5Z7x1QVSPKy13Twk3bkOIxByfjPxV3Kvh2Urn+D
         8Zd8EMAJbfjAPbxfGnst0BBlyh+dDetxEvTF6bb7j62o6QSIQwL2HjGcs9EKH07FJiet
         TGSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533CDjydy68oKy0Q0lbwFBWxoYRW6Nzqe8sIJC8b/3p3F5pP26He
	0ZkdIvsuUTMVRvh+fG92EkE=
X-Google-Smtp-Source: ABdhPJxCqudeMtYo7bJqLWfr5gT32bvFlFg24cWGqnCYvEfmB4VxvxTw8jy35fpd2bdTx5H04H+Y2A==
X-Received: by 2002:aa7:d5c1:: with SMTP id d1mr15884629eds.359.1612773430659;
        Mon, 08 Feb 2021 00:37:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:edce:: with SMTP id sb14ls7444180ejb.0.gmail; Mon,
 08 Feb 2021 00:37:09 -0800 (PST)
X-Received: by 2002:a17:906:eb88:: with SMTP id mh8mr15704579ejb.150.1612773429675;
        Mon, 08 Feb 2021 00:37:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612773429; cv=none;
        d=google.com; s=arc-20160816;
        b=mYSswcJYmXX7BpoSkYKqRfG5f1rpv+4JBBGLUoAj9W4N/Ydeqzus0U82dx7vC4DTGC
         +ZSgYVAYTfxxAzkVDI2/douHt0xOitR8Ul9AXTTlO/PpJC2cQb/xwMlbBX6AhyCjcXO9
         m2wy0FIrXhaIvYWMB6XqMmFZztrPLjdindkB9D19t8MFchobC+DEzOghOr6dPH9Bx+YT
         X8wR/glO5NsRKUWuzRI+V2/cuLuCABnFcBwY8ooPayJFp3ECkbkIpWvBP70tTxHqJ2v9
         jLiXVMYN2J+Z5nIUPQgJI8Y5QKi+kK1BuSpfuAM+2LymmU+FGYL6ImDTStuP3ScfDbYH
         i5ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=WeDVcDQA1q5/Tm2Ehc0Ju2a0u2j/dmHB+KhuogZUaEk=;
        b=w3gAkBzLudXa1WgyhKBWaqjMKBeHFK8T7ed34mXSUKfJfoLbGmKWQPANjGJxhOJ1A2
         cPgQBO4ulbNE/yc++uyQHLHWENuB91SfNtoY4o/I7GSnBGYlCDg558XK7DeE0823a3pl
         E9yOAnCIMZBRMoerXhLmOawWEGO1tYMgzuB9EHxc8AR4z7AMIWm3pxHsmWDFpYw9pZE2
         DrEZClxZKh8i5Mj7JDhNZwJA94jBaZI9xg6jpd3zEaqeFAEJUo9RyqpAez4qw9Q2M4MC
         cLzEbOauKOFzYsQYPzJVfWH7ctOtzB1LNazb9WmTIrYx9RSy7oGDiK/LThy7dVvWA60H
         cwIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id jz19si1221897ejb.0.2021.02.08.00.37.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Feb 2021 00:37:09 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 1188b5qe032706
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Feb 2021 09:37:05 +0100
Received: from [139.22.33.193] ([139.22.33.193])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1188b5e9015287;
	Mon, 8 Feb 2021 09:37:05 +0100
Subject: Re: [PATCH v1 00/23] Cache-coloring for Jailhouse
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
 <8e7872cb-ea47-9c9d-3240-f687b1ab698c@siemens.com>
 <7d28fae1-29b1-7957-5219-11b11a572681@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <25d9e564-50f4-4cee-a8ca-b932752a3254@siemens.com>
Date: Mon, 8 Feb 2021 09:37:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7d28fae1-29b1-7957-5219-11b11a572681@tum.de>
Content-Type: text/plain; charset="UTF-8"
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

On 07.02.21 14:03, Andrea Bastoni wrote:
> Hi Jan,
>=20
> On 07/02/2021 11:17, Jan Kiszka wrote:
>> On 25.01.21 13:00, Andrea Bastoni wrote:
>>> Hi Jan,
>>>
>>> Here a proof of concept for the cache-coloring with/without driver appr=
oach (works, but hasn't been tested as much as the old version, and we have=
 seen at least one crash in our tests, but it should be sufficient to have =
a discussion about the direction).
>>>
>>> The patches until 0018-configs-arm64-add-coloring-example-for-qemu-arm6=
4.patch implement the previous coloring approach (+ bugfixing + qemu-arm64 =
integration). The patches from 0019-config-always-rely-on-the-availability-=
of-way_size.patch are the proof of concept to realize a colored jailhouse i=
oremap in the driver, keeping the same logic between the hypervisor and the=
 driver.
>>>
>>> The "get_bit_range()" is refactored in a single place already (0020-col=
oring-extract-get_bit_range-logic-and-remove-offs.patch), but the main logi=
c needs to be replicated between hypervisor and driver [*], coloring.c does=
n't get considerably shorter, and control.c gets more complicated because w=
e need to distinguish when the remapping is colored and when it's not.
>>>
>>> Most of the code reduction comes from the removal of the cache_layout a=
utodetection, which is "debug only" (and could have been removed in the pre=
vious version as well).
>>>
>>> Overall I count for the previous approach (patches 01 - 18):
>>>  42 files changed, 1337 insertions(+), 121 deletions(-)
>>> For the new one (patches 01 - 23):
>>>  41 files changed, 1233 insertions(+), 127 deletions(-)
>>>
>>
>> Thanks for the update. I think we are moving forward. The diffstat for
>> the hypervisor (with include/) is getting closer to an interesting range=
:
>>
>>  32 files changed, 721 insertions(+), 122 deletions(-)
>=20
> Thanks for checking the differences between the versions.
>=20
> Which one do you mean here? The previous version (01 - 18) without cache_=
layout*
> is smaller, roughly
>=20
>  30 files changed, 710 insertions(+), 117 deletions(-)
>=20
> IIRC we discussed already that cache_layout was to be removed (not even
> "DEBUG/NDEBUG").
>=20
>> But we can still do better:
>>
>>  - make non-colored operations the special case of colored ones (e.g.
>>    map_uncolored(...) =3D map_colored(all_colors)), that should further
>>    reduce duplications, both in the hypervisor and the driver
>>  - make sure that only the calculation of color bars' start and size
>>    is arch-specific (where I still think it belongs to arm-common...) so
>>    that iteration & Co. can stay in the generic core
>=20
> I think this is a larger design decision than just coloring. I can integr=
ate
> coloring into the paging and have the non-colored version be a special ca=
se, but
> this means extra complexity for all situations that do not require colori=
ng. I'm
> not talking about runtime complexity here (paging is likely irrelevant at
> runtime), but documenting the code for a possible certification (if this =
is of
> interest) becomes more costly, for something that e.g., on x86, you don't=
 need.
>=20
> The first version provided a way to identify a coloring-feature (and the
> corresponding API) you may want to exclude from the scope of a certificat=
ion and
> from a possible pre-certification cleanup. If we integrate the coloring i=
nto the
> paging, this is no longer possible.

You have that extra complexity already because you have the
differentiation of colored vs. non-colored in a lot of code paths. Now
you will replace with "contiguous vs. colored steps" while dropping a
lot of code. I suspect a net gain.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/25d9e564-50f4-4cee-a8ca-b932752a3254%40siemens.com.
