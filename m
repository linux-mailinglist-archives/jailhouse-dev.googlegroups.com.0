Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBXE7S3YQKGQEXOHVPKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 989DC14298F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 12:32:45 +0100 (CET)
Received: by mail-wm1-x337.google.com with SMTP id l11sf4255779wmi.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 03:32:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579519965; cv=pass;
        d=google.com; s=arc-20160816;
        b=wupNRwE8HY4YdJmLmXTSbIXz4Bw4Y9BzVT3/henJ7eTzSMD/9NZhYdlPL/7UTpgpKp
         kjG+jjUGZ/gQkacCQkUah4VSnQt0IwSMumQviFNxEUz8VWDB8P9YIlw8a0ftxx5uRV+t
         BcOBPByDLGLJFO5VoX+aajb91f924PLMyexdkyuMi/P/hdRHJs4BWj1CL86inqnYc/+m
         0Z9eliXJsbDiEIe/GJEGz9JVlRcxzSswsYEK/qgc0bY/+p1jdkV9Io/rFsYkZnJLuwTQ
         nU+aZd8wk6okzQC2/X64So45RWCZ1/3sJEqpzL5B8Zy7iWfUH6wBJ3tTIJ/m5EQEs0Hb
         hTqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:sender
         :dkim-signature;
        bh=P7km7vu3tOYlsSYT2pAqGPHvY9G2XfaiHooC234SwA0=;
        b=LBF+kVfVkeKxwou960BlGZV4RG+uKHGHdKmVbeHVs+pxVI7ALPiDQG4ED3uI6CVyGK
         fkoKpjzEtd/oKIvsqeISdaHqxwd00tOM3gsn2zs8KSn3FsknqKkQ9eYoJthXsbYpomHv
         ElHQBcs5LAlqp/b3NG+wF9+bAWnY5nzr2MeybUL1LvzNdxs2aFaaM4ZFhBsJoDDNd2NQ
         g+8mMDeqI6fRX1ne0gNNLwoTJFVt9SEmsoZnMdCi4SCMc1hM/+EberwC5qO5uCU3Xocu
         M2m8F/bXGqIzkW2paqzA70Bo98e+V34MoPn5QmhB0hiN+HZOFbPo1uUk5y2Yd768S+Ru
         u+Ig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=WLQV8yLx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=P7km7vu3tOYlsSYT2pAqGPHvY9G2XfaiHooC234SwA0=;
        b=iMGu+U7oEky6Jyo/Dankxc0qtFvinvp6d2rMMN2d/aVzRynEbNafQmAilEdJ2ACUmv
         fOhXARcwdcdvYoG6BlUVePpxam72VTG9y1GCNvsOVNZgNYAXewBui0AeyYXhcUUNdYYQ
         W9ZLKf2/E2/K0HCk6ffau6JoFssx3+udE9fe1ek4K8kDShiJkbQI03gWCoZH4bpAkbzn
         clXzshOf7ouTrhqfLhBimDPswCzoQT7qy15YRhWksvqeiwFktzfqSZmR7l4BfK3YlxJf
         NMYdDPOIh6Y7yim6kIXAOSaydIH8Z5STnxLWUVzlNxJyfcRa2k20w8t3tYP7SvAWgsHu
         EpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=P7km7vu3tOYlsSYT2pAqGPHvY9G2XfaiHooC234SwA0=;
        b=WTgKWvuX1XNzzKn2qCGPkDagGLNLT9WNyCQvS9spMUL/Ll8wLqI0lm1BEC6qZc8bW7
         HKOqc2SIn6ssM9wEaj96Jr+I2+n6FJfsAOUYSt9mJ9gRrmS+eeuOTUvU/WvNGXu0pd0J
         QHe5Yeco1Z5ioz/mXSdFbg+m+p8dkOJYaaFnOY0bMc4HS7jZfLlwaXH/6AgqIkRfI9lw
         h48AjDfc6fA+sdC9GcHorqgfqWCQbZFdp3QYcWcdWCVStXsVVAthDGs2QAsBdyPk/bMp
         BcO5nI/sm1jPoCC3G6CtehMp287MC7fyq391t8RVKAL5G5z7hw0xDrYMaEm6CZtZJwqb
         x0sw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWwktEl1oIhS3y4f9tG2WLo3F6y36DsjapfPLVkv/D8KBgcDXa1
	gbMyT+aIGTFu3l7nkj/nZ74=
X-Google-Smtp-Source: APXvYqxirgU5/t/5q8IRXwqB00vd2W2STslfmAHeXS3G9vX0R1hvDuQj9Of6wIu/qed9R2FmJOT8XQ==
X-Received: by 2002:a05:6000:118e:: with SMTP id g14mr18619267wrx.39.1579519964839;
        Mon, 20 Jan 2020 03:32:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c452:: with SMTP id l18ls5558349wmi.1.canary-gmail; Mon,
 20 Jan 2020 03:32:44 -0800 (PST)
