Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQWP6HYQKGQEKWF6CJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id BB96F154C15
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Feb 2020 20:23:47 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id k25sf1355872lji.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Feb 2020 11:23:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581017027; cv=pass;
        d=google.com; s=arc-20160816;
        b=obxzrGYYe91q6A6gFr4Z60X6cUhHt6305WMVdg2bKTi8TUIbDOTgchRXAmwqBpdvqw
         6267K3KYlVSeC/+8DAHt/bm87Yo4js7MK4X/kB7Y9dJjDv1Vvr6vvhR+5IPZOTvt49Gb
         5d95an8RXM0bCtTjF5/evQOz0PkyPzI2cryREE8YaOxtnvWt8NwCAVvGXpg44oO7lefG
         uHBl9pi5FMqVE28LMXThi3kkT3VPa7d3AQ3sK1UD2AyGg9qzHmrSnwxZy9/cynDBKPTG
         90Zgz3GwBXxd3+LItxvnRWJgSCZJEQMLHgQ9U+bvQMTdz+AynjirVljk22s3kxAemcEe
         adRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=AqHOMcuWftBNwyNBvPXIGyYxRCEY2FQqPvFdQPaIGlk=;
        b=TTIlLKqvrBhwU/mHcEBZi4UWxaKBFCtK/Xe4ExD7V84KRac3PED8RRZowoMj+OuH0/
         edrifwpR8pNml1M/oHZ+cgi2DYkmxhUuP5BUxIxL01Su7qyI1oI4W0kQq958pkPgntjd
         6+AqxCb3cLgcsDdELOhNaEp8NYf9+PCS6AY3rF8ZGr5/m9L++b/976rDAavkfnE13+i5
         LMq0OV+GaIcDfov0PUBWL9v9pwIJTF0BLMeTW+MgOShiNZsHign0GQrCcr+ob/pQ+i6G
         lCJCs2sPsGktLfHcHMyIXwQXrzN2GtbGuxfRIuj78kv9b5n4Tuj/KIppyhuvwlvmbULM
         ngIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AqHOMcuWftBNwyNBvPXIGyYxRCEY2FQqPvFdQPaIGlk=;
        b=Ad5gyu04G/m0PIACfWuXF6Hf4Qt/EOLBu3HRimJG964Msa4YWJJEAPd1G/r4U2xPsu
         TVJ8FAOJSgXdX3Hv2FWjsIVwtaYPiUdAri24z648+/ebY4DEzNEHtBvpa1syYrHy1UaU
         6SKbrnzVOC1eDPyv5U7fc+0AZ3CIVkM0s1wFS16tdWYKu8GtxZ1pvS01tMNtndG8EyYY
         Y9IttO3+JrOAsvMwjHk6ntazTOaFG01H4fn9zcEcqDM2KCtErSFUJDKgNW2KAB4dPRVs
         WTVNrhuf9qijEUZOrL0tHdrMibd9s+PI7Napm52nWxBmRHPW0xWSK1nNFtC7DBDAivTR
         cZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AqHOMcuWftBNwyNBvPXIGyYxRCEY2FQqPvFdQPaIGlk=;
        b=a/DZUmCDgUFkVcz24CerVO04MT77lA5nRbW+ewL5J9I7HIWKBWvs2cDYUE9rdrzVEp
         ipgrY0ZGTBnb/GfojOf4TupvGaAcA0cFr1LAvsU+q2y+Y4XUZu/teNi+e9aN1r8yP+sf
         suEFO1i1QdJE8KkKcF8iuih7mUZu21J5vpX48C6FO9Tbw7jMDO4tnEhmngZBMY+4pMPG
         ATVOHoh4PZ6tGfrHJJP0OOcNKUWlCN14E3bB7TnaSorfx86LpRpG4xCYsTtAvsQbkh/S
         YcGsbMHwETyiZlMbbli05ugBZBe7aAssajx2buKynYqC+kCjV+E/qEtJlbKVUEmhyEYv
         IeIA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVLRL6eW3H5GWBcxp/qkd7bMesIZV8M4V486koZ/aP3MkA89Nyy
	oOKCnX4ZBjpfzU3+7JM2qOg=
