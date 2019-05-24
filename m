Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFWKT7TQKGQEFESOAOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFE82981B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 May 2019 14:35:35 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id y187sf2893309wmg.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 May 2019 05:35:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558701335; cv=pass;
        d=google.com; s=arc-20160816;
        b=hWdYJF1MQ8JOO0bkzbsr67BvbtEoSF5BL/8un4uo31WCnCr3zzQ4I1F6YMmEO+heW8
         gxFEZwfGMuJbLX5Gwczg8NnnaoXov1wRVjuGsdPaHNTWN0c7K8bkCk3Kwm2d0K2egh14
         0qKwsI2gStaxvU9m3EhrYHNOzdYw/eiBJi2Rvs07ugL1ppAbuEQ0c+eDz9p3ISOCt9nD
         XAZBoiYunVbcL6p01WufufkEvTugp+zGgEZsMx4ZAjQm7QnzJZg82U6iuZvHV+3hqnmp
         F5teIBpxaiGnnFAI2B4R+C/3DqengWEGY0087ZgEzBXBj8d7b5CB9XhUmionOKeaJPSb
         YzJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=RPShRfQOOgSsePwl+SymBPTVXw3dzeeznmBjeR+7GTA=;
        b=n3QIJr2bti8xKPRh48Zd/p2LVaqVO+PL2mO22EDKF41dEno7ItCKLbbNhqu6gLrVvb
         gXYxPWjWjq/G0FtsFpzdOWheP+eE+w1oV6MfGc1MRPDRRcFjY6C8EZm6ikC2+y8QV7X3
         GoDVAJYYb5KCRgHB9exoD/KoU8rrAJRGaO0X2b+PcSKMg/T47lEMUPauURwSPV1ZAcQO
         Gq2v12wGlI4xvcakt/0UPDMp3kgbPRbfvGHR2hFQR6KWDgW+ewU3VSPxB+J0X6yze8jX
         LrRNCX5E4Uotl0Fz4b63H5Z3az3ybnPUdwRJTNfcqxNKEyc0AFJ8voPY39KRYcyeN+G+
         Tfxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RPShRfQOOgSsePwl+SymBPTVXw3dzeeznmBjeR+7GTA=;
        b=OF3JTymNhF8/WMMOERzSmYMGfNAGfBGoDu+cJ6ckQV5ryMmfTPCoVdduQtPI2mjwKe
         4eTt61BpX+OVAPWrc7tgUgsF5aOyTUtKnmvgWowCIAcviBJMHTXgSkjhaGdy8NTSRJ8K
         1qHrMz7xHRxEbuWKw43RU0eGx/W1qpZAlStx0rdO1W9Z6LADKis+ruqxUGQPELy9R516
         5V6UzSKXi0rDzT3YLYpuQwWHhyKO5dD/aqwmpC9cZDq+F/tqQxZgP79CP1rKWjWg4byj
         a7ckxVx4v7aNk78fjpGdZmcWuoBCaLSBuZcdWzRQepZW4pgHegtaSJlG4SDmcSOlra5y
         frLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RPShRfQOOgSsePwl+SymBPTVXw3dzeeznmBjeR+7GTA=;
        b=NHJ39Ql6atuked6Wt20BjFanAV+UttclXeYATZAuheshWx8dvEeOAJMHS/v5nSHZAa
         U8gfMJ81g2KQE74qkdDC3ZKa0tIsWGfg6JqPWWhca1MX5+CyWHQrrHgTBs8d18n7D9+L
         Yu/ogTxWqDFwQlLI2HgIHXLJt4DWDkb4R21agikYHIpOoqePIn2QYBpxUjEbQqEzXy37
         YwfiP62tuGuiABVpifagF1HNfT9jKpldUzwPbabVJVnqCzioCZ5p+sIHxPD/+t1YFS00
         WQwCVKjxRBg0sjiILAvsGZhxFDZudm8Nl/BSdC7f8EOPtNxWmBbJnyTwjVxECTj3QxT0
         SZNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUY717VMraLo6JKYDCqn5Wc43MphNtEOKVzhZeRQqFIIG13v66H
	7VI1jq8kiLzNmyEVOc62eDQ=
