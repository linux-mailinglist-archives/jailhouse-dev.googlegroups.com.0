Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBEUQ46KQMGQE72LAVYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A1E55BAA5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 17:09:07 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id x8-20020a056402414800b0042d8498f50asf7430372eda.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 08:09:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656342547; cv=pass;
        d=google.com; s=arc-20160816;
        b=eRO8zl4AagchfgzaOzKr0I5/2TAxM/SeJJoDW/kK+cnunQM+I30xNngofE3yh7sT3A
         W4kMN3bF+CwAIyX3LQV6p/jIEUcCRPGPqj7HZSRG1sZvVpsGsiP9aM1fQbBOMirpCBCE
         WRUmHVsWzogIPwHBiPH+n2KRN7tv6Y+PCGLs24WYKxesozRakfCyxljKZSMX7G5SuPnW
         P8031w9PSVrkgkSdjwMg7sI2+Lo6lbx4C8Id/JlbsuumeXtNwXCbYrQqTfoFG8+L0rnn
         RNjq1/Ct/vCpKOc4ul77gUGQS89ol+noFhwqIyDBotVPBD/rBXYifW59QESQEogHznnB
         y2Tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=SMHz1tvNi9g+llT0raApqEqJ5kSJT1ZbdjeSAs73DyQ=;
        b=hOIMLpaFU2UwoO0s/LX4Pj/SqesqUucHX406MH4omZl2X7/CeCPhkChwF9AJlTfrpx
         utvpACs8Z31yGWR5+tW99eLUvJ2vC/WMFh49EQeCsrKds1ncrDlFFAzbcFgGKx5GNtE7
         hRYFdHYkGAgreW7KF/onWoTZPsEYAHcBmlIQC3GJ/3BFEgqfmSr8btvh6SRCUF83+nBD
         Bn0gRsyNnIvdTlKuwkbDzyQ0ODRGQ7d8ngMkC6JM0cSKTpeZUE48MDxPujESuKf7fuDs
         dKHdlDjnZw2zXnHEejdJF3h4uCOotQDNoXuEiQn4MhnaVhgCnD1+JKqt14lKM6zafLz3
         x8AA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=lmIxmYXT;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SMHz1tvNi9g+llT0raApqEqJ5kSJT1ZbdjeSAs73DyQ=;
        b=kitB8xzttCy+BYUL9Ye+3DlTrC2klSaDALuuPAGFye8KhSVV5/1/fBfoFBH86xyL1h
         bMAXqFbRcaoAs4RWmJBVgRm2N6kHw++KDzRy9Y53l68kzENlxt8MNpOC9aTBEBq+DfOS
         h8QI81auPs7n9OcOfOWmWSlXxu7E09hNYKXSRUydSGmlR/2NOrY5d7xLLBK2CFtV7Az8
         iH5ZmRm+r7yRK2wcBwLp5zXMX6CpvkbmDNZhAu8r9h4i2hROYJksMTxI8wujyfB1/hrG
         1TDeWxpjYGQQALyr3FvLQ6D8kr2aploJJ8opsPXDM+aTwZ+zLpIxp0qSv2Bj+79mHbcE
         O9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SMHz1tvNi9g+llT0raApqEqJ5kSJT1ZbdjeSAs73DyQ=;
        b=Q45wldr90mFIrzliCEqB58brb2gmYtkMoksZ870FSBJSZpy19F2KCJHo3pYyM8ZeRm
         BbIrAXTwwTG/teeoLoPRKsjSpOG8qm+R/AlzKHmb/G8gAcjBzCkf9rqorPaexFKhFtDT
         fVF/tHpoGKVKgyWkkAzDDq46BrTW+I1Z9hXRJ6KIyoksJj7HmfBAGWX8lkZiYAr24kA3
         +2v7UFTTfW2LCKx/xNzxNkIkdpYBJ1/LAFeHg07YxJWk5CKPtGrvA7gnrHeYTt34gnq3
         SO2KqG1hB5kQ0t9d1DDIb01RzAG10mMWoDvA+0Kd/D4632OOcSTJ2wT4rkWzUIl3y2s2
         q1xw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8hNGe+m3hcsYrps0p1T4ytwBTXmJQiQ0vJvUvvK+8WFH90k5e6
	IM1Jn/FmjbT2LkFMfMqsXNc=
