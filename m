Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXEW5T7AKGQECQSAE4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 800362DCD04
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 08:40:13 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id v5sf10582220wrr.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Dec 2020 23:40:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608190813; cv=pass;
        d=google.com; s=arc-20160816;
        b=MQDSW5itrs2RakWd5rOjtulg/MqEDDsgcXccLI+H239FsW8hAMWxOFfAsmGA71iCRm
         hdgffgx8xmFm/H4qKmybDe2FefGqQS/XFAvfqttGGqq9BdUQlihZtqWo0cUZtLjtvPLK
         ZbrikYAG+lXh6ART8XSUdo2cQ11KG5oAZMD8qHpyFdHW1nJkuiK55notK8oqwDFpeyKJ
         T289HivqTNK47jhH0k/fiRUAkxLq9cLWEoiOh+Gqo1KcFtNoBMg653/fpnpYPWREp1MD
         GHuwcQZC8TaHIxhM3pRkzlG8MDEPi0UkoRySf/S6W5rGASj69avpyr0ADxy6nWeM0Qwn
         g2WQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=KZTUGvZw4pXK4Nh3uzyTGCu8fj5oDMeFyhNS3ttidIo=;
        b=xoWoD/rJvSCmyfXPVvB3U9/x0HGou/iozTfIqQosqpNpWgpebgvxI2rxLzjfXBuEEM
         QrOiWtGuzEfwwnEN7FOXsaAUDf63+uaSDGnbon/pZZ20PnMiIzLONb8VlVvDeOxGT9vB
         AJ9Ca7VpOfI3398EW7NjN/s3lRJWC9NgFR7TKwTbTtfWwgB4JDxuvI+qpQLMyxVzO2dr
         zmLBFeyTHqiiBhucnhFhrQoZ9Rbhcow14SqVlNZFxTx7qrcCScz+tYAw9f7mS5cfWh61
         2WiXI8whayQbUgaj9A/JxuM1ood87R19TPfLmiT8R8pXJ9sFMrIqd4g7mUkByR3VTXWt
         GVsA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KZTUGvZw4pXK4Nh3uzyTGCu8fj5oDMeFyhNS3ttidIo=;
        b=Qihw0OuN9K469Z+lDCmZG8kxc5lTdNAdaHcrpx8n11DCZqK+fcv1tPTHn92G+F+46K
         7udNZPYSOaVzogSs14XA2JYP9E9ckaEF9DdXF/MUWEyDCNZyO0hFjHimUfL6GaUKon1C
         0WrNfbzxmXK3WjCOxH2f9H4m1lysoBel7o5Xbs6uuztjnC07vrY6fBPUGjrle3YyPHDs
         LUVSkVWowlftX18lQ9p/DnD/Lg3AKLSFyAIhmSboieE7o1qTsPo5NeJXgH6cvu+Q68eG
         z9I3J+duvoYIlgaJDmxMMaGliY6DwVGUOoDjUL876SggOE2v8V1LKad+Wdmxsd4XNNP/
         Tfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KZTUGvZw4pXK4Nh3uzyTGCu8fj5oDMeFyhNS3ttidIo=;
        b=CdCQ5U4fFdH7wj20meek59pHfEHWPwqGw+1khGJNSr8uxdW7xS9/ISaOBVmTxomYmm
         Wzv8o2qt2RsmoGtVBVH+lDaUF9su+IlpDB0virEnbCIVVYyrRskzFrZfm0+jrcI4l6e/
         DKMxIUOX2qbOGvfVS5EqTpil047KcTDGiCYaHneXt/19LXF1vsnIEk9PMWiuXE9vZPAE
         gzMzAdMuyx+eSHABqAMtszRg29lZmbRuuSiDAiqD7cOYXGLn892cY4vvj2AhuMKLLa0M
         0l+QbCW/MZu4XGQXZ8Bv1sAhKUWb46umywaC4qarrYTzP3unqUzWljZQoBoubPgAsr7n
         akWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533/wNaF+GGWB5ZfuQ62xVosC4TxcZsoFU9DZRLwfuiQxDoP1V0d
	XDQ4jTvHZ+a0AOZg4BHgis8=
X-Google-Smtp-Source: ABdhPJyaV9IpN25DDZjj+2ceQOhqunnzOuhZ03v4X9KBb8lfbUBLKzPZZnEMLmR5Ah1NvEsrTlb+cg==
X-Received: by 2002:a1c:7217:: with SMTP id n23mr6913029wmc.167.1608190813244;
        Wed, 16 Dec 2020 23:40:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a781:: with SMTP id q123ls2763149wme.1.canary-gmail;
 Wed, 16 Dec 2020 23:40:12 -0800 (PST)
