Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3V75L6AKGQE4S6BJAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D4A29E9C2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 11:56:47 +0100 (CET)
Received: by mail-lj1-x23f.google.com with SMTP id v25sf1135436ljh.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 03:56:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603969007; cv=pass;
        d=google.com; s=arc-20160816;
        b=jrss3olnuiE2r3vrBrOmqTmnE7bU0MpTKmx+G3oqp73nOdpHV0Fp1byqMvnLWYcsK5
         5AbwcynpYCCvS+yWYd30Lb15k5Su2qO19fORTGaEQqCONldJMb4//q439SbWEU4JpTUX
         oT16Ciwa0DjnAzudIXdeImiwBH57xT8bJtrL7BqawX0Lz6Fgmp5LMm94z3eyrCDUZAOp
         v3i4HX47p5Ae7fHDg1WvEg7jmDfROW6Au9sho9cf1HGOa+O2Yz0/NJ7vKYFtTQ/5hKrF
         otwVKBKELT22dIKZuumH/hOB9ZlierwtxVtxZJKsRldJHRsBjkzJjPcvF3rEE853OBhn
         yVOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=SS4A04/atZH7xQaAl024KMJ2r7PnmWUPhGRpKJGaGyk=;
        b=ztrfL0AQ3EC72Q0li5vDmD2vH/IYxo8lDyfFDEJRAJifZzULi+0Qh5PjMw9TMeJQVK
         eM2omVUg9PklzE6jWZb9oKW8YomazknDHRdoRaeZv3l49/TBxI4B1I7ZYmkaTuR944el
         8eULgn8EJFiti9m8aooShFyxH5WSt8gvC1a/YbN5SeK15OMFu0ZidiXFzVEEI1uwP9Wj
         rz/ZrMMvzXho8WgKSjfSHTzcuus1ZuBQ8cDNp/GuiQ5W4/AyDPw9ehbc4vezz8qXghqY
         GdOQzHn4Lt6u5Va+a07XvTxw4QbwMSSonE4Iz7j7VRqMsuVX/0SEiZRyk8cQT3Gdj8vi
         W80A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SS4A04/atZH7xQaAl024KMJ2r7PnmWUPhGRpKJGaGyk=;
        b=rlpWLnP5kx+hzWiY77cAplCvEObYZR0pA0+RU05b8n6f1YVtmXvykwM5aHgr0FVzzv
         tVv7y2wyHlbaOjeK7ef2/kBtTxhIX6JJ4QKw/u9YP7qaa0EG1hbMP1dnXdyWiLTnAJ5D
         /O94ATKbCfuqmhnWmfliVoVTQtEFuc4T0sUhKVBcS3WW6kUuFKYEXB6YdizW9WBxAXVG
         pSZEWXj5uoYpnj5+6YxnhX39B7vK5HUHLH8tsM1x+qVc6z2eNmdFWA2vYwsverPaCdyX
         1covO8UZaxCaoYcrViw8VEeNKZvvdp/Fbsi3zkQQEZKwCjyB7BuTdNMZaaAW5DmCLkxB
         clWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SS4A04/atZH7xQaAl024KMJ2r7PnmWUPhGRpKJGaGyk=;
        b=hfLx9fEPdgl9/YKtjOpb8yf4vSy/JCpU3Tv3WykbZ8cZpYd2xRLSFNeI/KaxhYXUun
         euv2G+Q4NOE1HH5nj3BntGZk1ILQgmEAZbk1JmKf/ZtLGYJaPBaaiVOZvScMaKmkDZyP
         sJFMWNlZNOa096+HSWduG3ODOGWwoubL7YvK9XynVFamDjm4r3rcN8bYDppIZXI24ClG
         V2M22Vf5y9+yx9XRTK5vMZuYvdVa8znrsn02NiQ0jDNPp+ciQBw6L0OJ5N1E0QPC0fkd
         o0vk0mfD3YUGSwwHqGzvImbdHWrA4dPJk3eQ3UuoBbMhnFllDSBVNLw2WYCrdWB+v3sJ
         A+MQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Q9JDtxDgAU/Xn/HinOlpc43jlVsYsoeCxfQ4MR+pbjN9nQtI+
	YnwK0wrzNH6zXaot9E4PmPQ=
X-Google-Smtp-Source: ABdhPJzyjn1YB50INUNMrz88UJguPWyCWVu2TFHGmoQxBxHJ8kncFuK3bO+1+d94l1q2L8wQ7qkA2g==
X-Received: by 2002:a2e:8612:: with SMTP id a18mr1439359lji.255.1603969007116;
        Thu, 29 Oct 2020 03:56:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:888a:: with SMTP id k10ls440308lji.10.gmail; Thu, 29 Oct
 2020 03:56:45 -0700 (PDT)
