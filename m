Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6GQUSJQMGQELDWB46A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 413A4511547
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 13:26:49 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id b33-20020a0565120ba100b004720174b354sf614516lfv.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 04:26:49 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1651058808; cv=pass;
        d=google.com; s=arc-20160816;
        b=HzaUUd+7S0RbGg1eSP/NscTUWGlPL6Xon54QaeKxPcqWItKpKn4wJa+QVZZZjFyU+g
         WEZGbEHO++xnxufuRIiz/NsD1oLA6i+xGGoc3EEU/PEAOyYUFhGPolGxlBqIXDVzBc5c
         Cl+hC0uqtTxkorwMEdusagl39HwCjqwLHD+m6FiLdRBBk1BvRepOuS5VTeHdCKQnBPNP
         sKCfjYA0fryWnb7fzPyIB/vpxNhTSZdbMTHzsy/SAWQR839GCw4L71rvAdrDB4Q8mtW4
         ec9/d5nCPGJK2BoL9+RSLTZEph2OA1fdNZcOK/mN72rASXKL9YMw/WqHw7pAhqsCL31u
         2eDQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=I10XZge+g6/Lc2w44YFpmg6dqrsB+g4K4FLpUMkTiG8=;
        b=boE2SmmR9DTUqdY4Tsy2V6rwr5ToP0WEu1xKKEQ4+lUb6Gn8dUJ4XqXobU1Yd0kG2h
         tbg8GJMo6ASAS7gLCUG81TahwiCGiS1BgHHr/0dj5ajD2sN9ZvQ4dpMbQ0lfvawGRyGh
         vW0hYlT6dltBtYi6ZtZwssN5bGJuWMru5e5/QJwaXD6ZSyZdWtyOSy8+oSirqQRu3IsH
         hDq6tWfWbTzOC6I9wBUOBsNkj3glG1gkV58Xp5beBvn7nRaD3uhfVc829IjXJliDa7pu
         B6oMrZAaS4xEp6vpGYnH41WKk1WdJD4k9qgQ7JLKz0gERXXuUGy9PSIFOvht2x7MWHrH
         zd1A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=lqGsZ2ry;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe06::62c as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I10XZge+g6/Lc2w44YFpmg6dqrsB+g4K4FLpUMkTiG8=;
        b=opvaAEah1LLMNB/uo3YBoN4HaFkkI60CI11wvTgz3kL2ugUqB8Y8i0H8TPDtSo6lvF
         YwBIeOR/7mU9ZeJEJ3ddcjyPN59CuLLmyzMGuOOmZAe7vv7DiQ95tYlVA+qExXKb7mi8
         hCW+lrOY2q7BcuS6NofPVF90THodILcWXA50SG0jKb0qGKG30vXtILzZfnsKYC88N1wK
         HRUPJ/5kYB7fCS4on7LR9JAATP/cYIqDacJ6+NK7dG/Cm6YpBZ7f1zFRt4PEMLWGWg0F
         r6Q1n7VXL3lwKUTlqrRm3NbyU+P6m2dBtac4QpjtGn0QEPH2OgG/YoKka8UepUigG7CA
         Am0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=I10XZge+g6/Lc2w44YFpmg6dqrsB+g4K4FLpUMkTiG8=;
        b=K5fjcdEMYbLrpCH+K7PcEdHD+6wDBxF5YSdQcwJOkjgESyrcuFhtSN+XioVxR3BcV6
         QeDOovS1GCPPxIx5NRW8tTSd96k4E2eJ11Xb7M1iLdrqlziVGnOn2BGoVSzkvXWUWYSA
         OumjC997a6Hw1smLiUrxnkhHUjDSFEM4x5DlesBV/rxic5TQmgFNdrGKnRMib8djzmwn
         A+2BqxpzBCuzRv7fLtOOJl0b0L9Gl+tr14BIVru4Q87suZjdPXe6Cq9y6ZQipQNt2Q6v
         8IQY3qz8HkFjKAh8WX0iZciOjoCQ6i32dDJAIMqIN3KaYVOILDdBM5zhTOMYGnVRWy5U
         Ih0w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530g39YYGd9IE/XEqPQ/ENwBL27n7HDJ/CFxNufPfetFwfzLIxO8
	Mk740Zqkad0dTvOT7NZGw14=
