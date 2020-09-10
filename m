Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSE5475AKGQE3PTUV7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 160C1263DD3
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Sep 2020 08:59:21 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id s14sf1888751ljj.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Sep 2020 23:59:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599721160; cv=pass;
        d=google.com; s=arc-20160816;
        b=KINBPkTC5AQC5GZAh2IDIO6/4Losr/Jn0n32v8TtltQWsfm8xEmcT03K3sxqnsQn22
         PwZWdw0+mWkxI8FdtJGwCH0TI5rTYL12qNp0gUN5/pVa7Kz21vG2EU/MWQATP2uHVPwu
         BHyLQ3289yT6uETrHZsdWdkI41aYmkBy9NBdRF9927NkMyijH0aZwv78DBT5D0341wUh
         6bjwBa1Tmb7wvQceS+LWdUMTiCXcm1I5V4ZMYEfCSLexvAYBYRtQaFetvfeT9Ingx61w
         UKHP05y9oY8XIffbS91Md6gI/X90fTGRTgyDbimXwQghE6cdFMjZThTmk9brMk8J9aSB
         WOIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=FGZ9mmVBqeIVB7zInc5gbDKdGslUM2gliFx7mjNlogc=;
        b=scuCjsKGp9fz1mAnJgScC5Vr80PqL2j0ExRq9sG0WoO3WsHAlrTk4pD9mO52leOaNW
         0l390I+LTUzC+2w1Reg2DKv/32v5XsplL1RVEYsoxx4rCqV+O8io2NM+Dp2yeLftKslA
         jfn1zkX5n5/4J5GnKNQCe3jgM4QYAFkqCk4ujhj1NJVMviIGhcx0aZt7Gun+HQgeHZa2
         dQMbsBNeVqsO61WJpuQOH5ZpAZJb8g9RxSzl89/hffhQzUVxL84sluEDEBNq8Glv3Trk
         UhcDb9mNGpm78pjLqblUt2L7w7pns+NKTFXjXxb5yVX24YZ3Jsjx78O1aoULaIa5qp4N
         hwEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FGZ9mmVBqeIVB7zInc5gbDKdGslUM2gliFx7mjNlogc=;
        b=GEKd8V+XoTitDEn3OyuJmSJF4x9LekoZxvTJXaAnkcuGpUGccIuK5XRdoltztE5asP
         a+xFqFdKSazIHk3FNxHTtORKtwz9DHrxIjf5eh1x8T7O18Bdp/uKacv5Aa+mv4zVooxT
         9E9OKHsyRmmXMU4VUMDDtnEiPWjuFAUPP+tXOmopjo6BCs596MalkSYcqdbs/dmv5ybr
         gqVlvz5Q408kxk2dEp4Kgto7Gbsmukkl/JHRsAfSX/LUGmxIhXC1LONCLaqaofBQG/zp
         Fbovp6bPKPoYbF/plWmi7yzq3l8QNTo8bhcFdN6PWzdGbi1uiAabddANcLUvokpBT7ci
         RHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=FGZ9mmVBqeIVB7zInc5gbDKdGslUM2gliFx7mjNlogc=;
        b=IelDnMOcu2r+TNGaK55ixzr4ZPBxE9bsJvZG1drDCqM28/0QYX389/1tZ6Y5Cq/r3Q
         ijJmqY+BUxlS9MraK69ERvhpYX/g+7FTuSHMS9dI/oGz1Btw+W3z+OG8M7vVzp8x5i7h
         /ItaYBbmkFTHwRdbHTG2+cOT85GJOpnKuZ1y0l3epi8JZow3KfhHzQE/grEX4uNtLdAG
         emliXIc8rqOdawDca3Y9bUBpSy/vnKm1Jak70zRJGOOoJD/YIdJVP1KpTvirXtFeMTD7
         jbccAVX6RLGo3d68OHWAoGR5YHVG5fkvutJ9Mo+cFCb4NrUXDym6MJEArLciPAWxeTig
         qbNQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531MmQTA+icWI38XWy6HS4DFqI2VgqIehDm8YJiMCJQHrL7TB8yM
	cj09FHGedKu+UHFMCwJdNM0=
