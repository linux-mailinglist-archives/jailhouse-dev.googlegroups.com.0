Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBXXPXLTAKGQENGMPZKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id DF30913EBB
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 12:15:58 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id 17sf977910ljq.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 03:15:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557051358; cv=pass;
        d=google.com; s=arc-20160816;
        b=bGHA3Um05mwhKzLqN6OxbpFFMwCwpGqSx1Ar9bRzHoVYdF2pwIt+MAKT8QRzy4esut
         S8rLBUFJ/OwDx0DMfI5G0eJ/gbi4qfTaUtEmPExBKUxB+Wk9dGUGuOiFQCAlmyKCIs+x
         52DFsTA4s/5W/T7bFEX1+xz5apa+FBRZsO3lpK0Ys/BG5VNUX3lVY3fZi0i5iMXShoRO
         8L8ZsWRuxNJIP51WaaQ6x+hhZMgv3Ujpkz5HzCWkojortdvJVoeDQxkswhziL0ZgWMGk
         JAn1XWnOGe5N14QbEYPa78DZMJ3Oi931uD0FldVaz7iy/W4Jyheg+Tba/lyze87MR7s+
         iNSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=znMBn2QnV+sP/URb7Qc7vMeHeLKnVIPfia0J5HBXNnY=;
        b=XBkvi1qEIIjHnU4QAKX/ZCn29eedHu/Snni8j7e2daiFh+EU8qCUA02RTboexL6wPi
         VcYsOkX1luImeAscvV6qGbewAxXOCXIx8/D41IMN8x8QkpQY/hBP8bclZvOZnDvmElUT
         fwDilVkGtMuKb2nn2ym8TLo9ZOTU21hGzZnab5NQ8gXrAihdzHzL4kysgMAHEZVORpVO
         uroqQz+8h8PpV5ficZ3fV04B2vqBZpONDo7r0ZasK5daLGDsutKs+wgpOskAeUR/KVO3
         BzOgEWvE+nSZE6uH0/uPCYuIJUq+BymnvcotukvhDjCjAd00j9fL0YDjFLcbeRhHoHJ5
         T4Kg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=I2omjdb7;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=znMBn2QnV+sP/URb7Qc7vMeHeLKnVIPfia0J5HBXNnY=;
        b=bB52KjyHypXcXh8v4ShMVJJcDXZjL/E4yo0C6ZDTvC9+2UGRPulu3nPiUwtt1EOthK
         dP/iELj6VN2PwX8tUsy0ImrjVZkexWRpjD5uO86C6TckpJTcwqqJiTvbK3QQaFRht7Mn
         vof353MpTqCTN7I+32lvLSZdDVqy6xUuz7Wj582u3RoFYGcxyyHsmr03pPb3BVr25l7q
         +kzyNjB69Og3O2RYf3Gsbg4WVasY/M94kZZSmSMGtZjip1t2YtVr+7U+sV4Zhm1O4Ck9
         D+I8BXZ6JhNXYWe/+EDZqGWOlb+h9CmUNBaPmydvwJMyJ5o5PKCq53CBCldOi6FDxDwt
         cBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=znMBn2QnV+sP/URb7Qc7vMeHeLKnVIPfia0J5HBXNnY=;
        b=FkhkyH65jjVUev2yUMezCAWS1qyTbKReTygPTnGSSA69lvXZfGxEZdjo/YJaS+1hdi
         MTAYNvz7P1enYoddE+RRZo677J8QUg60wYQ4aKC726BpDXlf69EfuVSwmdaUX9fyfxWX
         MUra9IQvrt3UnswGWbIBM1b4fOgdnVr7TCsqGYUkmBE+lvvDQ7kY7/YEXVUHFXmVqm8e
         izfP0+vKuZbN2EPfMPO45aynr2/1h1J0eQOzy96W8o8W5Q4rJ3w+QJJLRGpUSnfi5plM
         5sih62BOhIBdVWEPIUg4pq1qzfJyiCmtJDdQ0oLuBr+JPqePZW5dnino6xNIQDpCoAex
         IcxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW4QyaMPV3DdTaEklSp/zdXW6zdAV9q7lHjfJObWiLyn8IfV2hw
	SO0fTTl4CGWY8ZcOVSHZCpI=
