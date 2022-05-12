Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYP46SJQMGQEXJDPLHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103b.google.com (mail-pj1-x103b.google.com [IPv6:2607:f8b0:4864:20::103b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B51852532E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 19:05:40 +0200 (CEST)
Received: by mail-pj1-x103b.google.com with SMTP id z16-20020a17090a015000b001dbc8da29a1sf2679413pje.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 10:05:39 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652375138; cv=pass;
        d=google.com; s=arc-20160816;
        b=vloHovNfnKM6LpihOxPaCwQBowgV0ohwPbIVU4Am5qJ0Ij/sI2jzthBQzmfZ0p4C/s
         VAnwDY2y6bUw9d4eyk53VZ9FJbIkU8DMsZB3aK8YPv5FglXSWf2ZFbQwB8YqjCSdoBRS
         G8y5kcjR1/TaoYDYflpijvqVqGR63l7Fqq10ob9uS1Db2xD/qMAoSptNh98RAiWRDn7D
         bGh+l0EtSKbh9x1y4TYdrL7wqyWVHB1OJl690eHUWzgid3Lzf7T/mRoEHZ15xDy7Pozg
         Ldg1Si/9RiWAt6zp2QBHE2A+PuPmskwl8IVa8NMcVdP3Za+RjqIG+v5zMhZus2LtVlSt
         eORg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=z1R/I2zMcSn0cX3gYNMM94Rh47dFzL3xrBdeFHK2iuU=;
        b=t8My0Sa5e6kPMQhVfVd8FFe59X0OQZzpAYVFSUIlZSIXFuBnht4tk82idUIELf6cwY
         k/kY4QqTyaaJ63EaZXlYeVpkCPZ2EMS/97b6KyX/uMdO3+r18zBHdXA+24ChvSIqLJgK
         cqFq1QGwUYH3ICPuDHhTeS7+4bPPH21IkhP3oQYx7dr4iSxeeeINyLTtpxD3VgW28np0
         nAC/Ew2ObrBmsFen5RieYbD6CXViz1iZJJthXiVhb2SiiUgiojhHVw77p9kOe4CRPqzg
         Tzbb9jzqiL9atbrDX9BImVitlqSpecvxySxZ+A8tHCOA8jbfcoDq4IQbTN2Ng4/Mqb2G
         WNlw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Ong94ZfY;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1f::615 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=z1R/I2zMcSn0cX3gYNMM94Rh47dFzL3xrBdeFHK2iuU=;
        b=jaoifrCcA1gw5/zgBzTI8yyeq9v+kF83+IHFc5jAPuE8rjZvrIhIUwRooD9H1YrIVq
         l14W59TrPETFNvvB61hUQfZpjFt0hNU3eDYLB+HuSd3ilUnTAz9p4mUH8MhZvTZtXN3d
         kTjS87oJYKh8lcyIoH2wnQTV2GUEU3y5i1N/PYLz2l6YO5kbBE86QnktZuL2zsTJLkbT
         dIxXxmFynaWnJGjESJQ/ARZn+3yHJUk8jQn78c3TwbK93EY/HATKGiBjEH6dX043fVVR
         s3yco9AbT/zDGp8WsGQVugMPue5RHa8oSgQ9S0yjHexANl9g3q8Aaen229y0DgHjiSjJ
         BshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=z1R/I2zMcSn0cX3gYNMM94Rh47dFzL3xrBdeFHK2iuU=;
        b=U4iOxrUTcmF0ekNeV6QdJr3IrL9gEYi4FSsWc23WGzYmn83ip5Jn9kr+PTQspSmYED
         1Apvs2gN+9qvRQl0P5rOmMAY17AgqYR4On0jF+pvGeK/GvsX//BLmWOV5l7sKXvUSzoO
         QBUVTodRGEBdOAK+8+rUhELP0bCi9d5UmNe6SNTpNc19agaAl0O1JjXeY74sXzwhqm67
         rSzNF9cfbrMFRNEja73ezVlPK0j7i/2+FWfsM4JFURu5/EFoq/AnAqXdVsTQcNp1RdWn
         EA1dfUNBqaAJWlnvfnnY3dWN1N0twfKmTjYOfVShS1NiSuFaWFSVSbtcD8OJodw6HDBt
         zS5w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533NszgcTVrCW5/n7nhFbnodWVu23Bpp6nBqe67CFNPvo4vvhzed
	uItsGAtP4ODr2ebE5C7RQks=
X-Google-Smtp-Source: ABdhPJxL3iOsG/ESM9d9Mak7r7p106rVLsCQK05Bl4xqrp+8MWVMs0tXG24+EjrUH0l1nf8eRGlT+Q==
X-Received: by 2002:a17:902:db05:b0:15e:b542:3f23 with SMTP id m5-20020a170902db0500b0015eb5423f23mr824460plx.143.1652375138260;
        Thu, 12 May 2022 10:05:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:e811:b0:15e:a1b8:c1dc with SMTP id
 u17-20020a170902e81100b0015ea1b8c1dcls4111424plg.2.gmail; Thu, 12 May 2022
 10:05:36 -0700 (PDT)
X-Received: by 2002:a17:902:c94d:b0:15e:ba3e:c4d3 with SMTP id i13-20020a170902c94d00b0015eba3ec4d3mr803801pla.121.1652375136854;
        Thu, 12 May 2022 10:05:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652375136; cv=pass;
        d=google.com; s=arc-20160816;
        b=MzewwytZrWsJHZmwUivuNlZCrywEK48Y21DQerIL4j4f59BXkpm9+D5KXN8wvUWfwT
         8u8CkFrFf9UayRkLfZfBg+eivuydBvxCtJtfQzq7LytqOnPLhnaFq+qpH8H04SnPmGjk
         8g05Bwzl6ErKwmx9zQLAipWu+TrWYx8F7mrTYgKEibWDcP9zxbHOByqxTA2Gql0YtK+B
         ZpEOc10RJZznH0rcSFp1YgQXEz4DP8gch9KkUTh8EZazg4sjFSwL6oFZP42WW5ZRRVA4
         vDh6wlHdYkpragDq5VhL/wYIUnKehN5T2joFVju3abCxrjqbibvW8ZX27swwFqodeLkT
         I78w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=V+caWbyyt1KdsbRxJfI1Xz77pjWDs0se3slniNEntRE=;
        b=nevhuXIjxOi5e0yKIeHO2LFAkTaJewgxHKJdHbOvPB23xTzTUQ86lHe6RkxFdaJABC
         oFC1w92SomG5FdUZyrIYW4sZzb0LNXsZcldHNzgKomidd5x9e7lCPCqnMbjIsANXwdLZ
         9+2J1IjO3Dig9gi2iYE5dSExTjZ5HVvD/Rqb/rvx1bavoG/aUsKRyCtpchfiQePrZvg5
         OunEchrC5p93AwLffSOrA5/chx9aVf28XFWH0a0dOEtmaeuK+Rxxuph3G567DfLWgTA0
         2rakvIJBJfkrKWiViGTnh4Adtm51CzaqIFLwG/qW1OWz7UixHihiYt/zr7xk0KBrGr89
         nHQg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Ong94ZfY;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1f::615 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on0615.outbound.protection.outlook.com. [2a01:111:f400:fe1f::615])
        by gmr-mx.google.com with ESMTPS id g6-20020a056a001a0600b0050d232d12f8si35706pfv.4.2022.05.12.10.05.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 May 2022 10:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1f::615 as permitted sender) client-ip=2a01:111:f400:fe1f::615;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Og85UUReTkBYW3ZvFSV3Kc34lWC1Lyin3t5DaqPsi2dn6RirUAaPEF5PZ3CXmKefFpgW4RcnFzabxBHSyz6PpaXXbIh55YwZ4x+HFK8hjR6L0kSWjdoWCYxqGZdH1ivLtcnfoGxuMSOonoyCcqRoNAHn/prKSHarL6/waZY2VkbPdJlDNEciBPdzoDwwHVYxmwxU8/6BAy/dSSSwhlUg7eF+EEdOKe0Dz8/WGk8JlLFW/E2kEOm6bcg9QS9qORSLdpHBiFAeDOfe53C/hxcN4X4lT+oZro6IbPTgAWRMAA8kBlBaat4BjlKFKCZ5rRnSnUVVHXcd0jK4OGd7/Ieq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+caWbyyt1KdsbRxJfI1Xz77pjWDs0se3slniNEntRE=;
 b=h8FLFUumhGDZyJtJSIN9qqOA5XsctSyYgMcPr/Py52Y//dimg434wzQunP2dGvPHiXiYmSL5lF+ULoytqfwIYx0J4y8yujbW5DmHmh7ZhMVDzPcn5936mkUSK0mna3kvXeB/s51V5HFqqnmXlo5JAJbNbofh1vJjDGni80XfmAmSgSu52hcduZ/slOOr0wAF6YZzi5iAkbVWzwq7KjwNZVTOQECxW6M6rQb7roRQqpU1M/WqdtGpfzkhX5CQPPNMVhElnWR9vNEVQ5b6/Lj3TZLaRF/4C7EaaXnpN5VH0d937RazORQwfG2Yow46zg5LDgmXyZjGWtmUUhQJmI+9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DU2P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::32)
 by DB8PR10MB3098.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:e9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Thu, 12 May
 2022 17:05:34 +0000
