Return-Path: <jailhouse-dev+bncBC7MLAM5YYDRBRE73LUQKGQE2LCIEQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FA7710AC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 06:40:36 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id f3sf27448714edx.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Jul 2019 21:40:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563856836; cv=pass;
        d=google.com; s=arc-20160816;
        b=KUFEcWxQogen/3Btiujzs4Hvp/SSsUmvucIG0ZvITQU5AOP/W0eVh6MmjJgdvxD7SA
         xEWwz+jRzHJRje8OMO1tKA+Wwt/9QEF099Z6oSqWmE9OWpM2OAAV8rE7hV/+6ISsSWje
         I+Cbhr1gUpQL7mODXhKdXLdZVo9u5mUGE8/Tv9JBDAJXB2Hl122MwAqLPuPLiwyHdWLI
         Mn75LpJbcKWm9lc5wyprT2iQ7fnrNjBN8H9KF5rB+n/qS/LEv8nRsEKiCrVCWGluvj0D
         vpWSsas/W0Q7NvPXO0q1LLEsYEnMQf/8OMaTf0lkp7INKcylxdJg/ffsKCSEcZOzwdvp
         DCKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=1UrqQw8kcm+6YalHvgsEyBa/Gbgfv/mdjWrrXxBMsAQ=;
        b=f+VQOIcOd34jsv/5SgE6pH5u7ChR726+W4UV4jXZzH38HgA2TknqcWY0VfYjppfcVU
         xvGSZ9DoEksn5WKUIoApeNAGGgps8TbqGPNvMkiZSmF6rV+4wyEcAb/vaiYXDDXBw3hY
         gG+V2C+Y6ZHo46uED8KMKpl0jk9s12vt7fJFgLBQ1jWBIFUYPtJ5kZeJXzElCFF7Lnr/
         DIvaVOy6emp3uT3hiDhwIjYq38nOfCt9Y6e00ks4hpvxA8FCv3ga1HhHH2+kcaGXIPK2
         y39fCcY2+BcZqP/EVz6nbtf04LP035/SSKqfc76+opxG2AINMCaSscd3MOBoM7aTXHAZ
         n0rg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of antonios.motakis@huawei.com designates 185.176.76.210 as permitted sender) smtp.mailfrom=Antonios.Motakis@huawei.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1UrqQw8kcm+6YalHvgsEyBa/Gbgfv/mdjWrrXxBMsAQ=;
        b=Poe/IoFHNBjCq3hSCfBukK+eXsitJ0BtkJWAd6dOGx2v2xLlR6NyJmHuMKOBctOB5B
         PM5btG9D7bOlfap9tRB0yxoA33FZsc6y4J8FTtFu3pjN0cKkLUbnWZeYZCw9psBkUCDG
         +7SG++Y1EvpT8BvivQoVFEY0TObA4EhD+9cZVXSOJ1qXZDkaBJJtAWmO65hXbBeJ5F+e
         mlFukkV3J2kF3uolz8X7r4awzK61WMluIOtZ0Jm1jboPTtrRmKX6aqGfeNKp8AEy2KqO
         0dO7VLnP1EJ1/RPvJ/WSkwNIJsjjnEM5+PD3VPnRUWZBNfzCbmJT0bTv98g9OlQAe2cf
         Waaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1UrqQw8kcm+6YalHvgsEyBa/Gbgfv/mdjWrrXxBMsAQ=;
        b=mQw6d8AEWiYNPI/41NISbSFVRKY/MJ0/cjIQzgEqcyOe4y7nr8DwlwKGBcNs7vpu6G
         +RMBTI/ox6fFRY6UnYjXC1xVkc8VNNpHtF046Iw2tbn1Hf+DXoCOK6M5qV3GuU/9tO+c
         yzJCJonzRSfaPZb/2cl66UqNGlk889BJ75yk7DVKTnd8ldzxZ2wZMovsM/NyI9PJvbkc
         OPyQuJ1cm5JT46P7+2tXY4LXZszR1WIbBzIIoaAAyPs79Yw7n17ml3NE8CJGVRjrSLKi
         0pNFpKc4MkDWggY2fMWpte6H2PJ5wcCHS2NtFeeH9Co6/RYuT5C0flu79g5gvMiu/PQk
         QPzQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW7ZtD33y+4ex5VN9EDR5sZdaFBSgUvjqmP2rlbO3vZNBZD5YhB
	05hi8P5zTBRocDoee4K5vm4=
X-Google-Smtp-Source: APXvYqzWTDm0JYAERryG+0RYFG2fI3GtghlDWsQhJ83z8IDTsDFTgT3HvidMTbCwMETAXPPOL6MNcA==
X-Received: by 2002:a17:906:2510:: with SMTP id i16mr55873308ejb.130.1563856836665;
        Mon, 22 Jul 2019 21:40:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7a05:: with SMTP id d5ls8718351ejo.13.gmail; Mon, 22
 Jul 2019 21:40:36 -0700 (PDT)
