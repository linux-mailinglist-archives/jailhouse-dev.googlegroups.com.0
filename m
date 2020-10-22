Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBLM7YX6AKGQEC2KYATI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 6179F295BA8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 11:23:58 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id o9sf459264ljp.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 02:23:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603358638; cv=pass;
        d=google.com; s=arc-20160816;
        b=lt/GSHCUsuuIaJ8IeOHaDrN3Ha+PEONYzG0lyWlASKbVP4HAf5sCWXNc1ZM3QXjYjP
         W9xNulaCu8NpfRCsu0XE+FartCqjdDfATs2nfAwWt7EddNOP+lX5Wo05gS9HwWSGbaCX
         eEj54uxAoXgn/5kHiaz/pGbRIaYAsxpN1dVaf1UE/fF/gv3ZUp3hIg72YAfRnf79VGH/
         MeVov6mRLbj6Z2FRjiZAjUWjIdcDDQ1ixlgk08kpr86hrSMfX0TF+1RVChK8dsvOQEsg
         qqmsDBykqYCelr5Pubt1Jbzj/6A0fO1NIu2jicCMG5vZ4m/HyKDoyW8uf0hoCsZWKd74
         nPVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=qFUHAcOIRTd0WiAyhwHPIg4qE/rbRl049ZgHI5zO2OM=;
        b=OE9hb2ArihKOANxH5d/or/jkSPNPHWRdchC806zwAUCCl3F9yJqSNkWO8s2gxAZhLV
         9hW1PD56pXx91xNdoCDlZJkxyG7t3ZNy2DaUjZ/zu+C4A0Hg07Zf8Q16msymDNYsouSm
         Y2pDIRqETwXcgSi+bkkrxwuUNRdUN7b2HgO8+lWarAiTNxvD4+VKxrFKtGtHshm1yEGw
         l60HpnnzyIG1X30EAhcwjCV1MAGmYewy4kHo4RBBVgtk4TjvxHLVaufhM61Tr7l+zdx4
         igny3WtxHCwu5KyiVxLrcvfLtMdB9uCTKc2pTDu4MSc5EE7vUXmxiUN7w3aEQkhdVfoH
         IxkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=d+HIp3ix;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qFUHAcOIRTd0WiAyhwHPIg4qE/rbRl049ZgHI5zO2OM=;
        b=ZMCODpK8ZMI2c+wpU0GffO+RklauZZ1wgK98Ypy/1JsEgaibIAnsKCwm/Yn1G3IPoB
         wQWloW+qunVuqEYNhGvSDMakm1RArVmfg4Y0Qcb7E+3HDQ2TLnE8z9cvy6w5tWoJeE6F
         Pk9KIg6imCL+4CTmcp96wav2ZbFTxkP44/v4m8OSnDlDFq6YvlCDrDCp7OLHrhbwlDlc
         jLKeXd3z53gTNerpEUSVOZHFL4+TBlo6KtnMD+TfwpLfnMihaHslSZPGCzTE5c35/tdg
         97SAC/6b/cCq5kB58P57d1c2UMQoKAY2NfV1KOc8umtRRH0ZLpQsmmVqDXQQpJZ8spDQ
         cxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qFUHAcOIRTd0WiAyhwHPIg4qE/rbRl049ZgHI5zO2OM=;
        b=cHNdNJnFA8HC0S3GYRmWXkfQO7xDg0I5l7hBN5m/KXtQjrV3MOxCbmmmxIDyBAKB6V
         3GDtt2wTWJENUD0KViYebmI0Tf8E1lzuM8xW7Ua5PmxbaHRnSfUaTaAWtkPxS7x+NGXy
         /9h1XCfoykh7MqgoMXDz1o5lQt6kgUV3TNzkucbPeKQCDrktTxTrVc7eZvOPibuiHtVo
         2meBYJNvFxz1q8LgKgzhXL/t2K0q/N58AX+GtpoJF0G4Ei/zDhDwtCzuiOkmJOENsknP
         qso5vP1WTIAh2EjSdwfNk/zG7nLH+KivLDgNsHj9BLao6wmpBX1l62rv1kYsLs+QXWv9
         5UvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532qScM3FR9TuL8v/JcuisflnZieD49NjEDs1uiZnLGPaklo8AL0
	8qGeZ14oy01W7T+DOc/jOkk=
X-Google-Smtp-Source: ABdhPJxQqk6KPl8CMAlppjFUQeb1nPSo6+kyCCNuUpuRqvpgIuNEv5DFJELYMQptaHeUq4jQ6+t2fQ==
X-Received: by 2002:a05:651c:54f:: with SMTP id q15mr674196ljp.403.1603358637954;
        Thu, 22 Oct 2020 02:23:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b6d4:: with SMTP id m20ls201150ljo.1.gmail; Thu, 22 Oct
 2020 02:23:56 -0700 (PDT)