X-Google-Smtp-Source: ABdhPJzxSZ8k2l4fYZ+SmKlwDobc6EGGmmQ8i5Z9pzlGvMhX0nlzF92LgRrAxVhyO1QbrzMeT1epPg==
X-Received: by 2002:a05:651c:151:: with SMTP id c17mr3918174ljd.467.1599721160517;
        Wed, 09 Sep 2020 23:59:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:93:: with SMTP id 19ls1156401ljq.4.gmail; Wed, 09
 Sep 2020 23:59:19 -0700 (PDT)
X-Received: by 2002:a2e:4554:: with SMTP id s81mr3837082lja.121.1599721159157;
        Wed, 09 Sep 2020 23:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599721159; cv=none;
        d=google.com; s=arc-20160816;
        b=wvEE2ssUbBj9V58LjErOqFlQ8omEMe9kxmuHv1VSlbQxej8rwUSdFD16G8Nw/1Aez4
         wzapnHi0DA8n8mDHBuv4QaYta2TQocDvmQS6lq/H6dm5yweg5KY/juq3LxFniorYdI1i
         T/9EdLODpBX+U6+/3NbFmCO+YyBZngiiB8QO0w8A7Oti/sTRX73Raa6fI+myVgXjZXQg
         qrJQgOA1/Al9L3RUSquY2JqIE0AceIN2U29GmT3Pfij8QVoITw0EIa1bcQ/tBCFTu7Cy
         1Gs2nRcUpWMw15j6z9W5qDxaZ0z7+TLyDY40/T1b8yXO9u/iJuzfZfeYX9LdOu7UftLx
         h94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=QCx9rZ1gbQCmD+4Z8N3WDelk7KZ1tuhXNc7OCDdrN2A=;
        b=fVexMALKCzY9AGHjAfIUeuvJW9LXgXT+ebOnmV9pOMjHfBYKuOMvmP2cdl/6MAt0ct
         yatTaYPTGoW4YEuwLaz4IaGfD6F2MVh7GGvcNJNQRyvWNnw+RPjit3ybkNMZsdn9v2lS
         TvHWDpcfGrdRH3pkThaN2tWi9OGJNQ9rbFrlhVgU+n2zM6Yf/PX0wxvCnTVEV11uWduM
         M1frNlWqup82YIS8d+5v7U/z6AXU3deN6cYOZCWo1uqefbe8VvykdKzbNG3zuOFhq7Dx
         uQ3GiS21fYpZDVE/JW0wWU1UaX0KM+2junfHpt/YJE5lTw7w0VUZFcFIg5Oa9baqb/+h
         29Cg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id m11si139553ljp.6.2020.09.09.23.59.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Sep 2020 23:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 08A6xHEn007236
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Sep 2020 08:59:17 +0200
Received: from [167.87.23.29] ([167.87.23.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08A6xHDX006413;
	Thu, 10 Sep 2020 08:59:17 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
 <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
 <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
 <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
 <0f3281b7-5da9-d616-d7ba-775ae1593e0b@siemens.com>
 <9dd555de-385b-429e-827c-408cbc04122fn@googlegroups.com>
 <42b8fa41-88cc-4907-bdce-44474b98d8acn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8fc62bd6-478d-9725-ca0b-949f6e9217db@siemens.com>
Date: Thu, 10 Sep 2020 08:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <42b8fa41-88cc-4907-bdce-44474b98d8acn@googlegroups.com>
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

On 09.09.20 16:13, Jan-Marc Stranz wrote:
> My serial port is "/dev/ttyUSB0".
> I've connected this with an other Linux PC and tested it with "minicom".
> 
> But if I start Jailhouse with "jailhouse enable ..." then I do not
> receive any messages via this serial port.
> Do jailhouse use "/dev/ttyUSB*"?
> 

Nope, we do not have a full USB stack in Jailhouse, just to write some
character to a USB-UART adapter. You will either need to enable the
legacy UART(s) on the board, 0x3f8, 0x2f8, check the BIOS and the
manual. May also require some header cable. Otherwise, try the EFI
framebuffer console. See Documentation/debug-output.md for more details.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8fc62bd6-478d-9725-ca0b-949f6e9217db%40siemens.com.
