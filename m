Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVN5TDUQKGQERE2XJ6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C61A64B63
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 19:22:30 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id y24sf1980131edb.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 10:22:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562779350; cv=pass;
        d=google.com; s=arc-20160816;
        b=bg1+j8URPrxPAUBeo1VyCZE/EPzfBEKOjXYPRuH+PxRPJZGLX3d6Y7FCD05txgxWd6
         aGeCUN+qy2wyRfFhZaiZC8D145sQDfrGvGTGvJY4J1UioPXdtb7Q8oybzYkBJdODMLTK
         hlmI5v8stDSXW/kbX76yPq4sRaBtdxk7ttYoiVKZp4ZTHDuSZeHvwU3fBXnm63EttRzX
         WYG91ZhTrgmx7UVvGOpxXCdLTivNn1IFXiv2p25rcZH1ytpxPXeJqwBMupHbNCINf1yd
         45TvkGxeScBwf2BczQnyIBJziEeFfoa/h/ih1Mqmmfcsn8wecAa3HtmRZ9e82x+6NX76
         h0IA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=RHdOjlgn/uFql2bwo55iSafw3/RH3zMZ0oee/6irY2s=;
        b=HNoIlY2TjPqAJhxA6tDXqUMYmvL1HGwD7KhXIwv9mPuGmEj7uOZ/DLyJnU8kGFET3x
         DwAiDOl47co2lvJQmde5eVEY94W0TMcQh5E4x1Hvy4A4bUwa7oUrSkYVCwHUcZ2BKjKZ
         CQxrO3XcyClFmHcoWCBrwilKy/2BCUwKdqSV1cDdvP65WQVfxM4UwnbGFUyKMEn+4Sfl
         HMi6th8g+wtBGSp0BXf+mFSK0wmHJ7q1GYr6bk/MmyrV8J2H6gEBqJTkNdueG6LyVwCS
         KSqFjfV0u6GU3WlmxFuAdd2JHeIDXTl9h/twarzYXZBHG8Sv4dP7sMmu0OvcqSuDcjtN
         WtCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RHdOjlgn/uFql2bwo55iSafw3/RH3zMZ0oee/6irY2s=;
        b=meedunYWqnabSatUezxm70gjEu31XKrpMRb0qBc7kdYGfL/DQlUnWsrIRkbYWeIn5h
         bvTl5ihLR37Tuf1xndNgHSNo+Lpjv5ZFf3Yo6uniYCCli4GCh0OV0IVB+0n1TNKkuEfQ
         sP1gG5yh5PokkNQ/MPwWuwCZwK4yOPYVQbsMKTfAw/vBWA5WCyKOKD7E7+M5hwTR2mGl
         sqBlCVIs3Dpnlhub2onqS0Ow2KKSez8V7LrcOmO0N3m37YBrvQkn/Enni/bRttWVE6Jt
         BcF6n4NMgwBE/ubpXszXLg/Hp8/KjxtJwURCzAmjzVSMAbpDZLUpJGDSi0KbjAxSG60q
         SaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RHdOjlgn/uFql2bwo55iSafw3/RH3zMZ0oee/6irY2s=;
        b=ATYWYjILAQKzfnBKSBSpEPO1X7j1a13Xc9g21A9TFaCkbU4kM9psnuZfsgCteL8X9y
         nu1ZSoLYZb1l5b4TtdB6L9t39vRtnv1yXV5BhJlOSfWCd5vVpI5pZ7IDbY2zXpDQ+KAV
         xLk01QMQXNkNcpZIe1O0LOF6nBkoV7rDklBccejVyfw1rtm1xtEkwbVrM8Eopc3jg7KO
         gVl9QCqngskebux4U7N2ZTV+s6OhbeLFFfy6rMoJDoIQukquznW8GGs2eKXUz7aOxRLa
         Jl5fSiiwWdEFf0+/PwbkT0x5LtKT0wzO47IMet5/6uRtDulFgGte8mG9j/9cUWtM1TCL
         7x7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX3pEuE+PU3n8yoV2E47tIBanJYg7/Cr1KmePDMy2BVmMikr1DP
	Nz9NgmFWFx7mSsGKkByWtnE=
X-Google-Smtp-Source: APXvYqzd1rQ162CAeq9kRa6hcLv8/O9Jn9s4EZn20yTia99p24nEGQXPeUXTlWgQ9ew6msjTauZL6g==
X-Received: by 2002:a17:906:8053:: with SMTP id x19mr27536695ejw.306.1562779350186;
        Wed, 10 Jul 2019 10:22:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8efb:: with SMTP id x56ls817999edx.9.gmail; Wed, 10 Jul
 2019 10:22:29 -0700 (PDT)
