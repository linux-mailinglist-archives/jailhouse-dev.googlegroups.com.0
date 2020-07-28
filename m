Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWO6774AKGQEJP5GOHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0E2230684
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 11:26:49 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id h10sf5416541lfp.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 02:26:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595928409; cv=pass;
        d=google.com; s=arc-20160816;
        b=hskxQS0ISczALQ2ExJHCSzw8EydZf8j46+4ecGXmu1n+NUWd06+OpqrzfLe/ivFysZ
         9ZzVVffeyvIidjMjLsMG0nWh6Da+7xEXlP5ot2/PCiRrBXKai8bwQvC4sH1/r5ZwF48G
         Y61SFZ2D1HuyYOmG8SMvzFmp8f0rEsoCH7TcYgjaCF6UqXoTQ7EmBF2stB8o9ML31NdU
         vGIx3Akw1fu3qzQlsvnFAJyZuLWJWovYVt4nQ5wnvMmEvIHPg5v8XiEMBAHt8o2o3bZX
         nNxiig2t4JYLgXIpTRX0mJnUYvGJrMv+YlpFDerm3IAnfAWmqkaYQh24h8RhpfIVOAsb
         sGqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=w/9lHB5ugkNUzicP3sGColtYe4577zdszbo8aOsvEW4=;
        b=gS2LdkUKqCQOgsO2GGkmi1kgGrVjAF2Sm5MsJBqsFKNLqjGcP0BOaNgSgHOs7Ye13I
         cqmFQDYRtrDuNS6GG3cgsbQxQ9qMETLAeHRrwHbc06tTuCXiPKL2QBCKyohdRTsbsngH
         dDvzWbxKYzzGuDdm8oCTOOVStLPnBIPEAVbIUEL5FXB9sUPLj3utGY+vcJVGVUfEsp4r
         19X3ehCau+w/tctZq6ZnDndbvMNQ0PpV56/BKLMV44ptR84RJCRe+TE8NrA5wGsIOORc
         YCMBmMDHEsyRPQheI42XwqezbR7tIGVAjgHkQBOYbSFydsq7wTD5gKKWjcd0frUgKYif
         vzWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=w/9lHB5ugkNUzicP3sGColtYe4577zdszbo8aOsvEW4=;
        b=DRoAO2ASrJXE2EAv8GgXuEraMim54ggzq6XS5iYXz3xCX+BZgTrWmGqjOtb1uKODQA
         Q/KOspYHlQTnNgfDBPDwNB4DmjdqEVjm+rxMhWs++JnaUFq5fP7m6tGnFLLbl+M191K2
         wPdvnRCfm6TBWepIfJ0rRAv/7n9W/+pgc/AAalsk+RGuyjUqAm815GB19dtBE6cMkevh
         b70xXAMlw45tT57tjpxuzjMZZsAOpWz5uoTZTOucpE77Uo/A63WdUPrz4krRw/ysLFiv
         DUBWWxV0uSbdLoAwkOP4fqWt+rHrDvQvWJ+Vj6gJaM1Vg3VCX+KPCJSSxXJhpvkmmUSs
         YVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=w/9lHB5ugkNUzicP3sGColtYe4577zdszbo8aOsvEW4=;
        b=NiIFlD6Pg00cGaBwQh4Cv5K6yZGy51bHA4t4uFrQsTz/+SufDERjFnFX0n+v+caw+f
         4vW4vFuXQIgEY287mVyXNI86GqE/uxKcpWubuCWFqI3Ua2ZI+2JIbEobU8cAoqW+3V7i
         dL/Nw9DZZuxAo2+YoEh457i6KM901Cenjkh5gRLkvlYA+KwHWdxRPu1PeZrhoKRlgIdN
         MK+qLz4sR4xlweucCoCd0KGsTRmAJEpiH4N5GAOce3GmleWpOdNy+e9nXIKvat0TxKj0
         wQAW68Q2KcxzooYfR6HSNs6qDxiVhzXW6ptPewEOynXdZUl5I8b2AOpwx51VL1SIA51x
         vNDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530a1j+SEwk6BLkLCcdFCI/A6iJk28LFyl1uqx5+64y7JZsFTXnN
	L/6UryVNkwkIXFc1kCPMl6E=
X-Google-Smtp-Source: ABdhPJwG9XsLLdA6s505wCD2YlNeoSrFpef7j5Wq87vNs6CJAOSjzjl1IY3NB+1IQfqAyY3y0zABWw==
X-Received: by 2002:a05:651c:8c:: with SMTP id 12mr11098089ljq.420.1595928409390;
        Tue, 28 Jul 2020 02:26:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8610:: with SMTP id a16ls3551109lji.8.gmail; Tue, 28 Jul
 2020 02:26:48 -0700 (PDT)
