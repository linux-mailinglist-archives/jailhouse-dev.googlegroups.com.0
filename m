Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXEL6TYQKGQEUPYH2AA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD89155277
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Feb 2020 07:38:20 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id p8sf775083wrw.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Feb 2020 22:38:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581057500; cv=pass;
        d=google.com; s=arc-20160816;
        b=A6eU3XofseWBTx1LDi091d3oSzu2gXrWVd3ncKStShWFqrontTqC4LX6wSoyN6keSF
         +Fho8AGCcCA7wB6JoS0DDPA+tXkzIy7ypR5R+p4Dek3s+54O2FQ/Rdm3OmgjSs//aROt
         tIKEAdMR/vFSUsjfMQYHPDXk/sUo3zbdIg8cqVt62x3Xusz0iWSjG936UZEoj4Up76SU
         Lljf/njG0pnv0pvR8gilyfI0h2qu+SMIriR6+Nv9+267e4FBF2R57mDH1KNkS6qP/ycA
         l2lfrD2bvYGouPcqh/nGKptyNWWyYSAvmOpyYelrvwM9gZJCzVlGKGNrt/0Fe5SEJcZm
         07BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=OPEigeC178QnqSYrrv2vxcNU+149uWjnLyc9ZK74z9Y=;
        b=mSgu+4ouQ08P0jdC9/FfT2IEypMKXzN+LRt37q5iEB0cfAyyHmHOSF5MEK/seN1VBV
         Aj1aIeZfdLZa9xy6Ow011uXzDRZE8AWUffueTxviAW6oncSkRF9Oxl5P4hUzqzcfujwW
         SWWf/tZrlTOgOftuVmIht5hT58xUMMBxX0zHNHee9mcN9Jp6BRMd/etnIAr0tfp36grL
         bq4Gm1tHy41M7CxtAe/Drx1ZpycZfPvyMJLZSVpRt+V7/VUcUb4+TUKKCLAtycY9eFKK
         hrQFffADSH0nnsD3Q46hPyhWnp+3aJ/hz1rZhw01c/7FnKI+N+o2QjuIA8IwskO29xy3
         M7+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OPEigeC178QnqSYrrv2vxcNU+149uWjnLyc9ZK74z9Y=;
        b=OzNMYZmEHKiB+hzzFQHgDuy0EgliPphmWKiue4oxkickAyfGEnZl50IBXvBEb6Adlg
         E0+SGHPbpKmsoBTQXrN7f4Oo2u80c/8fujWdAdL+n1/mVXYSy/DWX8knepHbsA//PQVG
         XTqb3ubgmOFkmJyPv7pipuaR6Ik+BIBJL77+5+0GZVKh7PLYRh6u8EwRDAXNMxESJowF
         GbtM2TaBuXVLIQUbxdO0MvzjC0uLcM76UgNFk0TJ/nXXl8fmCnyWvADCJ87nJJkmggXp
         Qq77ri6+JO7fsdUuFUjnEPh5Y6vOMtYj1ixzlsaCAHMSIc/8dZ/gwPJW+VGBlKRZbcug
         yPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OPEigeC178QnqSYrrv2vxcNU+149uWjnLyc9ZK74z9Y=;
        b=IX8nY26+zCliDPwIlOSpZuwinbos1fzzFhiYFp53+Mej+fkyxZ8CouEfIearMjUKO5
         h7vzCOQP6S712EI9lQrFVBovsFdkbZmKEQtGtfyiuuRO8ryi2zBqSAxfIQpAA0DHgshk
         3mQMZ6Z2gERooOtPwjIDpeV5LF8XP61HBt45uAX+kCw+4VM8sLi9HYDuamO+Qh5gITHN
         sET50YFRk7jpIvvoKzGSz9k0HATgdQjMpZvYkIr3Enqi9TtKL9H8FbnjuKiuT2dK8PHh
         lLjdVE9nIpJz57ea50Ur0ES5fVQtqER2/gzzphkC6YwiIq1nxDGuAu8NPL6q4n7S0S5U
         J/Wg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVUZnfy14ddxuHZLLN7+EfWs1CQRSgIeovVVEjfu20FRvS+QkAd
	uTY7oHztiOjw/iz2ElDkPf4=
X-Google-Smtp-Source: APXvYqzbTWXYTy/loXl+dqepSWryCcuvj5WtLZu97TD+DeincQC8jUK5NRl5O9V4sB6CSpoSgg+rMQ==
X-Received: by 2002:a7b:c3c9:: with SMTP id t9mr2378281wmj.18.1581057500606;
        Thu, 06 Feb 2020 22:38:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c3d1:: with SMTP id d17ls5304496wrg.10.gmail; Thu, 06
 Feb 2020 22:38:19 -0800 (PST)
