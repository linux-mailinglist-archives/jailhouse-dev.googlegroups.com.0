Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBQWQSHUQKGQERN5224I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA91633FB
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 12:11:14 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id v7sf9461710wrt.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2019 03:11:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562667074; cv=pass;
        d=google.com; s=arc-20160816;
        b=V01hRuHh/u8T0wdEUp9eBPM5Tt20F8QSybGS7Cofh2tl6lNIDjal5slg4U8vLwA2PL
         epbuNcnprpEBUDlg5MhKRoSHvsXbIv27F22FfSNsVYWuhqDJ099DWYf/sqVv2BEJCybc
         FqD7DLD4I9Ltm3Kr+wdHOnyK/+qGJLF/pdV9t6gi93Wa123xsNtjOmS5/04c0dENHdP6
         CyyuqeAVZRaPi0AQKLHhYATmi1zd9MCjq0Qrl5/hSbH7cN0JoPt00DeWpr/QjGbhFQiH
         wrGPoIEdx14v25HcW72bwh0EJuSYT4abJb0kVR9guaX7Od5WIS9siTgnxNzV8vCUeYAb
         wBQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :subject:sender:dkim-signature;
        bh=Px7A/POfkOzZKdf0PAFwsSYbiDSxUhgax/Aown4KQus=;
        b=lSE3goqxUwd7NXd5b+HwKf6YwATm9LZEzBypD56jh3DLfHRkrSekoZFw0imO4OnukQ
         couxKl8Y0FcwqNZKBrBjvWzb8+8tglRrS5T44N16MbOF7FKmy/havmwa7WvyC0AFzgcA
         8e/43OSoIni3kMJUM18mhaXXLdrlXNjBUf25hN6QkDdTfwGDItTXSPGx1SrFyau7/kAW
         qEmFvmBmgYdrJzyxprmUtmbBTgZzu/aZZxHlNVlH4kK9eQoODcHWNM3t5dEcCJVL18j1
         OfqqUd2qgvhFPduRG81hvLKKCuT1R+GeWWpRGc6m0ICdXzVQpxmRlZoF5JyePGL4CCBd
         lELg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=LM+wPZGl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Px7A/POfkOzZKdf0PAFwsSYbiDSxUhgax/Aown4KQus=;
        b=cL0zOfwR/sXw0E57QEOFAilncAT4UoJD4VZX4CyUsevdc0Hz3iI4ap1wfaQ2K5nAF/
         Y/VyCmTqmqehmIwm3R4QVN+ljT9H/DXJ3o8ttow7XuBfyrKw4AgfjXD2zUet8OqNRMS0
         vYpJ8hJp4O041AqHxP2uVo0mMSSUXZhpxXcqkIS4/yjFaZWaZxUc6aX2++nXejIaGELm
         kzKO9ZRw+3P4SxpXj+Ij1gVAVXbuRQQ305ikahSrxajw0H3s9q7qhLwfdd4+wySRcWnl
         TE7NZO1pzZgrQqcfyRvPeKsWX8F17y14W3NWgK0gebgYBTUm3M+mZX144Wd01tvQlIcJ
         GiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Px7A/POfkOzZKdf0PAFwsSYbiDSxUhgax/Aown4KQus=;
        b=uEW/hwyCOFATOfSOmUYw4b/FDHBVXlZabs5znQPhPSt1wrYVTptDi/1vIl8kXr32j5
         Tvy0FsQE7L76imSbS5pf1l47T8YDaqUzvBQ5Xo0eEKZOpblTPgJ1lxsaEmFugVwJBqCW
         9CubZ61mN0aRUKIrPcOWtlloU9hQ8/hN0cP81F2GJcng5EbYBLAvExo3Hzw8DNUhzOnK
         cu61qBejns7Q2xtchPLdZAQEqZH48gjF7kiChTH5RKJnmgGe441S/gIqE9pPFaXZxVVj
         RqpCwc2Q9f5hGevtCMthLhUcxXUOsqOr9b0688nbx8luTgFOBol9HQHfoM125m8XUYOD
         SgPg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXAWWSt17R3pJkXtetSS+fMJH3hQz9mCeMa47qQL5Vmb95/UIb3
	PZFbtCDhCW+5/1UZLazGvsM=