X-Received: by 2002:a50:92c4:: with SMTP id l4mr32921830eda.34.1562779349538;
        Wed, 10 Jul 2019 10:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562779349; cv=none;
        d=google.com; s=arc-20160816;
        b=d5bWoWFNhVlZowzy2JuPZL6NoIHgVwans5tGubVck6M/mv3Ge/lOd28rNY3XP9V8pq
         y+dRa/WrFT5YoddaJ0kOr+rG5o2rAqC0E1I9Agedmj32amA7sTvhGc6KwFq+nDWajXpk
         q1iwv7vp9QPBSyOsWq62xMJa175IiZ8sGH5rMuE+SLZA5Ck5ZfYxZIL/XJ0FLVKN2WHu
         18e1dmU0YMKExoHqHB+F0Sa5kPAn3ACIc3Bo+qnIZECscghpvX05F8YIst/2Cyv0MMzi
         nn1GCHasEVv/836K1cVyzZBeCAThoJZ0dQzF93DpvNVW8SqyZraCiW62mxZF0HuwVUWn
         Bdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=pf0lLNgRxNSQgTjpXjnpactRE2yiHmwOyjTfBAWBASc=;
        b=qsFoMstX0XyBX7yWP7CddNl+vtjshYoAK2C8B2L92H/VLaX+Y3bDUUYnTRfpMjYtV1
         jhlByFFhx1EwWH8rSYC9goPEsy/t9XNNx+frwaH62JacDrsuFsvkJezvJHizwMvLV3qO
         WLwnUDEX6rMQ7E6F99ZwOwf5iF2JQpv0K6XfiIdrP3+hNHJoFuQ58wZmg7CUkpgtr6Yd
         2YRtnNuXBY3VU8luAwXrbKK5ckw1dwxRqo9SYRE6uzl8JadHHzd6yqAzYcmK0FKc0fQ/
         ybu8zyUTd0u0925Mrl4fVzC1sPXkFfHcgzioSGk0JBrrViLsvFdBhqcsDHVMvvwaOxeE
         Ywpg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h23si157880edb.2.2019.07.10.10.22.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 10:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6AHMTjA007532
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jul 2019 19:22:29 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6AHMSWd006075;
	Wed, 10 Jul 2019 19:22:28 +0200
Subject: Re: Assigning a PCI device to a non-root cell
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <7f2b8593-b6bb-353c-1eb8-604076f7da6b@oth-regensburg.de>
 <521c1b04-ab40-e566-5625-5827d3a7f2e2@siemens.com>
 <46aff85a-01ba-875e-1752-cb40f9080b31@oth-regensburg.de>
 <99f6615e-3621-3a7a-7bea-33839e48653e@siemens.com>
 <f7f0f3d4-33e7-bc74-7bb9-79cdb8c52c0d@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c6c3d947-d6ac-be55-6094-9743a61ccbbd@siemens.com>
Date: Wed, 10 Jul 2019 19:22:27 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <f7f0f3d4-33e7-bc74-7bb9-79cdb8c52c0d@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 10.07.19 18:28, Ralf Ramsauer wrote:
> 
> On 7/10/19 6:13 PM, Jan Kiszka wrote:
>>> Ok, there's one chance left: According to lspci, the device actually
>>> supports MSI. It's just not being used by Linux. Maybe I can somehow
>>> convince Linux to switch to MSI.
>> Latest kernel already?
>>
> 
> I'm using the 4.19-rt jailhouse. Do you know of any relevant changes
> upstream? Anyway, it's worth a try, let me test upstream...
> 
> At least for 4.19, it looks like I'm not able to easily switch to MSI.
> At the moment, I don't even understand why the kernel actually uses
> legacy interrupts, while MSI cap is present. Something is odd there, I'd
> expect that MSI is, if available, the perefered method. But even the
> root-cell after boot won't enable MSI. Still investigating...
> 
> I hope that I can switch to MSI with maybe a dirty hack, but I need more
> time to dig through the kernel's PCI stack (PCI starts bugging me). You
> can find things there you never wanted to know! :-)

I suspect you are using some 8250 derivative with a similar driver:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=172c33cb61da0df5ccbdf1a8e736c8837d165a00

Check your concrete driver for its interrupt allocation.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c6c3d947-d6ac-be55-6094-9743a61ccbbd%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
