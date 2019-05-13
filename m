Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPUV43TAKGQER4WPFXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4031B9C1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2019 17:18:23 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id x1sf2875035ljh.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2019 08:18:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557760702; cv=pass;
        d=google.com; s=arc-20160816;
        b=bRrKRKgAXt96IdNSm/8mjXe405/WV8gRMUtv6lEk7GE9/3jYwS5ek9CxbdSbM8xWF7
         wtUsFQ3l5GKR520nbwTAZyfRrk1ZqV/Jj/nUvH/hmCrzHVQcTjiMF4reCHmPoFnv+pmj
         UU0ra8ucQMSylT4SEmyl4trwHv60DVLICrxx/HhbGW28M4XVLG3hCXulRcjXR1EmhPXL
         hg+T8MqIxpRXOg9Gcz66sRI/cb8T0uOabU+7whtchMGowxhyi+Gt1eCKQg86c31L4c3f
         WPjYriq0kJzQ9Z+La2a/u9f7RnruRyuJJigjkUCGQT1efjQbG60eTR8erxWFWxVA73Gy
         X++g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Vy7vWIcHOVugvsW8oxf+g4A+k3KZk/KYhvKlTVPGXJU=;
        b=tq64Wt3FHiqYKCNifMrR4mCAaaS46DPDDCSGQM/bsFy7nFrRLduAdz5anHqC0wMiOu
         314NwmkYK55BxWVpv8pnE+wt2cohDacBxeZIKEVQEELQa9U5EJ4cRMSGspj/ccog43A9
         YcBV164FrofZoEle2y7EP5UWwEPGBI2M0bmAWr2GPjAnXPWwr2+tdO/PUdZvsCMOQJ8U
         i2xJREatycP1xkLSLg8XXBfdcsln0XMqcB8NVaJ0jtHl5F8Jrp8doVsEmu1ZlJCGnYsI
         bvPDevCHZ4b/YYDDmZBkNS1FMEey4bWQg+jhTWdYxEDHCUO7JkSvj/0SO1ggQ3YiA39x
         joBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Vy7vWIcHOVugvsW8oxf+g4A+k3KZk/KYhvKlTVPGXJU=;
        b=qg+S57ZHKSxZuaFd7PRqPIF5/34lpL8SIDr86gBqqnT2q1YDhZkSZj9aqHKCw5yYw1
         e+Ds3uyBuVaBr+hbl2JL9Wu0TnodgqF4xt0K2GYElcd+3Ywbmr14frw+KlqUZRFw8+e9
         CrNhu5LEKTs8SEfY6mFFX1eUNAHZgHiYF657UN0txJ3bCfRtXhkWxpHmgCPII2sTkxjo
         V34KS7TTWM2D7tJVzcOmbyJViAeGtZoZyX6I5ZRrh9tOrqWe2pWNbhzJd6WJ1gB1EV0S
         1SZq81ErSyDAnAB1cSTDjptt62mcsHC5QZCct5C72LL4H+zrnxIplPxj8vGg5a7PH4fg
         PA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Vy7vWIcHOVugvsW8oxf+g4A+k3KZk/KYhvKlTVPGXJU=;
        b=k4D9ZOpXOD/fTsZpbdlD1+EqIPaX7CAAiqsJBr+P7gKG42sY1tAr05FQtWKfqPlCj3
         JsqraH+yxPDgZpK4QANIeTSErX7G/hBVLDaJ7pPDhunPTQtwbLt9CKpQ+ljQ1bfna1mZ
         Q8biWetGuMyR3I6NyYhl6DoIygzMXshTjGhF/he/SUi5q5MUYgPFfwJPtDrtDDgiAdfu
         R5zrbHoryiXnNQAUgTHQUmRVmMaEO6K3MV5ZEnHtjWRPwrQh9qnADmyUJ1nbB4lcAowu
         URQU1yaSbB/ULejRC2wTS8HHdiosPDG41x4g3Xdwnw5tKN41nvsNTdlDjSgfLTgMdITF
         ZENg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVOguW8EwwZyfoxBz1+Q0hCgCOlVlux04cOqb4sQ2Cautc0CvcD
	++COZ9EcbE1RG418kXpjBpw=
X-Google-Smtp-Source: APXvYqzXDjRodb7TKbQUkDNQeWcMYncKDmIXb5PU4Usq1DAQwxskNMP9Zzi4Y8JCEiMnmh2tBcO8cg==
X-Received: by 2002:ac2:51d1:: with SMTP id u17mr13683737lfm.151.1557760702686;
        Mon, 13 May 2019 08:18:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8998:: with SMTP id c24ls429927lji.15.gmail; Mon, 13 May
 2019 08:18:21 -0700 (PDT)