X-Received: by 2002:a2e:50a:: with SMTP id 10mr585748ljf.55.1603358636605;
        Thu, 22 Oct 2020 02:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603358636; cv=none;
        d=google.com; s=arc-20160816;
        b=I5y4dEiJPYVEGgBd7o+2XpTJ9IvyUvQOGHA24KUu0E05dDpHdJKteBomi7dVPqDxor
         aAsS+maroHoUbkUDVDJK6Lwb+41ZqwYt0bSDU/em71jxhvs5qAEyPpDZUo2K1cNnKRzz
         jtZXyExrm2T2MLXdC09d9M9CzNgAXx3e3ZAtiG4bZgSRuWeb9vhc+fnj/FlgHPRL3jde
         OZsP3227pEQnQF9Kf10nhzq+mlbR5XLJcwv3XWyTNReHN07PWzTcZAmHfLsDnWKje0f0
         aYVDx41+Yx5sX06k4dfQyCilijZUlwOOPzlcp1Ff7jK8I/1tML17n5bAA5IXUKdSZGkj
         N4Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=gCVrza3xVhxanxSb8HRt6bYNw4nQM4l3Hk5qUEEoMHQ=;
        b=Kj383kWIklMmhD7b1rSXtBmXoWck7omigkQB3Nh7XkxCFWrhJx9SsZYqnHHLGDPsR4
         dCuK4zNKp0vrl/502Lbz0lFL4l6L4q2a06IlWbbjClw7RrmmpCJxE3uj6EDf4Ut19/pm
         kDSee47w6FDNHeEo4bjuGd8KG7JtyJsM19cK6iu2PySHH+ANX7RDdE3UrtWb8wyeSDCA
         d1+BBoUvHGu4XT1lvwjNDdDnK5g8X4qC0t/4oDbsh7IV6aiskagwwyRNCu0HS4gUTuar
         +/KqXOyIH7yAxh2/645G95Yrs2GGMMHeTMvjdGK+hVbw1ZIBXwRKIlMQH9pIWCAkATRf
         pDbA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=d+HIp3ix;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id q11si25232lfo.8.2020.10.22.02.23.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 02:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CH23w0spPzyWb;
	Thu, 22 Oct 2020 11:23:56 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.98
X-Spam-Level: 
X-Spam-Status: No, score=-2.98 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	NICE_REPLY_A=-0.107] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id u_R2fY--3ZgH; Thu, 22 Oct 2020 11:23:55 +0200 (CEST)
Received: from [10.162.12.242] (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CH23v5FRNzyVm;
	Thu, 22 Oct 2020 11:23:55 +0200 (CEST)
Subject: Re: [PATCH 00/26] Extend hypervisor compile warning set (and fix
 warnings)
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
 <7c3c49ea-93d7-2a15-d844-a2004231ebc5@siemens.com>
 <aec791f3-9637-b08e-99b5-56d2b6341cce@tum.de>
 <893cadbb-bc59-7127-469f-3dd5a00c71b8@siemens.com>
 <37b3e925-3226-1011-bd08-bcfa8bad8b04@tum.de>
 <eeb6ae62-5a98-51b4-b261-5346ff8cb5a7@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <359e5ab7-1d29-8ea0-66c9-3bb6644a7757@tum.de>
Date: Thu, 22 Oct 2020 11:23:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <eeb6ae62-5a98-51b4-b261-5346ff8cb5a7@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=d+HIp3ix;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

On 22/10/2020 11:13, Jan Kiszka wrote:
> On 22.10.20 10:13, Andrea Bastoni wrote:
>> On 22/10/2020 07:21, Jan Kiszka wrote:
>>> On 21.10.20 21:23, Andrea Bastoni wrote:
>>>>>> The patch series fixes the warnings generated by "-Wextra -Wundef
>>>>>> -Wnested-externs -Wshadow -Wredundant-decls -Wdeprecated", and two small
>>>>>> bugs:
>>>>>>
>>>>>> x86: bitops: only x86_64 is supported, avoid picking the wrong default suffix
>>>>>
>>>>> How did you come across that one? Luckily, we only ever set bit 0...
>>>>
>>>> Saw this warning and took a look at the disassembly. Panic is probably not so
>>>> common anyway.
>>>>
>>>> hypervisor/arch/x86/include/asm/bitops.h:54: Warning: no instruction mnemonic
>>>> suffix given and no register operands; using default for `bts'
>>>>
>>>
>>> gcc-10, right? I'm not getting it with 9.3.1 which I have here.
>>
>> Yes. I also tried gcc-8 (gcc-8 (Debian 8.4.0-4) 8.4.0) and I was getting it as well.
>>
> 
> Maybe rather a binutils version thing? I'm on 2.32.0.

Looks like it. I see the warning with 2.35.1, I don't see it with 2.34.

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/359e5ab7-1d29-8ea0-66c9-3bb6644a7757%40tum.de.
