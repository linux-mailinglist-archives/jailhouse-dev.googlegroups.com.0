Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBWGG5KNAMGQEZCCBZUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B49260FBE2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Oct 2022 17:27:22 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id k21-20020a2e9215000000b00276ff516fa3sf859173ljg.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Oct 2022 08:27:22 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1666884441; cv=pass;
        d=google.com; s=arc-20160816;
        b=VUdVdhjJHCwjbBgPuerqx9o8C9F+ih0lf+mU7DpFbtIvnp/phvQpV4QcGZYITDe5pj
         W/GpA94S8fD7Q0i5mGkH8ioJubjhHilF8JlmF52EzS55qwBthS6SfPhfhxHgXzxVECFD
         MSHVcJqxjuGTFij6ljC36bmiRull8xahGcEzQfvVgfVNIzFuC9uyKdwX9gSZg4yLOMEJ
         GVOI8oc/fHCjrpkRrls7FjAGCVONsOQ2HHz/BJSI4nYk6/EZFd1ENklDquC/7t+vCK77
         w0XwHnZ7LZpl1YnGkQf8jFhiTmk4CZzaXY2dZKLINZAI+PWUZJUMKTMpq5GfX0LRGZQM
         AwoQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=fh4yA8/AwvUqfnEfXXShLaZdTnrP3EcmZkDVI/KBbAk=;
        b=l6/l9inN8BsxD+Hll35haW7+2QN8R5kOsF+2bKZ78W4QrDh+BcWvYutOiyshWtR5E3
         bG4KR7k6GLcTXrIfdhjNVPhcXTShQ4uZOgnTT5LehuBqFTinSxbTv1i++qgbUHXDc08o
         IsjBwae2DZEdIIfqbcMPbv0YzI+Izh1DaQOdYjyfiHVSWV8pCqHG9ghXyUuyDTmoleaH
         FzODn+5QmA9NCMvvtVPIJVC+OH+bP5mGB8wkUPPeQk+mbxlxa/JvLV9bx+0KTaAkGgyh
         pFpM7AQXwl2/FeyyxpuCI+GOnno9RpXgczLf6/lyq8Jex6WC8x61YmGpbi5asM+IDPHA
         zwVg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=rlTcj4S9;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.7.83 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fh4yA8/AwvUqfnEfXXShLaZdTnrP3EcmZkDVI/KBbAk=;
        b=NbtaNZ+vykww2UPcpyfHyG063wkaVNc2KevplXXZr6HrFGIPtuje6oZz44pf0EuH/k
         WEJ/gGYltdXDDnSa/dlzjLSr7vTukUFP+MrIfQRHzTmn/08I/j2GYKu+/Ur8yfKYOzU9
         aCxormQeijcmVjMjrUSxDhWKcT7FYYnXJs7poFixj394NwLX+DrarlhJ6TvEhHQqltRT
         YdOuxN/7T2z6ny2hNHiG9NMCCeHy2cyORLgd9IUrd7ljB7U9mSJ5tqJbI26Ph84gcSFb
         A92wunOMcK+mOnAjwYjADt7OA6Iv4uCiDpRuEulNII1Q51OTb+I68OzBoRQCUpTMKaRy
         Dvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fh4yA8/AwvUqfnEfXXShLaZdTnrP3EcmZkDVI/KBbAk=;
        b=UcftDfmyjb7xjOG0OfPPgaCF+1Lc1uiUz+n/SDNODXYRTRmQ59Cwp/dJil4os7bWeN
         vfcdVBDq2mjnyp8czvWyGrFWDDq1l4ZUreHE/cRtUrfzWLSFPRDrUQpwDofOjd4KIRx3
         Mgo30ZS9LvvIorKlS3j26IYr2quzHEMSw3gK2fjpzmM8WhD4vDaP0FnvSmt0SBpfQixo
         6mAlafbjQl8nWJaZrjQIcX3vySwK8b84OxFAbTw9d/TDzU2FQXorAZogCfn+/I6FqOJU
         cvyJRiIOAqbFMcLd3DsMe5J+6Wok9gpPSs1vCJY0KRcMtzlqgb/jBqQg8EgnRINAnVFW
         /OXw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf2zPGURpc8KwWMhf4UhUaRtF5DowgKzdIjYAI4L8325kFGo3DQB
	TDcKdVdvsHi9MLt5Vv2UCb4=