X-Google-Smtp-Source: APXvYqxyCUe8taCTz9yxUtx9TOAugDGG1OiEyMMSTjl3sp1NhRjaL4ZAN9IwL1bWHWhs2tZChsGBjg==
X-Received: by 2002:a2e:85c9:: with SMTP id h9mr993133ljj.110.1557051358518;
        Sun, 05 May 2019 03:15:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:50c2:: with SMTP id h2ls836481lfm.1.gmail; Sun, 05 May
 2019 03:15:57 -0700 (PDT)
X-Received: by 2002:a19:ae15:: with SMTP id f21mr3807662lfc.86.1557051357837;
        Sun, 05 May 2019 03:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557051357; cv=none;
        d=google.com; s=arc-20160816;
        b=dmZ9QiLzucU6UF+E/LwvZTLcEOlhjATB+qPtsrXF+8EJjfc2kTXaVwHOLfnSeS9kAW
         qbsBTksEtom4rPWat/VadJvQ9JWccHhZMby2SXzh/I/wtN9XbNYHAxgQZUzMNmAN08Of
         fXLpN+NUvkN/JVF7QfIchmGWX5n2jII8NlBdO7lU+QnhPocJuc/XNHSyNtpbmiqE/Bg2
         rj2r8aAusRkP58M2/cRIvg+rPR+kKrZ5iB8kzyAsJAMo+cBye9emFOOEalzJtCm+Zgls
         DJJBQbzkwRWwr6/n0L5VdwdPbb5n4gDOVVcKMFo1tY3A7ez1aNR9++hIgnnyGYycAygZ
         yJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=DAQoLzqyRN7lXMdnEG4AVnbJ7sdColU5nxsqUkGgQGQ=;
        b=eXQ+/aqWNAwG+z0TunWYtdWz8ef5Ex73CfdbLPkvrsfnASAOn6JO4lWC/OJ71aA/SO
         hgLDYM+Ids3c5QEHqAQeQuVNxxC9A0jVfN1wQVwZ0tT5QUJNdievQQIVcuizx13P8rC5
         CzPSE8Cd237aHTYAssoF5pzSta3po/LXVW2uHnzFjUyG612sewd3lNprxnZ6rEp/h9ik
         ny57Zb/cWV2ZyRuum9CxmulrF1tjJXPTrtWbx7Ch0wAEnup0qndkFcbUHMm3RVZZTWvY
         QXV+nZbC7NTq8V7BsU/U4j9CUDFOwy5Tgkm86dkJGhTAOXvs5n6cJDvss2OzWIudZOPp
         phtg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=I2omjdb7;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id f18si41823ljg.3.2019.05.05.03.15.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 03:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lakoa-1guSwu41Rw-00kNy0; Sun, 05
 May 2019 12:15:57 +0200
Subject: Re: [PATCH 1/5] configs: define ARRAY_SIZE in cell-config.h
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
 <20190430214504.2153-2-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <6e481195-abd9-c2be-6b69-bbb9a6fdb245@web.de>
