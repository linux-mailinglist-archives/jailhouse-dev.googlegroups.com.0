Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBB7JUP6QKGQEARKOHHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8AE2AB1E3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  9 Nov 2020 08:49:27 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id o81sf1718626wma.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Nov 2020 23:49:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604908167; cv=pass;
        d=google.com; s=arc-20160816;
        b=M1QJWAfMhy3VOrR4asBPxw7zImLHBPLcPXJSdrSc1sPnpbVz9AYnwtGymfze8qTaQW
         N37vC0ZG+OtalioBdKHnEd8feqmZ+Ce7hhwod+LmmgSnYUrGe1Ema5lioHhSC0SA+NAC
         tqdQ53TZm22F/1J3xj3w3Z3y+dYQFJFOvr0TbxDwvXmBfZENvw7nRCObQdKfNjLhxsBt
         hT9swxcA6hIBGyZTwNSFUq5E4NEZYjwqDZG8B6PGm9DGvPcfbEZu2i03wdWc/wnnd6yJ
         ycJVm9k1Qq9EYNWoPHDNc0AtPYFgTVW4n4YfNmsqC7wkGlDmzEqk2sG2vT6nIldS46QE
         tDew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=PZwCx+TbpHUdX6mk6w1G6dYgoyO77w5S9EE9Y9kHzQc=;
        b=mCvC7bBGasoqaZ3i/wO5Ti1BYEVO6fEkvXz3An3nwtCmh91TqYl/++/Og3ps3ghX7q
         ZIgo9baVNAZj2xTkq6x/pLEGCrpVQWJTpBrBktLfRNMgSmV/f50qZtzP8Cz5bzUYl3gS
         scwBGv71EIL+BpCRidCsJmpg5zFGXYCwPl3rq79gGslZ0UbjFHemdiXE48PbtwDH/Jlm
         5H6sVoPJ0mIOsHeavl7j5xqn6btyNHMPe/DoFza1AWzzFgX50xqyUCl2SDnGUUwg87j+
         UtjtBwkL6z+6UrUSloed2t6b/ffryWY04ZBqj/SdsBpk/r2nO/WhZWV8uFT6YAoEnxZI
         Rvng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="jz/lQXa/";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PZwCx+TbpHUdX6mk6w1G6dYgoyO77w5S9EE9Y9kHzQc=;
        b=E0R5Gn3ByYu/aigqmZ9ZTBEFGbm3w83DSsNJc8mGDdbugjidfrivULUYE+g2z0YrWw
         RKtEu0CQgHpJSs/GO+pia+/hiS5N7z3+eFIcZOKIHXKNMrAhCTqLmXLzRIbVwYGVg/A/
         OIzT/DHuTlUIkvUMwcdI6EwSH8UctMJB2ptGCO1/AMHcqkGxLqCS6fy7yuXgfFWy05Zx
         3x9YEQMDVa14eruuFZsRidDTFrU498Eeaqn/9l5hwk80h8fRxgxpT6yhJCToUqJuSs73
         A2Wr3md/UiO7J8dNn+bNt6bmOs/IobwzCoXMDqOYrYGmrejacKI8KhtcsXjUw+yZ37n0
         9rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PZwCx+TbpHUdX6mk6w1G6dYgoyO77w5S9EE9Y9kHzQc=;
        b=cZRAvrO3FzS6lJ89AoUvZ/nR7mI0BI75XzDgUra71voxM5/yR8dVXZ7AqQs+KcvsCL
         0hjRuEMEBuXVD3v1A7IOtyc2+iyf61xEXyvyJwACZnBnWEQYOJlZ4JmReAbKTRSQZypB
         b21qWkXH+4UONC5anz4vHNI6CaQTFqEMQ38j7BZSPVtYqpHh7z+x6Wg3oCBHhjTLL/Sv
         aa//2HGOt2qy0MDmyW0dU84gtwLRrfaXYn1+XvgckqPFoRtVSKWxOOT411EU0fZcEBGG
         kTJ5zzu8AxdEX6iocLfcgZVXEaiwfEct47gsBE+8CIg9cuaMM1GcwuOZbIx10QwzyaSi
         EGvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530H50yF79+2uyyWjz+DZEa6QTbhNF14iE043aaqMe64CNPkq5B0
	GZkHBV6geZp2uFgCEBdCLk8=
X-Google-Smtp-Source: ABdhPJzdPsp24IyDGv6jQJ63FhRq5DeJM3WvpCEpnapNwOI5h2kmUsyvMsiy5wqCPxPhHes9dJHSkg==
X-Received: by 2002:adf:f3d2:: with SMTP id g18mr7565308wrp.77.1604908167569;
        Sun, 08 Nov 2020 23:49:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:aa87:: with SMTP id h7ls6269751wrc.2.gmail; Sun, 08 Nov
 2020 23:49:26 -0800 (PST)
