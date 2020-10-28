Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRFC476AKGQE4SIWLEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD9629D206
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 21:15:01 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id n14sf279733wrp.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 13:15:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603916101; cv=pass;
        d=google.com; s=arc-20160816;
        b=PgWy0kdKABVUTLQ35+sulFxYRcWyMql8UtXZCOQtDrPqOegbhIllDUSrwDNUEu04b1
         ll2+u7pSYUtq243sHAcJb5CWp1B+ANFKgB4WPFWZafuidxiORDOOQVNCmOty2deCNB8v
         ZGWfi8Yo8DY+YTT5Z79scoNHHPzJtT/59e+xJynnVf8v8fxkcGUBAh8llXWEIbNi9M4/
         BWM6Rmje6BQyI3sLNStDBq/+kgrGHbDIlwclZ6jDB6fZZx9KMU/mGGhT4oHoyWHS4Yz1
         bhiLTUgjlSA2bd7BVSIKF1AiiYHK/pkrvlnsubw/ynyusLoTeRtViJIBY3br+rTQjUAU
         DVBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=Sj2GmKZjVN4ion+Q44XZrCg8NPxpq5P2TTthEr4W53Q=;
        b=wHo3aG+/lEkYhsQyIcIK5Pzx1qrkLHTc2wiaJST2QnhkjnshWj54BQqVPvVxWBglIm
         26ANyId4e1j3xTKBuydi4Fj+FSYaotrn5AmlzlGwXzcgSpN43GyLLZ/DWkTcGOjvg7BS
         +J+pMQ5CAv+4hdp5sINNDhPqJ9C7gR+ts9fYaU/X45dMS7Xmy8Q23FDSydvRV5RKV0U5
         1qwViBNiyRSrRa1oJLBBe6iMBQxw6738PDJg6KJsRd5cAWpjSABQcv02k3Zm6D3iW8td
         jyBvjNFM8zIIMhpr4Mka7ifmhndrXWH8usNhkXWh6Fwz+HBSlTF4c9QBCWVaZ02vIbV8
         Wdeg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Sj2GmKZjVN4ion+Q44XZrCg8NPxpq5P2TTthEr4W53Q=;
        b=bYNf5O/Vu8gYKRoq+5+IGPezRhgpYEt/p3O3xjbHszbhc3p717fmN66z1ECiN3ogaY
         cJq+vnhxEJOia6v6V/uuM/GaY+6PN7vOSOvSUTLSJeCzRebY6hVScTxDxdMZotPhTQeZ
         2fZB+dp79UHcXJbPjeeNYET6EoJTCyujuDgGmHC9PytYMY8//yr26Xn3LmGTMuVxNqh9
         bypzxq8rcpn8YcQwoCzkwt3QNFOhnxavtD/SYYNPNmGkNHtqiMP08iOAsqgWrG4HY8Iu
         A0+u9RTorGiGIXrptbxuOZnEPut6hz2NRdZ1kfYTcGKua+zqBswQRvTqWQb2BRnbHi5w
         GzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Sj2GmKZjVN4ion+Q44XZrCg8NPxpq5P2TTthEr4W53Q=;
        b=EXixCnZ3AnL+CgLm68bsG5BOvtdF3Hgu7iv8hC8y9IyzhBfQG91lgUaIaUz5YhEL6d
         scvOmHj+D5wAibM+6z2GsOlwjTCw2TKk7XqtMm4c8cO+geJDYtdpvC1dVHprWYplpidm
         JOCXy8PCt3dpdRdfO5wkxZAIk899B1JdhF3sFSb/Hmzo9h32uFB7jjjAwKWBm+VMVcTr
         r/jMG//oDMSJ9ULlLiR9hjE1CknsZSnOZ/M+kI/UeBDShC15y7YbCda8HAOAN7cI7NCt
         FzrG5XqMqTCNAdPPzl9OqoW0zKp2rLrecFbi22JXUY/vVp3FNI4yzoKNHx0e34RsC9G4
         022Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532NfAuNMugtNcC9fpxGAs2jsizvPk2Nzbf10tVSQuxi7NxLvJFi
	ah91EPQWWUYAzwqhh93J77w=
X-Google-Smtp-Source: ABdhPJwhGaFFfiuSgQQcfYybrEvvv1YsbDC/8f24Td7JmWDwC06LTUdr9reYQjaxA73s/wCalRMrJw==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr554033wma.95.1603916101157;
        Wed, 28 Oct 2020 13:15:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:6886:: with SMTP id d128ls149747wmc.2.canary-gmail; Wed,
 28 Oct 2020 13:15:00 -0700 (PDT)
