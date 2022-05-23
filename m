Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBD6JV2KAMGQEJFZY4ZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 609AF531181
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 May 2022 17:13:20 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id k16-20020a7bc310000000b0038e6cf00439sf5787420wmj.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 May 2022 08:13:20 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1653318800; cv=pass;
        d=google.com; s=arc-20160816;
        b=PjZ6X5AWLpsqJ+bo4NJaIm91nxKHOHxxEVLWuJG8gXLkosPujLNh4Jh/w+YuvRusvP
         Q0U9D8tUIHPMjQoDUPzgsR+z8ubcODFiVbAcYGvOPcNuVW4eppBWNYLbrBleL2zwWiS/
         NK1CIQ9o9hJGoywAb7mGSTwYKFZMmrh9a6lFYlZkZb8dz2xTiaOGRRaIDmIBR+wKqc1H
         gUEVFqg4Iivje0l14+gvQWc9Bj1pwlpJ+hwRsFad/b5SWApRb4UEh45jaas4cQ5unie8
         fNVlCBCBvPBUeFU1awqpBRimPBgJGFqR8GEZKG7jjL8icts1JPPpQWLwmv3rocdAnP8U
         o3pA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=F1x/0neMLFKKG0jrsop8uxeg7rnOfZSsIn+l8aMYNeg=;
        b=g/gDcPRrIaAuJUHzSPmXB0cFaBRgl1PN+3P6KHr2Z8LX+Rl1wHf1uwBknHZo+kMzkC
         cuHkBwzf6lycGyy/nEpmsBMiyrczMrwQkRYHlEMDuxjhRi0ZNM/TqNEQMwULTpKDtW9t
         kvh8zfXG5w7M8lPj1Fcv5bUyGh7uIwV4cvs9vJ8fJiNfD21mExasnrnVwkLRswgXoDg/
         hqtgE8eOwHZgTnxHTkPV1+/53nrpwpdMNAe1gFjaMBUE3ayVy70BIU9EhKF1vcFwHKqC
         siqc283l5jyPoj36iWI43k+p/blrlusOK2WewoxDE35WPdLaC1GyXU784mH7VAZzPKy5
         CUKA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=uiLVBsLP;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe05::612 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=F1x/0neMLFKKG0jrsop8uxeg7rnOfZSsIn+l8aMYNeg=;
        b=KX/bWcZwg3aCG0ZhfVVY7jHQYS4lCY2n+1V5brW4xM+BmYMonLt8TqAm4IRhLeoGON
         lRK94YiXApCjH4LlkHJWCMR66HWn6s30+YVLOr3354eHncqz0+629ogrw2/roeExEpNc
         XIj8Y7duPspyTShZAxpN8A+ews4ZUJ8+FbSiJZpaMLk313UUT7NTDJk4Q5p+rH/xBpmh
         zQ5EGg32bEvLD/Av6LGdlyw8muUD5w7rquvYCGsqOEvmqMXIr88/44Nw2TE7EKNWBsPn
         fEr3AyXJRGSF9p1u/wHrxgk+2EvzvFm2hx83IeWFg5IMNGlnrDPE6EymWAuo8CwvgpmK
         AfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=F1x/0neMLFKKG0jrsop8uxeg7rnOfZSsIn+l8aMYNeg=;
        b=ngvq41wXgM/4649G2kwIuD33a1dH5AQVzj8S/b5D0/f4zHD5sNCxUPyQdLz/PuWm8L
         OTX4KjxbZHtYTzvkF5RWJ5380/nFvvrJl2VO3wab9TURQEspsX9twJPSn7MHVblon2ia
         BuWswuFFF+2s7IKdjVwN3ekjtucQX4j9ugCNfKCao2/scSy466ehY4R835yvf6aTujaP
         r88SYQQsuhSApKUvHH0AtdVWD9dkj0CRFTk3LEWY2Z5bVNHkO6dVAlY9DtQQRpzjWEuE
         jR3qfsqiTCtqXUBlUfa5o6h4BkS15raM3y2/vCax8AZmUCntk/3UwweELEw3xmCyqT9Y
         I3NA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533MTbXIynjIoAnKiHdiMeG8N33mkAiRCiuxfaVQuK82BOCqp4GB
	/0Jup4Ntmv97Nauhyou9Amg=