X-Received: by 2002:a2e:4e12:: with SMTP id c18mr14262226ljb.3.1557760701963;
        Mon, 13 May 2019 08:18:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557760701; cv=none;
        d=google.com; s=arc-20160816;
        b=GMQGPOWUXqJpkiGjUs0r9+yRBnmXg90EednEOEYzWLrvCaBB2od7lYzhvGgDsgXwaN
         25mDmnBcBMK4tUnGV12g13hFXAJf+KFTMaD3Ft2NXcM8ROCIPEgTS3egJg/MEDpSegbT
         9pEfAMzR/piWz/MC+F10ptTnwXYsomRNibbBZFMicRNR6C83ZAvZUojvXx448W1JTj2j
         Nx9KjYL7TCqcsVdreKjVm7PwX+ipNbrGHPcrVUVYU9yAKVCErJ9B7fauw3UoJQP7Hlab
         jntjVFb6z0v5Ow808xoryFPyOGr9mQOVpYcGmiQYNBrPmmKG3OTyGWpMTQJ6uXrUcZwS
         gRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=tDYp1p3073I4GOAoEmD9J8fq5TOBtYZOagfhZNpz3S8=;
        b=IO/kdOyLAOr8HYK28wjxzL2i6BY7O57dxcePS7ShoCOLVGq2BP2KaiyynBkuewCTn+
         06WT3YUHhUbqNhGJn7/unNDlPiF038/LgnJSECCKwJSecFrI5HEfScJh9m6vko8guyJR
         4kOlMwj6BbLbXDdiWyUEMW983QWHH2c+7LacxAL7+3gm4u69pLNAiIGcWNlkK6BilYQm
         s/lVAa1bE04vw2VvW/Y4KSQ1v1/v0kWVL1wpFJEVxE1bKvID1RbI7+khd60+g7REJqd8
         vFiSrcMLZMsEj2sc7D3qoOSqUba8rvOsoEEkvSCwNNOwKD+75qTUjrSR7Bv6FAGju1QY
         AaMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id c22si2493382lfh.5.2019.05.13.08.18.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 08:18:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x4DFILZ1006127
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 May 2019 17:18:21 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x4DFILKT020647;
	Mon, 13 May 2019 17:18:21 +0200
Subject: Re: [RFC PATCH 4/4] inmates: x86: activate SSE
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
 <20190509210726.23168-5-ralf.ramsauer@oth-regensburg.de>
 <9e20c6a4-6e91-a547-8040-1e9fbd9614cd@web.de>
 <9f486f2e-b7a1-eadb-3c20-2a70e6422061@oth-regensburg.de>
 <96585c2a-3014-0791-e2d9-25709d4c8c1e@web.de>
 <6227a9be-f49e-a0f7-abb6-267a4947d386@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9603dbd0-1ee0-c0cf-bd90-15c7d0f077ab@siemens.com>
Date: Mon, 13 May 2019 17:18:17 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <6227a9be-f49e-a0f7-abb6-267a4947d386@oth-regensburg.de>
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

On 13.05.19 15:51, Ralf Ramsauer wrote:
> Hi,
> 
> On 5/13/19 7:37 AM, Jan Kiszka wrote:
>> On 12.05.19 22:37, Ralf Ramsauer wrote:
>>> On 5/12/19 12:01 PM, Jan Kiszka wrote:
>>>> On 09.05.19 23:07, Ralf Ramsauer wrote:
>>>>> Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
>>>>> hex2str or cmdline_parse routines). Inmates aren't able to execute
>>>>> those
>>>>> instructions as SSE is not enabled and will crash.
>>>>
>>>> Actually, this not only fixes automatically injected SSE instructions,
>>>> it also
>>>> enables their broader usage, specifically when doing floating point
>>>> stuff. We
>>>> should add a test or demo case for that.
>>>
>>> Ok, should be easy to find some reasonable test cases.
>>>
>>> BTW: How should we handle SSE/AVX exceptions? They're currently not
>>> catched and disabled.
>>>
>>
>> That depends on a general exception handling infrastructure. I started
>> to look
>> into that, but it takes more than a few additional lines. I would leave
>> that
>> topic aside for now.
>>
>>>>
>>>> I addition, I would like to see AVX activated as well, where available.
>>>> For that
>>>> we also need to enable the corresponding bits in XCR0.
>>>
>>> Will have a look at that.
> 
> Enabling AVX is a bit more tricky:
> 
> We first need to check if XCR registers are available via cpuid. Then we
> need to activate XGETBV/XSAVEBV instructions via CR4.
> 
> But we don't know which bits inside XCR0 are actually valid. This is why
> we need yet another cpuid check. Then we can finally activate AVX via XCR0.
> 
> But there's more: SSE4.1, SSE4.2, SSSE3, or even more sophisticated AVX
> extensions (extended AVX, AVX2, ...) may still remain unactivated. (and
> what about 3dnow? :-) )
> 
> What I'm trying to say: We should probably try to activate most things.
>   Having a test-demo inmate in mind, we need some cpu-local indicators
> that tell us which extensions are available and can be tested -- we must
> not run tests which we can't run. Again, a bit more logic.
> 
> My current implementation activates SSE in assembly. I can of course
> implement the whole SSE/AVX-fun in assembly, but it is probably easier
> to shift this to C-side (at least for AVX).
> 
> We just need to make sure that the compiler won't use instructions that
> aren't allowed at that moment. But that shouldn't happen as the logic is
> primitive bit manipulation, together with some cpuids or control
> register accesses. Nothing special, but C-language might help us to keep
> things readable and structured.
> 
> We need to do this very early (on each CPU), maybe even before having an
> intact stack. But that's possible if we keep the frame naked, as we do
> in the hypervisor at some places.
> 
> What do you think about this?

We could relax the requirement to push everything into hand-crafted header 
assembly by building the C objects that should do the init later with compiler 
flags that exclude any SSE+ usage reliably.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9603dbd0-1ee0-c0cf-bd90-15c7d0f077ab%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
