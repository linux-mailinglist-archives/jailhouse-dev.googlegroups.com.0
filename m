Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBT6H5H4QKGQEJQ5DXHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A73B824650E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 13:02:40 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id x9sf3455984lfa.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 04:02:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597662160; cv=pass;
        d=google.com; s=arc-20160816;
        b=xN8f5gIt5VI6KMgZD15wOxlurNfLGfCt40uGUpTanei3kR3jiFJ70AcNVCRbsyyjKw
         GzzQz2of4hQzWiLz45PJkOaOUvhgXjdqmIvAsXsxAEdUmL2isB/82pzJ8bPKvoTWN34h
         FF8lIj6U9nvTX8oNI8nk3eI4LqfB4+X/l/H3Rs32sKvZWIGOb1ccE7Ii1Vr0Iz+ur3jY
         IR61N3zD/c5vKKDgXgPrU/45rwT7ZgSorkSXxrBa758A10t3BqmpWb0iBUyXfhzVhjw6
         4r4RFff1QnNZrW0EHFkdnpdChjK/bEBzLvWSKxOLDwRet8SKevtkFI1vwc28Wq0gmImo
         XMJw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=2T7XFS+T7by5Rp2oWSpQ1q/gsq1O6oMSiSDTVAui4pE=;
        b=Rtp4LTPHQ2yTob9xuqo/Kt5+hLroXBh4rLGR5HtXzbqlPtlOqx9m73qq6No2Jlq0rW
         tPZw8bhLrppO365C89vqdsIqCXi6lXOLor6T8IzWW3SYIp8j+Sa459ARzVGysrYXWsz1
         V7h0jHsrk/EbBLQcuV11RgKCWRi3YXSTiC8mhSBzmlmK37/qrvNEY4Hrk5RZW9ihM0k5
         OId4r5epeKph2NWmKIUlXp1xWxQfNhOzQsjphgTZxwnWAvk1XfMmHMoLhgt9bsgsUuJx
         eEzFFO3661QkNp7Y9D3iDS0eVHGVa/ThCjHzixtUrb/evCGZ4OSGRY+1j0I6vwyrbxe5
         R5XA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2T7XFS+T7by5Rp2oWSpQ1q/gsq1O6oMSiSDTVAui4pE=;
        b=H0hGVKWvCLXMHIyE4uNY6SkJVClwr+tJ+jGoS/8LnzY/hxnEEB5nmZ/ECTikdkTmnQ
         MNDC0MMADayUZmye4niq7pMGCBsW+vMSRllQGzoca4caBwckNxjpHKSR2XXAwePLBI51
         Rz+5fQaFyMQXRhhc5hywjo0Rs0hwTGFZjXR4VMTjrcNI1iwFhQqZH65P2mufpowYHAwC
         uWt9T42K0E/8U4+ft/t2j2ebrVTlwl7oKxzUC0t0b+RBgFWAZ3Xin0h3NsUY5emh9j9N
         Ka8PoR84Bo/JuxUP7dFyIv95yQMH0/8cPFii8dYgRsMBBZ/2WAAp6MhntS9y6IKxF8OP
         IVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2T7XFS+T7by5Rp2oWSpQ1q/gsq1O6oMSiSDTVAui4pE=;
        b=NmmcU1BAz6DOWoyeD0iiu+2kfah7UuBxyUv03fnJl2raQ1IPC2fOpJ8wSgPFjpDeQz
         dQXk2IqEBN9N4/PnDd9Xw2NCAvfKlR7I/ohQEBsqHUA/QFJVDToA6EZS6QjMlUtwYl5h
         84IJL888GT6ROXUuoq1S4H8z0GVSVveJcx4nQrTn6NfxkubIxS0LhUYJKKXkls331y4P
         YTvmViHOGcMWL9eFcfhqYOhVNmmf/30FF+159KKTNAoY7UE41gpaCr41NY1/YmGUQW0B
         Aj5pY45Rzya9XHZ30vHzoUTCV2igO8ohjj+Yqe4oebTPW3Z7w3OxnLl4nuzwrLwT1BP7
         LWbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530rsyqqRWQb4wedpluN0VAQm1na1PLI0eycQrU8fr+PZjfiNm6B
	3Box2xMT1KKqnTm2Gm8CZWg=
X-Google-Smtp-Source: ABdhPJx8e0qofq0qKycIG5m51N/PH/ML1YaXNolUGgoGi4q8q/U/tfrnYNdVKhCUCVFyUTuaK5t5iw==
X-Received: by 2002:a2e:5748:: with SMTP id r8mr7251425ljd.27.1597662160221;
        Mon, 17 Aug 2020 04:02:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6c18:: with SMTP id h24ls1202275ljc.6.gmail; Mon, 17 Aug
 2020 04:02:39 -0700 (PDT)