Received: from DB5EUR01FT054.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::6f) by DU2P251CA0028.outlook.office365.com
 (2603:10a6:10:230::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Thu, 12 May 2022 17:05:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 DB5EUR01FT054.mail.protection.outlook.com (10.152.5.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 17:05:34 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 19:05:33 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 12 May
 2022 19:05:33 +0200
Message-ID: <a866cda9-fa1c-3033-3cc9-b0762b0ae6b5@siemens.com>
Date: Thu, 12 May 2022 19:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Kernel panic on enabling root cell
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com>
 <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com>
 <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com>
 <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com>
 <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--18.126300-8.000000
X-TMASE-MatchedRID: k0MhqeQqGxw5QaOxwNGfvo9bHfxDWoib9c0SSBk6D85swYo64ufkVWOJ
	thub07SwY4zJvUjGrxXCaBA5v6nrh8jIZFqzzNvWr4vHsAGpVweGZc0nh03Q7R1kSRHxj+Z53V4
	UShoTXaf6srwzFJ/qAsP/La5NP1Jvc1CRDGuYa05ASosYQrlWjAcb6hGUQ2tTCL8RFER/j9Myyi
	+n+H050RCOwdkP3NVeYAX1zFjEwVo9LPdQhgZ/lh1GpI2Wh7mMa72LzVxTKQURW4LR41Fi8lSMd
	QR/r3EeR6RHdVK85hV2NlrEE6OjjT+q6H5pp3fffQrOflXxFuVpY+rDpJtqXuGECTbIgjb5sVwP
	MKjZm1aKXNybanokTxc7TE9SuU5smvSD3/eM+8LTIDCR7KoHhIy3ARqB9bsbB89GKHo03nbDvsJ
	EJ3LgvOnYh8o5mXik/0etkVHtq/8aUiTYmfzyKd3ZNwOPBqrYAM0/G7XUdeOEsxw9kf3dvEYj0z
	DHPzJp3unRG7yMq8UQyMOxzPzlhV2xMFrvDMyRwsZhPVDrsSPm0GdS2zsXWJUXYcPwQc2nLPSJu
	5jov2bWXfwzppZ8SOK5fhRxt1aAA41sIOnMj8YdFnFuhtKX0KGnquim0WHzpyEWs4H2RqcP6OWz
	RxLAk7Zk7gsuflVKvK0M8RWx8ZT3mzd9ajBAw0xuauhSu97Ow5rEtj8CKMNeYVWU5uHQ/Ayry3W
	oaCBEmyiLZetSf8nJ4y0wP1A6AKEwgORH8p/AuRuWSuAIu/jdB/CxWTRRu25FeHtsUoHuxqNKxB
	ViYn3WWcxcrhL+48w0uV0Cem2LDUg+ekVvIvxgO21BQaodlQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--18.126300-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 3C7F6B23140B5C91B96C70C001200543EA739A39464FFE85085D0FC3118B94422000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 326392a1-b6a6-4499-94bf-08da3439a0ce
X-MS-TrafficTypeDiagnostic: DB8PR10MB3098:EE_
X-Microsoft-Antispam-PRVS: <DB8PR10MB309830C2657793E3DA6B7AF195CB9@DB8PR10MB3098.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +sYlSohGRUWyQFtf3MIEL46LUUoRsMsgzRkBlZeak3JpNIGaW4/JTvEXwAGA9Vxta2LrSQZGxjaoGq0ec3+aSNsgHJW4SRfxzTU3OaK1BkUebF5NBoCRzkw49LUYGNWtSClUQdZHSZ+HrcI1nVEkt3jQZikCrvesJexZKnp0tCvzAP0JMTvnhVpaQW5jPQYMz+H7Wq4YmcaDp0t3FUiWONOSoI6PQ1AAkk32P6Oems2Ar1jZKotCbcHH7OzlNA8Ntiv1Px3Knz2s+p9BJbcx55jq3SwzRTWAgrFq9m+YuhESIXMCLcuAFDTkDt0GQGCigcmy+Ra/3NqojWdGudhFCI/Z06ASK2R/MeB74JHo+Pf1gds2ofFTPF6I4PRAJ3qxrzQgZDeoWklEQ7efI4TXQOe2H5EeNG1J7q454NDx+JCqufOGfdie0BGY2Z9030Ep98xIjZ9aPabFh6SQ7aDfnI3Osr/6jwPtOeEjt/+IgoCesqA7hLjQWMBvb/9yr3BOQM5J8XC+b9K8w5NeFEwdWEGRX0O7qSBJ2mHpz7ziSsw5/txx5WItL/I6ACHGOXqtOKm7702vZHWox2/zvOR9l/gjzXjtnONJKsyogvUgXaovfuRsaUHlEOeG5jO+O4WbaztDbbpd+NrhjW4L9vDVHzF2OswTlTvDes+GFWAZlyUiH0qQ1h7YY8X3QF7BvtSV0uorpRegqerzh50iqmQEbYklVtOpjCsjG8ANrdmIo5qDT7PLqt5hkMS/U0ioLeZ3PK4FWjlHqhTz1rjOQ55GLeeiwkvIc2uCWqyp7xZRLBz8CRKTvvmHdD/yLFpLsM1T
X-Forefront-Antispam-Report: CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(44832011)(2906002)(36756003)(8936002)(31686004)(36860700001)(82960400001)(40460700003)(31696002)(5660300002)(336012)(508600001)(4326008)(186003)(83380400001)(47076005)(70206006)(16526019)(81166007)(956004)(2616005)(70586007)(8676002)(16576012)(316002)(82310400005)(53546011)(6916009)(6706004)(86362001)(26005)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 17:05:34.1394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 326392a1-b6a6-4499-94bf-08da3439a0ce
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT054.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3098
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=Ong94ZfY;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe1f::615 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 12.05.22 13:37, Lad, Prabhakar wrote:
> Hi Jan,
> 
> On Thu, May 12, 2022 at 12:16 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 12.05.22 13:06, Lad, Prabhakar wrote:
>>> Hi Jan,
>>>
>>> On Thu, May 12, 2022 at 11:24 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> On 12.05.22 09:01, Lad, Prabhakar wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On Thu, May 12, 2022 at 6:45 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>
>>>>>> On 11.05.22 19:09, Lad, Prabhakar wrote:
>>>>>>> Hi Jan,
>>>>>>>
>>>>>>> On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>>>>>
>>>>>>>> On 11.05.22 13:20, Prabhakar Lad wrote:
>>>>>>>>> To add further more details:
>>>>>>>>>
>>>>>>>>> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
>>>>>>>>> for jailhouse [1].
>>>>>>>>>
>>>>>>>>> I added some debug prints and I see the panic is caused when entry()
>>>>>>>>> function is called (in enter_hypervisor). The entry function lands into
>>>>>>>>> assembly code (entry.S). I dont have a JTAG to see which exact
>>>>>>>>> instruction is causing this issue.
>>>>>>>>
>>>>>>>> So, already the first instruction in the loaded hypervisor binary is not
>>>>>>>> executable? That would explain why we see no hypervisor output at all.
>>>>>>>>
>>>>>>> To clarify when the hypervisor is loaded the output will be via
>>>>>>> debug_console specified in the root cell config?
>>>>>>>
>>>>>>
>>>>>> Correct - if you reach entry() in setup.c.
>>>>>>
>>>>>>>> Was that memory region properly reserved from Linux (via DTB carve-out
>>>>>>>> e.g.)?
>>>>>>>>
>>>>>>> Yes I have the below memory reserved in my dts:
>>>>>>>
>>>>>>>     memory@48000000 {
>>>>>>>         device_type = "memory";
>>>>>>>         /* first 128MB is reserved for secure area. */
>>>>>>>         reg = <0x0 0x48000000 0x0 0x78000000>;
>>>>>>>     };
>>>>>>>
>>>>>>>     reserved-memory {
>>>>>>>         #address-cells = <2>;
>>>>>>>         #size-cells = <2>;
>>>>>>>         ranges;
>>>>>>>
>>>>>>>         jh_inmate@a7f00000 {
>>>>>>>             status = "okay";
>>>>>>>             no-map;
>>>>>>>             reg = <0x00 0xa7f00000 0x00 0xf000000>;
>>>>>>>         };
>>>>>>>
>>>>>>>         jailhouse: jailhouse@b6f00000 {
>>>>>>>             status = "okay";
>>>>>>>             reg = <0x0 0xb6f00000 0x0 0x1000000>;
>>>>>>>             no-map;
>>>>>>>         };
>>>>>>>     };
>>>>>>>
>>>>>>> Linux does report the hole in RAM:
>>>>>>>
>>>>>>> root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
>>>>>>> 48000000-a7efffff : System RAM
>>>>>>> b7f00000-bfffffff : System RAM
>>>>>>>
>>>>>>> And below is my root cell config related to hypervisor memory:
>>>>>>>
>>>>>>>         .hypervisor_memory = {
>>>>>>>             .phys_start = 0xb6f00000,
>>>>>>>             .size =       0x1000000,
>>>>>>>         },
>>>>>>>
>>>>>>> Is there anything obvious I have missed above?
>>>>>>>
>>>>>>
>>>>>> Nothing obvious to me so far.
>>>>>>
>>>>>> So, is this really the first instruction in
>>>>>> hypervisor/arch/arm64/entry.S, arch_entry, that triggers the undefinstr?
>>>>>> Check the reported address by Linux against the disassembly of the
>>>>>> hypervisor. You could also play with adding 'ret' as first instruction,
>>>>>> to check if that returns without a crash.
>>>>>>
>>>>> I did play around with ret, below is my observation:
>>>>>
>>>>> Up until line 98 [0] just before calling arm_dcaches_flush adding ret
>>>>> returned without a crash. Adding a ret at line 99 [1] ie after
>>>>> arm_dcaches_flush it never returned.
>>>>>
>>>>> So I continued with adding ret in  arm_dcaches_flush, I added ret as a
>>>>> first statement in arm_dcaches_flush and was able to see the panic!
>>>>
>>>> Which Jailhouse revision are you building? Already disassembled
>>>> hypervisor.o around arch_entry and arm_dcaches_flush? This is what I
>>>> have here for next:
>>>>
>>> I'm using the next branch too.
>>>
>>>> 0000ffffc0203efc <arm_dcaches_flush>:
>>>>     ffffc0203efc:       d53b0024        mrs     x4, ctr_el0
>>>>     ffffc0203f00:       d3504c84        ubfx    x4, x4, #16, #4
>>>>     ...
>>>>
>>>> 0000ffffc0204800 <arch_entry>:
>>>>     ffffc0204800:       aa0003f0        mov     x16, x0
>>>>     ffffc0204804:       aa1e03f1        mov     x17, x30
>>>>     ...
>>>>     ffffc0204844:       d2800042        mov     x2, #0x2                        // #2
>>>>     ffffc0204848:       97fffdad        bl      ffffc0203efc <arm_dcaches_flush>
>>>>
>>>> You could check if there is such a relative call in your case as well.
>>> yes it does exist, below is the snippet:
>>>
>>> 0000ffffc0204000 <arch_entry>:
>>>     ffffc0204000:    aa0003f0     mov    x16, x0
>>>     ffffc0204004:    aa1e03f1     mov    x17, x30
>>>     ffffc0204008:    10fdffc0     adr    x0, ffffc0200000 <hypervisor_header>
>>>     ffffc020400c:    f9402412     ldr    x18, [x0, #72]
>>>     ffffc0204010:    5800fd0f     ldr    x15, ffffc0205fb0 <sdei_handler+0x2c>
>>>     ffffc0204014:    900000e1     adrp    x1, ffffc0220000 <__page_pool>
>>>     ffffc0204018:    79406002     ldrh    w2, [x0, #48]
>>>     ffffc020401c:    d2880003     mov    x3, #0x4000
>>>  // #16384
>>>     ffffc0204020:    9b030441     madd    x1, x2, x3, x1
>>>     ffffc0204024:    f842c02e     ldur    x14, [x1, #44]
>>>     ffffc0204028:    5800fc8d     ldr    x13, ffffc0205fb8 <sdei_handler+0x34>
>>>     ffffc020402c:    f840c02c     ldur    x12, [x1, #12]
>>>     ffffc0204030:    cb0d018b     sub    x11, x12, x13
>>>     ffffc0204034:    924051c1     and    x1, x14, #0x1fffff
>>>     ffffc0204038:    8b0101ef     add    x15, x15, x1
>>>     ffffc020403c:    f9001c0f     str    x15, [x0, #56]
>>>     ffffc0204040:    f9400401     ldr    x1, [x0, #8]
>>>     ffffc0204044:    d2800042     mov    x2, #0x2                       // #2
>>>     ffffc0204048:    97ffff6c     bl    ffffc0203df8 <arm_dcaches_flush>
>>>     ffffc020404c:    5800fba1     ldr    x1, ffffc0205fc0 <sdei_handler+0x3c>
>>>     ffffc0204050:    8b0b0021     add    x1, x1, x11
>>>     ffffc0204054:    d2800000     mov    x0, #0x0                       // #0
>>>     ffffc0204058:    f100025f     cmp    x18, #0x0
>>>     ffffc020405c:    54000041     b.ne    ffffc0204064
>>> <arch_entry+0x64>  // b.any
>>>     ffffc0204060:    d2800020     mov    x0, #0x1                       // #1
>>>     ffffc0204064:    d4000002     hvc    #0x0
>>>     ffffc0204068:    d4000002     hvc    #0x0
>>>     ffffc020406c:    14000000     b    ffffc020406c <arch_entry+0x6c>
>>>
>>>> Then you could check, before jumping into arch_entry from the
>>>> hypervisor, that the opcode at the actual arm_dcaches_flush address is
>>>> as expected. But maybe already the building injects an issue here.
>>>>
>>> Any pointers on how I could do that?
>>>
>>
>> arm_dcaches_flush is loaded at arch_entry (header->entry +
>> hypervisor_mem) - 0x208. Read the u32 at that address and check if it is
>> what is in your hypervisor.o (likely also d53b0024).
>>
>> If that is the case, not the jump but that "mrs     x4, ctr_el0" may
>> actually be the problem. Check out hypervisor/arch/arm64/caches.S and
>> see if that code, specifically dcache_line_size, causes trouble outside
>> of Jailhouse as well, maybe as inline assembly in the driver module.
>>
> 
> With the below ret added, I get "JAILHOUSE_ENABLE: Success"
> 
> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> index a9cabf7f..4e98b292 100644
> --- a/hypervisor/arch/arm64/entry.S
> +++ b/hypervisor/arch/arm64/entry.S
> @@ -96,6 +96,7 @@ arch_entry:
>          */
>         ldr     x1, [x0, #HEADER_CORE_SIZE]
>         mov     x2, DCACHE_CLEAN_AND_INVALIDATE_ASM
> +       ret
>         bl      arm_dcaches_flush
> 
>         /* install bootstrap_vectors */
> 
> Now when I undo the above and do the below, Im seeing a panic:
> 
> diff --git a/hypervisor/arch/arm64/caches.S b/hypervisor/arch/arm64/caches.S
> index 39dad4af..ce29b8e8 100644
> --- a/hypervisor/arch/arm64/caches.S
> +++ b/hypervisor/arch/arm64/caches.S
> @@ -40,6 +40,7 @@
>   */
>         .global arm_dcaches_flush
>  arm_dcaches_flush:
> +       ret
>         dcache_line_size x3, x4
>         add     x1, x0, x1
>         sub     x4, x3, #1
> 
> Issue is seen even without dcache_line_size being called. Does that
> mean we are not landing in arm_dcaches_flush?

Likely. I've never seen such an effect.

If you look the reported fault address, when making it relative
(subtract hypervisor_mem), is that arm_dcaches_flush (relative to
arch_entry)?

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a866cda9-fa1c-3033-3cc9-b0762b0ae6b5%40siemens.com.
