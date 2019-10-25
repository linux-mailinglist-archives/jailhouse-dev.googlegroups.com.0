Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSOYZTWQKGQEDPFT75Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F857E520F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Oct 2019 19:09:30 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id p20sf1833549eda.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Oct 2019 10:09:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572023370; cv=pass;
        d=google.com; s=arc-20160816;
        b=AEVZFPvWI9/Jd0h/J9w2JNoy1XCKzi95KfJl4s+VWL3/T/lGE1iLJZZHCH4mzng8xQ
         j/AmxC7DrqC5ibMghozrluE/ymM4VKAG2+UjqSTXku2KVwncuuQZhxJMFHHvtPdHfyGK
         +lRYxCeDCxcAXFCe+gaIioE1lzmF1bRJ77pUIkLfCIXtl3XCNearxyE3i1Cz6EC/dDFN
         xG2fqtzWrJ8s+s2qPy6X8CVkVF+yOlaQ9bnnk/qEU2OHfB5Utg9MEc8puaYMBpR2VwJ/
         BTX9rHMzM8Zt81DqZwdEPEHIfI2cntgrAEPdVIEHoVj9ICQAy/IQvgZs1EtZOnpZq5ck
         Jdxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=Z/sdzKsYkYPw3CtQiqc/POPiNv/HMoVh7xK476lqZew=;
        b=wRvkNS+YDni7d6ETpJjRq+aoxDkFk2xYN89rgA+axas0qQMjn6oVmA4SNfjsBCfLrK
         wh2gRLyPWo9QmXFcz9jwDjyWDf/oLZiUa7tUqghxIm2eON5x6WpjN+v8II0c709HVR3g
         qOKHNx1PNfB+hT9pCY9FPiWnCbPDzluFQP4WS8/niIOlR3Dm9sVmP+hf2po6Yk4sRz7r
         hvAq5lkPsLmOjcql5JXyVe1oRlPKkrp9CtxOlyfA2tDG5YdnBahEcSqsiOtGloZ6+K6K
         5yNToZz9Q2WrsyzmTXiuqvxdnjUUfwzTE4M6VRkamzrEHgR9o0c9OLRaED3Qo/+ZN+3J
         Legg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Z/sdzKsYkYPw3CtQiqc/POPiNv/HMoVh7xK476lqZew=;
        b=DUj6LJPcAuM+uE2o+C71Fnj7WqMFBN5CBKj0p+M8npQJSW03o7UpEPMUMWrih8WG3Q
         6ayelJQvkzliHpN9evHw6dKFCdM7eXPbqL39Oj2fqWAzA3MLcvD1ivgIAEeYbM7uC7OQ
         b4hX/UwgErAJh27nJquG2Ukf7E7/gbA47u1NEo8H/GFm3uknJ37LTdQJgAoZADkPV6PD
         vK/1MFaBxFjaj1jQkF09T2OQl15DRkXCvA88COjjuwB9pw/V7HrkUigqyLGuAWTvxkf9
         Iw2V3K7uTv3ry8PXJN46Z6TxmasS9lO4ajP5WqhxDsuDOQMjQwY1IZM3VitRPbNvtLNG
         6n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Z/sdzKsYkYPw3CtQiqc/POPiNv/HMoVh7xK476lqZew=;
        b=dMNQEQc1oE4cKRTKsZtfktHaWUCKBBGojFwjAnCXzHHF7iX27pqDsfl1lv1UA95W2J
         dAwLnhSxVHZO9vAdEBrXmb8QdAAOu0FQC1o2x2SpAfTAZ4PJTcm+N3Srz3qHLCi/MhS2
         EvrrSlG6KkK4oNxwMWMsZ88ABIqpLmhrygi/++BKqWmhV5E6+u/NU34dLuDuXHpmLi9m
         scaqGAw7x5kf7UfdE+D23jB0mKoHZanQyMVDqmXWSXjbs4aD0hzfK/O96hObifEVJbmt
         JWITvvJJg29VsA81oL2ZZ9KjM9R6SnXtQvlAQUjayDj4lweldF1gsp50ElWskNwlBTfH
         yZ6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVNMXN3IVFoaLcSrbl9dRjb7wsSzVOWPAGdcqvALm+9Y3ue0AJX
	9Eo4WAoNCt0+JfMbGw7J2jM=
X-Google-Smtp-Source: APXvYqzKd7xuKnV5Peyy+npDBAmweJPIM54gW8ahtwfHNSlm7G/WMnB8SHZUILCAhsa7lYuCh4A/2g==
X-Received: by 2002:a50:fa84:: with SMTP id w4mr5265062edr.250.1572023370242;
        Fri, 25 Oct 2019 10:09:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d98d:: with SMTP id u13ls2425570eds.12.gmail; Fri, 25
 Oct 2019 10:09:29 -0700 (PDT)