X-Google-Smtp-Source: ABdhPJzdc3LZ4fo8mqHV5uCNdaMBJz+hCQDgx5Qgz03xutgA0oCx3D0e40f67haimEpsLePnPfes/g==
X-Received: by 2002:a2e:93c6:0:b0:24d:422f:f8f0 with SMTP id p6-20020a2e93c6000000b0024d422ff8f0mr18294802ljh.469.1651058808851;
        Wed, 27 Apr 2022 04:26:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3e2a:b0:471:af61:f198 with SMTP id
 i42-20020a0565123e2a00b00471af61f198ls1683012lfv.0.gmail; Wed, 27 Apr 2022
 04:26:47 -0700 (PDT)
X-Received: by 2002:a05:6512:250f:b0:472:7ee:6fb4 with SMTP id be15-20020a056512250f00b0047207ee6fb4mr10216233lfb.414.1651058807034;
        Wed, 27 Apr 2022 04:26:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651058807; cv=pass;
        d=google.com; s=arc-20160816;
        b=kN+633YsOwLVqHWGCO3J90D5Waskh2Pipn41xVLaUj7Ng/fxXy2506beh+A/KNG9mD
         mchqnXVQaGV03o+HLXK7NJZlaXCXIHO/NzFcBrFGlYVmiYcJ3DlbE1FQJ4xc7supw5Br
         Vfi86dr4rV8+BJejKeFh4R7HVSfgRmIWcNZMGegxG4VTEbFxbca0GZhn1CtJfdjMVVgg
         sgDg7cD2OPKtsL84c5n5gYCadg2wThstxa1g/o18qJbinTKQs+mumDai/RE4tIVa7Q5G
         ph+OipuGhVco6mPOTgSoJIGNHEE14kjmKrBa+az5R7OVfdzKE2wGudcUSb2N2jeapNW/
         K8DQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WQPMV9VDuqItVRSSBjp7y032N2BwzUT4KttPihWY1R0=;
        b=NKHZqw6sMO81ahii+gayMCr9PGFBPhWyK9jMv6lBdoVCQJl6Qsd8TPirdkMe7KWxZs
         ZMfOIMyKXFA9gJKPaILPKbtPxg3hGyLOF6MVyV2bSsN2Wg3U5BpnthBYREFV7SDFEMh0
         dNZbX7zx70hKUulyzsGrI4XjnCUqVo+KAUJDyD7f49VouJfvVIXbdi3sjbe4feNjOlHA
         4wSMLze4BONMDZ1MYPGuUXHx+yIiYslrCIAHyEmMTswUubOadnuO8zW1FXNE8DyzRHrr
         FGu66de4taWUZ8EqdHLr9xn9B6gfKuyJnIFbC14sA8GlaMzWMo/hOdXnE6dCMQzGLS5U
         l7TA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=lqGsZ2ry;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe06::62c as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-ve1eur02on062c.outbound.protection.outlook.com. [2a01:111:f400:fe06::62c])
        by gmr-mx.google.com with ESMTPS id x24-20020a056512131800b0047216d2d1a9si63146lfu.2.2022.04.27.04.26.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Apr 2022 04:26:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe06::62c as permitted sender) client-ip=2a01:111:f400:fe06::62c;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WW8w09Mftue0EkZ8PTwgOVGa2WPCP9VcdybWwdlul/g7R52dhjW7vwndlZ/N8LiRQTxp0J79y/wa59KnCO3eIh60+eOmDGBAFmUKo14x2mJjPV/rlOjEoDeNirs0JRATREKc1dzanVsstOqbup2LbNM50guMKp9VEP6IkOgGs7VA7NTcyBar9UWltYwK1ra9wQF5y/H0pbRw3RbrBnEdfqhIpci2+hGUXe2m2QcrEIX2KCcmuOc7OtzXe1zTfLndLREhbhbCiNw2zKDIehJZo0+EUcGGWfUkZT0HqzJhlI5uqKronnBgtWPTmwt8snt4jIFh2dbFT9cK5O2o2BGfPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQPMV9VDuqItVRSSBjp7y032N2BwzUT4KttPihWY1R0=;
 b=A7H/j/LRDTDx6TD88vcJ6pyojVL851N+4SE5fbrULMc4L5Z0rC1nDJC6N5tg+TEBoMzVVB9oxPDO0zyyJIZHm+YSgsiLg1TXlC86xX7bSlhYDsQ1ZlWn0c9F0G97QEZen71Q4V5uyx/kKMN9JgkFl3zbKB03UGQiwXwAb483FxxUQIr80MPjqibjY0pU8I9Tt0ER3a3Fsk8HB0WuT0hMYLF5lw/kCB1YU/9QBoTGtxycUDzDr2isHIgkn3Xohi7PLyb/68GkcbMDx5jktg9/tfIF7GA7cjubJr5nuKUo3lirnRYgOc3laytHVPIWHMiUgNeyROC5moBSW5lW7QsDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=ti.com smtp.mailfrom=siemens.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=siemens.com; dkim=none
 (message not signed); arc=none