Date: Sun, 5 May 2019 12:15:56 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190430214504.2153-2-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:vs8XKI4c4xoNHhru86hY4kGPUGBkS1UDcBQ4AhDmhttiYR0Wmih
 aYzjfVRN4FDoMjuyYpTVXrhsp5iUWCCJjLDbLRqs2wALrhPtl4OR26IiTbn4FjrWFNrIPNS
 0vdXuabIMiOlEtUzojaTF7KyxHkM9wrQ9t8euerZ2FdHmWX667VFNaTSQiFAhQyW8jATBHQ
 jr9qjF0hPPUqNuIUZMcgg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cZ94aNOrDr8=:Hxmqy9TnOEhwEEDDxaJS3t
 N4T9SkE+7wDEBnjssLxJFu8U7uS6W37dyyFuq02ZbOSGTb5LN+5eUZGGXaETPwKbgPZtAVqw7
 8DmpPQr+JFgqxRzpZfe5UzXq/6oxyv2Eb5judLmdx9F9MZs1hj2PNiJHEYNHlVC9N1dn/2MfS
 5NKZD8/lGAfpIQUTUwW3+Kwqqcx9x6h0K28vpDhc/UrhK3JGpVY/MNmLKD1x18XB2WRPHcdjD
 hVaiyZkKyOTAXcF5oT4CTRHNfBXYeorMGhRfSmgPra2c/4Uc6Oh9XTK51o7R1ZVLq0bhMyX1p
 f26H0Khn693hLyvb5uG0XEdE+gGB+pwtMaSB1/5F5gb2ato9+7IU1MB82mWJwUJ/8lHOkDdNa
 UwoF0LmuUWeztpyIXJDVLOoDzQNCQtSm46VQRTrhcekBwFIzsJRLUePq3hKWMSCjTNXvafIrN
 xe8vwadiq82lPBdTJzkZZYojmFot3CxaAfAbc9awC8zmyw/PW9cd7NXTxgGvYQ+267S7Ckz57
 X9aiXfEnq4akzrR5D5Me5jsAGqraxaR9WNgiPaY1xsVl3JdgA2y5oKZN2IJ55NGNAZnEgtNp/
 P6jKnkc3jjOofzjPW7E4PtN4P+fmOLA51w3Zvgw8EA2Kkm3EW55mGh3PJbl1J4loH7zofGDve
 9fN0MS3sbmRniV1wySqIkGT/EzCZgr4Z7w4kh046BS/rssE1q0PLG2c8UFaPPic1Tzf4GUa6g
 zF9cO0RpqDcaBILo6eCf0vSEZYFxVDR7AHo65lKrvIJK/WPmSxNQ/WAW51oJ5DwRTGiidwQnA
 Q9SYn9DRDDj7vsKqeAo25qgPVfrOqNDXWFnm18cDXNe4HDqFwXA+gwIfL6jgGeIuAJQUlJKly
 3Opgcu6SPnowgoPBdU0/1u2GteF0oGga9yippFFTLrgQUbQ6G5BsYQFWol77gAm6mtPgKQp/4
 h1FlAndok6g==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=I2omjdb7;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 30.04.19 23:45, Ralf Ramsauer wrote:
> instead of defining this useful macro in every single config file.
>
> There's only one quirk: ARRAY_SIZE is defined for hypervisor code in util.h,
> which we can't include in cell-config.h, as it's GPL-only. So we have to
> duplicate the definitions, which might lead to redefinitions of the macro.
> Hence, surround the macro by guards.
>
> Also remove the macro from the root cell template.
>  > Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Well, I always counted on someone coming up with a better source format for the
configs before someone [else] realizing this obvious cleanup potential. I'm not
so happy with the hoops need for the hypervisor, but it could be worse. Just one
thing when updating this series:

[...]

> diff --git a/hypervisor/include/jailhouse/utils.h b/hypervisor/include/jailhouse/utils.h
> index eae0f390..6f6e8371 100644
> --- a/hypervisor/include/jailhouse/utils.h
> +++ b/hypervisor/include/jailhouse/utils.h
> @@ -12,7 +12,9 @@
>    * Partly derived from Linux kernel code.
>    */
>
> +#ifndef ARRAY_SIZE
>   #define ARRAY_SIZE(array)	(sizeof(array) / sizeof((array)[0]))
> +#endif
>

Please leave a comment why we need the #ifndef here. Because once we remove the
definition from cell-config.h again (that day will come...), we can also revert
this here again.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
