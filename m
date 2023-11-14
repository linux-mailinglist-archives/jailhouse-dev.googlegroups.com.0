Return-Path: <jailhouse-dev+bncBCMKJ4OZ6MLBB5P7ZSVAMGQE3DA3JVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FFC7EAD27
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Nov 2023 10:37:58 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id 5b1f17b1804b1-4090fa518bbsf34740075e9.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Nov 2023 01:37:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1699954678; cv=pass;
        d=google.com; s=arc-20160816;
        b=eZMBf9J4B3Fs3qdD8o9QMcmc7iWrAl/Goq1VGNOMJ2zn2c8t4RkUtQd6IzMByNPpV4
         GLHlfOMdveyfCJomg8eOwyXpA0Ct4pZ8gUp1LegJ7ksckoeIWifHmRELkMSONcLeQWPd
         fXmjpe4zHdyuk2hGs266oBQR72oYLVNk28zs9Q6U29sI3Fa8S5EJOlF6RohCjSiJWZpe
         Vuyk0rFnOSSaJ2IYxF43PyrqkBnhjDLN63bzLIXiH+Ycl9xhNFhJPR4viUfSYuMal6EF
         GnelNLJ8Bq/W5S0tLXs/am4g4qVZxqUfDSDjsjZOQdPacfzXcy4GIdoXo6ENiOxX/PbT
         UNYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=9Gxj4XEcGoJKP03CqvZMzI1G09gj6lPrAjhyFOctl0Q=;
        fh=t0Nw2nhOOnWFAR86PFfZva7qIMx1vMlLM9e++XkoW8A=;
        b=xf4DqU3Zm6x9LvRz1u8Ib8bcuugdEOPCLl632z4nqfy7tFU3NluGrulTLG9ECj9dOa
         DG2RCs65rgd98v52yQDRX/8L6aoRQ5m/2j9m5Vp2pROWpAK7rxJpzOLxcpfDaho1hfW2
         /GOU+5TMIiPcgTHxeVxVpOl/4bXKp5mLvWMZBNTUWhEXSopB+FPwqzlilQSg5g8q+AdG
         rUxlhaZhlR5Rd0fyrtpZEAI7MzvvpHTz1C81dPp/kZNt9tC/mj0Hdt6J3wCglXXw/M8i
         ZhOROEOcEMmfl8zaEc4nul0vYZ/GQFSgX4K/42BmnoJNKwJjAqaX3yqi0/Celan4x9wf
         VuKg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (invalid public key) header.i=@vmexit.de header.s=20180813 header.b=RaBtFvow;
       spf=pass (google.com: domain of ralf@vmexit.de designates 37.120.178.10 as permitted sender) smtp.mailfrom=ralf@vmexit.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1699954678; x=1700559478; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:to:content-language
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Gxj4XEcGoJKP03CqvZMzI1G09gj6lPrAjhyFOctl0Q=;
        b=kdLD+3eqUBlpFHWcS/IX+lSgn+4d9spQS+9GKqlbtGBreP4YJwXyHS767vuwFb3Ebs
         FtMYdMWgy4CnGLuZWKggcmisX87s5yOVHjm0yrwMnhQls9gbSoUEMTZqD1dXin7AL8HO
         +HGOLmUO84ea57Uus0q143vynesOCwor9dhCS/o/+cWYPTHimsVDuMpgThh9EGFrIpZg
         Kq/c6xkpaYqtMQhB3NwqkeUbetLvqp3zuS/9P6j5fizN3C4NSh8OGEnTeqqFKsmv5P9f
         Vsr4OQAfwTyuUqH59A/oNIGMDGjNi4W4CKeNwn6uUTgftqvUv5gdzt1ExueWcdLSZd7k
         iUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699954678; x=1700559478;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Gxj4XEcGoJKP03CqvZMzI1G09gj6lPrAjhyFOctl0Q=;
        b=oqepT4yNbhoVwVw3ht2iy3Ju8uZYSgpBqddVIJ2dzW3REyOXyuVlsPC0y5/MZ4Y7KK
         kJGOl/cvoHPR1rDsTRlu5MlvjaI4OeYk0fMSLKPsoplYvMcW2wvKylRQ/8WiKTRpf+Xa
         mX+mfPmfB0oWCOseONS+mrhngqXT/X6FoN+qMrxN7Sb+gUiqIbeMLRCXR4XDzxUdrZ5D
         TBeUoxe7bd4Bm0J03nCF+NcLMPt2FcLny2FJM1aXUWEz95Hf+7W/r0MOhF9OOpQFuMol
         B9CrrGQqAjq22UFsCwi315KOyikRNuAxT2uYN05qWoMGrzeAXqja7LNgbrNUNYFhiEAR
         omZw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yz2KiIk/kbv7xakAh31VAnsPa84F2fjFcC5nEZRPZGTsogXOZ3y
	S4yZHPEfU/ba5aMQlC5IrwU=
X-Google-Smtp-Source: AGHT+IHySJG2JeNNOYPYPiC7px7HvlbM6ABXq/rqtfzo2wtOHvZgyzv+P9kBQDR+VHSWdeUolJSMWw==
X-Received: by 2002:a05:600c:474b:b0:40a:4609:9c90 with SMTP id w11-20020a05600c474b00b0040a46099c90mr8033260wmo.29.1699954677787;
        Tue, 14 Nov 2023 01:37:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1d93:b0:407:67a8:8d2a with SMTP id
 p19-20020a05600c1d9300b0040767a88d2als2600381wms.0.-pod-prod-01-eu; Tue, 14
 Nov 2023 01:37:55 -0800 (PST)