Received: from DB6PR0402CA0014.eurprd04.prod.outlook.com (2603:10a6:4:91::24)
 by AM9PR10MB4005.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 11:26:45 +0000
Received: from DB5EUR01FT043.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::d0) by DB6PR0402CA0014.outlook.office365.com
 (2603:10a6:4:91::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 27 Apr 2022 11:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 DB5EUR01FT043.mail.protection.outlook.com (10.152.5.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 11:26:44 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 27 Apr 2022 13:26:43 +0200
Received: from [167.87.0.81] (167.87.0.81) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 13:26:43 +0200
Message-ID: <a538954f-de81-4585-90a0-d0b82921e782@siemens.com>
Date: Wed, 27 Apr 2022 13:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] configs: arm64: add support initial support for AM625
 Starter Kit platform
Content-Language: en-US
To: Matt Ranostay <mranostay@ti.com>
CC: <jailhouse-dev@googlegroups.com>
References: <20220427025419.3485-1-mranostay@ti.com>
 <5473ee5e-1891-dd00-db28-388dad40ee02@siemens.com> <Ymkh0iwDmwlRnOpQ@ubuntu>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <Ymkh0iwDmwlRnOpQ@ubuntu>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.0.81]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--20.571500-8.000000
X-TMASE-MatchedRID: Am/bhnZHfiM5QaOxwNGfvo9bHfxDWoib9c0SSBk6D857k1ZHmKLF7TMD
	HwdijHSHOF0RIPSotdNvxt6yFJGkPz60AyLGoqqf01CTCPwQxkkv6uNsAmpx3rHcAAwD045wDmT
	V5r5yWnpECQoQsV/9XHfLuRKrFFnft9USU7d3Zgva++rCI4JwzZXvqupO0P3ML8y5bOx03xl9LQ
	inZ4QefL6qvLNjDYTwIq95DjCZh0wmBvd3Ao2uOgtuKBGekqUpPjKoPgsq7cA=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--20.571500-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: A2365E23980FF33BD7156D49605A0B97234DED18B9BC351D628644D1F643B59D2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28ee4bbc-4f86-4c7f-9e8e-08da2840cf4c
