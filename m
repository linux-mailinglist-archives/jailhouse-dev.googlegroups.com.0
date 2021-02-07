Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBQGK76AAMGQEUXIH7JQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DC9312479
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Feb 2021 14:04:01 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id z8sf648005edr.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Feb 2021 05:04:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612703041; cv=pass;
        d=google.com; s=arc-20160816;
        b=BIeHHplunyAyzgWJ9iuAIP8svrlN31Kyi5LWX2aHbFoGvhgWQ7ja0sKAUz1CC1iv8C
         ODz1uT2Dg1N+2Mosb0nbiox8BA3E+lElfSZKvFXPpWaijyZPhEPbnF6xb7l0g337q1l1
         +LAQkRy0dqL4NnWrwcpd8/oox7CQ0+NDMOE/WYi3re7GrpAg8HAl9wIe1jTiOiSI/wog
         Dwve/ym1g9qZhx3/C21Dh22KOgTNpD4RDdQ2EUFam2+P1xigDAdi2/Q4fEIfo2plcTH4
         qvbLdvALjiyDAGYvpI7aUH/vdDRj+NCJ25vw2UVxU8W6kgTVGbYZBgpUyRpO+WhFKXy6
         GP9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=Bu3v9ZkTH6wJS+Zi9vFmNDkETtpRcIB436tbjVlsxmg=;
        b=PD1PuzVYovC3JFjp+uIfnnR+AGFCgJKYJBQYmAcdXsvJkF2U791wJhCLeqfExfdr2R
         UN3AEcGwnfW4dgU67qoRN+aMw/RWJynXfycDIHQfIbtN99C67GCYd52id0VTsv6yFAGU
         w3hRrdUiWyNciyWCz/GmJANayPtZTjovhaNwV2xKJJqzij4SMnlfrLmMCHPT5X0F97lV
         cSE5VZEMyUWE8k4vSnBDKRkeb0CBACC0RJocaUMzpnh2HKimigaxdObWaPqvLeGAOQRp
         RM7x1DykOq3Ns0HDFFMH+vj0hfszQfvwDgo2myzyi4FzhbLUU3FjvDdBrvOsFJnSp+bO
         Eh9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ABWVBP5z;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Bu3v9ZkTH6wJS+Zi9vFmNDkETtpRcIB436tbjVlsxmg=;
        b=YuFdZk8k1pYdEmfg9yPId4CQnNEhbp+Tegkrs6cX+INHTTEvYETVEhgd2rjjZA88M4
         rZP3M+MtA2HtpJ3FfZmfo8yqcs+/CpA/Fce5/+IWDIxxwksZMTjddJoAF5xIQhZGYfdX
         WLHGY4x63+/kSgMkLSm+xOCTG3337oMC006phfRjaGrSZeGunknoWZUCLQNNciNOFkoO
         zJ0wzyEwTT1N+DEgN99jEBK6nJs9q/GJobtFZLgVQe1E/P0nY67qsA/BoCMEovH1978Y
         aGc230SAHio23EOOMuls6k3yf1E8Q8AczdL6ttS3b1+bYAD6p0fsvyXVh/N1zMxJk/8u
         EgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Bu3v9ZkTH6wJS+Zi9vFmNDkETtpRcIB436tbjVlsxmg=;
        b=EWsgoyrKTfQ1OMpc/aQbuszPRMKcopWSAd5G6gMBenNT1nGLkmSuOKJC8zpsku9VP8
         0UCPprRxtd6XVrWRFHGt+/urmY69BABBEnhL9b2Y5cyWMgI6B1lDJvgwoHsM5u7S7pal
         2zd7abWc3qLFCJTWa+xF1u91zXFfBqpG4k6DyXyKoiOud6u9MPFh3MAl5A/ESm0nKsyx
         zQamVEndBOnOtjTvs0Tl186FY9PWPDBGTOgC2jcxxDHwkriZ5NV/ZKZHCzMY0Br/wmQp
         eV87K50Tkpi17HYUFIBmztOEHLrwhkA2MEYSZJwezIWw6kBYLWiG5b7C/hHfArfQxSRX
         TqKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5314WWa8JUzJVB1RAxLzU0XnqB2/lEosJ6mIXjC6qFsrVf1HvNRm
	t/9DJmYH6g134FKNkbF2KUM=
X-Google-Smtp-Source: ABdhPJwv8BRpxY1cMPFpB2UA0VTEoerqKoWhnLgrtXrLVQ/ut9de9PdqmEoXTrkbblXopmBMrjratA==
X-Received: by 2002:a17:906:fa18:: with SMTP id lo24mr12449742ejb.221.1612703040856;
        Sun, 07 Feb 2021 05:04:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c78d:: with SMTP id n13ls13888519eds.1.gmail; Sun, 07
 Feb 2021 05:04:00 -0800 (PST)