X-Received: by 2002:a2e:6e0d:: with SMTP id j13mr259629ljc.367.1595928408508;
        Tue, 28 Jul 2020 02:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595928408; cv=none;
        d=google.com; s=arc-20160816;
        b=CfKpmMo/JKq0zRyHTKcBHzdO3D1bMxeEOohqNywwmBGbSRsi1gD3sdYic0SqzsrrOA
         N0CA3oJOxANTD7zzMwbQNRMA+1eOVlJ87M3m7GV7DkuNZwQUBPCHpG/tsiyoZJU/DtKJ
         YE4H4vAIdT/wnFaZX2ncbaHRLZ4ke5efePpAvtOHmZpHCQg1V4lUJa0hQHCZrOSKlRAQ
         BQSZ5UuuXjh8VvpFeN4tFWzTZkStGVzeO2ag3Jzod5EkedTvsm2Kk1eqdAjChYKdsGW9
         xWpwXhAww/B/Gu8frUVMt3DQBFy9z0Nt8HMhy9sy6yjhAeHfswoFZB9Zn02zt1gs7tQ5
         T5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=XX5Og0FZ3ueeDnjZDrPrKIHJS7yCmFj1nz7nqvAdmqA=;
        b=qU0rc/y/IMrZDR1jk5MzLmexOPItniqU8HwrIe+rv3Ry7VSj85Gsyjs58GKUwZWjPg
         zD8mGU4r56X28i1VAZ2L2dvYKshqnWTiNlP+A6IL0hJJ11Yf/sFO7B7l7oXpc8NvCMwU
         O/IM0CRoanOGnQ6GSaoEtxDbSkB+sXY3I1SWRTY0ea0XUdf4JYX3iv0gdVmgSWVUw1jp
         eWMEdT452ViL0KtN5obWznTaeDjhgtom2Ld6FFlrqhPp1Ai0BdZernF0lkXLAuMcsDQh
         aS2pj5Y8xL3crR+RSHAsQ4PmNeA5VJBn+B5ypPckdxDszmw+YpD4m4hwVD4fapHg5a85
         r6IQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id l22si331837lje.6.2020.07.28.02.26.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 02:26:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 06S9QlGm019598
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jul 2020 11:26:47 +0200
Received: from [167.87.93.82] ([167.87.93.82])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06S9QkXn026658;
	Tue, 28 Jul 2020 11:26:46 +0200
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
To: Marco Solieri <marco.solieri@unimore.it>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
        giulioc@xilinx.com, c.scordino@huawei.com, fabio.federici@utrc.utc.com,
        Luca Miccio <206497@studenti.unimore.it>,
        Angelo Ruocco <220530@studenti.unimore.it>
References: <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
 <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <76259743-55bf-4d28-f344-1d829e040d00@siemens.com>
 <20200727211308.5mxhkffz5aj27ocb@carbon.xt3.it>
 <8f358d65-eecc-405e-c659-00f501cf5040@siemens.com>
 <20200728091507.35bodtnsvbgcwxvr@carbon.xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ee0c4b0a-9ea3-4978-43fd-fe38a1321e9c@siemens.com>
Date: Tue, 28 Jul 2020 11:26:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728091507.35bodtnsvbgcwxvr@carbon.xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
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

On 28.07.20 11:15, Marco Solieri wrote:
> On Mon, Jul 27, 2020 at 11:39:48PM +0200, Jan Kiszka wrote:
>> On 27.07.20 23:13, Marco Solieri wrote:
>>> If we understand correctly your
>>> implementation, you are mapping the entire memory region and then
>>> copying blocks of the binary image using what you called "colored
>>> offset" function.  That was very similar to our first (unpublished)
>>> attempt to implement "colored loading", and we soon discovered it is not
>>> very efficient.  Loading time grows considerably and could impede
>>> scaling up to larger images (e.g. an Ubuntu-like rootfs).  We think that
>>> a better alternative is closer to what we proposed in the last patchset,
>>> that is:
>>> - create a colored mapping,
>>> - perform a "virtually" contiguous copy of the image.
>>>
>>> We understand that this logic has to be moved outside the hypervisor, so
>>> we would like to move it to the driver, exploiting Linux virtual addres
>>> space to create the colored mapping.  What do you think about it?
>>
>> Did you examine what was causing this slowdown? It seems highly
>> counter-intuitive to me, given that we are only copying from memory to
>> memory in 4K chunks, just using different virtual addresses - that' all.
> 
> I think you are right, indeed.  Doublechecking our old (and slow)
> prototype, we discovered we were actually not just copying at each
> iteration step, but we were also been ioremapping.  That was most
> probably the cause of the slowdown.
> 
> That leaves only a design point in favour of the contiguous virtual
> mapping.  It makes the implementation more robust and elegant, since it
> enables the copy operation to be independent from coloring and thus
> reusable.  This is enough for us to favour this approach.
> 

To my understanding, the choice is between:

for_each_colored_chunk
     copy_chunk

and

for_each_colored_chunk
     remap_chunk
copy_whole image
drop_mapping

As the first option can be reused for uncolored images as well, I do not 
really see the value of option 2. Prove me wrong by code ;).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ee0c4b0a-9ea3-4978-43fd-fe38a1321e9c%40siemens.com.