X-Received: by 2002:a05:600c:230d:: with SMTP id 13mr19196498wmo.13.1579519964101;
        Mon, 20 Jan 2020 03:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579519964; cv=none;
        d=google.com; s=arc-20160816;
        b=E7D0jhVu68M9E4wLjfPEQ4rDKq2cCtG5Dwe0dVWXhYe32VWTBFU9P+xhExJQgxnjBR
         c7YuyC/PZ7dfXcH72EFJzL9bN0urDBG6NeZ1cpheoj73U9cxiHyCK6Q9HI8f2chgmgX4
         umKStoXwCQULUxZjIiJvxdyu6GJn8GL5NP9aeO2spcexLp5m5phcpsK053GgmQhoidev
         jo3Vpku3lEDZwjrx2sbWvhR4n+Kzp04JW8Qd3EAqdr3LADfpSqAu/bJdR4IyPilkN5d7
         Wtvl7A4xWr1N4TD3ta8QLKIcUXt6wHm6cbwcJ0tgfKgqKixvdCN4uxqEAAtKcvg3jjcA
         35cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=rTgoHAoGTT5C+BaU1yDzKiaELWM/P7P+EaXQqOItm58=;
        b=r+kSzaBy75dWpQ5gk6j2QC1bI55xsMRPUiljPU7QU3RG8LuyG9mcVabQeUix8rqUf8
         0vjWiGbMOMXc7jC2meuSVjhEuKosy30VC0MGssnXJ9XwlmlZAOZpPKdFN/6QLlWFg8Fc
         0Dxn7/0ZnLI/PqBd6/9LcXlsfkmeNny2Fy41XF/Ijw8A/EWWpMyq9cvkFaUOBBuXzuFY
         dJieoBXFBl7t2PATZAt6HIhcp2wi2mFm5YoddnaXWhUwTO3IxcgGT4zgIzYp1WBXhIGk
         +6le20UQjrMOke+R/XaEAwLnsQDs9xJ9lPFfW43O+Err98RBM8P9iLx9XAo4dL4+/42w
         bo8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=WLQV8yLx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id p23si693959wma.1.2020.01.20.03.32.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jan 2020 03:32:44 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 481Tzv5JTwzy77;
	Mon, 20 Jan 2020 12:32:43 +0100 (CET)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 20 Jan
 2020 12:32:43 +0100
Subject: Re: Difference in execution duration between root cell and inmate for
 same code
To: Michael Hinton <michael.g.hinton@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <c4f524ea-1273-0bb4-bd8d-c4a0599e40e0@oth-regensburg.de>
Date: Mon, 20 Jan 2020 12:32:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=WLQV8yLx;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Michael,

On 1/20/20 8:45 AM, Michael Hinton wrote:
> Hello,
>=20
>=20
> I have found that running code in an inmate is a lot slower than running
> that same code in the root cell on my x86 machine. I am not sure why.
>=20
>=20
> Am I correct in assuming that when `jailhouse enable <root_cell>` is
> called, everything that runs after that in the Linux root cell is
> running under the hypervisor, even when the inmate hasn=E2=80=99t started=
 yet?

Correct. All former hardware resources are assigned to the root cell.
This includes, e.g., all CPUs.

> Both the inmate and the Linux root cell should both be equally
> subjectedto the same hypervisor performance penalty, right?

More exits, more overall penalty. Depends on your test case. You can use
jailhouse cell stats to account for exits.

Is it a single-threaded application? Of course, your non-root cell will
have less CPUs than the root cell.

I experienced a similar performance drop a while ago. In my case, it was
misconfigured CAT -- too little cache for the non-root cell hit the
performance.

>=20
>=20
> Are there any high-level differences between the root and the inmate
> that could account for this large discrepancy? I know that Turbo Boost
> is likely not happening in my inmate while it is happening in the root
> cell, but I don=E2=80=99t believe that can account for the huge gap in ex=
ecution
> duration that I see.

Could also be some power-related issue=E2=80=A6 But what gap do you see? Wh=
at's
your test case?

  Ralf

>=20
>=20
> I'm not expecting anyone to debug this in depth for me, but I would
> appreciate any ideas I could look into.
>=20
>=20
> Thanks,
>=20
> Michael
>=20
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/4d8ab27d-7a1a-4601-8d61-4=
29dd0cdd018%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/4d8ab27d-7a1a-4601-8d61-=
429dd0cdd018%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c4f524ea-1273-0bb4-bd8d-c4a0599e40e0%40oth-regensburg.de.
