Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGUO5T7AKGQEWLM72FQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EFF2DCCEB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 08:22:03 +0100 (CET)
Received: by mail-wm1-x33a.google.com with SMTP id c2sf1655043wme.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 23:22:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608189722; cv=pass;
        d=google.com; s=arc-20160816;
        b=WE/je/oyWLbmaL+GhctHpl9VE08K+j3ZGAKshL4CQqURqPNOcKvE0O7QSRNsh0xaQR
         cQnTWTCqREermTfqcZiwziqNElp2DZPl9bukESroaZuTHF5PuLCDsx7PeHnZP5vuc/Lc
         rJsIUAai8Mg5WzyceyuCAfxTpqTZ1vbkOs+7Z+sri0ZR77wZyfrGX23zAs173iMhKPMW
         M/MLW+UQtRnIv2bta2gs1W+naYV9JfnIb8wXDfyqsQyuXlGK2qyo+MLmOXhjXmRVQ0ih
         QnrrvXmUqp7vWeFFuc0eUYKtCg3uHlRQNMrxW2tWUHEIUMjKhSJiLsRf8+l9nu4G5BAa
         DCeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=3BOiZTEmi1pnQEWu8s/mjD7mJjPlPAZMpvXBfSnXneU=;
        b=zVc4k7SuKgmBx9WbgJeTnclLLtedGwuNmnOIYbVioxTEoKrIScwQnMg/XT8aG9piya
         +KKFoVlMEfAtNrubhM7msI5wtX77JWpL/Xi0HgeIzfzAQ0EG14aeqMXvYNRYtG4CMbch
         +I948DMefYh6mqgNwEP5kdax2JgxyENv/bemnKT36y49Jd5LWFm9SPXZ/oyqArfHEuRC
         VQ00l3kavYzngQNtGZLEk/VNJzvwjaiMNXQLJMf/2wJJdACodBUx6/aGQuhCQspFSG/Z
         A8G1i3EwW862oG6hvaeoQdRx31pa5aZdQ9DQoTxsjJaijQm2QJuV6Lq50U71c5xtDbw+
         lnPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3BOiZTEmi1pnQEWu8s/mjD7mJjPlPAZMpvXBfSnXneU=;
        b=jZgSsQ4hq6HkfJcLLVthzGMhReof688PiEmMJGgh4x7TSzIRde8I059zVQFquQ4Qa6
         s7gB+Zp3wrJfr0MIFgo2Ip8hjb7Ebk2P5iG495KaxMv16L1i8WUyXaF+2BM+fj8851os
         OZzdCVRbNQtaUmB+tcceiWdcpL5NVpDQJaNpjru09IDdJpp5sjdnyXRDRReMtsrBB4CM
         8EDHhEO/eaVHwjo6zvDvBBde7ggCAYDuIDpBwVnTOci7nDU7oyHsnJhfrsEkeWBwGtdV
         iaNM5wKl3A7AMNyiFx4SUkntbDbsSFPrKoHlU/EfZLt9hq6w4gaGn5DfNEHyOfKV9HI5
         wP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3BOiZTEmi1pnQEWu8s/mjD7mJjPlPAZMpvXBfSnXneU=;
        b=N2RdqUKXkBXI7kTH7Dg6k3Mfr0hy/E6JBdGPpkcMPZO/3QNw0336DvayYwMpIm2F5p
         OIvrbvncyRRuN0Pw2xg/RhixlyCCXBbSaortsOjPCJXL87lLkhqUvNXUh3RZYBXsJ4Kb
         SetRvGU1Xiy4sM8RbmRsvnatmojzGi3l4MvF6TO2AuiHEKmBmFZ5taf/QkNKl3U9/mcc
         VlryfbRFGRoTlFDMA8qDbLjK14GbnNiFuLSHeNtZsHoMJGwQwmyY5qMpFA60UZC/g+ti
         ck8voMttXABPFqz+yyujpuCY3FPwGJVmfxk8SdEYb95WI2XydIAtaKEI8v8k7aRPVMof
         iWxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Qo2TG39VWPpjoLlo8vVfS+P7F/hk8/hGCDqOdmmAXJfeG3pC9
	i8ztSSaiM4wl+wrUeaggE9s=