X-Received: by 2002:a17:906:85d7:: with SMTP id i23mr55751186ejy.119.1563856836039;
        Mon, 22 Jul 2019 21:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563856836; cv=none;
        d=google.com; s=arc-20160816;
        b=Zbu/ylT40fo3Gls3x0qexifzkJmqjYw2pUJ6t0w1S95LWczre5ZRczQ21TpptwaVKS
         xz1QU+vOwAY5r1rdA6UFc8nNyULMhaNDUbWi6t8IGWxTHBWaQhMKTmr2mgvurBi/Ivna
         5N009yiClyHr33sN+qG89s8CbvwnT5ZMHoWzy3l+kJqi5eRSJqj7ydPseHe6zZ8Ch6v7
         Jiwtbei2tg4vllFtlOeKKu0N7sDBqgM0aJWsxDIrsUnALewLBL4N3qrkBVzK9kIhJxAw
         YwRM/9tQ+Uifwjrrg+ZZFfH0Qc32HvUIje3/0DCl2Zdkrsr92HhnVFcwNeTM7r0EhZTo
         c6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=LXrDtf3EPrW0Jgmy6HVDCFs21mtbtYhbSk1AWOfcD8Y=;
        b=tnS8YR/QDAqQ5DKUzf67enzg4kZc7Qf1hyDvmHvrKxMcvUbzBSH19Wqsm8vHhxr0O5
         D6czfLCNfsJwFWyvrf7wQqjwIUmb38oqyKbKX8sRkM1rOaKx82yku588ANiICzLCrKPg
         iswwmiVdadS+sWerBmM9izsMFOO1yg6s5VmKwdOK3P+bi6wXdFXfJqOSEWuljrbRx+XA
         b/08NZKcn7RDwzS6fuedYWqIOE4LZFU/mGIlurikH2pSgX0Csk9e62w3QGtjAdvpK3yI
         5fdSiUQn8Vxc7AzDiI46YR6IUkjA44wcYaZYMwR5jvEC1TQ02/ExpF4hQJDZGlQ1hMGu
         5ZPw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of antonios.motakis@huawei.com designates 185.176.76.210 as permitted sender) smtp.mailfrom=Antonios.Motakis@huawei.com
Received: from huawei.com (lhrrgout.huawei.com. [185.176.76.210])
        by gmr-mx.google.com with ESMTPS id jz14si1827020ejb.0.2019.07.22.21.40.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 21:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of antonios.motakis@huawei.com designates 185.176.76.210 as permitted sender) client-ip=185.176.76.210;
Received: from lhreml705-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id B3B7A5AF23390C4CF339;
	Tue, 23 Jul 2019 05:40:35 +0100 (IST)
Received: from [127.0.0.1] (10.166.199.110) by lhreml705-cah.china.huawei.com
 (10.201.108.46) with Microsoft SMTP Server id 14.3.408.0; Tue, 23 Jul 2019
 05:40:32 +0100
Subject: Re: AW: 64 bit Hypervisor crash at 32 bit WFI instruction
To: "von Wiarda, Jan" <Jan.vonWiarda@emtrion.de>, Mark Rutland
	<mark.rutland@arm.com>
CC: JailhouseMailingListe <jailhouse-dev@googlegroups.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
References: <95F51F4B902CAC40AF459205F6322F01C4EE0E3CB4@BMK019S01.emtrion.local>
 <20190722094752.GB28400@lakrids.cambridge.arm.com>
 <95F51F4B902CAC40AF459205F6322F01C4EE0E3D14@BMK019S01.emtrion.local>
From: "Antonios Motakis (Tony)" <antonios.motakis@huawei.com>
Message-ID: <5518ab89-15c7-c1c2-c56e-f840cc296cec@huawei.com>
Date: Tue, 23 Jul 2019 12:40:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <95F51F4B902CAC40AF459205F6322F01C4EE0E3D14@BMK019S01.emtrion.local>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.166.199.110]
X-CFilter-Loop: Reflected
X-Original-Sender: antonios.motakis@huawei.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of antonios.motakis@huawei.com designates 185.176.76.210
 as permitted sender) smtp.mailfrom=Antonios.Motakis@huawei.com
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

Hi Jan,

On 22-Jul-19 7:11 PM, von Wiarda, Jan wrote:
> Hi Mark,
>=20
> I'm not touching bit 13 or 14 in HCR_EL2, they're both 0. HCR_EL2 is the =
same for 64 bit and 32 bit inmates when the crash happens, except for HCR_R=
W_BIT, obviously. HCR_EL2 value is 0x28001B at crash time.
>=20

It's quite an interesting crash that you have there; I wouldn't expect this=
 to happen.

The idea with trapping WFI/WFE is to be able to suspend a VM that is just w=
aiting for something to happen. Since Jailhouse is a partitioning hyperviso=
r, you shouldn't need to trap it, nor should its use normally influence the=
 other cores. Yet something is amiss here.

Is the root cell cpu (CPU 0) specifically crashing with an unexpected synch=
ronous exit to Jailhouse? What is the output?

I don't remember what event 0x28001B maps to, I would check the ARM ARM fir=
st to figure out what the unexpected event in CPU 0 was, for a clue to moti=
vate further investigation.

Additionally, this WFI code instructs the compiler that memory contents may=
 change, so ordering of generated instructions, inserted barriers etc, are =
influenced. This is a far shot, but maybe the code generated around the WFI=
 is the culprit? Maybe not, but I would try to rule it out:
(a) First I'd try replacing the WFI with a nop, to observe the behavior wit=
hout the WFI but without changing compiler behavior and maintaining any com=
piler barriers.
(b) I would also try replacing it with an infinite loop ("b .") to get the =
inmate to wait forever at this position, and see what happens.

Happy debugging :)

Best regards,
Tony

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5518ab89-15c7-c1c2-c56e-f840cc296cec%40huawei.com.
