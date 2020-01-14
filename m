Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHNE67YAKGQEPOWEHDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F95813AC68
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 15:37:18 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id h30sf6542807wrh.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 06:37:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579012638; cv=pass;
        d=google.com; s=arc-20160816;
        b=MdZ8326xaPx+BKcrC18gT1cc7Cjs6Y3YDEgkVX3Bss2hPAImLua5PKtBKSZ5OWv8fA
         q5V8CHAEX3gt52k7pbWOjVa6nLMHPoU4+vkwAssVXRR1x7W+Y5okEPZyGV3qiaLoOeGk
         w83FDMVwNQYYy5Y5qUD2mAEwPZLJuD8am8+uMQR/47FipVi5WVBEN6W9T4UAHNa2eX7I
         J+VprmAYLaEnnFtprB88xd6LWCfPK/uMWTaut5cs8GDHv7n6twM0c/zhN2ceTP+XjfsJ
         jzrZ5aheNnfq98y+D+6LiiSrKTXVVt4YCmztWuK2+0hqJ4fB0u2XEUNDBySmZ7aH3XYx
         rt4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Ak4u7G/Cmt2YBc2WRTxt+7ySztL5t7SQRrZ+OKKD2mA=;
        b=clkV7/1ROxG7MuV/RjusfhWPLdBNAY//vHd+cA7zdXD62AbbaqmMgSsb5B6ycBCAon
         LF/Z/YpEbzlPCW7YjdOvE0gTYgsQ6kF6oBfdbGJZZSz4Fw1NwyH05UcDcpO1Q9ph5kUw
         ipR8RpPwrR/X5nD6DS5xDjoJ957jS8t9FAqdQaedm+nM9XvSp5Oi+QXcB0aG5fumbgTi
         ch1leQuIclU8ILfgLiuG8KvuQbARm/SRvpmqEBFFn9Y/a5rjqqzx2C+9Vv/YrrQdOK4f
         1ljGTxCxa4XCDG7C5k52j3TQkXr+oYFfTrndBoqcUqnpWxo42eFPL9iK1bihvK6RFbN5
         EBhQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ak4u7G/Cmt2YBc2WRTxt+7ySztL5t7SQRrZ+OKKD2mA=;
        b=en1bJWeplvKrgtH0+jGY8bQt1e+FCjWUDh75N/TiHiM/cbRronsX9ih5KK2/24rrth
         NLnj3mzUIJkOedLG4UH2sQ38ApD6LBGIZjstUzHyHkOb1vIbpxI3rnM/gCUDgNg+MkKN
         GN77M2nLB6Cv9WQexoHLUhyAjp67Ycwm3xlvUk+Psylyyd/230RCtsci/bPYd1rAsSLh
         acD9NA2BTu1z3oBh1z/aGv7ISE9tiVBqSS7ErrmdXRiGYy+wUq+1iqX4vGT3rqcFiwFS
         AjUtgyhJArOUulu/DEwaJvbLXSLiKtNQT6+0AdTqNZXZrEoGP0NBupcz19fYgNTnY2sb
         cj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ak4u7G/Cmt2YBc2WRTxt+7ySztL5t7SQRrZ+OKKD2mA=;
        b=oL4bbzOT/pe7y/eUKAUtOm/NIgsFGUjXO8kZ16/Iugrvw8GwlCfMl6nKEENqP0vPST
         qFNv4kJrI2ztf3ADwP4FQnjWVqs++g3Y+AyUVH7Lm2nSD1OKWoD5QKgYhkbrWnCqKG6s
         1P+OCv/30gBYXcr+vzX8zjx5bc9vISO0Xb7uTFTlFey6A57s3eyCSP3O2k7XWXjhPMCR
         H2TSyTKHWo1De4yRKGl+ulSrX+00BtPyniYdFrKUb7E3JFYIqqnXkUVN9BAi8R5wOQi/
         wBCDId15mEzvE6gqW8gtu2WrHFDaVpuNgrR4uvpTw5HdYfYxfWfnSl42C32CD3HQdIwl
         +H2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUKA3y+6o0TtXwdRlvvbLA+Ienw6bsTwjyGJblQ9ZILLBKEuWFI
	XOnF4Iv+wFil0N6cYZbp578=
