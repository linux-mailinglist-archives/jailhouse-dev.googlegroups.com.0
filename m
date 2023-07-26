Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAX7QOTAMGQE7GUOTWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id AC214763492
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jul 2023 13:12:03 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id 5b1f17b1804b1-3fd306fa3edsf9522435e9.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Jul 2023 04:12:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1690369923; cv=pass;
        d=google.com; s=arc-20160816;
        b=o1h1EIlAcz6At/rpr3i7/Zjs/gAcCy6IAHDjFlB0pGRPwQht1A4AlOIOJPAhzDAAmI
         iUB3ByLpyA49WQWMaqgA2UfZbzHMCBBPWurGjw7fWWP/g+29gJz6wTPcmzkXPXKM+yHq
         TS6pX5GyR842cVzIUIzoG06JItDOJ6YWJt66/mpWAu+ESLVO3dgs9j58g4EtRWQGGRxB
         njW5lWbmyN2qdeMJV+oZC+hPcznjtWY6VSElx5eBmxdk94PFtBkxOLQGUexlq57q5EYj
         pmPFMtlQhctjjPQMdLGqRW5SBHo7LHZUBLnQG0D+FvcgSeTtzqONGr4Kd1mq0/ckYMMy
         L7VA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=K01PvtgdXLF2oAdE3e1zIXf9vsv3XYjzXdkGZMtWP/M=;
        fh=FrV6cpl4HCjWBPv4bD7daMcPSJruKZfBcVW/WO33Ffk=;
        b=MxPFcASnAo+WsAcYqnsBLs5m1okhZb2DAbSaB+bdNDBM8pXM6Ac4zX21NQRxEdb+Pv
         q+zOd4bPLSKPJb6D7PXk58h0vYAlp2HJLs2YXX/ayG8kQAdWE9Ein9mYzNiNtycG22CU
         J9Z5kYCQqQTYJjS1xerKf1Dry9Vb6XgvKfN8S+T0ApJJcHhSqmU9CwCrL5v00UHRSA4n
         wu/A7fZlGlRHdsLFlqbUj8pYCF6IAVp5CAmSU6YlHMMs7xTaNW0BbcbQ0CDZ3BUL61Gi
         Hrl1nMY+CdM8bQ1u7SNuJ3wPn6bMmIR6oVAOzO9uGvcezYMBjNOCjn0eVx1Hzc2Erz+3
         Pfwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Pph2SD23;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1690369923; x=1690974723;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:to:content-language
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K01PvtgdXLF2oAdE3e1zIXf9vsv3XYjzXdkGZMtWP/M=;
        b=U9SMCyGxz3gV1MIqIz1fvG7sqXm1d2XEjmhFYKP1PhCbDbxzDnpNG18H/QocD685ON
         txlKQfKQ0Edz+xEkF58DLTcJcZywueHTtFWiWnWVmhEh7E7fBLcvBHYtZLc6Um13h1V+
         l6achTwVhiqDRl0CfN+OiBVwBLEXnM6BXW00nlXIjUDupKMv/0R8Mjcca1ECoXes2tml
         QvLD1o+CT/WusRj+mIryGZFosQtc2qfw2iScW1sHAjwTumBAqvj9udBwkB80iuMcVLcI
         tyJ46Vr0V3OJ16SYMzJvlEDi4ZjPWyW0sK+O5/7Prwp2GpZvkq6IoOdKaH+UyrIwJ5VY
         c+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690369923; x=1690974723;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K01PvtgdXLF2oAdE3e1zIXf9vsv3XYjzXdkGZMtWP/M=;
        b=SvykWTJ4tFj42RsFXEpslHfpJwN3wYbYtqzSAwQ2gQjN58bRiDwnSBSjyUGmmEkQNi
         A+PRL1GxjcFlABXUIXY2cuynza5B9WBgU9q5B9NoW0GywcZI+EDYOl3cBe5KlS/ithrg
         4RkqrZs4sKGO2C6uWqO4BDZvgPT8kUyRq5K1FMuSJsrI52gHzXpZJ1IkTFECybTbxLlF
         f88kIWcBwjOQs+HMdjNz71nsR0qefiLw+70nuQ3omVjaDOHSAHuzG5Ph7HUFrhsJTIQJ
         jyQ9a2tyVkXYv+DImY3fWQCbI4G429vR29NTpF6nIpFQSdNmI1F6Iz7wmjQ0MSDxdCqY
         BElg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ABy/qLbz6BbjM2crzQBTbZljjlo0gMxYnfFr1BWUbJkfjYKK7ca6dXZI
	8niBMYtXnPTUg2F8XnnKEnk=
X-Google-Smtp-Source: APBJJlEyGQ5F+Cp2ANr4NfNyzI0yIt52c/TkhItOYiXLlb+Q+D2mQadYp8bo/kNvX0CKmC7VsvLeDg==
X-Received: by 2002:a05:600c:1c1f:b0:3fa:9587:8fc1 with SMTP id j31-20020a05600c1c1f00b003fa95878fc1mr1523152wms.1.1690369922637;
        Wed, 26 Jul 2023 04:12:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1d24:b0:3fb:422d:4ff8 with SMTP id
 l36-20020a05600c1d2400b003fb422d4ff8ls52978wms.1.-pod-prod-02-eu; Wed, 26 Jul
 2023 04:12:00 -0700 (PDT)
