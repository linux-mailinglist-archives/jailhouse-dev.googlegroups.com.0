Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBBVFS6BAMGQEPN5IWGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F093308C9
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Mar 2021 08:30:14 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id u4sf3874046ljo.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Mar 2021 23:30:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1615188614; cv=pass;
        d=google.com; s=arc-20160816;
        b=nWpj63xgFy3nUokD7MKr+DS+w8TKqJ8Rcb5EzrDPkRIV6O9nTJGRZJmxmFJTr/ZU41
         7kjfktBan/PCFISGJqVM3qWyVlZF2c7TRePuUn8yV4hB19V38ESAnxC+sXwfeyeE8KSg
         GwrF7xSM1wrdSgoIBdMwNlrLNfTm73fG4hrHQHdIAFnhnllEiHWd0M6VJxL5oBBZqal8
         qnXnbxNHJ1jq3/q+6P3s0WX5sGckd3ZHmG+YcPViAXZaKd3/8DsqqFTZhCktg1fs6d0x
         p7LhxHeKLbgRP2uXnpnnH7g9Ol5C85QPPqgWMXNOt93LGBBHZawGumoN6iNZ37ZXi8k4
         GkSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=/MQX1OvL/GNXEHz0K00McIR6zKmUgmvNq4V0X+vlFV4=;
        b=CkU95Z4Wzh7VHno7/kd5OSywMdZKgUtCaReZTCOoDEPrPFEBk/8dsdChOURWwjJ3ju
         UtjxJlCMnL3iWf0yGohSgK9nGLEhZ+Vnt76l4XD3cfhwD/32HsWJb0GokYTFP0+uJ6vS
         LCHGx99PG6BMh0c82EixpmrEuXw+6excQMwsmhvHxMRMaTseubNgM8TNJl5ZxtpZF+Sd
         iyy2i0T4rgyuTOlFZSrELHkbDpLCLoxiyvZojx7g032nalgMDXaYDxKpqAtPKK12tR5A
         QLVDo2NHIs0MObjckD9+NCO2Tgx9BLN/i0Ie8ssKCiEwHDfjUz9qswQUbkgiPIx4ZTKu
         YhbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/MQX1OvL/GNXEHz0K00McIR6zKmUgmvNq4V0X+vlFV4=;
        b=KXVDzAxBxHpXOJNYBsI7dqvJlQ31x91aB8LWENb34AtTNvqkCio/spF/BfsCxgwZ4V
         ftuUKkpdCYAVrZM4L0B7MbtouKPxZvLEivmD9FFMCiBdHgRmrsMKQz9rVAdYshLP5QZx
         6D+RNweMNILbS7sAIxeHsfryLhSdtU2MTVFGTWp8oQLghOw4KkJ+2J/O/baIxhqeWtqE
         bU3KhSBxws9O+6ZIt/CBGszIiqub9/IisHnkeLA7Wl/GMTm07QB6oDJwKfq/RFtAuy7N
         YB74XOIyRJu7ddEnNVGmfjogey9jzVF571DMgaNYavLV3dvp1PyArBNqJ+lJOBYSmh72
         8SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/MQX1OvL/GNXEHz0K00McIR6zKmUgmvNq4V0X+vlFV4=;
        b=lt7s8Jdfq974auL826jRo7eZyHOmp+xyFrve3S7wmC6lboa/ltIxda73p981rEjccL
         ZMchPY/7l6SjqEvvfLzVW8a1ukmYdl7wB7jzAadg4q8ryVDhUMy4P3gqerNJv69VMgpI
         8cYUXxq/vO2q0/+ZCB/l83/RgktVuEDfDhx8B1piP7oU87L/5EdZCo5TpGgcoOKQRosS
         Dh7cUn/ZK2MvsHUsF1Ka8AJ5/+3mqayENjqzezYtQ45c+MgnAoVu0P+LbwFW6O0uS2Zr
         8TbgPPWlcGnCCMHS1z8BkfIu0CD/UUuvCG9xj4dkyqLOlWjML2ohLvob/CF+PomaUmmv
         yeYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532OhTmYM5QrC8eWrsj8AJAKjGWpNlHxNxzBtwSPMgN5MS+RHzf4
	kbGd6z4/6PGVwKe44uToawE=
