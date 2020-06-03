Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVHH333AKGQEGXNRZZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E451ED213
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 16:29:41 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id i199sf848149lfi.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 07:29:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591194580; cv=pass;
        d=google.com; s=arc-20160816;
        b=MKStqQBGwJgK8o+JXQu7gyHErWrkYd+ZIhr16BeKickHvPfX2M9BcUbaAlw0iWzvzf
         AA1dzyHX0PoJ64pfPb9kSzaHQDPDAXLZgA+H2Y6+5CguSp9ZteaFIzobT5XAf+JRCbyc
         SqrU+NPmaWaKjrJSKCkfgf9aA/FKpt4jB/gLrNFdL26VR4sEbAa29fRiePcRrRmWxSqC
         UrJMW8q4oxZF9zasmu7YZGQI9Ib+V84lTdK6XMvOQzWpB9qcrAAuawQFPw40TD6JKAUZ
         bo8+76JWBiEQ7mUrL8Ln53ylhH8dktHrLHv0knwqWFWVZ0pdOxDb+iZmxOTHiX/gfst2
         2Gow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=1RwWpuzjs40C11qmz5ohULt+gftWnm0y/6M39dRsVQE=;
        b=ELVK05l+WgbaNzNtJSTlJVu9SuXg3BIewJoqSMDIrqVfbOeXmaua1QyJxo6p5r3u07
         zgSAGH63/basuNGzRnok6F6VMzW/SWzcrR13zbu6TP8+F8t/GQ0UuQCUByGbyGC8pWNV
         Y0qxa2fY0sCbhKTUGLC5azikc4kzhbUgCg6z43d5yYD+51lE55ABDNb/MzIQ5ZLX8N5P
         iFBA/heAISzZNXBJ/lmymYL5nvnhIghwoBomHBHoycmGlqy6QHgo3QFLqxKe+RFKY6Ix
         NCNSEFmfDehh3wBeYNsx7DOL0BJ7o9Ae+nqXzWOoCkXNgh8K08p0d5q0WYVybbMmTfqG
         kyMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1RwWpuzjs40C11qmz5ohULt+gftWnm0y/6M39dRsVQE=;
        b=ZyhcjdPV+oTkKV30KnmHpC5/2oubtNCc2jvN73wX76pNXlcBBrS167MQuHfrd1No3u
         2kfRAWA5oToUqMs/xlVptcTzMOgcs6QHdErMkjCJJB/6JJw/baCkw4IoDnJCjCOGIm1/
         YmhiVZbw7xB/hz+HCCjIcPcdsfppcpj6D3KQCc4oL9tZKZqQwCJ+mMw0x6QpRkBXCAwM
         ZQy7+hanULegTgNczySvonlu0AaenHTAHpWzhdTl05PkwbNNYZs1vhp6js94q6xRBwgB
         WMQrrgn47nbAioOpPQ3gactwMqKDgmEu4XsY6GIpQ5BltT8mxfoGQ1JGZxWF6sHsqeie
         JZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1RwWpuzjs40C11qmz5ohULt+gftWnm0y/6M39dRsVQE=;
        b=bMUTDt84ZM6at6nbQt6AaNHSs7fHRaApv+L6Rtl/9bhrqrB4R74HXghVMP4cBrGVBs
         xq32FsiCrk6E1VVcmO8p7bJS+GdxqczCOnBPAUzno9pKIXgtmRbCmlen6vargnv1UaCk
         V8gIzBASCLg+F1b1p0eDSV782RapLZbYwsbYxqQnLw/7/5y80cuKI4BbN38kHrNVwGFz
         23SsTqwhUGqKo8LmAtR5Q11Baj5jrZ70gfUua8lRuvYwUR2Xy58GebKxWuyi4UM1cwgo
         Y6v7M9p1voUf3fujnUyvFWfGQ1WVgCGO0rKbxMIlj7cIjCj7Ayvo/N75i85SMcPtm7u1
         16hQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53309SntGKmo4c4/aVtsfv/+R/Krj+0SVXQdJ6Rg138QSPN4t5i7
	DOBwau4xmxZjvCtCpfJJ6Nk=
X-Google-Smtp-Source: ABdhPJwzuXbesZ283RKnpibNTloCeJGXvKLbrjgBC008kHW5hZDSiW0AYufwYFIVRPDDx8o0/CjBiA==
X-Received: by 2002:a2e:97d5:: with SMTP id m21mr2153513ljj.52.1591194580557;
        Wed, 03 Jun 2020 07:29:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a8b:: with SMTP id p11ls503194lji.9.gmail; Wed, 03 Jun
 2020 07:29:39 -0700 (PDT)
