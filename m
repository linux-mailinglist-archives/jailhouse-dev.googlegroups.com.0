Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPHJYX6AKGQEPQVZEVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 838F2295DEB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 14:02:05 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id o9sf616344ljp.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 05:02:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603368125; cv=pass;
        d=google.com; s=arc-20160816;
        b=XfAOnALZ7qEQwGWTyysa1vA6scgpOCp8uCrup1ziDPLFJI5RRWHinolMLAUJvFWmjp
         OZnAGAzbycql3DaGUiBtpRZEcAJwEwSpJBXX/CCW6I3F9oNgIs61eva0j14dqRVzJtvQ
         xS+M/yEZgnSTgdoePbfcx7XryahSzFZXadx879tAxvao3B2pwNfBFvgVR+y5xxiU6dS5
         l+gR3kQkTztiNmwaSkrB0Y9PlKFNOFFmkvaXF9fPa80VgQRxIbQ9Ntm4gm0fYgQS7DqF
         VRNmFO4LUTvk1bRu8cEwxVpH9h1Fslz03K2OEtQxYLsc3D9/wPR9pBx5qxWUAOMz7ttY
         +mKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=JItyR5z9CXJHls5MouDAy4Xxx38Lm/mcVoPqCtY+igI=;
        b=t2PD/5slOKhzG8Y+8ggEAFf93XnXcYBYZzOHxCkhysnp6AJwVRdSngzRtkIfam+n3M
         gRqqKM/ybVeJOzlcafAPmAxUNuONz92Uzc0oHjNZOk76IzL6AxXgAxOhnxGI+LcBKdqm
         Ff2zAMXCUxovRKdRoDEL+teKxo0Zpz9+3yHS2oKafj36xJWBc6LJnTz82D6xYQnGhrRr
         9L2R5lkriltML6WFmbYc3Q1g0vwPoRJhJEd7kJuyZBiCfoPX7V4stEN6C4otem3IXIy/
         pxCFA/JYRi8Y0KgDee8GGUm5PotW1iEJdt3ToDSBQGzKBrvSNNYVNU4nO/E+LBs09R1i
         Mjfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JItyR5z9CXJHls5MouDAy4Xxx38Lm/mcVoPqCtY+igI=;
        b=i/ChTF+g8fKtBSUcyBv+eHL2G9FGEKwBbBOeKbKF/puNhyiAPX9MhD2lU8m/4+A7bm
         zKw4TLBpi4fOrc2Igjk58LTSmrK7+vwB7BgOHeKjdINkoDxHIER3wcycBCbozxNECnpC
         Ds3ikuvYFapjWD7zHSM0D+zmdFoFKV40dVpNLnCBhLMWuDJMHsv/mgghZTt7h7ITXMHO
         8d+vmo6RHBFhixoEhbQU+ymvOvkG8cD5adGhnL0teYNLi+MbAzycXefyhSJzQ06D65ZP
         1JyjjklO2dppdH41lIL+8lFMcQ/iEDTsxlJFGfleU2zOZ/9sYNokDh+dx0ARkUUqGoBo
         fanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JItyR5z9CXJHls5MouDAy4Xxx38Lm/mcVoPqCtY+igI=;
        b=gE82OFwizc0uOuraEE8W8J5vY8Wg4hiN1g4jJ4JiETFe4dmmyeriaqwNml1PqeefUz
         lJKECBGIXMGIucQz2T4HduEsAWqJaYcoo1mmcZ4jIo1ALR/qbt0Fe3uchmniJh8dS/Id
         BLbQrbrk/HCxSgWoRWdYc8ALs4s3SGQcnwYPEOzcIw77TPNrWau/87pj2y7mILmmwfQZ
         2u+eiwyVG61uH5VZSVjTnmYdfVbVk65QnAOJSeocKaQELMQu9Adr5ECm2tCTs4otL5MO
         mRwknFZ9JfWApca1ZH/20Dk9qWfpdbWRIFBtjVCINok6NOA/ROsVNJCr8V4o7VA9XWGH
         rFpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532EnTBjf6dGRl8vWQUacnhY82+a9jn7XkUpUFI9nhFkz8PZLtaI
	ilUetR3j237p8o4tKZGmRkE=
X-Google-Smtp-Source: ABdhPJy93KuHWDfM0rjD7Ry0KBLp1z/4GDzbOvmJAbDBUSiMXWfq2s7iTdKVjP4AB7vR2/jhnkZ90Q==
X-Received: by 2002:a19:384d:: with SMTP id d13mr700012lfj.102.1603368124993;
        Thu, 22 Oct 2020 05:02:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7313:: with SMTP id o19ls275582ljc.11.gmail; Thu, 22 Oct
 2020 05:02:02 -0700 (PDT)
