Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWUY3D4AKGQEXNHD4SI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 72635227053
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 23:27:54 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id d11sf12491463wrw.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 14:27:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595280474; cv=pass;
        d=google.com; s=arc-20160816;
        b=Pwvl2e3BHnDIfTXIzIUluz554nbPvcmCzZ//SgkPBBztr36BNBYqFukyRBnGI+XD8m
         TvuB1JF/+8zy6cQtbT7MysdRIsMQJlB7UAB1iewvX3ggA/2BKJTyC9fz/CQF4kCxe2+Y
         3AsKOlwksjhm7QZS07SszG1k1kX0AtbwUoZrEf9NotcjPQUsb9P0aBTl/rJU6pQ6ggRo
         +poyFJZ6VQimxqH+oOMaRibxIMOsaR2G6ZYwbEeSNyPw9VbXFbVjjHXMFSIsrVpWyKS9
         X2Ryu4oVPV9JbV4UNqPY9Ob8bPKUVnN/sl2IZVcdHkUaEyIPEz0PlYRkn99VKX5utbhS
         zuHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=nosvNo4F6KKnFxz2R5KcFgeC7NJoTopKPAiVlqphWEE=;
        b=yPvlOLrCktidrs8i5v+qwd1AaRYXBcN0cfFqMKN4CrNM3w8m//rdD5N8e6LLYsbRVR
         2U4p9OUepAV9qSvlazPFKjywJ2GXZSRKjG0b0cjMjPGpRacMsh4WRVOlonr/69clIgDK
         +Vec5pNXAe5YTBOufRX9y0tkrDwHZ5EU5ygoc72uozJHAJ4s3xteJ/c6iiWjDKLLWgHl
         ZIfgNAl2PU+UnXMbB4N40CfSOAfvfPeColnoJ9atUl/ZKugIK/UboyqqxjfrCpTNfc5s
         UHLM8swOPTpbzs7p40jMUiedk4wmhcq1aFj0Tlo6jvSVqP/o5/b/Ldz4UaGinWn7BlAq
         0WEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nosvNo4F6KKnFxz2R5KcFgeC7NJoTopKPAiVlqphWEE=;
        b=hA+pLLB/Yyz+NAb0tBrSS2sKfZZVMjJ21nl+ZtapUMTTnBfw/J6bxW8hUo7/ye4vSD
         oXsmE4O24A8gutv5dFteaElIAgioAIpM5N2XPgjnUUK5U0acIsBOL7uE4RCqf9S3bVcr
         LdhLZ+9QZ7ZoHzLPWAEl7Ft3ZF+w14eqyVFrFEs7H3f3DJWI1EQ8GjL/cNcMa+npZLPn
         MHaV5aFetsLEb8oaVoZvKL6Md7t9ZbWZXFeajAaj6qEfWCVfKzTk8lbuwb8YdooexVj+
         FdhADLe1/AzDklO0le9OTzdEkYaBgDIHt92evqA2IlSbzD0ELfbqOk0zEoFouma3BXQu
         AvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nosvNo4F6KKnFxz2R5KcFgeC7NJoTopKPAiVlqphWEE=;
        b=QwVyfpB9UxR0hfUw99VVG7tnnHqWka5vfVancBFd18oszSG6fM/4O2EJ1hFtHHqlUj
         U0w6/4R9XxFrsJ8a0HOTlhKorlIv45p2T4sluDNlKk1QJWhA8S26k5ck7PmR6C/4WEYa
         oEF61nmNW//5jOmX7KPrIHJ/CsgDzHflSA+C4PP/xHnsU37c8mfkd7tezx4mjL68WbbA
         jgZhY2ZFehvXPNmGKyU8W3iOeWLTJ2Ls9796qcBjFb4JecZDBmMSQMbiZULBfvYypUQU
         r6KZiisshMBiFxYnjVwg41wnLA3a24AwISQTIdp77k0JEfqNi0OFD2P62b+aVr2+I3ez
         /Wzg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531eIqmXOpogQingFiWA2+2kpe4D7x+wHvWlBTrugH7PXPkHHs7O
	f3B0Ut7aDXFgv/oydsqAWIk=
X-Google-Smtp-Source: ABdhPJyK2UwkeqbzwiljLn//F17a6UyMRckWr9WyJh4OZf3Jtiiba+hpJwkXbGvwZ5uB6Gr1somkdg==
X-Received: by 2002:a5d:5549:: with SMTP id g9mr25315086wrw.419.1595280474126;
        Mon, 20 Jul 2020 14:27:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81f4:: with SMTP id 107ls303048wra.2.gmail; Mon, 20 Jul
 2020 14:27:53 -0700 (PDT)
