Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKWYXCPAMGQEYA7RR3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id E591367752F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Jan 2023 07:41:47 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id h9-20020a1ccc09000000b003db1c488826sf7760767wmb.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 22:41:47 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1674456107; cv=pass;
        d=google.com; s=arc-20160816;
        b=ug+GijpCKWsVd/yH3uN8AwkCAaRPdrOE+ykSVE89S7PklafAtH3oseMc99jwkN93SP
         Ay0Bk/N7DJR8raUvlR5xg/TOavYxjV25/WgvrLVdq/hS4VEQYp6RRWdXNpDpxN3jxL4Y
         ac3Zdcu6+ghcFi2AwKvElJnToo382LS77gAgYkxHjw+zOH+5yyuPhhuSMybF9isJU7k4
         W0F/8oJGE80aUX/SBZ+G3xjIWeJFw0ti58pAgh3uuxqYimHVgB2GRrufVwtFyAb4y0dn
         KR6p64AeosAzrTdLUEIinDJ3N05jh4WYuOtJLIZ0MqpDDyuDHoNYDBKuKd19TCZAhI02
         G6uw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:references
         :to:from:content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=SRnqTCUgqdz0GOpHo/5DtHzeT0LfgLEGB+lBCWg8WvE=;
        b=IKnuAM+xCf487WkPJ0y6zW+IdskK7UjeKE/o1E7w/OOy1gsA7CVQDvl8Ao4IWsjmh5
         c4GlGDXryAYYY5W+MfcyxZagv4qA2qrOpaugRQN1eXz3ZTd7i4Codb7uuKsDw3Oa9jH1
         +LQTgJeg+0poEH/rVXouer9eiR0d+LrTy1dh+um7vd2Ltlgj9/pnUmh/m5PGzJVkNBlT
         3D2wX6yG8FKyOn/3oNvxCOCrY3uRlcrfN1huB56Pn7v+d7/UJ6BAW18vl1JLkqXzYOQy
         2Uk0FC20oSeH26ugWy+6bccFxRiAV1BMudqt3uhBKHIUuz8ZFyPujROXzLJMK/xBwOwp
         eT9g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=AbbS4tfZ;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.15.80 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:in-reply-to:references:to:from
         :content-language:subject:user-agent:date:message-id:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRnqTCUgqdz0GOpHo/5DtHzeT0LfgLEGB+lBCWg8WvE=;
        b=mUW8I95jZS5THR0rBFd/Q6V45/5sGVPhSTTazYpzuhxn7DigfYQK+L0KRBuKdInWXb
         caH5am0b2sYG6YSyiXolmTdd7UDy979EkaMvolz9PMsluKCEPG/on3v+mMW3O/pwEW3a
         QkJBAWmfZRCIavJWUsZCiOTn5XkiDz+Bg2AASFZijlP4FEAXCgF39LFMZMdaQEOrL3C3
         QmIkc2Ebw3axct9ikwIrM+0Sp5OCONZtrNpkFJP0pV8RXRnNS10HQE1OorvuDDlPg8Uq
         FJHcDso8FzYfbqJtHVJMiYvCsaa/6PMTAI5yOduUZ1ftlIHM8BdUg2AqpjV9wMwzl0Wh
         wTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :in-reply-to:references:to:from:content-language:subject:user-agent
         :date:message-id:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRnqTCUgqdz0GOpHo/5DtHzeT0LfgLEGB+lBCWg8WvE=;
        b=DYdyGslZJ8MCCxDvzp1+uBvPU7Yh1HiqPrmBWCSDh4KjOPxoN1ymbB2dI2TUKBuTqN
         +RxmL90dzZRihbkjtnSMdkzY1FXH7hfQ37M2qJGJa5vFQoZRWkjMwJDd9EKYnoagCRlN
         tDA84oiRr8kX3/nTuF5jyiULhKQykkT9i5DkpJhfx4c0orqAKdS5Pttj+I5JsFhqX20d
         vN9w23IwI3GlzX8sIZRK8OwXDX00utvx4jBhh7sL8sjyXhGBEDDeRcng7Fgx6o0RGbZ7
         rcWtOtApFHw3MCwXcMQbc/iIfU3HzMG/i08ap91qxHpD44KwpgEG3GXj72L5E4brIGcs
         8NVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2ko7D7EUd5RUkwAdMwmFRXphD7Aj/LbMAfdPMyduSvKtzaGnshWT
	bsF7B2go6b+Iz3GzawVy1Rs=
