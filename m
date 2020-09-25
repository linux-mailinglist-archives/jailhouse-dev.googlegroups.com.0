Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCOFW35QKGQE3P3IBEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 2139727820D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 09:55:54 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id m10sf844062edj.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 00:55:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601020554; cv=pass;
        d=google.com; s=arc-20160816;
        b=LSTk8tpalBWPbniumaD25APorD54ecWnBiRn6elc7SHNw7i2j2+TOH4ii6/yvJIYVQ
         TKP7Qn+YAB0l1zHSEX1+oVi0uGcdIln+7Dn336M8msbTBPPZF5U0lXod1iHj0JK38mQO
         YkJn1xgfMaTEh9CvGIh4LFMXEnzbIEz3HheCtSXA3d3+o+rpUb2o4LxmaNKDKB8H4GPy
         UgKz2COipQdH6VwCwIl1bXIah+/xmGcxJdVOZ8iQ41ZV3iOPdRvw1swqEhz9qTp1vzUM
         wmVlzgiSkz1ocNEdLbbJWkEvbqiFGNX0b18U5vWXMCzXU+zPSsVgUOpVSInVoRn07ptI
         ob8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=rN4Kqe0QRDT5U25DnKOyRd55VbdfVeUh/UuUZFihXnk=;
        b=lKs+RsvaUy8Q7jaKfGY1bYyr6T1QNizSsy+BZKc6uo+B+K/sSxG0/ToYHrG7y/9gCs
         mLj4OPIWUpPC5IFRNICmuDR/Cv9FxnxFTVWBToEiQ/xOgiCcmPDHSVNQ2PMik49ZAbAN
         UWC/dUsHPSrCiMbFHdugX24sWgICcrM5qvRz+vFd2TRwDBJnO6ifkZ1Wd4pCkTMa2INj
         bApVC912mgOvHpL5M65ZPAXzKCXCuwkbmyYn3V9Nt50R3Dp7dc6ZGeVIfkhZu1il0lT4
         QZxp3hxiztybpsIfHlT64FAwX64Ol+zaxqV3RSWGGzovjtFb8rc0TnzP7do8OcBJlOVN
         qCeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rN4Kqe0QRDT5U25DnKOyRd55VbdfVeUh/UuUZFihXnk=;
        b=JVD6vU0EKca3dYRFeT6tDRHajh/mv5X9xK2/vJP6q+Etd2LZxiNkHOhmsPTIwBs/gG
         q1FzkD+2hqGNSYl69SKUNypuN4gCd8I3a3Jyt5pb2eUtGP8lcVD4YtD/d60HYR8MU4mH
         kj7XxQrxfTjisXyXWNPE83L34oR8FAZw/k9AsgzgINnxAHa85Dmel+KGhcPytmfKScri
         Gw1T33+liR9JejrnuV+8vvrtob+y5gIitoEqdTSzvHstKe5+cn8K7/BPgX5y3j2rRTGZ
         6A21rFVSwti5EU0+LIPfTzki2/PSNaEQbkteXxqWy7lDnAHN2chxIPIBbIJlMmuKtI2Y
         UXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rN4Kqe0QRDT5U25DnKOyRd55VbdfVeUh/UuUZFihXnk=;
        b=IM6FAPRWJE96lAN65FXXJmZ5wtV+YbpmlBpZH0gOMrm3uy2CIZYDjtm93nXqWd/6HE
         2kMxs2tNDCW5bkOHCeOPdEJp01ox0ryxIshMxqURg1fQiQCXMMtaWIiqKTKhLyGGbxEG
         QRcL1/2wvnUv//INKh14WuTTWo1dBsXBaO9PiqR2M95BvC0dK3sjapghOEcWk27QSY0G
         a3LuTwpkZnyCiCtXIzPDAQoNh2UkNe+O3SVLs5WsODYyt+YuZ5wc+afWahHFDpJCx7kM
         95N5B67xH0i6raxAASTU/rnhq8sqolDQfiuPuV2YQMiiKsU53owKAMLne8aS++8zji0U
         2FBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530kAkqbeRusT4nxnU2TjhO06IXGInbDkBsal/GsJ0aMf7OkA1dP
	DgrG5wPAXHShkj64iJ2e2YM=
X-Google-Smtp-Source: ABdhPJwlxZn8CgVd0LumFV/96p2A0f1XlbxRGQnenNjhoibZ8Y9ePpXhTTeCLB6/ixLJkbaNESxKPQ==
X-Received: by 2002:aa7:d68c:: with SMTP id d12mr2771332edr.274.1601020553856;
        Fri, 25 Sep 2020 00:55:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:40ce:: with SMTP id a14ls809251ejk.1.gmail; Fri, 25
 Sep 2020 00:55:52 -0700 (PDT)