X-Google-Smtp-Source: APXvYqxjGD6BBfooDdSXAEP1fvspSbgxOEDq9fb0fewBipm/pJ1lP+0U3e399pAPsPqnlbXJsv2Gxg==
X-Received: by 2002:ac2:57cc:: with SMTP id k12mr2648466lfo.36.1581017027089;
        Thu, 06 Feb 2020 11:23:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3a07:: with SMTP id h7ls1567963lja.3.gmail; Thu, 06 Feb
 2020 11:23:46 -0800 (PST)
X-Received: by 2002:a2e:761a:: with SMTP id r26mr3042590ljc.135.1581017026122;
        Thu, 06 Feb 2020 11:23:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581017026; cv=none;
        d=google.com; s=arc-20160816;
        b=VDCgznjt4oUrMxgjeX3fTSPjN9eSQMh8arfi8ezQpcQMfDI4mYjIZYT+QlxTQvjsv7
         KoWsVJvB7aMUYXc+M5YAnSZc2KhP9nAQyWT4Az2yq2UotURwm4c4DTuT7wgkEy+Kb6z8
         cf/QUkeD0NUximvbDn/umoFKM/Fzoc2+0PIK62GXny0BHmh5L/FipHx3qTk0q5EnJtNt
         3Pjmwd3RrXaDm9LOC8pTnN3ECZwS07pOxjREbmOA+fU8ZZwdgC+S9w9ayZTd7iqZPIjl
         iWcueOf++BogY9XJ21R18ITg3es2wo6SQRZhG5CGh1CN6Ac/romYMP95kKtd1mRUarG0
         vbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=f3dUxGz2s/3nTEHxwssGPU5JXPpLyTIrAradzngy5hM=;
        b=1EyQcPbVXNOckDP7Sc+nAqa8Ij+7JNPjcHaCp60NSGgH15xQxAh22MrfRw7JB66nlS
         4QvYlC+m93JS2qYbLYvGB8dvt6+wLuPk5sQzCXH3rQZMyz749h/ZR0henrHj0dubHx02
         AeWlIs84T21WNvzSQ/Z0ulmAoc7gfAsrsLKcGQj74tTljXNP7ZfVa+gOcPWj34m240+P
         lMAcg8An0Yk6T34zkj3bG6mj0zjcMw0KKEQVKCVubTewmXPf28nM9foQOMdCsmcmCmSB
         mD+iVGZKUxAzxzhshnda5yvgTuqYif7jNnKGwAXPWNXf1PwcqE5yA2/qi7QtH0HVwzyA
         Ng9Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id e3si19530ljg.2.2020.02.06.11.23.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 11:23:46 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 016JNin0001198
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2020 20:23:45 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 016JNixr003879;
	Thu, 6 Feb 2020 20:23:44 +0100
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8e62e937-be43-4c10-721c-78f2b11a5eb1@siemens.com>
Date: Thu, 6 Feb 2020 20:23:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3d7d68d7-b54d-4610-b50d-528c1c2be781@googlegroups.com>
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

On 06.02.20 20:15, Michael Hinton wrote:
> Hi Jan,
> 
> On Thursday, February 6, 2020 at 12:06:05 PM UTC-7, Jan Kiszka wrote:
> 
>     On 06.02.20 20:00, Michael Hinton wrote:
>     > map_range((char *)MGH_HEAP_BASE, MGH_HEAP_SIZE, MAP_UNCACHED);
> 
>     Why are you mapping your RAM uncached? That's (roughly) only needed for
>     MMIO.
> 
> I guess I was copying the other map_range() call used to set up the
> IVSHMEM from the ivshmem demo. So I have no particular reason.

The ivshmem demo is doing that only for the MMIO register region, not
the shared memory is later maps.

> 
> I see that it sets the PG_PCD argument to the page table entry in
> map_range(). What does that do?

That controls caching on page-level granularity.

> 
> Should I set it to MAP_UNCACHED and see if that helps with performance?

MAP_CACHED. When it's uncached, every memory access will hit the RAM.
That is... not very fast.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8e62e937-be43-4c10-721c-78f2b11a5eb1%40siemens.com.