X-Google-Smtp-Source: AMrXdXu6sgE+dewzpcmkNrhGTseJK/MGdBMJggDpxO9APoiTN1U7SvCTZR+Jw26QFAanS/YkkzCG3w==
X-Received: by 2002:a05:6000:23c:b0:242:52ba:30eb with SMTP id l28-20020a056000023c00b0024252ba30ebmr1009837wrz.440.1674456107548;
        Sun, 22 Jan 2023 22:41:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d211:0:b0:225:6559:3374 with SMTP id j17-20020adfd211000000b0022565593374ls9307577wrh.2.-pod-prod-gmail;
 Sun, 22 Jan 2023 22:41:45 -0800 (PST)
X-Received: by 2002:a05:6000:784:b0:2bb:32f4:3697 with SMTP id bu4-20020a056000078400b002bb32f43697mr20631772wrb.39.1674456105920;
        Sun, 22 Jan 2023 22:41:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674456105; cv=pass;
        d=google.com; s=arc-20160816;
        b=ig+59kqUBLT6b7+gIlHAywOjsSzhBblSQjXeUq7QW7QHoSfaiTmELX/7dVfdt0S+Xz
         okT8VSoi3ikuUilGCvg/49U/rMJGHBlEhCI8k8/idgrTEZWwaHI4CTHQZx+9pDIY1YBp
         mSCNDn4UA+hgoVLU18worgGUpGyctcAMJJW2xP7BssNuTN1ZKE7XjB2Nw+KoookFAgx4
         fs43ceLBDtay+QXcQuX6ZCAOdCeOUDLdoz/mnwFsSugwvULvEMin2kCJXsfEKwGrR+G+
         u36RuAEbiOQH7QFqU3WvpGBdlGzmfWqvzHH76fitshgZajELwmW3jI+dHQ1FWgv154g+
         +B5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:references:to
         :from:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=wUclB/WhJkdzdpSEplCyv1R1fs6HKC6ZUpkrEyzEhp8=;
        b=HniAStVkUT1K8U1VUAPR8RHre4VhByvYKbChnDF3XNMvQOEQ5CWSyYy11uUS6D1QC4
         MmLBwWlFmTPKk+y8uxujeIuj+dKsVQKiVT3etxvwleZ1UryuIwQoE8Jgs9I0i/k7dLM4
         Z1tebetFZrRgeEVLzgC5ACxoVX8oLzC0s/6pWUbCtKNv51qu01+75pzpz9CsFoSZQFJB
         bV2bep/Bn7hh5LP0hKhopmirTLHWt0Yuqm0THH4g0DY/P/hRvkBhwmsERdxQ16mcX+Y+
         XWv7KdJitqXi1DOooBD34j6VdMKZ74H1x7OCM2Anp7bf5X+SCscQU+TtgTcGsxEbPX9T
         nhcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=AbbS4tfZ;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.15.80 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2080.outbound.protection.outlook.com. [40.107.15.80])
        by gmr-mx.google.com with ESMTPS id by11-20020a056000098b00b00241d0141fbcsi625037wrb.8.2023.01.22.22.41.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 22:41:45 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.15.80 as permitted sender) client-ip=40.107.15.80;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEtudvsLrCfLwTx7ldJHkw42ni+0dAwdIMHKEEUM9kLhCMj3glalh44rQtvlwf1vVEINNMixvSwJ3ljG10dVSion4EdCQeCz5i9MQunt4pxGCUzanfNbSXZ7RKXqZFjB4t013CrrxEONGntR0xXTcyOQBz4Ah3yG94GJ2s7RHLDnjJULmNRqxCzWJHxDu3x4fYnUEiMGPVnIXvZuERqzM9HYL0pVAPO6X+ca0BaWVRpO2cN+Klb6jxXKCnG6aCOMhAj5fseKMJbxA0dKmVK8I8RjwMYnXSahOmn6DcbwPs1jo4zyIKiBcw2SHP7NEEjCKxSanH54YMxE7A/UJlceMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUclB/WhJkdzdpSEplCyv1R1fs6HKC6ZUpkrEyzEhp8=;
 b=OjXiRdiMXaHIHbTVRTbUjDVgz2vzdgQ0iysFQCA54mVuhALL3nrsnj+3xSH30GcDHcFHsckSeNlP7igs+Z0ccVGL0FxPxeYuM0szCK+KazX7WWsIzhQtbvVdNhS8vWT4HRRUDkR8Nhn6CWugkRXny+MIKlfuxatjeKpN3iVdShj1FFzJ0K3smpdwKY4ciBpCfddExnpL8dZfmd3p+pFFDA+nsHrEmiZkAp8vPQI+iXvy6abIHU0MeV29FQBFTbbdIi8g+QYlbIQMbG0hY9Q/fNxTPa1rJM+8UXngz72Q7rNVwCS47SkhnYd6tc6tskkTdgM1PkMpyWz3l3pAJwSCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by GV2PR10MB6358.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 06:41:44 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::784b:e95b:b855:dcc5%8]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 06:41:44 +0000