X-Received: by 2002:a17:906:2b48:: with SMTP id b8mr1554413ejg.125.1601020552556;
        Fri, 25 Sep 2020 00:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601020552; cv=none;
        d=google.com; s=arc-20160816;
        b=SelK/5FjaHShbH0nLGhliXlqFHRC5xSfdDKgG6Qzst3tSLYkHrRHFrwnvhHqF2BNuV
         oebJ2++d2IiKXZs1daPiDhY+djtJ/sYRgk1+mvz2FKoV+ZwEpL42M2NeKRcJmv1+F/aG
         jFt5I+W3Kn+eVX4aEqxazV06Op5fuU44oW7D33lfhmJ8pSyeeYEP4tEg2jrIZ0dv2tKa
         os+z7nCcNS/PA62b0MHnDlh9Yo+goanNdnFwBs5L1YNr3JbxuYiCQQ5uUc0eVs67nI2f
         Yx3rfkbJihcdqm28n5p1rOEHoLfWDylCg7xhAgJ4oVxmU23na4SdOgEXdpcaYWwvuzpl
         RiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=CWyFH4BMzh/fJIM4PcnIJ5cRYtm6ukNsbtvJyyD+ejc=;
        b=NzDeiR/IrLP4QY7t42UYTGgze0o7SeUB0YJGh3iIq04u+928Nqb9zMpxSmeHIf3X4D
         YDvrLHXDvWSv6jvBy8JkHFsG0qhaAE96AQnevfusqe6uXYMvwIzjPG8308OFBKKJqf4V
         q7gS3IwhKL3F7zAzxHPo6Qx8yBy1ZabMt3WvvHjcPiHdZn3DRf7NgvitDGwRWU3evMvz
         I5jMe86kC8rp0R4LEAX7xG3lAic5pM32gA6trybkBaZjNh8UZ6uU+WA3Whzv3xwwMqZS
         vPdFuV79mej0yjijAywqcQmg2kH5ppFL+nJUJjm1p/Q/DvcpAQ6ZFPRpX6bMyB+aZCkX
         RI6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f17si49909edx.5.2020.09.25.00.55.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 00:55:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 08P7tqro022761
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 09:55:52 +0200
Received: from [139.22.133.254] ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P7tpSN026870;
	Fri, 25 Sep 2020 09:55:51 +0200
Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
To: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
 <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
 <DB6PR0402MB2760ADEA2D5A37133E5A1D9388360@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <27f73d85-f64c-fa29-0524-1fa360c6385a@siemens.com>
Date: Fri, 25 Sep 2020 09:55:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760ADEA2D5A37133E5A1D9388360@DB6PR0402MB2760.eurprd04.prod.outlook.com>
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

On 25.09.20 09:30, Peng Fan wrote:
>> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
>>
>> On 22.09.20 08:45, Alice Guo wrote:
>>> +		.platform_info = {
>>> +			/*
>>> +			 * .pci_mmconfig_base is fixed; if you change it,
>>> +			 * update the value in mach.h
>>> +			 * (PCI_CFG_BASE) and regenerate the inmate library
>>> +			 */
>>> +			.pci_mmconfig_base = 0xfd700000,
>>> +			.pci_mmconfig_end_bus = 0x0,
>>> +			.pci_is_virtual = 1,
>>> +			.pci_domain = 0,
>>> +
>>> +			.iommu_units = {
>>> +				{
>>> +					.type = JAILHOUSE_IOMMU_ARM_MMU500,
>>> +					.base = 0x51400000,
>>> +					.size = 0x40000,
>>> +					.arm_mmu500.sid_mask = 0x7f80,
>>
>> How is the sid_mask of a platform retrieved? Can this be derived from
>> information in a normal device tree?
> 
> This could be get from device tree, to i.MX8QM,
> iommus = <&smmu 0x12 0x7f80>;
> 0x12 is sid, 0x7f80 is sid mask.
> 
> Sid mask is use to get the extract the exact sid from SOC internal BUS,
> You could think as below:
> Bus signal & 0x7f80 = 0x12
> 

Understood - but there seems to be nothing like this on zynqmp, so I 
tried both 0 and ~0, so far without any sids assigned to the cell. I 
would have expected that something breaks then, MMC e.g. There is no 
error reporting in the SMMU code so, thus I will simply see stuck DMA 
requests?

I guess I need to study that SoC to understand what can be expected 
there, i.e. which devices are under SMMU regime. Unfortunately, I do not 
have the MX8QM running here yet to check your setup.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/27f73d85-f64c-fa29-0524-1fa360c6385a%40siemens.com.