X-Received: by 2002:adf:a29e:: with SMTP id s30mr17642108wra.29.1604908166385;
        Sun, 08 Nov 2020 23:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604908166; cv=none;
        d=google.com; s=arc-20160816;
        b=gFXEwJkJQW9hRVd5c/1f9P9IW0Fw8t67oUItESTdQrWd3YG94oZ8ZWHyk4urMkziZ9
         IEJeSllsutiYLYXH/M9kOa/SMJDictZLlm67dRxAVfwb8WYe3myMz8FzT9O0SzCikdZT
         20uPHz9vS8gZRLptYb+lZMG1GfLktLw4RUyy770vikP0kPyLuvk2WT/lLfZ/0ybP6XHu
         cF0xFqnE9SCbn5dcBsA6qT66qTU1xAZfSex+4Yo8KfXX73BYmsAtwAOCUr/skY83R5+S
         r4SWOZrblPU6zK7ktE4vhz/mk/qzWBz2E1NScRBBIHSxQCMQFCmn6Vg7EkyhzGC04Wus
         b0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=gW5g0hZ3SvZmQDxWoEtKFWu17IgmbAGEugSEqe2daqw=;
        b=i7A3vTZby5Qziq+RhZsYA2e3A649Mt52JQAWIl98/Gj+PvKoycpuysa5zGdrRG3q1Q
         XBnbLGlAQa9BJuQ54dniE2rbEq2EARTUiZuLA5Tacch2Wq0YjmxTxpyo1fLO6vLDg1eX
         yQ4ggflHt+9OCqbTzyF1CItp4WngXProFIWUvVKUootKyp70xqYNBKlWcDUy+f0cxoQu
         nL75IJVNBsOR0kxqClKOhCgZUG6LCSZugb2Vm2FzOzfIlD413Wxu8+8h+zQM058p/ePk
         yuV5++eJdCiKmJAXS9fsOUQOfJ8YN/PJ8iDFctsuY5qnir061VpS2IXmk77nMhfbONiB
         jsPg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="jz/lQXa/";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id v10si91346wrr.3.2020.11.08.23.49.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 23:49:26 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CV36Z0nRdzyV1;
	Mon,  9 Nov 2020 08:49:26 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.874
X-Spam-Level: 
X-Spam-Status: No, score=-2.874 tagged_above=-999 required=5
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
	NICE_REPLY_A=-0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id t3FNc_zVp2jJ; Mon,  9 Nov 2020 08:49:25 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CV36Y4CgVzySh;
	Mon,  9 Nov 2020 08:49:25 +0100 (CET)
Subject: Re: [PATCH v3 17/22] x86: apic: Wsign-compare change to uint and
 update comparison check accordingly
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
 <20201028210933.138379-18-andrea.bastoni@tum.de>
 <1c5995d7-8e3e-7132-d3e1-52fb809db242@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <4787ba5e-c45b-8ab2-5991-9558645e7efe@tum.de>
Date: Mon, 9 Nov 2020 08:49:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1c5995d7-8e3e-7132-d3e1-52fb809db242@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="jz/lQXa/";       spf=pass
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



On 08/11/2020 22:51, Jan Kiszka wrote:
> On 28.10.20 22:09, Andrea Bastoni wrote:
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>>  hypervisor/arch/x86/apic.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
>> index d36c2033..b49a6745 100644
>> --- a/hypervisor/arch/x86/apic.c
>> +++ b/hypervisor/arch/x86/apic.c
>> @@ -315,7 +315,7 @@ void apic_clear(void)
>>  {
>>  	unsigned int maxlvt = (apic_ops.read(APIC_REG_LVR) >> 16) & 0xff;
>>  	unsigned int xlc = (apic_ext_features() >> 16) & 0xff;
>> -	int n;
>> +	unsigned int n;
>>  
>>  	/* Enable the APIC - the cell may have turned it off */
>>  	apic_ops.write(APIC_REG_SVR, APIC_SVR_ENABLE_APIC | 0xff);
>> @@ -336,7 +336,7 @@ void apic_clear(void)
>>  
>>  	/* Clear ISR. This is done in reverse direction as EOI
>>  	 * clears highest-priority interrupt ISR bit. */
>> -	for (n = APIC_NUM_INT_REGS-1; n >= 0; n--)
>> +	for (n = APIC_NUM_INT_REGS-1; n != 0; n--)
> 
> That's not the same. Will follow up with then patch I modifed patch I
> applied.

Ouch I missed it. Thanks for fixing.

> 
>>  		while (apic_ops.read(APIC_REG_ISR0 + n) != 0)
>>  			apic_ops.write(APIC_REG_EOI, APIC_EOI_ACK);
>>  
>>
> 
> Jan
> 

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4787ba5e-c45b-8ab2-5991-9558645e7efe%40tum.de.