X-Received: by 2002:aa7:cd45:: with SMTP id v5mr10490592edw.373.1612703039988;
        Sun, 07 Feb 2021 05:03:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612703039; cv=none;
        d=google.com; s=arc-20160816;
        b=tYhrY0NzIL9jYXjJRicjtbGwYlNI9IursYS73xfADj3oFm7WtfSCsSSsGgWYZIhiNW
         wQ2QszRHNDaOpksS61uJ0FnxYeUDPyGy+PMewsJv9lEhR4friMY5TNyp8cHSYSiBjSr+
         InOdbjJlxoqyceBBW2qhsXIXYZb6cEMi5v3ZINCtf6T7TaiioHC3FRXe64PdtrYYl+Ui
         W5FSS6cpfpg8rcAFNsUgslSvL1Byqhv7fXfaSVAhaj+z8SkiUeyZu+B5XouM2LGmBNah
         qBq71iIkUNjyQxnBye+gXv0L84G7hGIzfJBlHKtekijlD+6e2YvtEjPtGw1+qL+zOz3N
         FGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=S2g0nGHDiKpJTAndDWqEsUKwHWHpSsPyOY/ZAJ9sWIg=;
        b=r88zYJpDzDVGHP4dDoinoCmvEDkJnYZH/I3uXz0WwaFry2CaRYBISgugGAZvuxAib8
         760pl5Y68DdmxBPJJSB7mK2xBgNFkkaqXuwIZ8uiWR0vPqRwoVEfxtLKKLjTAhlYOVXF
         Z3xJHjEmCbw8AUN1EJF09o170qmnIvb518jXJqzz3QqT1Q9U8tu6dZGgF3SsQDlhi0Zi
         jHU8TlQteoiaHjnw6SrZk1exxJtv7PEpS41Gk/un2gRIfNijMmk8eGYzvKhNcoToQY23
         G5+DfMPuG/mVl1ZMvrmuYSXgtcHtXOvecl6yiQo1h/akbh+QDxjMn95WCr8fecU1I/tl
         R3kA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ABWVBP5z;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id r19si612429edq.5.2021.02.07.05.03.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 05:03:59 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DYTqz4K71zynP;
	Sun,  7 Feb 2021 14:03:59 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id mHAs-FAIscO5; Sun,  7 Feb 2021 14:03:59 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DYTqy5f40zySl;
	Sun,  7 Feb 2021 14:03:58 +0100 (CET)
Subject: Re: [PATCH v1 01/23] arm-common: bitops: add most-significant-bit
 operation
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
 <20210125120044.56794-2-andrea.bastoni@tum.de>
 <4b9466ce-3886-d080-dc41-e667e4e2439d@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <11b93c4f-486b-2e4c-127d-9630aa020ef7@tum.de>
Date: Sun, 7 Feb 2021 14:03:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4b9466ce-3886-d080-dc41-e667e4e2439d@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=ABWVBP5z;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
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



On 07/02/2021 11:17, Jan Kiszka wrote:
> On 25.01.21 13:00, Andrea Bastoni wrote:
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>>  hypervisor/arch/arm-common/include/asm/bitops.h | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/hypervisor/arch/arm-common/include/asm/bitops.h b/hypervisor/arch/arm-common/include/asm/bitops.h
>> index 808c9a0f..a726862f 100644
>> --- a/hypervisor/arch/arm-common/include/asm/bitops.h
>> +++ b/hypervisor/arch/arm-common/include/asm/bitops.h
>> @@ -31,6 +31,7 @@ static inline unsigned long clz(unsigned long word)
>>  /* Returns the position of the least significant 1, MSB=31, LSB=0*/
>>  static inline unsigned long ffsl(unsigned long word)
>>  {
>> +	// FIXME: the ffsl on x86 isn't robust.
>>  	if (!word)
>>  		return 0;
>>  	asm volatile ("rbit %0, %0" : "+r" (word));
>> @@ -41,3 +42,12 @@ static inline unsigned long ffzl(unsigned long word)
>>  {
>>  	return ffsl(~word);
>>  }
>> +
>> +static inline unsigned long msbl(unsigned long word)
>> +{
>> +#if BITS_PER_LONG == 64
>> +	return 63 - clz(word);
>> +#else
>> +	return 32 - clz(word);
> 
> 31? Something's fishy here.

Right, thanks.

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/11b93c4f-486b-2e4c-127d-9630aa020ef7%40tum.de.