X-Google-Smtp-Source: APXvYqxSUvRh4lkgLUTJcGs1xxmTMkdLWwo+Dr26G9xA7+AoZ713uWqQtAJjm9NRdbaCZ8dIW7j89A==
X-Received: by 2002:adf:f80b:: with SMTP id s11mr24185700wrp.12.1579012638196;
        Tue, 14 Jan 2020 06:37:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ebc5:: with SMTP id v5ls5689265wrn.8.gmail; Tue, 14 Jan
 2020 06:37:17 -0800 (PST)
X-Received: by 2002:adf:f990:: with SMTP id f16mr25977641wrr.185.1579012637450;
        Tue, 14 Jan 2020 06:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579012637; cv=none;
        d=google.com; s=arc-20160816;
        b=CpwkqGfRRIv8NcRBw4x1b0gT3BpoLa66GRNNw70OUsankvUSNOnnVvJI+FpblruTeQ
         qbapGpFMJpYnN5bnFHxzSTnLoxrgIGS5uGtM1CuRK9PJNtNsteS6OEEFcXot9bqfohcD
         64/Eb6OmE8v+I9b8IKszcZfe0KfAk63e1f3HvUWrkEjGlNKEytp/2V75u5nzLHtxrWaY
         unGZLPcsUrdUO3ty8EiAUeIuXtLOu2gYHB+3BYW99TjBQFDATOmFvsX5fvLZ+07e4bgt
         ug/HqO7DOVgFloxvBMV1gPr6OhlUqjBQZ+jVKCInJkmI8pVgcKPyjGGUbZcTjZH19kOC
         akcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=xjpTii8iuQY6ZldlxXBvS6Vmw3ReHeQT/Rxkzvxzhz0=;
        b=ybsX5MN9oLALBhqmWYcNft5mhuBIUlM9BcJfOOBcOLdDe5WHWEQ6WSKot+L6nZh3EE
         Nmo4SJEL9A3m5TUlGAip8Hn+QknoUfx9b5BPlmqShr42iMMssWRJomDd8xYCk6H1J8je
         mTigV5ebH80n3JQy3NfzrpkRwMTZTUW2Y23hDgD7vkKLPYzzX3ElTdXflnnWNSTdmqlD
         d9Kwqp9CT+OhjkII6HFiUucnhG3QyogWpOxjzXcOFXB9H1I+N+tJZ/SRq0QRExS6aG/5
         84vogA8cT95bWlUldlZw95kZKUu1GcUzAKjxtegwN1ZDpcAUgllH6SqSiPClKfWwWirR
         SjFw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id m12si699372wrq.1.2020.01.14.06.37.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 06:37:17 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 00EEbH0N009619
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2020 15:37:17 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00EEbG4T018571;
	Tue, 14 Jan 2020 15:37:17 +0100
Subject: Re: [PATCH 23/38] configs: Factor out ivshmem memory region macro for
 network devices
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <cover.1578313099.git.jan.kiszka@siemens.com>
 <945028d7d210064c97963f15dd3e0a171ce46fd4.1578313099.git.jan.kiszka@siemens.com>
 <02d5b3ac-54d6-48bc-5eed-eb0a91186647@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7569e790-1298-6e1a-8465-57b7844b5d05@siemens.com>
Date: Tue, 14 Jan 2020 15:37:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <02d5b3ac-54d6-48bc-5eed-eb0a91186647@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 14.01.20 15:26, Ralf Ramsauer wrote:
> [...]
> 
> On 1/6/20 1:18 PM, Jan Kiszka wrote:
>> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
>> index a62fa1ee..f82bbe8d 100644
>> --- a/include/jailhouse/cell-config.h
>> +++ b/include/jailhouse/cell-config.h
>> @@ -129,6 +129,15 @@ struct jailhouse_memory {
>>   	__u64 flags;
>>   } __attribute__((packed));
>>   
>> +#define JAILHOUSE_SHMEM_NET_REGIONS(start, dev_id)			\
>> +	{								\
>> +		.phys_start = start,					\
>> +		.virt_start = start,					\
>> +		.size = 0x100000,					\
>> +		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |	\
>> +			JAILHOUSE_MEM_ROOTSHARED,			\
>> +	}
>> +
> 
> In the end of the series, this makes calculation of .num_memory_region
> unintuitive: the macro will eventually roll out to four memory regions.
> Would it make sense to introduce a macro that denotes the number of
> regions that are created by JAILHOUSE_SHMEM_NET_REGIONS?

What exactly do you propose? JAILHOUSE_SHMEM_NET_FOUR_REGIONS?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7569e790-1298-6e1a-8465-57b7844b5d05%40siemens.com.
