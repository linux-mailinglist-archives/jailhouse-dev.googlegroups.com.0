Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBU6ZH4QKGQEMTF4NGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7052417A4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 09:55:51 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id x13sf3852035lfq.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 00:55:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597132550; cv=pass;
        d=google.com; s=arc-20160816;
        b=mvLFhyIw0nYo1R+kV9FT0dbclj7l3OKdNMe7Akmz2WLLnjz0r6xtqhZOlv1GaLooxX
         ag6vVbFhWx1casdcXhwZaqJWonIUSeaO5ccwRnLGRKghm6Pl6YyieyRPIZW0JT30B2k9
         HsjbpAwOBv5KOM2BSarqBLzdI2VgGgFaUb/cLIqYbr6UiIae5cGTarHw3oo2+iITdRu/
         RdgYuvYlfbaTILJ2x7ZCJzfyMT5Wq8RFf82h+oxvcYjVXl8Dz/IpyIM7mSzKpEQSB+Av
         19ald9R/q8Qsg6ijehIH/CNomN+KpJvQDYyA7QTOO3mw52muZ28XARx3pP2131745eJe
         HXIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=eTgNz8I1+9qzI5a88aHGmp9BB5rmKEIBbZj8UTTKPlw=;
        b=rH7WyCDoxTpcXMduRb60QjoB5PTqKEBvnCmtZs4+V1+k8bIMpm5YEt9HqZ1AsFvZbt
         x88eFQF8xjbQQZisz+e9exyNsWEbxMbnGayr2KyPF+jJwVZOWSM7J2eV2aXfvIWuqb3D
         GkH1ApyuPt6GEBnc0Ej476f+1CvsVv1ZB4oKyQ3ZTiKdDTkg87McAWak64+xSwsnbeaM
         G66h9+/vcCP8I2ij5+g6jYG8fNXiyWc3Q4bRpfXaWWvbIo9v4JvXhCe01rHEK1EeXhX/
         eDPzhTkbz/JRWV0IXmWC5VBqjcBmZFHeSJ6FNrdDcI4UnURlkFe/Kk+CpV/WbcQt+gYX
         b0GQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eTgNz8I1+9qzI5a88aHGmp9BB5rmKEIBbZj8UTTKPlw=;
        b=cUZPva9FO7nhCblgy6dupmrm4kXYRQU7Xnh4X+ghQj+AFD4pDyAeXGc6Jnf+Wk/Aqc
         3kWilP4awls9KTbMeYQylQPxg68453pPiZ9VNDKJFBhCggdPtYsR5g766U2v0iXYMQfy
         VGhmp9dwl3cmKjVlyyRKeRUSAT9s2GyXm+LTSxQevFNTA4ikKCi5iBM7OvwRqMz/NZUy
         XYTpZGhUqwbCFwWzOYKKYA5CLd1jYsYO4a4WHz2Sju/Sk/O3n8fUdysxr1K19466foUd
         AaUSCFmhRmakELjrANblQjnB7zc2KGQXEpEah5oxuDWK12prK+nZ/MDj8xVZ/xkWUI47
         l/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=eTgNz8I1+9qzI5a88aHGmp9BB5rmKEIBbZj8UTTKPlw=;
        b=DmFc2LZsWp1xcFMsiA06D7x+taNxfg6X93i0uLpSm1SuAiwr7nOJhWSiPQ7kErNkCL
         O2w1gd5BkYpoeezzibvM5Xqqv/cnHhDTEiW6B8UR/fjuLrMSeDMsTRhhIlmXVE8yAIFg
         ijBL/NT1DlJ4H/fyNHi+xR4MduEVtlqL5rO5Iz/P/MCrKP7PlNi2qNBHNyHZfIMREHr1
         ZHSmOYkqMBBPfcW24puOMErcRKsZSMZzkEXJoFT4/eJTqoijONAziLrU+PdcPPBR0mjN
         4LPgu6m/7PQutPmYtzgiJOjWbuguMseu9PEZv8JJeLuA31AsAiMPykDyFWbHrWk3UUSF
         XKhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531p8amem/BZPhLxPwAr1WkszDtTuF+oZMtYaBTAEee6jowYrmsS
	DblyrzRbx81VmI84jRtBQ/A=