X-Received: by 2002:a2e:b0ce:: with SMTP id g14mr2192214ljl.49.1591194579560;
        Wed, 03 Jun 2020 07:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591194579; cv=none;
        d=google.com; s=arc-20160816;
        b=DWttyHS2KlQbxhpzlxV9ADvP7Jkd8zogxosk3yJT6zAC1Hy+4VfKECYfY+6iHIqiMi
         YslNsm0pQo1AHi4NAzYnVENljqIVbvk1mMs1QMfMpwmIRPBQmNAb7p4tkL2TLqy54iIJ
         DA0i1CK4DZHaSbnHehdROrL0M7jJ1utPHk2oR5q7NV1s5E699nYaSJ81J4dE2tZKjSpy
         UCuvplJMP+80ElYUkSYnXDrSNEdgD2YEEqoJ8t9FvXREq6X6+uSuyq+IRleE/gG+wLJf
         sS8UlJrtCio3PH+uq03TDFp7ggomn92G/EeWtzH561rilC/IQrGtMPhXev+zqH6tqIIt
         k0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=msr/brIehgyKOeJWRcIJ7CHSnqLkFEzmo8GpUsY7S38=;
        b=N4cYmDDxP5QsM9sdjuSVREKRfh5sfTp79Ug9Tg55rSQUfhKb/rV5z0/2v2JD0grLU2
         SKXR94ojmYVfvnYzm6oVYd6uoquWdyQtnelWS+lHiRkrua+Fa70DZw6GkVb54S9x1r2m
         rYRlts7DHD5e0nHFXtQyOI97RmqgABwXEuSHV5kU/tILgrNnKUJDSX18PdvJ5uGkqCTf
         Z7kpQdHsGtd4t5TeZe7AAOkHbGNWqVFWQJTsRnof2Ma/ij7Wv9K2H3FMDUsRyTYJoMb4
         SEMCl9HnWjmy0NLyenXsq+vFsYhgpgr3cYPWvKbgbo2BZzUm1cUtcHqoDEizQcjVA2Wz
         qCqg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id u23si111758ljg.7.2020.06.03.07.29.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 07:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 053ETcL4025540
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jun 2020 16:29:38 +0200
Received: from [139.22.36.189] ([139.22.36.189])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 053ETaKW011887;
	Wed, 3 Jun 2020 16:29:37 +0200
Subject: Re: [PATCH] arm: irqchip: fix irq_bitmap setting
From: Jan Kiszka <jan.kiszka@siemens.com>
To: peng.fan@nxp.com, jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com
References: <20200603091004.28908-1-peng.fan@nxp.com>
 <ace884f9-c86c-e4d3-03ca-40c38dd68b8b@siemens.com>
Message-ID: <4ae71765-1fae-e57d-70e1-6fe4ab27de90@siemens.com>
Date: Wed, 3 Jun 2020 16:29:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ace884f9-c86c-e4d3-03ca-40c38dd68b8b@siemens.com>
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

On 03.06.20 12:25, Jan Kiszka wrote:
> On 03.06.20 11:10, peng.fan@nxp.com wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> There is a implication that the pin_base in the cell file
>> should be "32 + 128 * i" with "i >= 0". However there is no checking
>> for that. Pepole might choose other pin_base, such as 160, 224 and etc.
>>
>> Saying the 1st irqchip pin_base is 224, the 2nd irqchip pin_base is
>> 160. When irqchip_cell_init loop into the 2nd irqchip, it will override
>> the settings of the 1st irqchip, because "224 - 160" is less that
>> "sizeof(__u32 pin_bitmap[4])", so to make things simple, we not enforce
>> the pin_base must be "32 + 128 * i", and make the upper example could
>> work is to check whether pin_bitmap has a non-zero value.
> 
> Good catch.
> 
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  hypervisor/arch/arm-common/irqchip.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
>> index 847758ae..794b88d9 100644
>> --- a/hypervisor/arch/arm-common/irqchip.c
>> +++ b/hypervisor/arch/arm-common/irqchip.c
>> @@ -421,8 +421,11 @@ static int irqchip_cell_init(struct cell *cell)
>>  		    chip->pin_base + sizeof(chip->pin_bitmap) * 8 >
>>  		    sizeof(cell->arch.irq_bitmap) * 8)
>>  			return trace_error(-EINVAL);
>> -		memcpy(&cell->arch.irq_bitmap[chip->pin_base / 32],
>> -		       chip->pin_bitmap, sizeof(chip->pin_bitmap));
>> +		for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++) {
>> +			if (chip->pin_bitmap[pos])
> 
> Needless test, though - or'ing 0 is harmless.
> 

I've removed that and pushed the result to next.

Thanks,
Jan

>> +				cell->arch.irq_bitmap[chip->pin_base / 32 + pos] |=
>> +					chip->pin_bitmap[pos];
>> +		}
>>  	}
>>  	/*
>>  	 * Permit direct access to all SGIs and PPIs except for those used by
>>
> 
> Jan
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4ae71765-1fae-e57d-70e1-6fe4ab27de90%40siemens.com.