X-Received: by 2002:a05:600c:2147:b0:3f8:fac0:ad40 with SMTP id v7-20020a05600c214700b003f8fac0ad40mr1162958wml.29.1690369920362;
        Wed, 26 Jul 2023 04:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690369920; cv=none;
        d=google.com; s=arc-20160816;
        b=WOkMlPUqQlT1LVJCqHM3HuR1BwNCs6G02Zj1blsy9hmhTdAgI7/4YkO8FV4TiJIWn2
         qurqfZLN3FdjZyuKNUnKQbdwBpaAvMSrJf0vt5Wc3s0xeZ3wwAPOXdGihDwK3kZEYTct
         uk+U3Vm0VgmdBdFORDiJ0nkfigzoKNVjT9s5qP2+7POcHzIWZGw572qERz5quvvqzzkT
         xpOItD0QgC7VK/vvSVKMLKncQqkA7CnvOeD+YXfOVnt2Xc9rJQ5aDlV8k2QacPGz0TTL
         yf8BONqREK/Ni9iIZiBtxNsj/G/WHrZoKmWBsoq2XM8W+KfT8vSMMC9cVUVl+opt5ejw
         i9pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RDQjWw8NBpQhpap+eRHmjFu2Gyf+Gq9+nx+SA7r9Mms=;
        fh=FrV6cpl4HCjWBPv4bD7daMcPSJruKZfBcVW/WO33Ffk=;
        b=ISqEyKep6iTY9c3Jur5vpQ9/d5tgehGPcioiNOThuN2RgzyLlhAOHhKDFgCvcZYYGs
         Yxdk8O/p+e+YBsWRr4KIGknpiNeY3YfLOSdYdCybyue8dO4XBlj7fTEzOal/V/VlirwO
         xGxFgiulK6WgiqHUZMuUG2rcltGtzWqpdtO6tbUFeOmbq6gqekVPZZpbMIgJnbuqQfjy
         hpLrB2La2lf30NWaQlOzRM15e7inS15Lh/nl6hiHjoLNtRu7xEUEI88frek4W8lN8Lnw
         LM5V/UOSIXldCCMLZe8FjX6py+2uRHGNyD1JdZ28awP8RzouVWtPVh37Z+QQtzfoJRdN
         DQiA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Pph2SD23;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [194.95.235.60])
        by gmr-mx.google.com with ESMTPS id n30-20020a05600c501e00b003fbf22a6ddcsi106795wmr.1.2023.07.26.04.12.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 04:12:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) client-ip=194.95.235.60;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id A1ED03E00E4;
	Wed, 26 Jul 2023 13:11:59 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4R9rnq28PJzxr6;
	Wed, 26 Jul 2023 13:11:59 +0200 (CEST)
Received: from [192.168.179.88] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 26 Jul
 2023 13:11:58 +0200
Message-ID: <d5ffbbc4-d926-5bc0-e7bb-fa400875039b@oth-regensburg.de>
Date: Wed, 26 Jul 2023 13:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Configuration with 2 guest cells
Content-Language: en-US
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <81fa9191-18dd-4003-9cfb-bed496d5723fn@googlegroups.com>
 <faf9ae5c-7f62-5814-7453-793bffb881c3@oth-regensburg.de>
 <43f41f9d-0930-416b-a618-1955e237cc87n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <43f41f9d-0930-416b-a618-1955e237cc87n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Pph2SD23;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 26/07/2023 12:56, Jan-Marc Stranz wrote:
> Of course, I checked the configuration for the root cell with "jailhouse 
> config check".
> However, this is not changed at all while I change the configuration for 
> the guest cells.
> 
> Also, everything is fine as long as I don't set the size for the guest 
> cell larger than 320 MiB in the guest cell configuration.
> This only uses about 62% of the memory area reserved for the guest cells 
> in the configuration for the root cell.
> 
> I will follow up on the tip to increase the memory area for the 
> hypervisor ( hypervisor_memory.size).
> So far, 6 MiB is reserved for the hypervisor itself.
> To what size should I increase this memory area?

Just a bit more. Try 10 MiB or so.

   Ralf

> 
> However, to find the cause in the driver or hypervisor, I lack the 
> necessary knowledge about the structure and relationships.
> So I have to rely on external help.
> 
> Thanks a lot!
> Jan-Marc.
> 
> -- 
> You received this message because you are subscribed to the Google 
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send 
> an email to jailhouse-dev+unsubscribe@googlegroups.com 
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit 
> https://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/43f41f9d-0930-416b-a618-1955e237cc87n%40googlegroups.com?utm_medium=email&utm_source=footer>.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d5ffbbc4-d926-5bc0-e7bb-fa400875039b%40oth-regensburg.de.