X-Received: by 2002:a17:906:399:: with SMTP id b25mr7115785eja.24.1581057499879;
        Thu, 06 Feb 2020 22:38:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581057499; cv=none;
        d=google.com; s=arc-20160816;
        b=LwcSICW78UY4Mbhk7hccTcvPcFu9alXspWNLgwhzuL10kyjKQg3WHO8ed4GQw9FHBD
         YIlvInvcqYbeRMRGxi4s8sC1huhsL+yUeXzyQOaor2hDPannGiOLeH5yhVLRl0vbHQOd
         B1SaFfcEpHeCN+JbF/4HDZh/CEvQeb/BapGRA2dQ3Du733jgavytqRUAPpjRP9xsLp/3
         YbXClzDRWkGbUr/iqQG0WHwssR9pHw8LsuSkWWcg7+VlBt9L76eWiZUHjulpPdZtJmf3
         5v4yVeJ0j7uC3WD/X4UXYNyS5gHYvSWFkb7QVkD2X+2x5gdQue7CCxG/917CJdiT+TlY
         iNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=9GNuuIbxS4RC7D7rU5fWCpB+YN8YnljcFuVub+3nMzc=;
        b=mh+xfXxkwTtVT9LUqA3hn2X74wBhp2jmyf2brs93pzeBGdRpX6/ilUUB1SVE5Pn0we
         ToHXJA1MEqrK9ulwRDxnjcCQrI7dpcUjrOtCNmwGtz8hOOlLK4kkEg4wABbUhVEGtc4p
         oMREJxgsM3pvTdHsWI7koPIF6ISm2UilO9QGESXp6564KFaJH18aDSvJbhtt0R1wikbD
         9zu0oxXk5XQQR42hLjMp9cP7Ex8dmgw62isXc1DseSHBo6UTeqm1m+4yxvUkaJunisri
         aiWbibyeKmTISWza0kfxaXDm9cMIDsb78CTz6k3lNec0AmHyG0yXWMVlHRvfsTTy3RK/
         bTyg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id df10si105707edb.1.2020.02.06.22.38.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 22:38:19 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0176cIVp003794
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Feb 2020 07:38:19 +0100
Received: from [167.87.42.193] ([167.87.42.193])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0176cIM6023654;
	Fri, 7 Feb 2020 07:38:18 +0100
Subject: Re: Difference in execution duration between root cell and inmate for
 same code
To: Michael Hinton <michael.g.hinton@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
 <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
 <20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
 <5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
 <20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
 <96056326-0700-4779-b1b8-3b0df7134a73@googlegroups.com>
 <9c6c6364-c7a6-f2a4-507a-b5a9b1f6b8b3@siemens.com>
 <3d7d68d7-b54d-4610-b50d-528c1c2be781@googlegroups.com>
 <8e62e937-be43-4c10-721c-78f2b11a5eb1@siemens.com>
 <8c4969cc-6165-42bb-9647-b19966635742@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a93c1ea5-2c50-7dcc-42e8-fbe9b31db08c@siemens.com>
Date: Fri, 7 Feb 2020 07:38:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8c4969cc-6165-42bb-9647-b19966635742@googlegroups.com>
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

On 06.02.20 23:15, Michael Hinton wrote:
> On Thursday, February 6, 2020 at 12:23:47 PM UTC-7, Jan Kiszka wrote:
>=20
>     On 06.02.20 20:15, Michael Hinton wrote:
>     > Hi Jan,
>     >
>     > On Thursday, February 6, 2020 at 12:06:05 PM UTC-7, Jan Kiszka wrot=
e:
>     >
>     > =C2=A0 =C2=A0 On 06.02.20 20:00, Michael Hinton wrote:
>     > =C2=A0 =C2=A0 > map_range((char *)MGH_HEAP_BASE, MGH_HEAP_SIZE, MAP=
_UNCACHED);
>     >
>     > =C2=A0 =C2=A0 Why are you mapping your RAM uncached? That's (roughl=
y) only
>     needed for
>     > =C2=A0 =C2=A0 MMIO.
>     >
>=20
>     >
>     > I see that it sets the PG_PCD argument to the page table entry in
>     > map_range(). What does that do?
>=20
>     That controls caching on page-level granularity.
>=20
>     >
>     > Should I set it to MAP_UNCACHED and see if that helps with
>     performance?
>=20
>     MAP_CACHED. When it's uncached, every memory access will hit the RAM.
>     That is... not very fast.
>=20
>     Jan
>=20
>=20
> Switching to MAP_CACHED worked! My inmate now runs 100 ms faster than
> the same workload in the root cell. The inmate went from 2.8 s down to
> 1.1 seconds with that change.
>=20
>     > I guess I was copying the other map_range() call used to set up the=
=C2=A0
>     > IVSHMEM from the ivshmem demo. So I have no particular reason.=C2=
=A0
>     The ivshmem demo is doing that only for the MMIO register region, not=
=C2=A0
>     the shared memory is later maps.=C2=A0
>=20
>=20
> Running the workload directly on input in shared memory with IVSHMEM is
> super slow, so I'm wondering if the data portion is indeed UNCACHED,
> contrary to what you say. Or maybe there is some other bottleneck. I
> will try to investigate that some more (maybe I will change it to CACHED
> as well and see what happens). But at any rate, for my purposes, I can
> always copy the data out of IVSHMEM into the cached memory region for
> now now.

Oh, now I see where this confusion came from: Old
inmates/demos/x86/ivshmem-demo.c used to map MMIO + shared mem in one
chunk, and that uncached (for the sake of the MMIO part). You need to
look at inmates/demos/ivshmem-demo.c from latest 0.12 to find the better
pattern (also how to use the latest ivshmem interface).

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
jailhouse-dev/a93c1ea5-2c50-7dcc-42e8-fbe9b31db08c%40siemens.com.