X-Google-Smtp-Source: AMsMyM7UWp0ExXa77fP+HsFMSMcnl/d1oSDU4A5cG7gv96F9wpgC9rB9BGlIikYuUcIoVAKfJkIesw==
X-Received: by 2002:a05:651c:1a1e:b0:26f:b8c5:6ea3 with SMTP id by30-20020a05651c1a1e00b0026fb8c56ea3mr19804307ljb.160.1666884441139;
        Thu, 27 Oct 2022 08:27:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:2034:b0:48b:2227:7787 with SMTP id
 s20-20020a056512203400b0048b22277787ls527508lfs.3.-pod-prod-gmail; Thu, 27
 Oct 2022 08:27:19 -0700 (PDT)
X-Received: by 2002:a05:6512:2290:b0:4a2:abab:a37c with SMTP id f16-20020a056512229000b004a2ababa37cmr17338910lfu.609.1666884439222;
        Thu, 27 Oct 2022 08:27:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1666884439; cv=pass;
        d=google.com; s=arc-20160816;
        b=dfxQxdVeTRKDWLyMlP8yS4G7Uxg9JNZtoOM3xfJNooxwnOtWi+Pk7YggrUgIB9dAob
         RuFqWeqHrfPY0puExU+hJF99HJxl4ArQ7RIOrEqEA7pX3tWS3/5YXaL+sUir3TozYEtt
         nxkucJ6JM34/HVZTk/SIMS4jyeDdPEcBiWyt5QvAJM9H4XP/Uc75rTgLjf4OvzyOvR/d
         P3RUSR9pCc7p1ta1F2oozqmRuMc2uIMtY96IcF3NbPftW7zxcBllA+oHWufFmfMrKglU
         PWWmeodChoYxwJ1+SaUtGgwDbptxtJfISHzeibMBW3yjvKmm2doNqfVRodEQxqNU3xSE
         e+3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=AHvKOiTpRf+ReOvwqRAj4GdyGWeXmc4Z+8zC4t6nt8k=;
        b=kqXSS1USQ+xwqfadNxoxGY1Huo6Ubm752JLR24EmmrjnG40e/Tn4X6eE9C4glbb332
         AbioRpHN8hl4zQytYf4GU+4rGsj2mdPx24Zgow6I5nuk7U3ZuzLtKjjzCyYwHlIDGxNt
         beP1TwDWzC/hrRt7DYlEqWEqzipK8HoyU0zk8JXxhK6R7nXa8ZVgZn99oFue1obgNR+J
         JwFoxVozSXCZB//JTR/Yut+/fzwdDnl1q8lir1g25GHlbiW8ExIaFadzWQGqgrMx0rut
         lQo6nDDaqZAciLFJl9HL3JtKP2Rw5yl263dwgI/TfRuUWmqLLKDSz7byqIEExKQa+Wgq
         rjtg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=rlTcj4S9;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of henning.schild@siemens.com designates 40.107.7.83 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70083.outbound.protection.outlook.com. [40.107.7.83])
        by gmr-mx.google.com with ESMTPS id s12-20020a2eb62c000000b002772f154176si31260ljn.1.2022.10.27.08.27.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Oct 2022 08:27:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 40.107.7.83 as permitted sender) client-ip=40.107.7.83;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLG76qlpmSAn3lrBbOqLrRgJgln/7WaM5I4WJBVORf3zXEpy8lO+8DXczF5hT3TnyOuGk/fyds6W5+Y1e3tf5fNHBKAGjO+JAywmshzbvF1kvNoZdYXbuCrmd6CO0nOtKGFMOPW/5drIFPm2cS+JKl5H4zoIZ1z+nq8+8S0sMyPCIjQvsCTtlzWNeG1YTn82ydQJUycGvLS6qOqu+BpFRJDccfRU/od5mRcpXqk1rlm1aijLN8wuR3lRmJI2aWVvi9Anl2NChQJ009TPr6I6qViGlFQ2p26sgOupNSaeSDR6LB+RvuQ5tffEyN1H9akmUb97cS6p7N59GS1WojPetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHvKOiTpRf+ReOvwqRAj4GdyGWeXmc4Z+8zC4t6nt8k=;
 b=aKxVy29kn/ZyD7nevj0vpmMc9bhuI4vmT1qyN19FiKhKyVCCaYG1YuUJxVWTUH3Jl6M9uNeT24yYqQW7tfuaK1INQS1JY4zkRCE5oZGcCly5t6G/F2h+GrV7cOrlakRArfZW8igw9QRzpDjMzi7x3N/h+n6Xd70qVjmd7Uwpv+nKXid58mheSDnkFDTGpi0G0xHTg67vYtiv2poyKyba76Ke4oLtB2v5jtOrLZUKNpjgp4S4SAR0dVKl1PqEEWcgPg48nup0DuO/34iYro+9F9IxQ66hynJQJZgDc5aMisLpfEKFKjQk/i3yYmxlSRbmPtYiy6sH79go9+dAqNFifA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:269::8)
 by DU0PR10MB5193.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:345::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 15:27:18 +0000
