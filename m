Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAWC57WQKGQEOYSBXHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id CFACEEBE7E
	for <lists+jailhouse-dev@lfdr.de>; Fri,  1 Nov 2019 08:38:42 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id p14sf1545517ljh.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 01 Nov 2019 00:38:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572593922; cv=pass;
        d=google.com; s=arc-20160816;
        b=nmznkz/xi4UpR0cvQ1PHNKNbm1EGeAL5/I6CIW7jo76lIsg8Wwb+YJ9LI+6SLpXDo+
         TmbyuBez7IbkT5oex1MnknxHPAASl4YHS9aheu0KEA7IFTtPVcivTPu64yIJ2IjV//VN
         7C3aK+QnB08yhICjWHsrbRHT2ZYCjxoqfDzIfB45EZHx9IAn5PgsUxmFC2jOAwxuvmu/
         W/UChmMsG33XwCWDsW/Lqv5FkyRlNt94E7iHY0uYAa4RCiGHbYkGsvlX/HXRSdJK0cF7
         TNKaxfocnw9aSyH6ji4j8QqlnuYfCCUCC1OK4f0lCqyglnemyUKavOGjq8o1Tyd8PQk4
         H/Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=bJsAiDSEr56CVpBkmc9YVTirTzWjfgy2kHZAt60a9CA=;
        b=nCYfMXrMQ4Zptk8cNDZawGfb+03A35izZ0rGdiMrkUBgaTRouna2RGXCoI1B5oNhVU
         TqGgiMYMCWKLg6ztSEQ6RzodjwX9kuhBH5/EwCOM+DXlOS0UdUDNQZcPA0rL8y0NN4HP
         wxMRuI5pwGhZ5Hc5YK8YAn+OLgO/BePCHxLpFuw4PAHK7PaI9xqYa1sgNPyciICTmAdd
         KCqoj+/ZZmwBbEygnF5KWCA9q9gWUyIlbaKJO65XuqUrxX9wrYqxdW9GDM/Z4MDT8qY4
         ndk32Y8W81j+q4EObtP08Z6Kccj/RPwBqdc1HB02vl9I1ZsCYuN5uEYU2Cr/KMRCsP9k
         ipqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bJsAiDSEr56CVpBkmc9YVTirTzWjfgy2kHZAt60a9CA=;
        b=hPhbqveT3edxj5l9+oVWBf8jx9kH1MF9YTwGbY82/SCeNCQvA0o5tT9/PS05UY9jQq
         7YebE1wRF0V0eKyUKQwRHtzeX5YjCA7QX7JKFYbJbndyTq9VSwYvaOAs50a+POOqjgyU
         xgKxed57EgelWObczBCBy08jsPwg7Ep7dOOdqsxN5yH/jtVCGs9WeeAqq735SSBFydU7
         SPOkfkChxVk40RM/4atnR0tEnJ1WUqdJ2uS7dkT3RC14xXYoqK5CX56WFPYqXHOn7y++
         Yw4VG4GaPAus+DUsVvzyU9D2XDOiUd5dVQKcsrOCAnorSfVF3AUwbLWid6YkJiwAPF3R
         x/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bJsAiDSEr56CVpBkmc9YVTirTzWjfgy2kHZAt60a9CA=;
        b=UW1v4ym1rZ9GJztTpW3wgq6IpwC5vqgRPySnzVikhQn3MD013/w3n9kpvPfhrXwxqP
         NlFQnjWosT0QlZQELMOUycHButJjbq49ZbuK4fT3a9t8bhxy+lshv5gNIm45In1AAfAc
         SlG7ZajqE2r/9DFOJoPhVnmYiUy3lvp1M+zKNCFcaT/1bnOvbv0xFXlapFxYM6y/ucN7
         kjlT9luz3g0WgEbeC4dTAkWpDCr/+LNJvVdzg9yrOUR5gOTPoiEJzcfN9FhOqphQqwn/
         jh4UZV/D1nqXNm1irkGk0wDgyXPs8A8w0pVvscL82LZQFgyp28u3oNuvRPIhJu7JRjge
         nY5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVDdIB+SftdlSzNetDfOGpA4WE7qttSrVWigOqBS2/SDzlx1hX/
	ssfheGVpTxQEygX1l5WVorw=