X-MS-TrafficTypeDiagnostic: AM9PR10MB4005:EE_
X-Microsoft-Antispam-PRVS: <AM9PR10MB40053D957A6BDA979007337A95FA9@AM9PR10MB4005.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5nFjXrcMjkAgl1mU5CaXHLJk2DmZ+ohS3sXLG0HCmqpgCEu9BSlcdxJHovRfgaqN96tPWga70T01C3zvnfWe4vTUUK3VCNVdtAXOwLNFJndvbysaTt+Re60Vcoh9HxJqPsUCIqzPkR2KLK5yfsA+HEI7kraEzXMJJE8wPQDqRax9Rh7slV03IJeFpI4mFzJSNtB+syCCVq/xVq1sTFDYsNEEwT3M/oZUo9/d/MPTk6dCFO1S6wbX9D6+UW9031uiJJnzhV3JMRpfVfnOmj0JwtJFHE82kFeyN1Xu6pVsRejnwj9m/uhH7T1Ju10M4FaE4CJG2065wq1rnJ6JfUY7ldywZ4X2aElqCrn00uzjpjdWct0vtOExhq3Cf/X+mW7RJ+cCLPSEouw+HgDNNgpIPcYh8JHupi6SMY9AoCLVWF2az716rtsc/uUCyuiFuDxN2BoLcjL057DRSV05jXFDV7Kl4dpfM8ooyqFcW+dsV+OhUdVkkb60Kq3qJ0lme7qAXoTU0sGZgtInnp9exvxguQypDX+m+7lfTVJpbJ/K5HF1iRHdyP1T9b42ZBb6T9/u9lkb33CIlRxcwrdWIMkpWAQUhIZJwCzVdkU7TeUcq1NWCo0to0aj/qiUYTIjYh33fxIMvLADVrAPw9CmrKDy5e8bY9A0InoDmlrlBONiHrpgQfeZILTR6j5scJIqtPHOzMNdYOMRZiVbSu1K7mC3xawmTW2glZRGsrgllSxzJ5dtgFPyuoeh///YM8S9mHLwAwgDwuZx6hTxiwnxKgYluQ==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(86362001)(26005)(82310400005)(70206006)(36860700001)(70586007)(8936002)(36756003)(44832011)(356005)(31696002)(81166007)(16576012)(6916009)(6706004)(40460700003)(4326008)(498600001)(8676002)(5660300002)(2906002)(31686004)(186003)(336012)(47076005)(16526019)(956004)(53546011)(82960400001)(2616005)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 11:26:44.6488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ee4bbc-4f86-4c7f-9e8e-08da2840cf4c
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT043.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4005
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=lqGsZ2ry;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe06::62c as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 27.04.22 12:58, Matt Ranostay wrote:
> On Wed, Apr 27, 2022 at 08:34:11AM +0200, Jan Kiszka wrote:
>> On 27.04.22 04:54, 'Matt Ranostay' via Jailhouse wrote:
>>> Add support for TI AM625 Starter Kit platform along with eMMC and non-eMMC
>>> Linux inmate cell configurations.
>>>
>>> Signed-off-by: Matt Ranostay <mranostay@ti.com>
>>> ---
>>>  configs/arm64/dts/inmate-k3-am625-sk-emmc.dts |  28 ++
>>>  configs/arm64/dts/inmate-k3-am625-sk.dts      | 163 +++++++++
>>>  configs/arm64/k3-am625-inmate-demo.c          |  72 ++++
>>>  configs/arm64/k3-am625-sk-linux-demo.c        | 220 ++++++++++++
>>>  configs/arm64/k3-am625-sk.c                   | 317 ++++++++++++++++++
>>>  5 files changed, 800 insertions(+)
>>>  create mode 100644 configs/arm64/dts/inmate-k3-am625-sk-emmc.dts
>>>  create mode 100644 configs/arm64/dts/inmate-k3-am625-sk.dts
>>>  create mode 100644 configs/arm64/k3-am625-inmate-demo.c
>>
>> Why k3-am625-inmate-demo, rather than k3-am625-sk-inmate-demo? It's
>> k3-am625-sk-linux-demo as well. Or is the inmate-demo not specific to
>> the Starter Kit while the linux-demo is?
>>
> 
> No, it is and should have the sk in the file name. That was a oversight on my part.
> Should I send another revision, or will you rename it in your merge?
> 

I've renamed it, result in next.

Thanks,
Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a538954f-de81-4585-90a0-d0b82921e782%40siemens.com.