X-Received: by 2002:a50:ec03:: with SMTP id g3mr5179223edr.83.1572023369344;
        Fri, 25 Oct 2019 10:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572023369; cv=none;
        d=google.com; s=arc-20160816;
        b=XbsOUuGUV5/P08cRypcJ9QJlkBZf9RhdSEBQtLkzVAJkw1u61vT1jJY7A2atCikPXh
         L+kZf/UKgNq+H/xoMFm8muujy6pM81Ig/3sF1nKhoE1vhrWPXypdL8Zw2maSDts7Wy3u
         H+Fl8rHy181lYI1uVanyT5oWyapZ0RUYchUkcObrrVCPFwCzdKCMjue9vDH9UObauc2A
         Eyxd38tPsgKuzGSyjmopCTCh/6imWQ6cXfPORY+MI0uf6vQ81SFBRb1V55d6EL3Bs7xM
         HONYH5ZjU03fVHu6g3uZ9VFX1pU2G16N24AxOpCa6RQLw2fyKGJdrfqF/j8LqFGg2Gtz
         F8FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=o5bjTpDOQ3N59ddRZaIIGUiJkG+bKPPtbmkZDepWdrw=;
        b=B5YcDsjWYKs/x1nyUo1xiQfjIJMRCywWM0VPNm5QxMJxYoGrFokY+aiZa7qNROcEHo
         PAwwEbVY0B77mlgaFMXIsaPMsiUVhKlrEvxj09CRY0pqHHTWwjiS8Y90ftYDtpwrY8fX
         cvZjRsXOI/8x+06cIrMNNtqYkxZE47qy9krt2q2OsIbAWmhcBb2qx2V0BX7xn46izD0d
         YlD0IFwBqR9NK0RgKnwIN8Uf8MuaAyraxykkQ+tTJnyx6ZDXPjPNsGJN2ugPF7uHKN5j
         3MBcaRtq4MVfzq9mm6icTtPOTeN81kFcepawQVxr0SO5ODkQIyMHo6pD2oiFpvV4msf+
         2mWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id c28si165213eda.4.2019.10.25.10.09.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 10:09:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x9PH9Sik016196
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2019 19:09:28 +0200
Received: from [167.87.35.116] ([167.87.35.116])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9PH9R1s020876;
	Fri, 25 Oct 2019 19:09:28 +0200
Subject: Re: v0.9 vs v1.1 interrupt latency raise
To: Henning Schild <henning.schild@siemens.com>,
        Chung-Fan Yang <sonic.tw.tp@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
 <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
 <eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
 <48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43@googlegroups.com>
 <20191025155257.6af12e29@md1za8fc.ad001.siemens.net>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <76ecfa10-3a69-b5bc-382a-48a59c345637@siemens.com>
Date: Fri, 25 Oct 2019 19:09:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025155257.6af12e29@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset="UTF-8"
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

On 25.10.19 15:52, Henning Schild wrote:
> Well you only have soo many shared ressources and if it is not
> additional exits/interrupts then it is contention on shared ressources.
> 
> We are probably talking about caches, TLBs and buses.
> 
> You should be able to use i.e. "perf" on Linux to read out hardware
> performance counters. And there you might want to look for TLB and
> cache misses.
> 
> But the bisecting might be the better idea. Jan already mentioned the
> "features" that could be responsible. With a bit of educated guessing
> you will get away with just a few tries.

BTW, does your RTOS happen to use anything of the inmate bootstrap code
to start in Jailhouse? That also changed.

Jan

> 
> Henning
> 
> Am Fri, 25 Oct 2019 00:04:36 -0700
> schrieb Chung-Fan Yang <sonic.tw.tp@gmail.com>:
> 
>> Alright, I have test the latency from HW IRQ to application response.
>>
>> I found out that there aren't any additional VM-Exit or IRQ, nor RTOS 
>> scheduling and house-keeping.
>>
>> It feels like the processor is generally slower as everything takes
>> longer to run.
>>
>> The IRQ epilogue takes ~7.8us and iretq ~2.x us. In addition, the
>> libc and syscall interface also have slow downed a bit.
>>
>> I do notice after upgrading, even with CAT, my RTOS latency are prone
>> to be influenced by the Linux side applications.
>> This was not observed during v0.9.1.
>>
>> It's strange.
>>
>>
>> Yang.
>>
> 
> 
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/76ecfa10-3a69-b5bc-382a-48a59c345637%40siemens.com.