X-Received: by 2002:a05:600c:2106:: with SMTP id u6mr7235817wml.4.1608190812252;
        Wed, 16 Dec 2020 23:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608190812; cv=none;
        d=google.com; s=arc-20160816;
        b=dozCClzdLQYcWoluFXxPmTwW2CNsNzH6smROVXhG20ASdPFdDUimMqyt6+6kgXjiaB
         ZaO5Moqh+PE2hq4M32I5Jodh7EQGRVN7W4ORAu2vkZYI17NSLgI5MfjBoPORsLK1LFuJ
         s5HfLEOKWZHSwS0XyT+3G+ZJQrZj0LiyMOZbNL/iHToIpvg3GmmLL+Q8lfoCUQ0knEWn
         yBYpo6AMcMHKOXVy00ClKB+L3YPaKW1gtuaImIBcfFXwyINpzrlHtvmrX5MXAdHO0REY
         KY9vm6pWRSA9Fcj0ssJadVyRNDs4H+hOrPuqsP9VbHjtaC0CakMS/ppcQwTRkny+3YKy
         qQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=U9Mq7O61MxtO3lX4eELNpE0/1X9n5miDNDM7Q5BFL0o=;
        b=zsJ8g8jJa+PbjNuG6wIXlQAYIo+8cQIkBB2e0+GkL0kudCK92bNebtz2VbFGFT6wSO
         3t2R3+wWEbljp76JWxbwmPEffdCCfzAXmgo6lBmOkvJlxkh1wNb02nmFScdIIVkvpMy3
         HorYZ25zaF2N4TB8fkuB3juql52IPYHPzxRtzVXv5uEivS61/tuzNAX0Json0O1h0/VC
         uVjO6jueQ8ylNuxgIrGEjGJHk0xd7s7uQb/HCaJfhJtEVunPv1KzKU13+zyGnP1uaj0T
         ZcnLftWd+CJe3RgocwchK42BI5GUscUNjYbeGOEhhKZ4yOz8fK0OMaREjD9CkEmnY6Pf
         XeIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id y1si256757wrl.4.2020.12.16.23.40.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Dec 2020 23:40:12 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0BH7eBF5006659
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Dec 2020 08:40:11 +0100
Received: from [167.87.38.225] ([167.87.38.225])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0BH7eBnD018142;
	Thu, 17 Dec 2020 08:40:11 +0100
Subject: Re: arm64 zero exits
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <DB6PR0402MB2760E9A43F64FDA9DE46AA9488C60@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <f99a10d5-db9c-fd70-e0ee-87aabe30e596@siemens.com>
 <DB6PR0402MB2760BEBB2CD916A46AED7D5388C40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <23d9342a-7ca8-1d15-be0e-ee1d38e9580a@siemens.com>
 <DB6PR0402MB2760A49D84148C0E3EB0344B88C40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <993144c6-af49-9d7c-dd31-1761f90a4941@siemens.com>
Date: Thu, 17 Dec 2020 08:40:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760A49D84148C0E3EB0344B88C40@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 17.12.20 08:33, Peng Fan wrote:
>> Subject: Re: arm64 zero exits
>>
>> On 17.12.20 07:08, Peng Fan wrote:
>>>> Subject: Re: arm64 zero exits
>>>>
>>>> On 15.12.20 08:16, Peng Fan wrote:
>>>>> Hi Jan,
>>>>>
>>>>> Will you merge the arm64 zero exits branch to master? And when?
>>>>>
>>>>
>>>> Still wanted to also upstream the zynqmp enabling, but I do not find the
>> time...
>>>
>>> ok. The i.MX8M part has been upstreamed.
>>
>> Yes, I know. But I'd also like to have a board supporting it via jailhouse-images.
> 
> ok. All software components from Upstream repo, including ATF/U-Boot/Linux?
> 

At least pieces that require integration with Jailhouse but, yes,
ideally even all pieces. I hate doing more of
https://github.com/siemens/linux/commits/jailhouse-enabling/5.4-rpi, and
I will try to move to 5.10 as a holiday season side activity to
hopefully resolve that one.

Jan

>> QEMU turned out to be harder than expected
>> (https://revie
>> w.trustedfirmware.org%2Fc%2FTF-A%2Ftrusted-firmware-a%2F%2B%2F4860
>> &amp;data=04%7C01%7Cpeng.fan%40nxp.com%7C268a38e8c831491f1aed0
>> 8d8a25c72fa%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6374
>> 37865235884393%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
>> LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
>> WDk0s2yyUR%2FdzvJQN3sCbo95hwwWfIET7L85tU9SBac%3D&amp;reserve
>> d=0),
>> and Ultra96 would be an even better candidate for that.
>>
>>>
>>>> Did you test that branch against imx8 extensively?
>>>
>>> Have not do stress test, but from my sanity test, it runs well.
>>>
>>
>> As we had that issue in
>> https://groups
>> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2F91E9F831-4F9A-4444-AD9A-
>> 3E5C56D3CA70%2540gmx.de&amp;data=04%7C01%7Cpeng.fan%40nxp.com
>> %7C268a38e8c831491f1aed08d8a25c72fa%7C686ea1d3bc2b4c6fa92cd99c5
>> c301635%7C0%7C0%7C637437865235884393%7CUnknown%7CTWFpbGZsb
>> 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
>> %3D%7C1000&amp;sdata=D%2B%2BcWibTYld0XzGxd231mFh7E%2BHbYji4K
>> drtTEbJ0bs%3D&amp;reserved=0
>> already, I was just extra careful with exposing the feature prematurely.
> 
> ok. I'll give a look into this.
> 
> Thanks,
> Peng.
> 
>>
>> Jan
>>
>> --
>> Siemens AG, T RDA IOT
>> Corporate Competence Center Embedded Linux


-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/993144c6-af49-9d7c-dd31-1761f90a4941%40siemens.com.
