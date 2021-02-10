Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGGAR6AQMGQEMKKZMEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4EE31680B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Feb 2021 14:31:04 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id e10sf2620593edl.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Feb 2021 05:31:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612963864; cv=pass;
        d=google.com; s=arc-20160816;
        b=aFTDaWp7Jg0CLiL7xBdARhU2e4NyQPyE0SGL+s+K3xJGB9J7wS4mGpcNGk3zOQUOHt
         tim6agP6RyNjVJguwhDz6Si5w8YSI+xxi2oa1gc8mJwSGlBC3iakoOLlvTXaU1u9YcVJ
         qvKKuTF2WP94lXf+vv2qGeMjHXxgpOLvF+BGFU4mmO71IOXv3SG49JCS1ddc3vDolBf4
         Qb0/JuxKHZO6xY07O9tFCbavvnpOImw13nlpfk1soOH4rvGY8pnUeMtIfJEVn6w7hy6l
         GS9Tg1PtQvDYIu9HZQdZIXfH8Xvg+lBs6ppuKnN1Ikh02iEQVhLGHHO5UMGo+h773mHq
         UZSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=0XcAPYiV9NOeRKx8xKT5jYMuc9loIDZZ95LdIzo1RI8=;
        b=qHQwwa3Rz1Qh25a4NcRJqeZ46CRp+RI1iPjD/GV41JOWspUM47VXJCKqHlSorzO57u
         pm/Qtg6c1vNh4cCPJyQZvQth7ewvzXIiIWS9jZJ7M1chJgU+3VcugnV4ploeeFncd9jM
         N9Kc4qBzfb9Z5kzAXyO8+s3M9OkW4LUZ6uLwNCfjHoKuHe5Aw0Nf53dBdVVH/sjMLN0z
         nbyffbsB8fQ1h43qbaIdk9JAd+nF5Q6qACml6/slPqGX2W2qnRi6AcaREIpYTw4uGipJ
         CLcybz+ksU2mlPvwXtSwcqPPPPQhQkUCu71fQEVXo2WqBnRFaGszOxbxYJ2uftXIJSWR
         Dgqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0XcAPYiV9NOeRKx8xKT5jYMuc9loIDZZ95LdIzo1RI8=;
        b=ZGNrWgDgu53jiYH6D3W5S/rMRkthvxrjAz/WzHPR07+UYBIxH3l0fet3JcLZD4ld0c
         KnRd/xPbI26TifkWvW725J7gsMd6gbGgWFZQUH6XkWj/DxrykBXbn9OlJZCaHJCn0LlX
         zqam8fs4cRCExPIWGepwRFCxUixXFsGa7VvlYjvYClcpfX/sM+9igxfT6qLBJx0mj4A/
         WHuBo3JD0VjfBmnAhv5l6SiNxUFTN+mYkpsjHFPGyvQ5dlQAPiOowN7+kXeuV2V327iO
         EWBm0Cw+Timr5wyuGUBzLCrm/EJCGfPRdA0YAtm2e0IQFXyHi7KUrGWNhIx/W81K2oMs
         KrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=0XcAPYiV9NOeRKx8xKT5jYMuc9loIDZZ95LdIzo1RI8=;
        b=OVrvITkhDs5aL/92D6foEQBoNrP/Qzyx7LXgtaE3lWyTHWGMC9QYG6XbqIuW0i42Ye
         ywd7fRD03DDgqOQopefwgRasOfAMlIiJK8JMkA8lqpD/uJv6ZZkXNRpB2TGEW5uBByVi
         VhDonYLo84RNGg4/NRyaEP1OSWJ79SELfjK95Km3HKO+JO+K7o+LmptJR18tas1Ybqof
         vJrl5UN2zyERoVfOSarYrVMp7oGT/pWjc2CRt18vsyn8o1nKu+ppGFQx6IPelSmVjTSd
         Q3HhXcu4cLM0wuFLj50JBvxsjv7LvEt8pmVM3st5x5RUuwdkR2kFtB1JT13j3s09nLhs
         CvWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530E14QjWE1i/8OeXT8wAAkO2nGQAsJBXTImIKwOSm8zKHu8NQs0
	njBA4LHtvqyH9mTX1w6CaqA=
X-Google-Smtp-Source: ABdhPJzURvLDLjU2+aLZFCvbLyLggmOsxyWhwhlPhIYwuSoXQxnGS5TdO2HG1KyC3ovqzWgCosN3Hw==
X-Received: by 2002:aa7:dd4c:: with SMTP id o12mr3100914edw.180.1612963864318;
        Wed, 10 Feb 2021 05:31:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:364e:: with SMTP id r14ls1052354ejb.3.gmail; Wed, 10
 Feb 2021 05:31:03 -0800 (PST)