X-Received: by 2002:a2e:b055:: with SMTP id d21mr813029ljl.244.1603368122621;
        Thu, 22 Oct 2020 05:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603368122; cv=none;
        d=google.com; s=arc-20160816;
        b=0h+VWP1MNk69ZRFdCyNu1Y3Us1/8JpHpZY4CRqMwATJAvH5aatR1Vu1mE7lthq0N8Q
         8Lp20Rb/cRr5psQHTC4sVA9QZpzHfJtmIk99lMb3v75up7Npk3g+IaYeddJ+TtTNbKiE
         cWUgTGsAhrQKKlS3voHAfK7H+XwAvs/FbJcqg8YtLmsYKRtnSh6xSFESGlxgnhudSERY
         gYHGphZ3B/apXv2tT+nrRRL/xt4AO2FVSLDUjfUCqDhUCxuOXuLu1tImj/TbR9WhkhjP
         KOa+5oLi77uZy9rFUFP6caMncEPNdBEsA7uN3qQhpt+SpxPjzLo+FSZ3Cb9NkHDhh31m
         nWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=+hVKsxBqjNlnt2OaRNCbax3zeX4ERgpr5nTpLdsNTXw=;
        b=EJqejgAlkw3DoAwrzA20Y/ZhJZWLxR7vwO1pDVVEJ0YisYbgDBVFTsNnqpd6o0pF4V
         lfVWq7OtC1CTY35ewGO19xU2Xok2uaWIZuSRafgWaze9XfwLTyCFOJQaae5tW03GtqWb
         EGslO2LU5QsXDDf7gheoLVD6+TQnhNHHKHTABhnecSs8zY+hyHspyke9R6MgbYyLKiW2
         PvzvbQGyLzMFaXWUzmNbCeDqhcTG6/rXQNvC9D03DqcY30DCWdFzsOgG8lpGwDSvOYfe
         0JmgbjQjEOaygtOlUczeFn7U5VP6GJs9BzunJ0HGB3rPQqwqCJisOCTvcZwmJrFV/io+
         F33w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id t9si29640lfe.13.2020.10.22.05.02.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Oct 2020 05:02:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09MC20kr026332
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Oct 2020 14:02:01 +0200
Received: from [167.87.53.106] ([167.87.53.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09MC1xSA001430;
	Thu, 22 Oct 2020 14:02:00 +0200
Subject: Re: Jailhouse in qemu and ubuntu
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Andrea Bastoni <andrea.bastoni@tum.de>,
        Jari Ronkainen <jari.ronkainen@unikie.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <cd0ba433-1be8-4c99-841e-d637d2e5fb54n@googlegroups.com>
 <b4510771-f6f0-4771-9fe8-50a39589bd88n@googlegroups.com>
 <8e259404-32c1-7e23-d790-a5c52d800795@tum.de>
 <3f1b6c78-46f8-424e-7114-11d29103b325@oth-regensburg.de>
 <415463ca-566b-9061-77f2-be88125e1f2b@siemens.com>
 <8b501f7a-4891-ab51-579a-def18e60537c@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f16b13ef-0ae0-bd2a-dce6-0307e441d800@siemens.com>
Date: Thu, 22 Oct 2020 14:01:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8b501f7a-4891-ab51-579a-def18e60537c@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
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

On 22.10.20 13:35, Ralf Ramsauer wrote:
> 
> 
> On 22/10/2020 13:04, Jan Kiszka wrote:
>> On 22.10.20 13:01, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> On 10/22/20 12:09 PM, Andrea Bastoni wrote:
>>>> Hi,
>>>>
>>>> On 20/10/2020 12:19, Jari Ronkainen wrote:
>>>>> I noticed that dmesg gives me
>>>>>
>>>>> jailhouse: not as system configuration
>>>>
>>>> I'm hitting likely the same with Ubuntu 20.04, but not under Debian testing.
>>>>
>>>> It seems that the .note.gnu.property section is interfering with objcpy and
>>>> causes the "JHSYST" identification to be removed from the .cell.
>>>>
>>>> Removing the section while copying the .o fixes the issue:
>>>>
>>>> objcopy --version
>>>> GNU objcopy (GNU Binutils for Ubuntu) 2.34
>>>>
>>>> readelf -a jailhouse/configs/x86/qemu-x86.o
>>>> ...
>>>> Displaying notes found in: .note.gnu.property
>>>>   Owner                Data size        Description
>>>>   GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
>>>>       Properties: x86 feature: IBT, SHSTK
>>>>
>>>> hexdump -C jailhouse/configs/x86/qemu-x86.cell
>>>> 00000000  04 00 00 00 10 00 00 00  05 00 00 00 47 4e 55 00  |............GNU.|
>>>
>>> And the Gnu comes around and drops its own magic cowpat. ;-)
>>>
>>
>> Hehe :)
>>
>>> Jan, maybe it's time to use a linker script for configs? This should
>>> avoid such errors in the future. I think we have already seen something
>>> similar in the past.
>>
>> I think it's rather time to make use of pyjailhouse, define a simple
>> yaml equivalent of the C-based config format, and generate them without
>> any C toolchain. I just received (valid) complaints about all that
>> fragile num_whatever_elements and indexes again.
> 
> Let me Cc Andrej, he's into the config stuff. What do you exactly
> envision? I guess you would then also replace all configs with yaml
> equivalents?

I was always hoping to find a magic higher expression from, but that
will not happen anytime soon. So the most conservative approach would be
defining a low-level equivalent that allows adding the same resources as
the C-form permits, just resolving their counting and the
reference-by-index issues.

> 
> Makes it really hard to debug if we have a bug in our generator, as we
> only have the raw binary. (Not saying that we don't see the same issues
> with the GNU toolchain)
> 
> I'd at least like to have something like a 'jailhouse config dump' that
> creates a yaml from a given .cell file. This could also be used for the
> initial conversion of our C configs.

Exactly. We have a checker tool now, we should also add such a
decompiler. Plus, we can (and should) fix that latest objcopy issue so
that the current approach could be kept, at least as reference and while
converting (sigh) existing configs.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f16b13ef-0ae0-bd2a-dce6-0307e441d800%40siemens.com.
