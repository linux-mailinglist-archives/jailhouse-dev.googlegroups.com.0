Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBAXLULUQKGQECOHLU5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EFC67348
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jul 2019 18:29:54 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id 21sf3021401wmj.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jul 2019 09:29:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562948994; cv=pass;
        d=google.com; s=arc-20160816;
        b=BFPfYdv7MmcIxAU8ZGPMAPv7VxvjGW+tHJDMdc2CEor2XmmEtl2CoVpwsNsiOEXnYs
         9Oalf2J6d7EUR2qknh66dIAgYo5oekEAntjbkf3LQW06y/9NE3Dqnh0q+TXIff6T+MkH
         4OHbR88X7BtYMIG8EpIt5Dcg07kC6Z8rpvibpclVnID8ounmL8JTwMYlznqpAEXQLUWD
         ZNpBCqf+4U0QWO2W9yXVFllT8JDZQtJ4LI2OQiuVhmjtMNv5ck6y99GUjEv0exh7/fkP
         TMCJ4BzcTGCOchZthyEFf8AvxXtT22hP/oHya3TS3OI8fQa47uLYzRT7dwC1KffsdrdD
         3gBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:cc:references:to
         :subject:sender:dkim-signature;
        bh=rPh+MzbQdoa+Lm7QdGArDMmezG4TnLlNZ4kT8zqPETQ=;
        b=KqVY9uL88xuss6r3Ph8XzsY7Cd3T4YuClDcwMt8r5PcEUDtPlzZwEr4UCNI7/aDvxI
         WB2EqvIxhVjbfvQEsS22uE52AGedt9kkOzztDPqdSzxO7x+eeD8wyNuoSwCncSaRaK+F
         RIxILXklnoku5FXMYqwQVK3Tlb5fTo8hmRTBR3Rhcq4aRAX4XZjRtvAvVPyhlE0usWXQ
         VsTrEbQgiu5V5uj68c7pGERPQRQncZ6V0OPZhStRUFXk8RniZ+AnbGpNdW/Kxno/aJfT
         rqQt2WSFjsE095Hjbdwz3OATU/sZ3+Ue3GogOTXcnyzjLudoXe3hcoQlNF8xhsXfXiUl
         9m3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=KiBZbzIK;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rPh+MzbQdoa+Lm7QdGArDMmezG4TnLlNZ4kT8zqPETQ=;
        b=r1Imwh/qiq/49rwkSXIzaoTilQKfkNfcU8bcEzj73Zna6flcQD3xfhXInGqERM6dq5
         biM9Inmq6SJziXzzbNPxLqQh0KE+E7ZD1rUN6u2r9M7RZ4ZjVFT3hS3Ra4tiVKCeedjM
         eWRMj+218BTR2FIUEat/quRsAPAGCgDaJdELyWBaI5IK+ufKGP1Awz8OCkLZ+Sqz6Od4
         50LldE2xzT2u0QC+wGrWgA69pN0zgxlF6xjY6NDrW54HmPScrJJJoy96M5anSgDFyq72
         vhhFi19j2OxlmZny2OEJXtuF+BmTEgrtaqYxZTeTCZ5UN74VLXPeR0RJRFzBeH6INONP
         kQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rPh+MzbQdoa+Lm7QdGArDMmezG4TnLlNZ4kT8zqPETQ=;
        b=UWgGmElKJqnkE3+EBRTNO+GjYK7CI7aRrxpWOE9rP1+e/trFwIcFmrdwkE/encc13o
         awuHkHUWshn1nQhnFVz2ubSdAjq8BMN4yFqlKGCc8kePmFygtNqmtQT+Y4nFExbf01gW
         w1+JeeuI1GY3kfrG8Rlkepv9KiRFc0hdVU+3BqN+bkaNOJeLl4W+BhDJZgNwfCATBh9O
         /QklC1OzqUS1HD49iJwAXeKu+QbxnKCdgX0+gR9YncEbsx6SMjZM81zf++a3yW3iFUqb
         s/+h2QjxMhxftv27Ai8533l8kBJVPq+16jPPieYU3bcDXjsiSApgtKKvs3BvhLAIvSsQ
         Zzyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUg9LQvQcShlJRN5SALVtBR/tCc8OtgKVVSuHigEAcXE7AYk/KO
	GGgvRjnCCrT+aa29NW7lQDI=
X-Google-Smtp-Source: APXvYqwsUxccJg6SifTdCvIeMWxY2TO8sEiNI3bGpatHcCc62wu/GKcRZ3NHls8yDiynj2eVoKmmkA==
X-Received: by 2002:adf:afe7:: with SMTP id y39mr12237288wrd.350.1562948994511;
        Fri, 12 Jul 2019 09:29:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ea50:: with SMTP id j16ls3347257wrn.9.gmail; Fri, 12 Jul
 2019 09:29:53 -0700 (PDT)