X-Google-Smtp-Source: ABdhPJxcOCDsJSkH6sUt4ZAHxcqHdCSwFzyPOnUdZUx42vl4NpnqwvW6NvOunpm+UCnWl2KO33IkRQ==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr42150413wrv.397.1608189722781;
        Wed, 16 Dec 2020 23:22:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2094:: with SMTP id g142ls2723673wmg.2.gmail; Wed, 16
 Dec 2020 23:22:01 -0800 (PST)
X-Received: by 2002:a7b:c930:: with SMTP id h16mr6986535wml.175.1608189721596;
        Wed, 16 Dec 2020 23:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608189721; cv=none;
        d=google.com; s=arc-20160816;
        b=z+hpurlSX6CSXZ+C5GfO4bx9iG1jJyHcako5KPt0C72QFsnPNZkGce/WKEsSiZ1rf3
         BPPqpdliqaCAjeUawhcbUeKHa7Rgdo4HlWloYCKr1FH8YV/JA2ONfpojRSGAa0OdHfpZ
         TOzqM2Ybf3e9qNcDWI0eS+b2wxna4TEeqsFdZ6H8EYubrp4b3/ueX6QRp/I0Ep0912Ll
         6a6DgARMIyv+08Z76NrakvLnrJb0S6cYH4Qafi1yxStdxBVZTgPlL0r5nLSa6SgSz6CL
         RL2i9E72Rt6A9hlN8NzlMYxJVDWk7ExHVQxTgF46i3lI9vSTjP1qRV8+OdyhxGer21Ld
         AjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=OPxZ09J5zkDPkj7vFSWMJ+lHNIlbNuTHwNzTkKgq7AE=;
        b=D5/qqJcY9oGMAnLaPBPMt6O1y+L2zvOkm1S2QArNV9ay/P3/YryzLEss3YgwF3sQpL
         fRUpWsNAC7apZI7QW8OO/hJmkcWJq2fbjJLjvnxR6j3pO4bR67ufH+tlxzAUQsXDTHjC
         D0bqFkZxYiN6B84UrEfPt004F5WsOOEAEWskVRBLrfihOSo3zxrziffu+24vMe74mtm1
         KspKCtNkF4p9TtDAu1UDcxtOztj71zRwxflvRp7P9IsVWHeleWRzwRNHaVO/dn2oiPVV
         8pPZp9LwVm6JIeYRtlXyt7wrwKMHcGTDnFAlkBVbdytSaCXqitWgXF1ZSxCGQwPuLsKM
         jc0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id v15si282754wrg.5.2020.12.16.23.22.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Dec 2020 23:22:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0BH7M02u002268
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Dec 2020 08:22:01 +0100
Received: from [167.87.38.225] ([167.87.38.225])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0BH7M0b2018126;
	Thu, 17 Dec 2020 08:22:00 +0100
Subject: Re: arm64 zero exits
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <DB6PR0402MB2760E9A43F64FDA9DE46AA9488C60@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <f99a10d5-db9c-fd70-e0ee-87aabe30e596@siemens.com>
 <DB6PR0402MB2760BEBB2CD916A46AED7D5388C40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <23d9342a-7ca8-1d15-be0e-ee1d38e9580a@siemens.com>
Date: Thu, 17 Dec 2020 08:22:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760BEBB2CD916A46AED7D5388C40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 17.12.20 07:08, Peng Fan wrote:
>> Subject: Re: arm64 zero exits
>>
>> On 15.12.20 08:16, Peng Fan wrote:
>>> Hi Jan,
>>>
>>> Will you merge the arm64 zero exits branch to master? And when?
>>>
>>
>> Still wanted to also upstream the zynqmp enabling, but I do not find the time...
> 
> ok. The i.MX8M part has been upstreamed.

Yes, I know. But I'd also like to have a board supporting it via
jailhouse-images. QEMU turned out to be harder than expected
(https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/4860),
and Ultra96 would be an even better candidate for that.

> 
>> Did you test that branch against imx8 extensively?
> 
> Have not do stress test, but from my sanity test, it runs well.
> 

As we had that issue in
https://groups.google.com/d/msgid/jailhouse-dev/91E9F831-4F9A-4444-AD9A-3E5C56D3CA70%40gmx.de
already, I was just extra careful with exposing the feature prematurely.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23d9342a-7ca8-1d15-be0e-ee1d38e9580a%40siemens.com.
