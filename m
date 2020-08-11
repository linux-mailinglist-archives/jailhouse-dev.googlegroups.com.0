Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLFEZH4QKGQERIU3OLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id A218D2417F4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 10:09:17 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id q16sf3877862lfm.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 01:09:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597133357; cv=pass;
        d=google.com; s=arc-20160816;
        b=qrhcYdYK1dN4uSGV9ok1MTWFFf8U/J08AFwuUfhmQf1+mjBqgD2O1CBWwzd6ISuUv6
         mKXNI0fBBvoSYsHYqkTsLxzq9eQhjzCqqcCn5qfgalNbRE1wk/Gwddjq5Hzka0Un3W9X
         JnzdrBOor0GbDVRDMyDnw1cY/wCJoFUwH9gs9wkpzGA6Psbyxf/XIDixZG/MGcC1B6r7
         7Q7B8Z7VvmWwoj5EYFBusArVGyHrOWHN/sqabyhOcqieh4lZmrSwIjfSdiC2MSOPnldv
         UoLho3d6wfoVK/6IOp9tjxr76Dow3gJS248d8Q97FbvuC6frj3Xdr2Vv69wwXWYBVLN+
         sVSA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=od07OjOZRI4uJ+SF4PYHm0wgq22Jo54m2sZivJIHDC4=;
        b=puDFl1je6kfHwtwMMMdP8TAA9aRqaaRl+bDooWgQdTBz1VrdUYvihfKiO6dyfcPMgs
         RobQBRemjm3PvFoy60ypvyCXwsz0dd80jLqiRD3Z58iYXwtsb55kYTpFVVOLgnAZlXY6
         ye6advoMAxUs6pAyWKMKnAImCjOtwlGPWKs6YDHcxJAZZx6nC9bpbvOXpEZSAuZgtG5y
         GjJeFuGFu02PDgDNTD0GmBSaq7fpFlrppJI8Yj4W8cruI44xLMNp8urhQvSFD+bkrnxe
         YPRVfrCvKI6le/U/iV69DkKdvI1zW1ztNeqUiLWv/SgB2XcRtMCPlBOYG4tLhqKDPy7L
         ul9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=od07OjOZRI4uJ+SF4PYHm0wgq22Jo54m2sZivJIHDC4=;
        b=n9b7IN4Sot/quE0PKy/+XslZnVloDO1+ivt+g/dOD6RBOgmsJK6Z7QjslpWQ/SgRzM
         wfnUZ2owT0qY0QJ/07czYA2D2laxFLkMghcw4rKVUk+asTuI4RTJL0o11KY3pS9V2Ai1
         jBpuvdSJSgv/WyAkNpZb3hNi7JDFwPt96N+8NMTc3eIIZu9L3Cp2oKiRuOG2dFcSqliR
         DL9njxQXYEnORys0is5iergxvTTeAxxee5d4BMiZHXopU+nK9pOG8r3zuc5VxbmZxx3l
         LvnbFjY+F/bARoE1kFCNwMv1GnhjLSiPrWxYEf3YqSwwZ5pMjlfvF7nubXq0TOtS8lAh
         CxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=od07OjOZRI4uJ+SF4PYHm0wgq22Jo54m2sZivJIHDC4=;
        b=APqiY7P4W9qppQSBbB2ThiW4gx1QXmTqwGNrkU21y6CVXvPXJT7reh0HbAnXuiAcVY
         T+T2gbjW9k84//xRUhqaw8hsi1S8hD9uEFs226oyBtojVXHWf2+xQaRXCyMNDL/WbXki
         Jtz8OGtE+0GZToeIy7AkcIZCtodoMjvNdGe23XVkpIzlVGb+gZtTTvL8FkbCcjqZx3xb
         XMEovdHvoPa11jULbOYAfTbTxqeK+1HhRPD0XDHY6kVfVqv83Ap35fXb8WnJLlzG6fZV
         40Hq0k2uZxhm74bih9d56tvlaqmrMR07Hy8dPMwlkY7u0zLOVuFuLtVuOASUcGor8qtV
         pWCg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533EDPbnnyS9VGs7VPDnD3EQ8VZO62oZ0Zp9UQAyDtt0V4Dfj814
	ONGn8Umo0FaSI0EIZV4Lp/w=