Message-ID: <a53ce3e7-15c2-800f-fce0-0efa73831de3@siemens.com>
Date: Mon, 23 Jan 2023 07:41:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 07/14] configs: arm64: Consistently move inmate demo to 2
 core
Content-Language: en-US
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
References: <cover.1674415741.git.jan.kiszka@siemens.com>
 <97b48d1823b7578cdc4be370a1a56ad20df45a15.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <97b48d1823b7578cdc4be370a1a56ad20df45a15.1674415741.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::9) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|GV2PR10MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a495014-d6d2-4897-3d67-08dafd0ce451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z+r7DVD/4YoBitLn2pzhk4h8G9VENAhU9wgZB3sU4Q61SqfXSrM24OwiVVXjkpVjmvCChV2IRVt4NQGuDrdTbnQPvniUmCGrLFP2lQxrtgNvdAvgr7KoISQRCCD6MoQH7FeWKuW3I0Ck4ZeO8y23e7MiBKTCL3n1ujBBB10TpxDH7pBQwap9vL36ITg2BATy1X2QZ6PVqiTdCD+e2WgNOG7Y6lq1lP5qVMJCsbYCfkaPu6G3yvapbv6zXwlQMeINVCHYz/iKsiv7hMAA+7xfSZ/+53gTAKA4ciYU0OHeSrFIyPhWLXgOY5jz+GNEmb5ldm96aXU9u1a9vKCwZigvFHq2BD5YuM/6yuisyeq0FL6Wb7GyFhnfxxOl9LlsSloUbDlicKyAw1rOGz58prcdABq7TdcLB19zioUl2H2XcbmjSyrn35BqDwpUpqlVDU42llceMCzJg9jV8oa/jmWpOmH5KJFKGE0rEtobYYuFCNd0pOhEuypMBFiQix/YbaXhz0dxfjSt+AMR2Qnt3cezNI1SDQy8OwXLH2bjwHFxeg6/3+abzPDL7T+FCOFBLu4tWqNJyi5s8tQg4jMwS0rfXKP52fWNibhwCEjLuKei2P4JoRS2xkwN8tDP/r54tXxOgAt2iU5OPBAiAqTXK2kppISEcPJguMFZUwv4pQSPRSc0hcoOH5f+whNIGN8UyVTqvibic/owhEf3uy8S03yfNsv4OX0XHgIRjKA6UWtHNYA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199015)(38100700002)(82960400001)(86362001)(31696002)(2906002)(44832011)(4744005)(41300700001)(5660300002)(8936002)(8676002)(6916009)(53546011)(186003)(26005)(6512007)(6506007)(6666004)(2616005)(316002)(66946007)(66556008)(66476007)(478600001)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnRSaWxFKzBSYThlbEhYeUtKR0RDU1owdXJVM1ROVnVydWZYRCs0elpXU3Mx?=
 =?utf-8?B?WjVaSGVwVXdObGo5ei9YWFBYK096eXc1ejZ1L3JhY1NUZFR0NElSYlZmb1Zy?=
 =?utf-8?B?cEtFN21oQjFtNVF4WWhzanJyNmlkZTlYR0d4NEV2Q3p6L1VwZTlJeWh2TWx2?=
 =?utf-8?B?djVRQlByaTJqc09TU1M0VGp2UmxrU1R5eURmRm93akF2VGJ6N0hqZDJVRFJp?=
 =?utf-8?B?TTEyRlYyRWRxY0NQTDFoa3B1eGkzSHAzVmhhMXlQZm9uTXpxUFNkaGZnRVNR?=
 =?utf-8?B?Qmh3UnFTeitHN2c5am9HUHdhK3MyL1hTSjd6Wks1OE12cDJZNzRxZUN1QXFO?=
 =?utf-8?B?aWJ0eTd2eVI4VWFVZUNyR0VPRVhnM2w0S20zK3lNdk50SGx4VXErMDhiNnU4?=
 =?utf-8?B?UHVvWE1GTlg1c1lwMU00ZDJTa0RLM0dhSVdJZWo5L1lyYXhOeDd5M0tRUTNr?=
 =?utf-8?B?VmhJMG9sbU9ESzZyVk1qUHhOMkRvRWlNbU5UL2RHMi9HQi95dG9WZThNVWJQ?=
 =?utf-8?B?TzM1d1ZpREhLQTIzWFVXZEx2Qi9xVVhnZjd2aFBadnRmbVF4R2s5QUQzRCt4?=
 =?utf-8?B?SjRnbUlrV3k4V1FXU01vaEliQXk5SUxFYWlmUno1MXI4SnpGM1FueWpOb1lp?=
 =?utf-8?B?bzJYcUVCRkNsTEloSHVRTlRwaTMvSXEwZ3llblFIcmlic3pQRmtOdWZiUHpv?=
 =?utf-8?B?Q1VqcnJvSHYwU0xBdUFaMWpmcUk1eWdHUmYvNVhIbU1LMVRxd3h0dm15WnFG?=
 =?utf-8?B?VEJYRFo0RzRZS0J5Z0UzQkg2SXpHNlowWWpsNDI0Rmt1dTJkdUtlNDZRbWZl?=
 =?utf-8?B?TkRtNzZZTGUxTVJ3clpKTTZpdENpOFlVVThMM21WZEFZaDA5VUNwOWxNZkF1?=
 =?utf-8?B?OHN0MkV1dWpIK2ovT29RcE4zMFlUc2lKczhDVUtnVVpIRmdvMUIvOG5SZkRH?=
 =?utf-8?B?OVIvdlNQWnlSMlRob3ZnT3NWb3ROZktidC9qYVppdU5vdWwrdzFRUDJxYWVE?=
 =?utf-8?B?WUdLWkZSdlduaTN1TTkvRmcxV09GU0U2cGU4ekV0Uy95VFJkZXFxbDRzRWs5?=
 =?utf-8?B?S25pYUR2RFVTb09pdXl2Z2NhcThtZHpwdWtiSkxVb3dtaXl2SHZzeHJhdW1s?=
 =?utf-8?B?N1FsLzN0Q29jZjdaWXNSQ21hR0kxNmpjMEg3RnpJY2pqVDNHOERmQitoUGhi?=
 =?utf-8?B?N3RBV2tPTlpaR2c5TjRSWm1nZmsxRmxiZkRNZno0b0MxWnVQOVcycWJmdFBv?=
 =?utf-8?B?QTlzT2hGVVVBd3BVaG5ZaHJHclI0TnZNd0FVbnVOeHB1MGlrNk5SRUNlN1c0?=
 =?utf-8?B?OWtDWGE2Mndvc2twSG1yZHcxK0F1YzBhcnRwN05oaGc2a2JLYjMraVlya2Z4?=
 =?utf-8?B?UUxGUktXWVdhOTR1bjl0cWhlQmxsOVhMVUdka0ZUa2RHNC95ZGRBUDRHczM1?=
 =?utf-8?B?TlZFWVJSaDYvVmRUNnUrYmJJbXZRSDhTWG1IbklqTUxUMVpvR01MYUwrNzJk?=
 =?utf-8?B?QTdHREhiRHQybW1MY2ZmNVM2TEIveEwvVzBTWHBKeUQ2SWFWbVJhNFUyd2RE?=
 =?utf-8?B?cUFSS1lLTHorOTUrOVB0SzZjeDREZkpydjN4SXcyYUVzOW4vNWlpVUZJMW9K?=
 =?utf-8?B?VUN0dzNtQTNxYVFjQnBnN2o1azdJdnFGVFZ3TnpqMFVYdU9LakxiSzJHY3RX?=
 =?utf-8?B?UnZnMHJLeG9ZYXluVGlncXd2aktZRWVZbjRzZXZhMVc0Ti9iVVRvWjZ0Nk5B?=
 =?utf-8?B?Mkxidm0rMU1tSEZuZEtac1VQMGUyWmhXYll4em4zQ1MxNWtrU0IvalZmKy9v?=
 =?utf-8?B?MmY1VHhuTjNuNlhQaS9qd1hzbWdTcUJXMnJYL241TjVSMmdHSFF1WmJaS1BQ?=
 =?utf-8?B?U0NXSUpTTSt6bGpoOEZRcURaYXJrb3cybWlNakNuc2p4UmVZbnpJQmNKZHh6?=
 =?utf-8?B?MnpyUkVvdUVXYWsvTnJ0RFBlL2F3VGpWQVNqWU5zUVFOc2RRdlBWYnNWaFlV?=
 =?utf-8?B?eUVqVGNUeFppSDRHQ2lBZ2wrekhhODN5U29PTDdXOUVzaFpVaG01dS81OGlD?=
 =?utf-8?B?WmhSb1VXNTZFWHJ2SSt6Ui9CN09NVWxOVkZWUnlhNjM1NmpNQlA0QXNWT2xI?=
 =?utf-8?B?OWp2Qk1zODBiajVCVVdTcmRMZEUyckRnYzJMVDQ3cndCdlZLWkFBbVVwWWxQ?=
 =?utf-8?B?M0E9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a495014-d6d2-4897-3d67-08dafd0ce451
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 06:41:44.0497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmjEUPilp/LNgK2N+3EuxIZczl7VpGArLCvwGD5eiKZgQEXWo3zCojxUKTWloZxhRjssdb/H02pvQXzjjehX4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6358
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=AbbS4tfZ;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 40.107.15.80 as permitted sender)
 smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=siemens.com
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

On 22.01.23 20:28, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Allows to run that cell aside the linux inmate.
> 
> For the k3-am625, we also have to shrink the linux demo to core 2 and 3.
> The r8a774a1 had a inmate demo cpu set that was completely off.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Subject should read "Consistently move inmate demo to core 1" - fixed in
next.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a53ce3e7-15c2-800f-fce0-0efa73831de3%40siemens.com.