X-Google-Smtp-Source: APXvYqxyeKtvqw3k4BfB+H3cvDfYLvsoX+cCXFA4dXN+BRDNOJ4KnwFLfKlZsn9QmoXlB9qoq+EIcA==
X-Received: by 2002:adf:c706:: with SMTP id k6mr24127546wrg.40.1562667074560;
        Tue, 09 Jul 2019 03:11:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c05a:: with SMTP id u26ls841199wmc.4.canary-gmail; Tue,
 09 Jul 2019 03:11:13 -0700 (PDT)
X-Received: by 2002:a1c:cb43:: with SMTP id b64mr22221465wmg.86.1562667073841;
        Tue, 09 Jul 2019 03:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562667073; cv=none;
        d=google.com; s=arc-20160816;
        b=j2AUpzcjmMaj3T4ztOwt/nu7KQzgbPk7N0VIAmBefjb/6//ph03lgIIWFtxweiZzBW
         A2HLVb0nXgLZJjbOqGQgONPIj6+4heYv65FQlmBcDJgY3xVdFC0Df2jF9DD5OxsMQVxH
         kUAUDslY1vOwFpFHyXkVthCGyckyjV3aCzyE29rAD3Wd2krxt7uI8tquPHz/fl8NGgla
         BVK9egt6AsVQjZaj9AgjDW7zUkU6XOZPFsHh5Z1SyJXxDetreE+L2ttXnBg76Flk9l1/
         9q8TuMN3HPvoP8yPHDj5lam81FOd07FhofHB+xMrZlrZAFRF2tpUOi4t10+HSvcvsmNL
         QmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=bnNcdbzbIKXSN7ea4e26yEvizXEt12sttRJAoqWHmDU=;
        b=U29zQfJRyG3SEZDNxFgOiqpTXLQ5fHFMBJ7ZvPshmkSWnme+8R6qDN20tB5yXyb2jg
         4AtekLLduTqpJs6Lly+u7O8R5SPQ8sFPvgER1vvYUkgBita6Cum/8fASbVovQAa7ZdzK
         U/NAQETvN6TgW5KN52N0bw5PRBFZHuFjaefek+3KBX32UvrLvo/yna9XDO7byaD7DayH
         5T1Py83oAZzUKAkG+qnCr4ic0wWC2F4s/Nx4xSukGj9VsoQca9PbpR509KwqGwyX3cVu
         cp1gkPZXHKH5tBUwdFcaC7AzSqbBI+HtmWdwO/6KmCS6g+LTWuk2UyE81nYTUYA6iymV
         xXsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=LM+wPZGl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id u16si997777wrr.0.2019.07.09.03.11.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 03:11:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45jdPs3cH9zyMc;
	Tue,  9 Jul 2019 12:11:13 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 9 Jul 2019
 12:11:13 +0200
Subject: Re: ivshmem 2.0: Reworked ivshmem rework available
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <8d0a6e80-d926-8783-949d-8fd036611492@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <c89ecf4a-6287-34ac-b421-457c084d654a@oth-regensburg.de>
Date: Tue, 9 Jul 2019 12:11:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <8d0a6e80-d926-8783-949d-8fd036611492@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=LM+wPZGl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi Jan,

On 7/9/19 7:36 AM, Jan Kiszka wrote:
> Hi all,
> 
> long-announced, I feel like it's finally in a good shape to publish it: The new
> version of something I would call "ivshmem 2.0" is now available in
> wip/ivshmem2. Highlights of this:

Cool, thanks! Will try it.

> 
>  - vmexit-free peer state table in shared memory
>  - all key features of current QEMU's ivshmem, specifically
>    - multi-peer support
>    - multi-vector support
>  - unidirectional shared memory (optional)
>  - UIO-friendly one-shot interrupt mode (optional)

I saw there's now a FEATURES register. Should we maybe also introduce a
version/revision register for more invasive changes that go beyong
adding a feature? Or will handling of different versions be done via
vendor/device-ID (as I suggest that's the case at the moment).

  Ralf

> 
> The corresponding kernel drivers, including a rewritten UIO driver, are
> available under
> http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse-ivshmem2.
> 
> The code hasn't been extensively tested yet, so any early feedback is welcome.
> Just keep in mind that things are still in flux, specifically as the discussion
> with the QEMU and also virtio communities hasn't been started yet.
> 
> One of the next steps is demonstrating the feasibility of stacking virtio on top
> of ivshmem2. I also plan to reach out to the QEMU community to ask for feedback
> and interest in enhancing their ivshmem model equivalently. In the ideal world,
> this model will not only used by Jailhouse in the end.
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c89ecf4a-6287-34ac-b421-457c084d654a%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