X-Google-Smtp-Source: ABdhPJz+6Vn2AGNwhYFeBhQhmdhahR6j7tLCZ23ltVm1BeG4TmA7kxQUid3Jl0dRmJTQ0NcbN5/SAQ==
X-Received: by 2002:a2e:a316:: with SMTP id l22mr2569275lje.301.1597133357133;
        Tue, 11 Aug 2020 01:09:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:60e:: with SMTP id 14ls918431lfg.0.gmail; Tue, 11 Aug
 2020 01:09:16 -0700 (PDT)
X-Received: by 2002:ac2:5e3a:: with SMTP id o26mr2707177lfg.78.1597133356475;
        Tue, 11 Aug 2020 01:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597133356; cv=none;
        d=google.com; s=arc-20160816;
        b=aAB74rI//HTnJgt4c/TB7+qqxs89rf2tUirVtTGXzn/VZIyxWvcFVQzlDoWSux758L
         xzncs0TSM0DQ5APB99XmkPwns6nUr6dLeVfdCMF6gP+E/GNvWqOiq1LjRPA9/KkY9bo8
         Um3mgXzCLrzlOtNFsu/zZtEQn9RfZCsgKF8jLCHa1pXuxeCPqT4v5TwSrGNpwmBDey5+
         G0RcgqhxovgARq+p0ACnfgoNNjWlR4U37qMsAhjfPZxcy3orsylBT9b5qSFyXOY45CL4
         D5QdyKLQIHoDsTc6kmInGhTpxXZZNcHIbryB7M9fZ2xr0qsaiKR15aGYabrvLl1+Vi9m
         5vmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=YxEnEFp3FUzlWwoJC2GA05K/6p5Lv28KFj4BNgfJCkk=;
        b=umlzV6zcJuqaHA4H17G1vIlEE7U09BdvR09bmUBoQs9LoXfsSyiKHHp3bZF2RGOrIr
         pymIibS+iLIwBh/lsHWSvKdZy6f1wlX71FKN0oYf6ai2svCfpbjhvlArq2SFhqjH/oWA
         HCYNf4B7SIQvY3Xy1afkMIWXfpwZUZhPqzr1jhiKyb7BjftjyIrBT3LH7iOtzqRG9wB+
         jxwlN0OizTRXRJd4pGx7dnBGCl7OxVIMpYEWBm1McFbCTuxhTfdvlVXWdKCJu6WHA5Aa
         fT2fQS99HEDNfG22Jgiy8jpJEEmnyflbccy6qPItayWzHXPtxAieCtOpsc/LoxHdA1eq
         YVeA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 69si1025894lfa.3.2020.08.11.01.09.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 01:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07B89Egb031470
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Aug 2020 10:09:14 +0200
Received: from [167.87.76.230] ([167.87.76.230])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07B89EFR017966;
	Tue, 11 Aug 2020 10:09:15 +0200
Subject: Re: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
To: Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-9-peng.fan@nxp.com>
 <4821d0a0-f8f3-582b-1182-9c5424f68ec3@siemens.com>
 <AM5PR0402MB275665257ADDAFEAE4B42B8688450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
 <b62f684f-82e3-51b1-e983-e191d719284e@siemens.com>
 <AM5PR0402MB2756172E76077618D002D48088450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <91ede2a2-f658-7588-7add-fd93554e66d3@siemens.com>
Date: Tue, 11 Aug 2020 10:09:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0402MB2756172E76077618D002D48088450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
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

On 11.08.20 10:07, Peng Fan wrote:
>> Subject: Re: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
>>
>> On 11.08.20 09:49, Peng Fan wrote:
>>>> Subject: Re: [PATCH 08/10] arm64: sysregs: correct SCTLR_EL1_RES
>>>>
>>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>
>>>>> bit23 is SPAN, not reserved bit.
>>>>>
>>>>
>>>> This is not correct, see D7.2.81 in the ARMv8 manual.
>>>>
>>>> Where did you get this from? What is it trying to fix?
>>>
>>> DDI0487D_a_armv8_arm,
>>> " D12.2.100 SCTLR_EL1, System Control Register (EL1)"
>>>
>>> This is just to align with Linux Kernel, since the head.S in the
>>> bootloader needs this.
>>
>> OK, this is ARMv8.1+, I was looking at 8.0. Are you sure the reset value
>> changed from 8.0 to 8.1? We definitely need to remain compatible to 8.0.
> 
> See https://elixir.bootlin.com/linux/latest/source/arch/arm64/include/asm/sysreg.h#L577
> 
> It not have bit23 reserved.
> 

...but set. That is broken with your patch.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/91ede2a2-f658-7588-7add-fd93554e66d3%40siemens.com.