X-Google-Smtp-Source: APXvYqxnJwGl/X74hcKOuS8vSomQwvvd+1R3t0gmEifpgaUi9GqrYZq0D4dQCcpyD0i+wXV0k07kSQ==
X-Received: by 2002:a7b:cd0e:: with SMTP id f14mr15421474wmj.127.1558701334893;
        Fri, 24 May 2019 05:35:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6751:: with SMTP id l17ls964327wrw.7.gmail; Fri, 24 May
 2019 05:35:34 -0700 (PDT)
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr55603348wrj.182.1558701334189;
        Fri, 24 May 2019 05:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558701334; cv=none;
        d=google.com; s=arc-20160816;
        b=dLUFYTCgGpJaDu8jc2DVo3JaCF1fG5q7FizKg1knfHjew4sKtfEc/DVKHoTrJkatO3
         nlYInnsdv9noGJHCM/OgbDRR0KOxPDdsTtIY7Xa0pFk7eIbvcDKMurxiRZbDTJJqNMEN
         RM47rmLy49m4uKkQDc37mW9M7HNXlJcoFvLgSsnP7TlwIqIZLL0FjXePpOKYYPqyqWiD
         VNpcOdgGL9V1Cim33dHxGtrV5tlb+KwmSIDfNAeCcdvoy1juH+P7q4rP0TBcXEEGB3Md
         xI7/x28VCntlS44pQ15JML8d/UA9jTE4d6U4MUnEYHFmuXZKrAmmrN1oym0JA+hRBisS
         P1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=vulTjpwNa6t4dJd3tUMDB/PPADvBZH145od3PQS7i7o=;
        b=MEV6P59RPrrVWRpWdQkYtEOjw8Bm1/s8sEZCXTZNPx2VVX0iLQ/YtmDDQAtG+zS/eU
         URFwGJmCu7lA2eYLD5X4+RD+uPurjiFiq1cI+kBIobb2l9qLk25ybEAKkzxuhUdjL9Lc
         WylOdVMfLPQre1FnjJdgxtrFOvjsV2/gZdQGROIaLxCilQnDrl/8QV8lolpNGHX1deaO
         ewqTJhPBKT6m2z84wipDpz7OQd6fTnemVMfxtHpN+CtvhgrzI3uuXPHw9Ir2xrPYTx5c
         x+EvBrvj436PuNVkiOPHFzoF2G0T/eFSGdJD5mcJKp6ieaxvoIApP9mFSi7mpAHGcU6S
         hq8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y70si666303wmd.0.2019.05.24.05.35.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 05:35:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x4OCZXbr025319
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 May 2019 14:35:33 +0200
Received: from [167.87.47.159] ([167.87.47.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x4OCZWQs000466;
	Fri, 24 May 2019 14:35:32 +0200
Subject: Re: Ivshmem, MSIX, irq_find_mapping return -EEXIST
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <deca16ad-b539-4447-b865-f0fbcb5abe3c@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1b96aeba-e9bc-51c9-68e8-6fa4acee6504@siemens.com>
Date: Fri, 24 May 2019 14:35:32 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <deca16ad-b539-4447-b865-f0fbcb5abe3c@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 24.05.19 11:04, Chung-Fan Yang wrote:
> Hello,
> 
> I am looking for some help.
> I am using ivshmem-v2 with virtio.

Do you mean the wip/ivshmem2 branch? Curious: What was the reason for choosing 
this version?

JFYI: I've evolved that spec further, but the code still needs to be adjusted to 
it (changes are significant). Goal is to have both the existing ivshmem use case 
covered, while enabling the additional features that are present in current 
ivshmem v2 draft.

> I am planning to implement a virtual serial driver on top of it.
> I ripped off the ivshmem-net driver, and obtain a queue which I should able to communicate with other cells from host.
> 
> The problem is that during root cell's PCI probing, pci_alloc_irq_vectors returned -NOSPCE.
> I went down the rabbit hole with ftrace and found out that in the MSIX initialization, irq_find_mapping returned -EEXIST.
> 
> I have cross check the code with ivshmem-net, there is no difference except for the NAPI registration.
> 
> I am filling quite helpless down this rabbithole, and can really use some help.
> I can provide the trace log and driver code if it is necessary.

Hard to give useful tips based on this information. Code and configurations, or 
patches, are usually more telling.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1b96aeba-e9bc-51c9-68e8-6fa4acee6504%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