X-Google-Smtp-Source: ABdhPJzvj5kK60gRpcya2dHMStW4BpxGT/xhVp4QW6fVCH3i27sYVDRMdHEQXRdbVJ61ca5gH5gIKQ==
X-Received: by 2002:a2e:b601:: with SMTP id r1mr13312178ljn.271.1615188614279;
        Sun, 07 Mar 2021 23:30:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:e86:: with SMTP id 128ls1788551lfo.0.gmail; Sun, 07 Mar
 2021 23:30:13 -0800 (PST)
X-Received: by 2002:a19:488e:: with SMTP id v136mr13740131lfa.611.1615188613103;
        Sun, 07 Mar 2021 23:30:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615188613; cv=none;
        d=google.com; s=arc-20160816;
        b=hIJlsDQFxOBA5PFQxPH6SwRqXiiEUcQxMC+ImjJLms8u4WlkghkZZzjc1bAegnfp3h
         RYCeSQco4FWz1ErWugyjeGzOFz8zQU6Ne4qhk9ql+cFiNQbYQKqLntGn94Eg2kSK49uI
         pGI0nw11140i+vdv2LVCX/PFpprhaa1cqzMBJEtv1a9p4x/xzaKFg29SW5m/7E+tsIJt
         icqyO8GaEjhQyyftsIdQMUmpK00H8p1mTbkgleVOM4F4ufypGLimmpZOO6yp/aA9Zukb
         LASZOgzuqvbxH1lMyDu84CMhwRSeikT+qz/s890o63EK5oLmEobwLDb2DAMdeNql0SYL
         yaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=K7WVuUqf0jIhHd1E0T1ckUZ+Pf3FBPteH+AZwzlleJs=;
        b=brMjV4rV41xBElDMKEkqcZG8jgsVeonkXXlx2T+RP7tHvvqK0dIqhrtxdHYIfsBbV0
         z4fgB3SiyEtbLETMRVu7/MvAJ87QP5tLvIAZaJKCo1uuCd5cb8XwaqRddO99yy4r0KZl
         8M9al3aYSpc47sY9F7JPxQrUPYzwml0e1BPbptR7vhUBDR4SGtnvd0oZn0dwqkPv+mNb
         rIj2eEoSF+iryGdN+LXJn6DAQZkiWPucFh1uSzmQBhWySfhL+V/EPFjeMWYFTij3937j
         JBUz80mvBy4QBr/S+WC6GEtfxpZWKcbs+Ey9e2DcDW0VRH76axes8S2piKsBExtwHbUH
         eNTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id b27si310033ljf.6.2021.03.07.23.30.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Mar 2021 23:30:13 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 1287UCu2000923
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Mar 2021 08:30:12 +0100
Received: from [167.87.91.100] ([167.87.91.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 1287UB3n028484;
	Mon, 8 Mar 2021 08:30:12 +0100
Subject: Re: Can you put patches about SDEI of the branch wip/arm64-zero-exits
 in the master branch?
To: Alice Guo <alice.guo@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AM6PR04MB60532B8A62EBE93C38ACA24DE2979@AM6PR04MB6053.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5367d224-4be0-e621-cd34-dff466c465a7@siemens.com>
Date: Mon, 8 Mar 2021 08:30:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <AM6PR04MB60532B8A62EBE93C38ACA24DE2979@AM6PR04MB6053.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 04.03.21 10:52, Alice Guo wrote:
> Hi Jan,
> 
> I have tested these first 7 patches of the branch wip/arm64-zero-exits,
> which are aimed to use Software Delegated Exception Interface(SDEI) to
> manage interrupts. These patches can work well on our platforms.
> 
> Can you put them in the master branch? Thank you.
> 

That requires going through the regular process first. To start with, I
rebased the patches so that they can be tested with master/next, see
wip/arm64-zero-exits. I'll submit them for review soon.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5367d224-4be0-e621-cd34-dff466c465a7%40siemens.com.