X-Google-Smtp-Source: ABdhPJxxPcAyyf+x+WtbYXNW6gieoBCrEfp58G2pfXuko/Ho6MXIS7IgQHQarVe3lo+AwRUsr1Fp0w==
X-Received: by 2002:adf:fe85:0:b0:20f:c3e4:9010 with SMTP id l5-20020adffe85000000b0020fc3e49010mr11668134wrr.586.1653318799955;
        Mon, 23 May 2022 08:13:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1e0b:b0:20e:7a8a:8c81 with SMTP id
 bj11-20020a0560001e0b00b0020e7a8a8c81ls12315408wrb.1.gmail; Mon, 23 May 2022
 08:13:18 -0700 (PDT)
X-Received: by 2002:a5d:5586:0:b0:20e:7842:83b0 with SMTP id i6-20020a5d5586000000b0020e784283b0mr11535656wrv.245.1653318798303;
        Mon, 23 May 2022 08:13:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653318798; cv=pass;
        d=google.com; s=arc-20160816;
        b=eS8E8ruPZN9FYYeSBZDm9CXTDpfS14PAsVtuVQ+ZXMgB55fjlKkOPgFdrHFtppKYNS
         B5UZt726ltPpobLsEI6/pOjWgs94aL+GfEW9qpPObbIHiPfpux5fR5HKt7jbHqwrLqFA
         3n8GSE2x7WMHYZ6NA2djFO895NdoVN8JAVbN/J3wzwbtJG+Syyvefx01nXXDvjq6n6rp
         E7+BExj/UHtT/x7pf6g+5PsfXZ/j1z2b7sIj1HAAt+eTjNMtWQT90pOOFseEQ1lcJXDw
         scJkN9Kvbby/ZwrV0QqIMADRIg92vkJzZpYbQXPz0tJjSqossuLlLRarIJyJpYHG0jNP
         qiug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Rsb4cBNIS5MkQ35S+8+xNG5FRmlGWDtUmiHCLDHAtpo=;
        b=Ul0F0OCsa388m6nBWKmAgUjDyn/+SaLE5ti8hnuumoLm5oU1ToPc10QCBaUDjcbc4z
         jbLH+NL6jFJE9He1M4mN3jxHZ5a+7ikKI2+xQI+hI7yrsoHxCdbfxUo1W/Pf6boFVfW3
         QUaHT++aiVfUSuKj2d6ssS6Q5cbWMzacMaEXHjszhNjoDB/2lHatEqSMP4fQP3iwEtZP
         DxDugaAHguCkBV+uWk2qFpcQLMYWx8yW5J9zBe+QEec1c6T87WvXOHuJgCumhVhgcZqT
         pXRRV/AO5YSBj4mzzbwCBlydCqTmR4A6b6FKzP+KLvPFDUEWFoC8H0GPOSlZrxTjeAmp
         rAxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=uiLVBsLP;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe05::612 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-he1eur02on0612.outbound.protection.outlook.com. [2a01:111:f400:fe05::612])
        by gmr-mx.google.com with ESMTPS id n1-20020a5d4001000000b0020e79ee1704si375593wrp.2.2022.05.23.08.13.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 May 2022 08:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe05::612 as permitted sender) client-ip=2a01:111:f400:fe05::612;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Es7dT7DTYMxHZSmc6IO3jhjUl7D4Ly3Tw0DZWzm8e4D23hfy8EeDgWbPyApHte7whLM+L8rcLsSk/wgez2ffgc0wagAMQ+m4NrkhUq6hXM8+8tR9z7pBchOJfhKQqNfjM00baFSSmYiSJtmIVsMcslvtwQ0jcnEnG/DP2gFhGzT9ssBSILV0dXKJthNajduPyPerw/zHW9LGg+uhM8lTrTfabJ9e2+1vK3RuAezuTJTDP0Tf9GthF9jjhmOElO/bHdGuHzWEtSgQ0t3BRXTfyvjePNel+azHuPrVYWP1xpA6JfyWXWxb98Yl3BE7sOjTDbeOHVVGgyMYR1MKPvlDyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rsb4cBNIS5MkQ35S+8+xNG5FRmlGWDtUmiHCLDHAtpo=;
 b=DFq1jD88PnTqC/kn0YOW5iNNzWVa+qFePKokQq2qI/JUrsifULHosN/hIEqH2t+OQSANfLbgUxmzDCS7VeO/MEfqJX8cH9EmYUXTw9uA1NwUfs18OtQI19fvoQdzpgAG/tKodx7tkA592y2jAgIHA8GAQcoXbhK2Uiplf1p0S5uH3PJVUzRZ0GwuOkIUEQrsXO92LztOXFyjugAv9w0FaVlNRfFJ8dQPOsPRHOcVW2aJ6DxHShnUBwbp4zzw5HZnh4s+LoYDuHOnqZKwAs8WDoXxCgC4VxddzcOmsAJA1KHqsBzyflMaz5egdrHlDyS2mVaTpnNT8FsY7vEv2yKB0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AS9PR06CA0490.eurprd06.prod.outlook.com (2603:10a6:20b:49b::16)
 by VE1PR10MB3392.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:10f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 15:13:16 +0000