X-Received: by 2002:adf:ea4c:: with SMTP id j12mr13104766wrn.75.1562948993820;
        Fri, 12 Jul 2019 09:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562948993; cv=none;
        d=google.com; s=arc-20160816;
        b=GHvMXiF83fXs+9P4ijG4OetamCj3gl5L4Oz7ZAB/gpfD2BgNm4uCPiUaMVKPjKWdkq
         nieXe/uhpTqbjZGpopwHGfErk1dNk7uKSRg34NA3+ZihlXgoHZ08K78B8+0Id+wEpjTQ
         666FdIKi4KYnWwwNnxjzjCZJ+xMGQuLvWPH5yjSsREg1GckXh1bxL1bt72DmZQVwZoQw
         ufTCoQo9V0yrHtnF8L8tKEefOmR2R0B4z/jzbqPbBXWnLmN/nGuVz7GCir/kMFzXqu1O
         PKQWsmBI17Y+JtoOURnhBrGwlJFVFMAz7jnXZwEoCVMxoC6L2Rlvb/9dd1zNvLugmtSg
         KSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject
         :dkim-signature;
        bh=qPMO81Q1BFpcJYIxSC/gOv2x14H41dgaQfzZqy2haV0=;
        b=CTUKnUBZyMccZWJuwltOiXQtWQ7PcvUdOO4x0bXBd/2MpltJmhwf46SQxCOesoxN8Z
         FqzOQ9AtJpR9WO7tmM8ZkipW2GEEQ4iRseLXaTNj0EhIl/sCh/I4FPnfwvGuZM/LxnJ/
         43A88IXF6Lp2ypoc9V6S23XHLqEsN2ymYkrUiztG2vu42JBo0VBNcBKdmZ1WnvMiOU1w
         5G5t4zxnsTeVRoAv6/R50aLHP8kTULRDrrIU/Ay1uXVMjmKGztBPTQ7bXXatE+JPIdim
         l6bYEjIXO2tV0aTGgGixRhWuhCDCKnJfFDxhmYxRWyJheF4WGAYuflWHJeQRlkvg6tvc
         hyWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=KiBZbzIK;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id u16si447299wrr.0.2019.07.12.09.29.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 09:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45ldgP3KlDzyKJ;
	Fri, 12 Jul 2019 18:29:53 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:2f4:8dff:fecd:d26b]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 12 Jul
 2019 18:29:53 +0200
Subject: Re: [PATCH v2 2/2] pyjailhouse: x86: implement pio_bitmap generator
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@web.de>
References: <20190620220614.23450-1-andrej.utz@st.oth-regensburg.de>
 <20190620220614.23450-2-andrej.utz@st.oth-regensburg.de>
 <e369a4a6-57cf-3fae-a68c-3351394da184@oth-regensburg.de>
CC: Henning Schild <henning.schild@siemens.com>
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Message-ID: <011d894f-8cc0-1603-0c72-df3aedff943c@st.oth-regensburg.de>
Date: Fri, 12 Jul 2019 18:29:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e369a4a6-57cf-3fae-a68c-3351394da184@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=KiBZbzIK;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Hi all,

On 12.07.19 17:59, Ralf Ramsauer wrote:
> Hi,
> 
> On 6/21/19 12:06 AM, Andrej Utz wrote:
>> This replaces the old static port list with actual port regions from
>> '/proc/ioports'. The static regions from said list are kept and override
>> the data in case of region overlap to retain compability.
>> The generated port list is virtually identicall to the old one but eases
>> manual configuration.
> 
> just found a bug in this series. This series creates regions such as:
> 
> <snip>
> [  0x80/8 ...   0x87/8] =   -1, /* 0080-0087 : dma page reg */
> [  0x88/8 ...   0x8f/8] =   -1, /* 0088-008f : dma page reg */
> [  0xa0/8 ...   0xa7/8] =   -1, /* 00a0-00a1 : pic2 */
> <snip>
> 
> Now we have a hole between [0x90/8 ... 0x1f/8]. A hole means that this
> area will be initialised with zero -> access is permitted.

Ack, this is not intended.

> Root of this bug: In addition known port regions, we must also respect
> unknown port regions and deny access.
> 
> @Jan: This brings me to an idea. The TODO says that whitelist-based MSR
> bitmaps are a v1.0 target. I think the PIO bitmap would also benefit if
> it would be whitelist based. Do you agree?
> 
> E.g.:
> .pio_bitmap = {
> 	[ 0x3f8/8 ... 0x3ff/8 ] = -1,
> },
> 
> would denote that only access to 3f8-3ff is allowed. All other ports are
> denied. Much easier to write and understand.
> 
>    Ralf

Unless there is some bit trickery optimization, I would also prefer "0 = 
disallowed".

Also including Hennings concerns:
 >The main issue really is that a lot of device drivers do not register
 >themselfs as port-users, so we can not detect them.
 >But those exotic ports are probably blocked in the default config so
 >there is no new problem.

I will reconsider my approach how to generate ioports list. Parsing PCI 
config space seems like a better source instead of /proc/ioports. 
Depending how secretive PCI devices are with their I/O specs, 
refactoring MemRegion generation may also be necessary to use the same 
logic. Need to investigate further.

But for now thanks for reviewing. Consider this patch queue retracted.

Andrej Utz

<snip>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/011d894f-8cc0-1603-0c72-df3aedff943c%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