X-Received: by 2002:a05:600c:608:: with SMTP id o8mr579959wmm.86.1603916100081;
        Wed, 28 Oct 2020 13:15:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603916100; cv=none;
        d=google.com; s=arc-20160816;
        b=oB/2wOr4OsMRHYt4bX5vj8QWOjYI3jgSpnKSYVFCrUVuL6kdfD2idfawpMHxzLMBL6
         PHYLhVTb7ndI0bG+nydf7Xcssh9qfDsd3rsmiZs4+HO5xDoW8GLJTkT5jZVoUMDSE2k/
         oQ/LFvj2bqsY7scJtg1Tr83BjasVU/6r218uPWuJ8q3pd/w7LwmgBxHPSP8KE6fW8WDv
         oSf7x9HJ+K878lSsg6Tg4lBCpCy2f/ZNKFKaDs03+XQA6qeHJRRaZbo3xA7jMNn6f2Pa
         FEtd0aQf4JEUE/kpYCCInL7ssS4aZzS4juwRup6hGBhU5sDp1quwhtBKKQxvrlOQ0KDy
         pqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=BaoRAw6ykO7HzIxlIdqsUWv16FfGfLJmvZeKhkL4Wgw=;
        b=H3ygFO4cJy3sdTyO1hnbRj5N21dFydjauKRUgVp5gqaYCZ0HO4v/vUvNMqrXDzQgUY
         lrxpXRdtwDUF6V1jlP5XauuelKj+TkYCRFebHXpP87gjQfxvOlbEYIPsky57kU9Mr1Uy
         5/L+bQNuv/B2uGbwdnFGxIBHw8q+BtUMF/s31KyY4/r6G6WwDsU+/RLXma+g0Rlswz40
         zrQ0aGGWwQbdZJ8nsoFhSAe7w67Ua+f9aOsQ9uEDtcCGRlQF9E9NBdnNoY7DqUujM3Gf
         qsmVjybQuwsmjrzOAbDpm2TrnXLoFYVB6PIacZkcDoBWTcN6U6omDuKMTKfhxHUrRDvn
         C1gw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o4si10913wrx.4.2020.10.28.13.14.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 13:15:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09SKExrY010627
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Oct 2020 21:14:59 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09SKEwvP009757;
	Wed, 28 Oct 2020 21:14:59 +0100
Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
 <78334f5d-b665-8de6-31fc-10599877b3b1@siemens.com>
 <DB6PR0402MB2760F60895CFBCCAEA5F2F3A88160@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <bee3d688-1c2d-f4d8-f434-b9ff8d50ce10@siemens.com>
Message-ID: <fd8fe9cc-9e69-4406-21e2-979b282b6d16@siemens.com>
Date: Wed, 28 Oct 2020 21:14:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bee3d688-1c2d-f4d8-f434-b9ff8d50ce10@siemens.com>
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

On 27.10.20 10:22, Jan Kiszka wrote:
> On 27.10.20 02:25, Peng Fan wrote:
>> Jan,
>>
>>> Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
>>>
>>> On 14.10.20 10:28, Jan Kiszka wrote:
>>>> Changes in v2:
>>>>  - map 52-bit parange to 48
>>>>
>>>> That wasn't the plan when I started, but the more I dug into the
>>>> details and started to understand the hardware, the more issues I
>>>> found and the more dead code fragments from the Linux usage became
>>> visible.
>>>>
>>>> Highlights of the outcome:
>>>>  - Fix stall of SMMU due to unhandled stalled contexts (took me a while
>>>>    to understand that...)
>>>>  - Fix programming of CBn_TCR and TTBR
>>>>  - Fix TLB flush on cell exit
>>>>  - Fix bogus handling of Extended StreamID support
>>>>  - Do not pass-through unknown streams
>>>>  - Disable SMMU on shutdown
>>>>  - Reassign StreamIDs to the root cell
>>>>  - 225 insertions(+), 666 deletions(-)
>>>>
>>>> The code works as expected on the Ultra96-v2 here, but due to all the
>>>> time that went into the rework, I had no chance to bring up my MX8QM
>>>> so far. I'm fairly optimistic that things are not broken there as
>>>> well, but if they are, bisecting should be rather simple with this
>>>> series. So please test and review.
>>>>
>>>
>>> Alice, Peng, already had a chance to review or test (ie. next)?
>>
>> I gave a test, sometimes I met SDHC ADMA error when
>> `jailhouse enable imx8qm.cell`, sometimes it work well.
>>
>> I suspect when during jailhouse enable phase, there might be
>> ongoing sdhc transactions not finished, not sure.
>>
>> I have not find time to look into details.
>>
>> Anyway, you could check in to master I think, we could address
>> the issue later when I have time.
>>
> 
> Hmm, I would still like to understand this first... Do you have the
> chance to bisect this effect to a commit? Otherwise, I guess I finally
> need to get my board running.
> 

It's running now (quite some effort due to the incomplete upstream state
- e.g. upstream u-boot runs but cannot boot all downstream kernels...),
but I wasn't able to reproduce startup issues. Shutting down Jailhouse
often hangs, though, at least restarting does all the time. And that
even with next. Seems we still do not properly turn off/on something here.

Interestingly, this issue was not present on the zynqmp.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fd8fe9cc-9e69-4406-21e2-979b282b6d16%40siemens.com.