X-Google-Smtp-Source: APXvYqxDtaZJZtPj903h59iODQOwdavs2ehRCOdIYwwu8k88k9BWHqnUpQ9dyEkFHuSjG4U/XvnrrA==
X-Received: by 2002:a19:ec16:: with SMTP id b22mr6785643lfa.74.1572593922372;
        Fri, 01 Nov 2019 00:38:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:42d1:: with SMTP id n17ls536089lfl.5.gmail; Fri, 01 Nov
 2019 00:38:41 -0700 (PDT)
X-Received: by 2002:a19:654d:: with SMTP id c13mr6271035lfj.30.1572593921548;
        Fri, 01 Nov 2019 00:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572593921; cv=none;
        d=google.com; s=arc-20160816;
        b=R/3Q1iBLDbUdbmOzmxWPYTjyUgsFNZrJtWwtNWjgc5AhYu2kRq94dxz72qy9jTvc4Y
         CbABymc+vgWeTJ2BgJbONY9TBKRSd+6i1GVPase2GJIbiQ+IPfxFuxGjtx52nXLTkcIe
         YDIOd/3ShFNLM9Wx+aaOTLqIBGJejPRk88/JXb+uimtPj3uW7gkEIkarAyl/IsvKuFtQ
         k8GZYyfz8TxZoGWVMrZ7rkWAcpG3PXMYXfvpAYHB4O7bVnIi46ZWsZM7GXbRHaore0Qm
         yCu2Vcn23PvumdaEXoOfrG6e5ldxRWTjfDhds4xMKindOs7+5OsqYGcNTrpHQ4dm7LRW
         L1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=scpiqYkCWRjpsLiPNK1ZbRMNRaV1s5hTZD7oOd8I2jA=;
        b=vCqzsYZIwuc2CcF3foCB1eOMT3zkm52oD+OKPL09jYvdfkNW5b5Jeh5W6vAwcZlIca
         sFtNOl2Lwk6gkjTLs6n5oaYyBege1hrpxU6oTc1bhOsxu7kpVRpppQdI8xDIvdQoHVMH
         kCVME3YbjwVeYdxUMJBrJcMHEZ/Y+ON8SCz/ans7ie0BIsyESREo4LhJR4vhGYplFYs3
         UFZCaXpHBZCe26LnW9kPZWJTxqmyf+o2FsZCADUb+dPXwrTBXunbdE2bjKKZ7u90/obB
         7It4izspHjvdU5kXJQm5TV/+iFk/0Gk/5GUrGy9LMoPa8ibBnNtHcAcwF/OKeCxSG0WM
         +MoQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id b22si485579ljo.3.2019.11.01.00.38.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Nov 2019 00:38:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id xA17ceKV015681
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Nov 2019 08:38:40 +0100
Received: from [167.87.40.255] ([167.87.40.255])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xA17cdAw011756;
	Fri, 1 Nov 2019 08:38:40 +0100
Subject: Re: TSC Frequency
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <01105881-d1d1-4931-b950-0b6028cd5ac5@googlegroups.com>
 <0d4ba667-fb8f-40a6-becf-69958143de2b@googlegroups.com>
 <255261de-a630-4790-b91c-16c569248829@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <92f21f29-0e44-7ab9-d1eb-0576bf8da429@siemens.com>
Date: Fri, 1 Nov 2019 08:38:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <255261de-a630-4790-b91c-16c569248829@googlegroups.com>
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

On 01.11.19 06:59, Chung-Fan Yang wrote:
> 
> I also noticed this.
> I am working on a Broadwell machine with 2.2Ghz of core frequency.
> 
> Jailhouse get set the cpu_khz in comm region with the frequency probed
> by Linux during boot.
> I got somthing like ~2.1997Ghz in that field.
> The difference is so small that I don't have a good way to evaluate it.
> 
> It does sometimes make the process of maintain a proper systick
> frequency in custom RTOS painful.

The forwarding of the Linux-measured TSC frequency is an offer to the
inmates, not a must-use. You can either do your own measurements, use
hardware provided data (where available) or even hard-code a known value
in the system configuration (platform_info.x86.tsc_khz).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/92f21f29-0e44-7ab9-d1eb-0576bf8da429%40siemens.com.