X-Received: by 2002:a2e:9010:: with SMTP id h16mr7424831ljg.316.1597662159264;
        Mon, 17 Aug 2020 04:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597662159; cv=none;
        d=google.com; s=arc-20160816;
        b=tLpHaRNMBVZEAPuKlbYBbU9l2PR4yBz6AnNp2HZW2MnkNGl91nhCHj4O71i8qEhisV
         RHHLcpghcdUiEqoYaeHM57P33gE1U+j0/NTEhuq1sf60c/sBjeOKam/nBRZWpeluWH9v
         in9FAWgLe0xngbt1K5YundSMOnxbDaEVw8DEOCIp5StfGHaR76uPwCT1cFEjB/w5gZqn
         23Xi5COvkBMgobyAQuSO73TPtNaUSoMvwj/6uSwb0V7GkX4RDXMhCOm23QJG5dzPAdv5
         wTfZS9seLpOHhKhH4OgdWU3oEUuMl8mXbRseRPPblofpxjIib5Ds79b8SSXpXCqhTi+b
         nWGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=2HhlKpibieFR8IiNE3F78/FfV44m7CxqrjB3CjUaqEg=;
        b=Kw77rmPuzJkPoxjKzSsGKujzRgtYjKAuMcQjy9AzBjqxDypoWq0kyS8BJCxNxWL2JH
         D1DYAgpalZQII0+0qQFd35PQmfdwkvVFIinfsQh/ezxLPi5DA/lHztuqZ/20bWmhflIH
         Rbzp5UtbAHgRNZonRA5V8ui6PTUY067CNPQSIoUZPvjJd5U4nEtYuDPxieqXx16cbr8R
         5uGCB6iCI5dEPunsptGK9yuRLr59yYz8pOTqwWUc+PEoQ/A1xDsiPrrIpKX3Fl3YhCiG
         By/wSeUCjCnIzFClsz+NiKAW6D0Teu2vju3W/FubSiswySJ3Tx9gcbpzTwgBVPjYf8fe
         X2Eg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z26si708170lfe.5.2020.08.17.04.02.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 04:02:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07HB2cPq001665
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Aug 2020 13:02:38 +0200
Received: from [139.22.40.250] ([139.22.40.250])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07HB2bq7029936;
	Mon, 17 Aug 2020 13:02:38 +0200
Subject: Re: Dropping code during runtime (was: Re: [PATCH 06/10] Add
 libbaremetal)
To: Peng Fan <peng.fan@nxp.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>,
        Wolfgang Mauerer <wolfgang.mauerer@oth-regensburg.de>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
 <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
 <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
 <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
 <47babf84-565b-db76-7e42-47b0a2d5ed00@siemens.com>
 <9d551e5e-25fb-4c8f-66a4-934187b9650f@oth-regensburg.de>
 <4f2c2e19-eba7-6020-5f1c-137f9e8c5efe@siemens.com>
 <314fbb96-7032-ee8f-8926-de3a667bddee@oth-regensburg.de>
 <DB6PR0402MB2760B89232AA1E85661A252F885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9356b747-915c-22f7-f398-b6d2d3dab77a@siemens.com>
Date: Mon, 17 Aug 2020 13:02:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760B89232AA1E85661A252F885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
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

On 17.08.20 11:45, Peng Fan wrote:
>> Subject: Dropping code during runtime (was: Re: [PATCH 06/10] Add
>> libbaremetal)
>>
>> On 8/14/20 8:13 PM, Jan Kiszka wrote:
>>>>
>>>> If we have a universal binary, there will be a jailhouse disable will
>>>> be present in the beginning. Once we decide freeze the configuration,
>>>> drop it. If we make those things compile-time configurable, then it
>>>> has potential to become a variant hell.
>>>
>>> Dropping significant code chunks from a root-less jailhouse.bin would
>>> be a valuable reason for such a config variant. You do not have to
>>> argue over things that are provably not there.
>>
>> With my approach, things are (provably) not there in the operative phase. It
>> depends when you want to attest your system. In the same way, you could
>> also argue that Linux, U-boot, the firmware, whatever has been there before
>> you made your attest.
>>
>> What are the parts you could drop during compile time?
>> For system partitioning / cell creation, you definitely need to execute the code
>> at least once - you can not drop it during compile time.
> 
> Is there any use cases currently?
> 
> Saying you have a safe critical cell and non-critical cell, if non-critical cell
> crash or hang, there is no chance to resume that cell.
> 

If reloading a specific cell during safety-critical operation is a
relevant use case (still speculating as such a system wasn't built yet),
we need to keep at least the hypercalls that start/stop a cell and that
load it from another one.

But I'd like to hear a consistent user story for that before designing
this in.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9356b747-915c-22f7-f398-b6d2d3dab77a%40siemens.com.