X-Received: by 2002:a05:6000:1008:: with SMTP id a8mr24597422wrx.416.1595280473452;
        Mon, 20 Jul 2020 14:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595280473; cv=none;
        d=google.com; s=arc-20160816;
        b=jqidsdaf1nFZ75L2PPNtfR9UZ+kXP6M46uGAi2ClNI5SW/w1/h18cN4h4nfhXzAhgO
         h3YVf8L0YBC9kmkwUrzBPUmxMbjT0UWvpyj+/Sr3msU3/Wcm5yhG+yjYefRZmMXj84xG
         Pnt4d/5Z1HKPQp7S+ROeo2JgCy8UjPQPHfOWO1XPQJ0jXN8Nx/tcfe0Bcg5nDQnsTcy5
         kQvJSAaD085FiNrEDzaBMuJ6kjLZIbtwP/7LC6T0FF7Bdh2dfqiiw4jiXC8yqYADepze
         oo/QLxb0zenOAnGa/nPH6eHA5WW6ZBS0EhtdcODsSNH23mv9cq+mGJJszIiGcsWxCH23
         MVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=+3AU2OeTp3gr+7V2I19pbn7862eQCyGJGeqOxvDj6aM=;
        b=vSTtorBctBaqbYWI63iF0DQKkFl9XOzqG2k70o7ciiqgiQy+sI85jELAzWF0sxjkNK
         VKTPy9Ses9rzsUc9akIOwukR15AXPOP55UGt0Abo5zeZho98UtxgjTkPLLxzSIn1oNlP
         c7EIjdDE5NwVkOoYJ2yfBwJ+AdlNOVm3Z9tdGSdX0zBc5XW/eQfIQK0PkgmePmtjXJbU
         l4w56lsnQ5wey+tYUOvCZCN6sGo7miCe/ApTVlsgmZvPGxoOlBY226BBKjtj/r5k+QVE
         aRppbtecAKtki5NhGD74eBsO9stcf1WhfiX3DHts/6L4THIdsAOxLJPyUWxknHQxyH1w
         sJDg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id g14si29178wmh.3.2020.07.20.14.27.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 14:27:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 06KLRirU012495
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jul 2020 23:27:45 +0200
Received: from [167.87.88.27] ([167.87.88.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06KLRipM026913;
	Mon, 20 Jul 2020 23:27:44 +0200
Subject: Re: Is Jailhouse already used on products? And if not what's the gap?
To: Rick Xu <cutfield@126.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <4f73eee2-1784-4049-8fc0-6a889e2ea419o@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1e8a7abd-91e8-26b2-3446-e9734bcf8d86@siemens.com>
Date: Mon, 20 Jul 2020 23:27:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4f73eee2-1784-4049-8fc0-6a889e2ea419o@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 20.07.20 09:57, Rick Xu wrote:
> Hi,
>  =C2=A0 =C2=A0 I'm very interested in this project.
> For 3 reasons, first, it uses a LINUX as a host OS and then changes it=20
> to a guest OS, so a running host OS was saved.
> Second, less virtualization and more real-time.
> Third,=C2=A0 it's easy to use.
> So, I want to evaluate the feasibility of using it in an automotive syste=
m.
> I want to know is it mature enough to already been used in some=20
> products, so I can use this information to enhance the customer's=20
> confidence.
> And if it has not been used for products, why?
> Looking forward to your reply.
>=20

Jailhouse is primarily useful in two application areas. One is=20
real-time, splitting of high-performance cores in a AMP setups without=20
much hacking while providing minimal latencies. There are users out=20
there, at least one stepped forward officially, see [1]. Furthermore,=20
Jailhouse is part of processor SDKs that TI and NXP are shipping to=20
their customers, and not only that just led to [2] - which I think=20
speaks for itself.

The second, still more research-like area is functional safety. This is=20
our (Siemens) primary focus with Jailhouse. And while we are still=20
waiting for and even collaborating on developing [3] a certifiable=20
high-performance multicore hardware, our discussions with external=20
experts and certification authority made us confident that a key element=20
of the software for complex mixed-critial multicore systems - Jailhouse=20
- will be very well suited and efficiently usable. Once we have a hardware.

Jan

[1] https://elinux.org/images/6/6e/ELCE2019_Poster-Stojkov-Jailhouse.pdf
[2]=20
https://github.com/siemens/jailhouse/commit/b6715a3731249ec09a280b2fdbf5e43=
85b1e6677
[3] https://www.selene-project.eu/

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1e8a7abd-91e8-26b2-3446-e9734bcf8d86%40siemens.com.