Received: from PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1cd8:9066:48b1:b1c2]) by PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1cd8:9066:48b1:b1c2%9]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 15:27:18 +0000
Date: Thu, 27 Oct 2022 17:27:15 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Tim Biernat <timbiernat@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: NXP LS1043
Message-ID: <20221027172715.1bbfaeaf@md1za8fc.ad001.siemens.net>
In-Reply-To: <480bddd1-57be-4f84-a285-dcb917277ecdn@googlegroups.com>
References: <480bddd1-57be-4f84-a285-dcb917277ecdn@googlegroups.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:269::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5780:EE_|DU0PR10MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: 784c1555-12b6-4e66-3ccc-08dab82fbbbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CT2TZvMfoEwuORDE5SYxYDQVvvZpMGxybMzWXjPHReaMPzh3HjbcvppI1Tam3hv2plS4WP8K8fZ6JgngIttDYnUPvVLhSIaLkTp1UKxcbCDCGV2xieMP0eHeCl1HuFBAyECM1YYoxIB+9k/7bdhRuzdb6xLjCmO14T/MxZhp0hvVBfUAxNzCuPJfWVjpNmlUxKMbEQKOoHOhinBdHC17/qUQPSFLaesYXMztu0lSavnvanqaD+WHRTQAeSHTydY4VRUtdh54LT7E/D12HyR1t8/Un++tPkrtADCvG970vE6nXWN/7fNZXqUWThHrRZWhxrJzokvH+prsw79wa+Ju5mxpkVNrgoPfUCOnUpCkeaes7JlOMDgvnKHpLnLKP+vLC5q1ldng3+CDl48imUbkmAPqiKYxdQTW5kH3MEOjxRg/Hsonc6CBTP8HK0l59QKQn40UZKvBdbYiK/Cfmub33l4BTZ4sG8SYIzA18VEaVA+97DgKc6KSyu86puKp3DBnBt/6agHg68BnWu7MjJKOmKt4K4pHI0BeLZqT4Suf2IBviKYuv2hkaWr1uCk7ljHmAQE4Yp4FK7ZQePhJ2nTHqEde+S3NXSLoKbK7M28u+YSX0OYGSzF/d4EHlOQTbaq4ELesorrbdxP1uPTZvDrSrKmBzreNt2mzDl2Fw8Cf3zl1hVEW5jBedjHlTvmySFiB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199015)(86362001)(82960400001)(41300700001)(38100700002)(26005)(4744005)(186003)(1076003)(6512007)(9686003)(478600001)(2906002)(6666004)(44832011)(6506007)(8936002)(4326008)(6486002)(5660300002)(66556008)(8676002)(7116003)(66946007)(66476007)(316002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?emDHSVUoQ8EakCx/Jq5/ybz7zgOEW2NrXWSnQMo329KEfZ1x3dfbMyOBr8bj?=
 =?us-ascii?Q?t36MouHnKvaXt2PueMT3n4ADWz2zgCu2Cj1Z1iJLJ3LDK/7efRry3oqu25ja?=
 =?us-ascii?Q?H4ZwhkgTYCPluIhc6bjlWOzekSOOjNnoAOvvwDlWY9hbZFi+vuz4uA3Xofa1?=
 =?us-ascii?Q?inBcfPTt2LkTrMXypv1gkjBzn+kbZjYlFk4leTDktHi19BOvXsanWxSg4Dyn?=
 =?us-ascii?Q?v74POlDmbx7057YzgeClfUq7rG9CebTBKQC62bH6Dn/jB+crus1cveJqyGJA?=
 =?us-ascii?Q?T/DeFI7kScckIOu4/UdHaukJAH979Yf70j+bwiL2XpkBY6cRwS+nJHwHzh1l?=
 =?us-ascii?Q?J5hnPCKsXM1QtOcp/aH+dhhTuNwsPFOxkill+xa52GzsTw2yrTTdgsLlY6OP?=
 =?us-ascii?Q?K7igG/ZjjNEPTulXUDniqtDfxMZt7fFx1DJ0X+eGhAOKxedp1uE5eMexwQow?=
 =?us-ascii?Q?vBGuURZQ0EwDPp0wAMjK9Om3oHeNcbcTbCGNN0cGdBbjkIoBFgjHLXMu4kho?=
 =?us-ascii?Q?SGWMc5aGUx+/R3qnI2cMipJEZPUuO1f3TOBlwtYLFfq2YCeAgy+FTLzglPFc?=
 =?us-ascii?Q?QPe3ptVYHqgWPfM7SPnmudDNEvQBNY/fkXFsu0BXz63AmQQRs5rtBRngCLc2?=
 =?us-ascii?Q?flwWVslEn5QbH7QbCN9HmIU7CvV+bnqcv2QS1KPnNVanaMZprYzHhTjaQYX0?=
 =?us-ascii?Q?nwbTWI3BYoucXg63/JitYsDP4rcRaYvG5pPKYfcPOo0FxWhTKbju9AYBkmc5?=
 =?us-ascii?Q?7kIyTzysDaxH2Vke/Kxl917RbtlA0Crbe/PGn01HrHhNyHvrjdzHDqbYXLWl?=
 =?us-ascii?Q?rew9BC5pImuC4wNaMdkmBJ1OFZ2swqBZIPd8Oky6It6U0m3XIyQsKPlnv6d4?=
 =?us-ascii?Q?YVHyjgWqaINXS4+0po/lfoshMzq8874X5QHlFc8kSNQj8UE6oefh1Os4k/wR?=
 =?us-ascii?Q?NUafJ8Zh13n98On7L0ZPmUJu+BBskuggZpoci3PJdax5S4bw5P2D4c/FjH44?=
 =?us-ascii?Q?twUgMTdsdEkbPfaYcuj9lrW2XEPs+PUSOyr1UC+lRM+IvSbLW2I4ZMvS1oIS?=
 =?us-ascii?Q?mNzLa1AqZI6dlR6HJQjJblp0RYpBVrdQJn7jsNxsHXhmqcdtM4xbF/4mZ6Pg?=
 =?us-ascii?Q?0BxL39tKYZOc+rtk4lJedHplHxAhbS9E12s3qC4gJQMknlYy5c+Qw3cpflma?=
 =?us-ascii?Q?W3dKSMhw98TOSaomcYD2X+JYR5Bxufy0apijG5oFFz2mf0yI0AbSqFVuIUHz?=
 =?us-ascii?Q?WZJclJPkqAuMqjIx936LPk0Ac8ZHJlXJT7wbKgj/N6jGfifRoJRFqvz5fuLB?=
 =?us-ascii?Q?2FUNNgLrywz4cxS3EsQzAjCDGfcd+WgpP0Ni9j1kScQdzOcH5tSkMmvYxZG1?=
 =?us-ascii?Q?9ClXbBoqK2kfK8EreWpYzN7WhY3N5lOP2669tdYMlm7AW45s5XbkhaCvBywq?=
 =?us-ascii?Q?A5wKJ42QD47fU3G8qAV1NwLRadyw3ORpKImFx0LJIX6PBmw7ct3mfe3iTc3S?=
 =?us-ascii?Q?29o5XPD7OZvhCsVId9ZGAOIcouuZokJrVZtYT+HipD+7Xc1ihL/bzU17iGpM?=
 =?us-ascii?Q?cNja73eFTFvOMgw2hlhWtSlJyuX5GInWkA8u+FCKxq3PlOW98HYVh17t0wBN?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784c1555-12b6-4e66-3ccc-08dab82fbbbe
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5780.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 15:27:18.0064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yilQlv+vk2TZ1s6L2yDSXcLjfurwss/bZ+MXrrk9uEX+iuGvoumy5ovts5eJkkITfhqZ1AGs3k56lntULvlslaVKq2UrsCtaytcSzVlbg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5193
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=rlTcj4S9;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 henning.schild@siemens.com designates 40.107.7.83 as permitted sender)
 smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass (p=NONE sp=NONE
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

I ran it successfully on that board years ago. There was some
collaboration with NXP at the time and the files you seen in the tree
have been contributed by NXP.

So support is present and good. However DPAA can not be partitioned so
you get say ... 4 totally independent NICs with cells that do not need
to trust each other. But a cooperative sharing is possible. Like a root
cell gets DPAA and a non-root gets a vNIC that is bridged to a DPAA
port in the root cell.

So both have network. But root-cell can see traffic of non-root and has
to be running to forward it.

Henning

Am Wed, 26 Oct 2022 09:13:40 -0700 (PDT)
schrieb Tim Biernat <timbiernat@gmail.com>:

> Can someone speak to (or point me in the right direction) to the
> state of current support for this board? I see some config support
> under arm64.
> 
> Thanks in advance,
> Tim B
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20221027172715.1bbfaeaf%40md1za8fc.ad001.siemens.net.