X-Received: by 2002:a2e:7c17:: with SMTP id x23mr1702086ljc.366.1603969005815;
        Thu, 29 Oct 2020 03:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603969005; cv=none;
        d=google.com; s=arc-20160816;
        b=ZDHC3EcUMZZ83TRQP5XwAI2RbZFRngxcUk68ZqsGab1s3BPlLdsobLmb9r97EikLcN
         tGFfVj37QB1GGbwiyiism2RwQe9yxQctRQXctT5cH8974fjeh8tkk7zE8sqCl7DGuM3a
         AkAQ8UhZRTdCPrEuWHB3cnUUklTJGc8mLYeKl9r9l0Bcxd/IHVs7JrUcE0Q9Ym8skTq2
         Fafr9lxgWJKAGjzjDfGVknqBhvQhvj6rIjY3lWIVcmazn684yVbaTe6aXq1DhWQIkFDd
         /z5bnv+ziQrDX5zHhcyfjHTlUibsJ8ux8hWQGbjzWsLek4/TEyxwnkAcAzkbSON2g2hI
         tw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=G9OBI+7+qudtEWztsBw64v+AJLjV8TGqUZ2BpFcX5HE=;
        b=hwpKaR2EPyXcYD8Vo1cNeHHNhVMZw93rNF45ND/lWBoD0oHm8dsCIgLctAs1X3X0ir
         OlW6OAYH1L31ST4nw4j4RMIlrH0G63p0j2n8o2eu3p7vEs9sC657vVhyLzxEa9kkr8Jb
         wlSj3vHEEBHEdGTXLWG6CBRwIlMPV68YAkHuyeYnBWmcGaT1OKRhBfUaeh1cetIIX91A
         NqERM6m/TfSQLJ/rPtXkrc+1S5LGoEvrrST5OYNZDWj7d2AkS9CECGBUQOHtREUfFpwt
         3VJiSy5OkjVPF94s0XrAjy99BuGDBPHLw2KiGfu8IaIb7a3teeOXSCroppFssf2e+AcI
         KVYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id w28si71524lfq.3.2020.10.29.03.56.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2020 03:56:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09TAugrc028183
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Oct 2020 11:56:42 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09TAue75019019;
	Thu, 29 Oct 2020 11:56:41 +0100
Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
To: Renato Mancuso <rntmancuso@gmail.com>
Cc: Andrea Bastoni <andrea.bastoni@tum.de>, Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>, Renato Mancuso <rmancuso@bu.edu>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
 <78334f5d-b665-8de6-31fc-10599877b3b1@siemens.com>
 <DB6PR0402MB2760F60895CFBCCAEA5F2F3A88160@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <bee3d688-1c2d-f4d8-f434-b9ff8d50ce10@siemens.com>
 <fd8fe9cc-9e69-4406-21e2-979b282b6d16@siemens.com>
 <8c0cec16-dc86-b316-ef84-af51a15c80aa@tum.de>
 <4b408440-354d-521e-0a88-e1541eaed1d7@siemens.com>
 <fa5b83f2-fa5c-e158-4b99-cc86db20ea43@tum.de>
 <eaa35809-1823-9bac-a971-12b9e4a2ec54@siemens.com>
 <CAL30Xq9rJCRQLTqdhuMdLz+RXEoJDqv+r4jZVbmmX+FnqvvBCw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e0eb91a0-17ce-383b-51ac-2bb41071a3a1@siemens.com>
Date: Thu, 29 Oct 2020 11:56:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAL30Xq9rJCRQLTqdhuMdLz+RXEoJDqv+r4jZVbmmX+FnqvvBCw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On 29.10.20 11:49, Renato Mancuso wrote:
> Hi Jan, Andrea,
> 
> Thanks for looping me in on this topic!
> 
> Just a not that I in my version I don't just recreate the root page, but
> the entire page table tree to be NC for the SMMU. That immediately gave
> me a stable system on the ZCU102. I have tested that even with a
> dynamically recolored root cell. I haven't tested with colored
> DMA-capable inmates, but I'll do that soon as I have just added support
> to boot colored Linux inmates. I keep SMMU and CPU tables in sync by
> duplicating any change in map/unmap operations at cell creation time.

That recreation is what we do for VT-d vs. VT-x as well because tables
are incompatible (at least in the VT-d version we support). On AMD, that
is not needed, and I thought that the ARM tables were designed to enable
the same. How does Linux handle this?

> 
> @Jan, when I started working on my current repo, I did it to quickly
> port JH to a dev board I quickly needed to work on (the NXP S32V234). It
> just so happened that I branched out quite a bit. I am quite happy if
> some of my effort helps with upstream dev. I just don't have too many
> cycles at the moment to propose well thought out patches. I am actually
> looking forward to having this conversation in a few weeks.

Understood, but "quickly" is relative in such complex topics. The more
people can look at a common code base and share thoughts, the better and
really quicker is the result. As you may know, the SMMU implementation
of NXP had a long out-of-tree history as well, unfortunately.

Same applies to the coloring topic, so I'm also looking forward to get
central traction on that soon, hopefully.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e0eb91a0-17ce-383b-51ac-2bb41071a3a1%40siemens.com.