Received: from VE1EUR01FT007.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:49b:cafe::16) by AS9PR06CA0490.outlook.office365.com
 (2603:10a6:20b:49b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Mon, 23 May 2022 15:13:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.70) by
 VE1EUR01FT007.mail.protection.outlook.com (10.152.2.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 15:13:15 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Mon, 23 May 2022 17:13:15 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.24; Mon, 23 May
 2022 17:13:15 +0200
Message-ID: <385f8761-8d70-d0c4-f903-9adadb3c9a90@siemens.com>
Date: Mon, 23 May 2022 17:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
 <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com>
 <CA+V-a8ufXHeaMTwmMmtYdVijY_OVwU_+eTtSbr=Rx=oiQa=9tg@mail.gmail.com>
 <e1b5e28e-f6a7-b603-95f3-8a72f0405d7f@siemens.com>
 <CA+V-a8t9brsw1fu_x9ou7uHOYxhO8AjuKiLfW+1MJ6tw=A=f=A@mail.gmail.com>
 <8e895901-cd60-9696-935a-293245586a77@siemens.com>
 <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
 <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com>
 <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
 <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com>
 <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
 <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com>
 <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
 <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com>
 <CA+V-a8vshtRo3Kot2xCVV=L+kySoP1XkOrc3U8tWXxLeCCb4Ow@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8vshtRo3Kot2xCVV=L+kySoP1XkOrc3U8tWXxLeCCb4Ow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--21.055600-8.000000
X-TMASE-MatchedRID: Ktq4DOUeYhU5QaOxwNGfvo9bHfxDWoib5BqRf5kNIzL+xRIVoKNMvEYj
	0zDHPzJpJeI9RhD7ZBGipFNLeO72SFhKDdNdlrOor4+R+6ldzMoDI91I0N0Y7wPZZctd3P4BjWP
	6asaL88U+9dYKTm5jhEY+53TsI7l7RgL8bfVL3cqxpMXwFK0zmWPKPn3I8aTkpyEWs4H2RqcBDy
	a2JbH/+gdY+faaPuhEjJ2ZvLV5BfsegE7wWr44F48F3Ylz5PzGYDYgBcRN64oIvxEURH+P04PL5
	Pgu788ebVkSV/UXp2tEotrrfbJfNGUEpJZFU04zo3OQ9cMz+QYcvw2fLc9Qi/NmGUwdG/ivsA4Z
	nTP1AH/Hcpx10+ABgfBUq5JsuvxSVy2IBz5gEjfuPtnLBVKiMoWYwRXCL6rdR4PPMO+JjQ45B3K
	UNlRt58uSXx71bvSLJ3IOVnYrbXeQyMedJ2g4ojBqcJ6LaTQkONFwC8T7+SuJkf5qQgIh3dKwBB
	/OFHVCyJyq8H6JxQuhi8o8aVo18eY+iV6ByKbcBaafuX8ZUpuQbsqx4XamQd5x7RpGJf1aa9qia
	DSLgo1Z+M9E/Hx6KB5CqudOrNQr8ttVWal8pxmokY+LsTdKcfoTgAQLFaU55QEeLkPp6LJjCt26
	9TGh+JQBR+Vr4iFospdaYS9obcQLG8CBpMcXL5GTpe1iiCJq71zr0FZRMbBWdFebWIc3VsRB0bs
	frpPIAaDuAtchTk4=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--21.055600-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: F4734A5FF47909EC7FFAF886EDA78CDEA5791239467681E9EB3F59FC8B60279A2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c018536b-7394-46b7-4029-08da3ccec314
X-MS-TrafficTypeDiagnostic: VE1PR10MB3392:EE_
X-Microsoft-Antispam-PRVS: <VE1PR10MB3392EB7425D3E52A1712157795D49@VE1PR10MB3392.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ChB0lHI8z06HpP8U2Orqcj5YLCATo6W9CJ9JrynLaCi1jllXj2LiSNZ07DKeszGz88zMDy5GjX9/jxHtjWcvn5H9GHaxc+dp+5t6JFy+rozmAi+1P17W72S4guc/4vplccBkV5oKWDVBlSAB2Dmt5BZfWrcdPeOfsBPn87Ot8TxBZhk+fTCExjF+RmDebohLXxRsXWUAIp4ex/QPY2UJdiRbS02R6s+jNoryzsUvQHujrMQbq5mwj5HCbu3XGmjmvB2V7J7QUtT+sAdOhGgVxxCyZ5i1wwwXVCBK0OyB3WOT9G9MMvf3xsGNlyPsAjXghu/axrkQ9GT4UE27Hzb3nDuLaim0fqz/iCjspLNkZl5avKqdQXPufsL58lUWMRGBsd+4wRooUvlor+FdWOSBm1aOYgVML415rwfny8UfhJLnlwVCLVZBIdjrmHRGHTYjT0YXhC8dsmg7JzvMUbq+xUy8HCsxuZB/gM81DejytcNznu3BYb2wIG6u5sXtqq9UxkRMpjT59FJG0gkLdsx+KtBhjRcNQ2Ey0Y//3LAcdKOuaCD0DA8EpJbxHtDoEcz7N99+iT6+Kysf9cLQy6p7F0uQiBR/aI+ACn/HpZ2j+3VeuC/EsE7vnMRuMxGaqZVxyZ4JllxI/LgpP8yMMBE6mW+Gqnaq3II4QADHa2ZbvKtTC13STn72QgJVGzOVMum48i8vHmu0l+rBLjolVcIIqQSyW1M9ZL8Ks+0DVOCx8f5zf7haWy5q+J1YIwObCifNIY7nU3COjARM4KEoEp/Tu1XHwW3jlUmKXBVe1LUJL5ouaoRQo5VR3G6bSetZqrjbxsxmrt5VOQQZibHH75Gnow==
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(7596003)(7636003)(316002)(16576012)(6916009)(31696002)(5660300002)(6706004)(44832011)(36860700001)(356005)(508600001)(86362001)(8936002)(966005)(82310400005)(83380400001)(2906002)(956004)(336012)(186003)(16526019)(2616005)(47076005)(36756003)(70586007)(70206006)(53546011)(31686004)(8676002)(82960400001)(40460700003)(26005)(4326008)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 15:13:15.9535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c018536b-7394-46b7-4029-08da3ccec314
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT007.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3392
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=uiLVBsLP;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe05::612 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 23.05.22 15:55, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Fri, May 20, 2022 at 7:08 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 19.05.22 15:23, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Thu, May 19, 2022 at 12:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 19.05.22 11:44, Lad, Prabhakar wrote:
>>>>> On Thu, May 19, 2022 at 6:30 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>> Forgot: that cannot work. The call of arm_dcaches_flush will overwrite
>>>>>> lr, thus the second ret will only return to where the first ret jumped
>>>>>> to - endless loop. You would have to restore lr (x30) from x17 in
>>>>>> arch_entry first:
>>>>>>
>>>>>> mov x30, x17
>>>>>> ret
>>>>>>
>>>>> That did the trick thanks!
>>>>>
>>>>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
>>>>> index a9cabf7f..7b340bd1 100644
>>>>> --- a/hypervisor/arch/arm64/entry.S
>>>>> +++ b/hypervisor/arch/arm64/entry.S
>>>>> @@ -109,6 +109,8 @@ arch_entry:
>>>>>         mov     x0, #LINUX_HVC_SET_VECTORS_LEGACY
>>>>>  1:
>>>>>         hvc     #0
>>>>> +       mov x30, x17
>>>>> +       ret
>>>>>
>>>>>         hvc     #0      /* bootstrap vectors enter EL2 at el2_entry */
>>>>>         b       .       /* we don't expect to return here */
>>>>>
>>>>>
>>>>> With the above diff I do get the below:
>>>>>
>>>>> [   42.980805] jailhouse: loading out-of-tree module taints kernel.
>>>>> Reading configuration set:
>>>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
>>>>> Overlapping memory regions inside cell: None
>>>>> Overlapping memory regions with hypervisor: None
>>>>> Missing resource interceptions for architecture arm64: None
>>>>> [   46.582588] obcode @arm_dcaches_flush: d53b0024
>>>>> [   46.582616] obcode @arm_dcaches_flush: d53b0024
>>>>> [   46.611311] The Jailhouse is opening.
>>>>>
>>>>> So it looks like something to do with the debug console. This has to
>>>>> be poked in the dark or any easy way to debug?
>>>>
>>>> Well, we do not yet know what goes wrong. We do know that we can call
>>>> into the hyp take-over stub and register Jailhouse with it. We do not
>>>> know if we will then end up in Jailhouse in hyp mode and just lack
>>>> console output or if we crash on entry already.
>>>>
>>> Right agreed.
>>>
>>>> To move the uart console out of the picture: Did you already check if
>>>> the driver you select in the Jailhouse config is actually one that
>>>> should support the UART on your board? Next is to double check if poking
>>> The UART on this platform is almost identical to
>>> JAILHOUSE_CON_TYPE_SCIFA type, but with some differences which I have
>>> patched to work on this platform.
>>>
>>>> registers in the way the Jailhouse driver will do at the addresses you
>>>> configured will work: Pull the code into the kernel module or even into
>>>> a userspace application with /dev/mem raw register access and try out if
>>>> that works in a "safe" environment (without hypervisor mode).
>>>>
>>> Sure will give that a shot, any pointers on doing this from userspace?
>>>
>>
>> Something like this may help if you do that the first time:
>> https://bakhi.github.io/devmem/
>>
> Thanks for the pointer.
> I have tried reading/writing from the hypervisor location and that
> goes all OK.

Means, you were able to generate output on the UART. Hmm, would have
been too easy.

> To avoid any issue related to debug UART is there any way
> I could test this prior to enabling?

Not without extra measures: Without JAILHOUSE_BORROW_ROOT_PT, which
applies to arm64, the driver will not map the physical UART page. That
only happens in init_bootstrap_pt which is run after jumping to EL2. So,
we the jump goes wrong, you cannot find out where you are.

Do you have the chance to get hold of some jtag to find out where the
CPUs are?

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/385f8761-8d70-d0c4-f903-9adadb3c9a90%40siemens.com.