X-Google-Smtp-Source: ABdhPJwp7Hx5/yZB7lGI8fk10an3eKNtGF1og2v9Xf8Q93Pm4+ovhwPcMQC0v8DLwzswQK1a2tGGfg==
X-Received: by 2002:a2e:4601:: with SMTP id t1mr2538654lja.391.1597132550547;
        Tue, 11 Aug 2020 00:55:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:60e:: with SMTP id 14ls905611lfg.0.gmail; Tue, 11 Aug
 2020 00:55:49 -0700 (PDT)
X-Received: by 2002:a19:4c57:: with SMTP id z84mr2676857lfa.92.1597132549723;
        Tue, 11 Aug 2020 00:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597132549; cv=none;
        d=google.com; s=arc-20160816;
        b=DHIy+vv6i4ioskFbQPY9/X52Ad+SXkmmsHuf4EcHo2kxU5DWR8ARAOGACdoEMOboSb
         jy2nG8GfPOv2a8Q3SMsP9uJkR1vvdTbX8IBmtRJZpOkPehHGIWCpEscOaCDAra6q3rzo
         +eP8it9GB0GkzjMy2nFJ8UqTMN7gTgTRYVOGAyt0FtOseA5Era/tyE0QFGGzUOFs3pUv
         xaGQVHcuaL8zPCrCrYpoE9wzINqBShAp/ZiL2gKeH6LDmncfdrQikxsR+9iHdkmN15bo
         3WeZcepYPIb6PW0Blatsb0CoeIx7SRCKjg93KwgeRUI+bfCqrzMUxTzGIwjGo13PzbMc
         kQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=mS24FIpdap+GBB3JuEoUPT0hrtD5lhs3mdbNiBYE6ys=;
        b=XUkypTyPjASMXzYweUJqTBgc8xUhXeRx0a+y2A/W8zaPUKVjdqkclF1nALdLf9pZKX
         8qXUFGpl0h2EnwUZuQ2ShE2MC7Qwu+Hot053lbFhxlwuP7FUyS05AXXa/LfIrBij3llL
         cTGeweGfWbzZHPwf1qDCoMFeJ065B9QCBWoVhidw+HoAnsSmxdmVaHscBs2VpqttOjYk
         I3ZoPmm0qcbDsU4M/s/To50LR7jhNdu96hPCOvMW589IoTF7k+3yVnJYia01HZWtMq0S
         nJ0APC4zHQkhttfYkfQ5rFOIt/3tq+ceMUSFrvP1FnBDVg7jdV2oEH0WCqm7XN1dTpMQ
         sWcQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 69si1023820lfa.3.2020.08.11.00.55.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 00:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 07B7tnvU030117
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Aug 2020 09:55:49 +0200
Received: from [167.87.76.230] ([167.87.76.230])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07B7tmnW025784;
	Tue, 11 Aug 2020 09:55:48 +0200
Subject: Re: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
To: Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-9-peng.fan@nxp.com>
 <4821d0a0-f8f3-582b-1182-9c5424f68ec3@siemens.com>
 <AM5PR0402MB275665257ADDAFEAE4B42B8688450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b62f684f-82e3-51b1-e983-e191d719284e@siemens.com>
Date: Tue, 11 Aug 2020 09:55:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0402MB275665257ADDAFEAE4B42B8688450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
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

On 11.08.20 09:49, Peng Fan wrote:
>> Subject: Re: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
>>
>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> bit23 is SPAN, not reserved bit.
>>>
>>
>> This is not correct, see D7.2.81 in the ARMv8 manual.
>>
>> Where did you get this from? What is it trying to fix?
> 
> DDI0487D_a_armv8_arm, 
> " D12.2.100 SCTLR_EL1, System Control Register (EL1)"
> 
> This is just to align with Linux Kernel, since the head.S
> in the bootloader needs this.

OK, this is ARMv8.1+, I was looking at 8.0. Are you sure the reset value
changed from 8.0 to 8.1? We definitely need to remain compatible to 8.0.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b62f684f-82e3-51b1-e983-e191d719284e%40siemens.com.