X-Google-Smtp-Source: AGRyM1uM4XpSpuZPE5K/L++Ha+uTQxvSGh+yiW0zG9u2iNDXp4zai+/5vWy6uo11TlSh+Cn3RiGDzw==
X-Received: by 2002:a17:906:4b0c:b0:726:41df:5580 with SMTP id y12-20020a1709064b0c00b0072641df5580mr13172339eju.263.1656342547174;
        Mon, 27 Jun 2022 08:09:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:3f8e:b0:726:b004:f241 with SMTP id
 hr14-20020a1709073f8e00b00726b004f241ls1297757ejc.1.gmail; Mon, 27 Jun 2022
 08:09:05 -0700 (PDT)
X-Received: by 2002:a17:906:74c2:b0:722:a7e9:6f82 with SMTP id z2-20020a17090674c200b00722a7e96f82mr13295460ejl.3.1656342545565;
        Mon, 27 Jun 2022 08:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656342545; cv=none;
        d=google.com; s=arc-20160816;
        b=wpKnB1llAWWNDzVVaOUO2p3lAg+hJvLTiqmB74A79Xdtjo8e9Xyl/+Xkrt89nyGuvX
         1EemV6VevJxYbB6uVRML1zUYDtGiZGKea8mlHU/XFIfwnMCSiCoi9GsNT1m4aAOaiaLr
         98B1kxFs269SgGHRLk1194I+4XmLN7VbIMgeAeV94wAVCl9bJAlX3QEMnTcUB9jwe9Uy
         X5+IYO9KWMr05dhNx6KkU1ZKOMQlRUEe7BLFbmGEcQ3XcLoTiZ8qxPRY0LPtolIoKulv
         8TERomqzWfV3m/9aZRhifpEZ//6LyTLk9Mu+FPpz/6p90u0BY5pEFM1DD7eqjgnXRmz5
         NxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Uw3+dm5+W8lqd5h5vGbHlVcmPWUCpt86L9tSyJoZMzY=;
        b=NwN5mfyLysOdfE23TCzJXKA9IMm09x28qeel3lkq6E4kqB+FZYvx/9nuVCsRF7hgax
         YnwzZnHgLfuwLXOkKpT3rXJxeTFutRN52pI/51ZVLsH8s8hm3Pj9SCYXqR9Pq3mPi0FT
         8ib7yY5kcx3yfp8wzQGl8Z3hmp6M9QpiamJSqQ4ynLa0qoaaKhDiuUPfay8aTLPo7YsQ
         qA2gHx/9J4mrotjZl0IbeGHi1ATSiGElQHO6Fy68hTiEQXxAULW/+cqEDbQa949ztGHd
         uhqaVxFeBYut66Rxoxo8DBdKSbxog9XG1kybTGXmQ/UzvrzzpGwliGC9ExXRxcBAuVq3
         P6Jg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=lmIxmYXT;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id a22-20020a170906245600b0072695cb14f9si183960ejb.0.2022.06.27.08.09.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 08:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWrjF0HmpzxxQ;
	Mon, 27 Jun 2022 17:09:05 +0200 (CEST)
Received: from [IPV6:2001:638:a01:8068:f8d9:f11a:f164:a35a]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 27 Jun
 2022 17:09:04 +0200
Message-ID: <23ea11fe-921c-ea60-ece7-5ca0b06f524c@oth-regensburg.de>
Date: Mon, 27 Jun 2022 17:09:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [EXT] Re: [RFC v1 03/42] core: riscv: define MMIO accessors
Content-Language: en-US
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Konrad Schwarz <konrad.schwarz@siemens.com>, Stefan Huber
	<stefan.huber@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
 <20220627132905.4338-4-ralf.ramsauer@oth-regensburg.de>
 <bc6248e0-accf-37e6-6318-805220a390cf@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <bc6248e0-accf-37e6-6318-805220a390cf@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=lmIxmYXT;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 27/06/2022 15:43, Jan Kiszka wrote:
> On 27.06.22 15:28, Ralf Ramsauer wrote:
>> GCC may emit 4x 1 Byte reads in case of our regular mmio_read32
>> accessor, when used in combination with -Os. Yes, I've seen it.
>>
>> Define safe handlers to overcome this issue.
>>
> 
> The kernel does something similar, right? Worth to point that out then.

Yes, but that's not limited to RISC-V, and there's no particular comment 
on that issue in the commit logs in the kernel. Maybe they never 
experienced it, as basically all architectures build up their mmio 
accessors by using assembly per default.

   Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23ea11fe-921c-ea60-ece7-5ca0b06f524c%40oth-regensburg.de.