X-Received: by 2002:a05:600c:35cb:b0:409:79cb:1df6 with SMTP id r11-20020a05600c35cb00b0040979cb1df6mr7992551wmq.14.1699954675302;
        Tue, 14 Nov 2023 01:37:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699954675; cv=none;
        d=google.com; s=arc-20160816;
        b=fiCBC5FY8DHjI26GdYUd2SahaBs2zuMHxP+XhMQcGS5IowbhwxBf2c8T5dyZQme54y
         mkQWlOA8mXjvj9nKbqviK0e40NRsbRgQa1H0v3+AA8SmOCgtyPKEib6Pm76VO75RY4A/
         xw7JHH/3fBhyHnpRcKAGNk12QDqogc92zyYJL8kjjOfA6RINTn8YIZ9hggyt6N4cKkq8
         HRvfPRFeKR5tcDzcRfhA0wALJ68Sdd1KCOXbogxPO+UvAh///WcmhDiH4inJYtDNEKkZ
         l3ZP1vvVIsgyjuhAzLb9EHdpMivTkuST51hzua0QKW0NyBDwWoTVJDkkG1+cNFUTpdAr
         Dq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/rwAd+jLC09G8kxSS19b5A1Bvquh8FMaXpKL0U5Utho=;
        fh=t0Nw2nhOOnWFAR86PFfZva7qIMx1vMlLM9e++XkoW8A=;
        b=Dy5/8+0dhdu151b71MrJbIhKhkHY+kRxrMi2AH9YCJN9Gyf4c/1I+2nDUna1AK0UU0
         T3DkUnlttWpvFwI0D4aSKck/a/PIHBHDLQ0mvOCBN3A/OGgFsf4aSCAla6S/qRtBF4DJ
         yKkboTaxm2qWZEdJZDilS+5SjOT+Vs1NnOirI29LDzW4gOhOLiSN/P/q/ZHn01qXY9Zl
         0JcHnckrFPTBRiWaVgGDfXVGjNQiylMBlmb4aHYfzNkUG+dB1EvmgbA91dZy6I6IJXrF
         HS+h7DlAjiKkPWHe8HH6+1xR4XN9aiR3M2gMnF3rqbfi4jXMiDXmGA5R8RS+lc2MYD0K
         DoKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (invalid public key) header.i=@vmexit.de header.s=20180813 header.b=RaBtFvow;
       spf=pass (google.com: domain of ralf@vmexit.de designates 37.120.178.10 as permitted sender) smtp.mailfrom=ralf@vmexit.de
Received: from mail.vmexit.de (vmexit.de. [37.120.178.10])
        by gmr-mx.google.com with ESMTPS id p31-20020a05600c1d9f00b00405c7dd428csi611975wms.2.2023.11.14.01.37.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 01:37:55 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf@vmexit.de designates 37.120.178.10 as permitted sender) client-ip=37.120.178.10;
Received: from [172.16.2.23] (unknown [212.77.164.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.vmexit.de (Postfix) with ESMTPSA id BBAD9AC02C30;
	Tue, 14 Nov 2023 10:38:59 +0100 (CET)
Message-ID: <5eb6becc-4801-4b30-aa7c-7a1826e50aca@vmexit.de>
Date: Tue, 14 Nov 2023 10:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: jailhouse enable non-root linux
Content-Language: en-US
To: xin zhang <zhangxin6483@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <89d7ee90-8781-4db0-ad76-b045f1844eb2n@googlegroups.com>
From: Ralf Ramsauer <ralf@vmexit.de>
In-Reply-To: <89d7ee90-8781-4db0-ad76-b045f1844eb2n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Original-Sender: ralf@vmexit.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral
 (invalid public key) header.i=@vmexit.de header.s=20180813 header.b=RaBtFvow;
       spf=pass (google.com: domain of ralf@vmexit.de designates 37.120.178.10
 as permitted sender) smtp.mailfrom=ralf@vmexit.de
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



On 14/11/2023 09:40, xin zhang wrote:
> What is the difference between the kernel image used by Jailhouse to 
> start non root Linux and a regular image? Do you need to change the 
> configuration? Can the directly compiled kernel image be used? Which 

As always: Depends, but generally yes.

> kernel image is used? Image or vmlinuz or something else? Can you give 
> an example?

Depends on the architecture. On ARM/ARM64, use non-compressed variants. 
If configured correctly, you can use portable kernels for both, root and 
non-root cells.

Thanks,
   Ralf

> 
> -- 
> You received this message because you are subscribed to the Google 
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send 
> an email to jailhouse-dev+unsubscribe@googlegroups.com 
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit 
> https://groups.google.com/d/msgid/jailhouse-dev/89d7ee90-8781-4db0-ad76-b045f1844eb2n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/89d7ee90-8781-4db0-ad76-b045f1844eb2n%40googlegroups.com?utm_medium=email&utm_source=footer>.

-- 
Ralf Ramsauer
PGP: 0xC85252CC

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5eb6becc-4801-4b30-aa7c-7a1826e50aca%40vmexit.de.