X-Received: by 2002:a17:906:118f:: with SMTP id n15mr2936565eja.497.1612963863296;
        Wed, 10 Feb 2021 05:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612963863; cv=none;
        d=google.com; s=arc-20160816;
        b=NZxW3oI0K3fi4Mox+NMEwCWfQ9PUme3ra1+avhJ0/yi7Hs+wHKwOncjIUgR6AbgaZ2
         NSJlS9ZSnq8HQvnvRi0pSgHM1TijsV8g6P8h0rp+atGjD8FP5zBrp27Rugt6IJa4dsk2
         vCVPyJ2sycSxBzBhUI9llMDcKGbK0s93aXH4iLqZDQGmgpsu1wbdBtUzM0aHcm5MRhyC
         1D79kLLA6ftiZdpDA0ee0/wEwb255Bnsjyar4KkynppJ2kjreloy9r6qd9mLoj2c09cu
         SnnOF1gwS9GSA5tUGB7K1u2d60w+K4iHL8le9Lk6wmNWsRXB0OWPFRir8mLVBjI+4PsW
         mQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=7d1MxiPvJDSca/ICz0fhEZAXK5DSXKJkWzYxXm/JQ2Q=;
        b=KkbMxKWccgqNnVD3grSYCuHaLwFSpnilOTnFvZ1oI4f9LlOqU77I5ydSN2B2JiQR9v
         7JVhdt3Hy5Ccy1KVrzOvrLfQz2CG0azXxeWmUW7K2l8+vD8lpEkVjZZmILgtyOdiQvgG
         /mdGhK1B/4+bGdRlAVh/jyUUXd7sIpl+0XuQ49jf8GuZ4TEMt/On60CHPGpBtENT7BCy
         FUY3mxpSONuRmBKp/rHkF0GVV9neH6LwVPq2VQFAUpsCV4bmhNnkVvjpli2djtp8zNlS
         F8qt/tl31fTlk4yCH2g5WrKu0M/ji5ejkt7r0FSJuYuBLw6XFLd8QcF0WUL5b8wOFsdV
         HnzA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id y20si93831edv.3.2021.02.10.05.31.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Feb 2021 05:31:03 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 11ADV2R5007229
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Feb 2021 14:31:02 +0100
Received: from [167.87.76.191] ([167.87.76.191])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 11ADV2u8021363;
	Wed, 10 Feb 2021 14:31:02 +0100
Subject: Re: Overflow in MMIO registration
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AM0PR03MB4450A4AD70FFBBA0D726D521B68F9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <290f756e-4a93-46f8-0eb6-a15206bdc1d7@siemens.com>
 <AM0PR03MB44507C4040BE5E902027D833B68D9@AM0PR03MB4450.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <c3dbe31c-29f2-af62-d2d6-9f7d47e8381b@siemens.com>
Date: Wed, 10 Feb 2021 14:31:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <AM0PR03MB44507C4040BE5E902027D833B68D9@AM0PR03MB4450.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 10.02.21 12:15, Sainz Markel wrote:
> On 08.02.21 12:24, Kizska Jan wrote:
> 
>> Something may have caused a subpage MMIO region to be created (page-unaligned memory region). If that region split-up didn't exist in the root cell already, things will fail. But I suspect that subpage is rather a symptom, not the >cause.
> 
>> Where there any compiler warnings when building the config? I would also recommend checking our configs via "jailhouse config check root.cell cell1.cell cell2.cell ...". Or share what you created.
> 
>> Jan
> 
>> --
>> Siemens AG, T RDA IOT
>> Corporate Competence Center Embedded Linux
> 
> There are no warning during compilation and jailhouse config check command says it is everything correct. 
> 
> #jailhouse config check sysconfig.cell core1-cell.cell core2-cell.cell core3-cell.cell core4-cell.cell core5-cell.cell 
>   Reading configuration set:
>   Root cell:     RootCell (sysconfig.cell)
>   Non-root cell: core1-cell (core1-cell.cell)
>   Non-root cell: core2-cell (core2-cell.cell)
>   Non-root cell: core3-cell (core3-cell.cell)
>   Non-root cell: core4-cell (core4-cell.cell)
>   Non-root cell: core5-cell (core5-cell.cell)
> Overlapping memory regions inside cell: None
> Overlapping memory regions with hypervisor: None
> Missing PCI MMCONFIG interceptions: None
> Missing IOMMU interceptions: None
> Missing resource interceptions for architecture x86: None
> 
> Attached to the mail the cell files I'm using. The .bin file is the same as for apic-demo.
> 

Just looking at core1-cell.c reveals that you are neither aligning on
physical page boundaries for the base nor using page-aligned sizes. So
it is like I predicted. And it is NOT a simple copy of apic-demo.c.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c3dbe31c-29f2-af62-d2d6-9f7d47e8381b%40siemens.com.
