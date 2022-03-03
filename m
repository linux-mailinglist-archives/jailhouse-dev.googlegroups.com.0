Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKW2QKIQMGQECCX7A5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 287224CBD35
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Mar 2022 12:57:32 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id 185-20020a2e05c2000000b002463aff775asf1813484ljf.17
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 03:57:32 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1646308651; cv=pass;
        d=google.com; s=arc-20160816;
        b=MQkbKS0O2yqqj0AyDXT/ZIp0zqVhIceOJOZlZsvICP1KY58NUvhDMuhaufemVHbwXp
         vsvvuQAV/4RuWwCQNs8Mut73QHwWBeuf0O593V5ZCqDpN/WsxAnzJLlZWA8UyMt0lp5f
         jXa8Q1UJS9ZB9b3gGGSXSvW9yjXKoElsKUh1z1p5nzuwqLcjudfn9C5gQsL2s5ZDBCJS
         QW5NOTgqyrwA4sdghNORUUPyR9cfvBdiJBLgF6noHEMyPqdGNzPkZsQ178Zxo2aYA9Wv
         8eXU3sItGPFjdV99XTzuAedNDdiXtuennwUBKZQi0atWqxxDMyverQiqE8PRPi9983i4
         EMlw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=xtGzU9ESB1oO41XRMCCGXf368PTk0ntLOfILJu3p0Mk=;
        b=GMbKmwV0kwV0jFZbyo/+sGp+3D77KlBIesCW7PIKMx7IhZ12n/c7heshHHK2gsIq5e
         qKu8NjH3HVSYcW+5ltIsVvQuVXMKm/Hiul5p1Q05fFIM6Do/9Ocu7ZRRD7LZ2EL/Ax/G
         bW4NVaFcVA0gPbx/i5Q72kQjQRgFZ3KWZ7yLB8ByfE3SAyASdjevKpcwdx1APzsLxZCO
         xGvOCW4XLo6sGkEuCbfW/AbdZEr7XxwjGWVGk7G6MtHtQYOK+jmdbbp5ILmjIyX4kcEg
         0cgj9HT9JkZcf5U2csV5jKIGY9tSdNy5l+T64QBNqAKgcL/LHieDaElpX7ptowYKxM+b
         iiIw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=TWn+UPb5;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::601 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xtGzU9ESB1oO41XRMCCGXf368PTk0ntLOfILJu3p0Mk=;
        b=jp8w3YkJaTTqWNJwF3nR+WkLjndgLtRbYlbWPo8peEs904t4fVFvZtI1qMEFo7PfCC
         VuThySMrj66LXU2rDyuBOlLR71CCWL0nwyShcQdpxOtyTy1B3e916EGgdyMpAlRv7xsv
         d94myzAwIq0xsjfJ3eNQOm5oaqaQMJPB8CgTe8QvbtTneGRTZMG9sy+/C3Uj6H8qA9dT
         6D+2WVJoqixCCJ7xxpvWCwNNEuICQMkycbFVsElz8CaBD67NdIx9okreq+RKP+K6pFvq
         jiU8gZx3NRgRPlT2r8q/KJeW0VV7kbZpwCZWpeyzcAjYZyxANorFbFvDhKx7ZzYrc6Tx
         9Geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xtGzU9ESB1oO41XRMCCGXf368PTk0ntLOfILJu3p0Mk=;
        b=V9fJ1obZJ/naDTkTHKqvuzn6ild7dayOIOlLL482SJHTsMDatA5x1BkZzTHKHylrLo
         4cnZ1DVoICcKWToZqiLvpO9fE7Y0/jTKMbnSBiqW93EIDc9Uf58z6+plCE7kVLvJOpcM
         aq4RzfE+QDtldTf8cLBu2W997Kqs8RnW1bW42Hr/iQO8g21NRbTCfCcBxDvcUsWVclEB
         TMBLG20j0fSyu7U+zJ6FPdN5Bmn5WHXisyLLqjXuzIjrHoybRl0wZNjKR4y/T1ps7WSS
         uM5ImMO8HblT/5l+ptEVq2DUUjbkh45uVeJOFjf/7vhDFr1b7RG6Z8obb4wuA7+yS4E1
         X2NA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531UgyIcBSb/5KdpV6EypqOkpquMBCUudYAzF7iDyTcqofWPEAhX
	HnLXZclM7f4yn6fGgLykaQs=
X-Google-Smtp-Source: ABdhPJzwdD4hY3NCbxN6zhLpDcxFDnQ5sbGf6lKMphSVExkibCwSjJmOt6cCaKwywsKn4/RNDvoyVg==
X-Received: by 2002:a2e:824b:0:b0:246:1246:d830 with SMTP id j11-20020a2e824b000000b002461246d830mr23644636ljh.267.1646308651666;
        Thu, 03 Mar 2022 03:57:31 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1a13:b0:246:6680:f7ba with SMTP id
 by19-20020a05651c1a1300b002466680f7bals247890ljb.10.gmail; Thu, 03 Mar 2022
 03:57:29 -0800 (PST)
X-Received: by 2002:a2e:2f0e:0:b0:246:1a59:8f04 with SMTP id v14-20020a2e2f0e000000b002461a598f04mr23620694ljv.409.1646308649822;
        Thu, 03 Mar 2022 03:57:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646308649; cv=pass;
        d=google.com; s=arc-20160816;
        b=c9bZwWYIxjCWzGj4e/0OZLesy0al71GhVorTS3SgBOWTQZfJzyLXEG+hXXFBod4Vg1
         Q0q4KrgPsmcD3DsW5SFQC18XbiWa0okozMADKsgYyLdBmCUzZEMqO7jgoyXGJ/Fa/TCp
         sUtxtGHU6UigbXhVCOmuqh9WNvzpIr2udIs1+QIZ0jTQprvmrbr1xkrOnNjT61mDMs4H
         Tzhz9cZgvKqC5xjZAlTor7zYJyGdImYql1Jdk/qraqlqRcqqtSwh63HH8P6Fmp5HIR9y
         guKgrS1koEZhNKUc0s8J9Xbv3p+l77WB9929BTYjsrxFBKkbFF9bBCbdiItsd/FOtknG
         H4Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GSFqwYAePF3FbHMV5hyTUDSgH8UiDV+GYLd0EaLRRfk=;
        b=J6DLU4bktpz+O1d54lY4Al4lTm2l9Rw9GrqHbb8fc4VShUkUktSfduAHhsyLUrRvS5
         +yW2iLs4+dXkCreAjWBZRV1j1/kxPEN89laWJlC59kHvT2Ey9uz8ik3APYiCz7SG8F+X
         dLerDgwTwTxAGn7Ffc5HNUiwSbPr8I6QaqfHJNEEGlHykQiIorgTTuwTsfBqkWqYQkje
         9Bi1Tw8+sUHEjF6T9n3XHZYHmWWVtCPTiqbmx5qtDxaA8wlRUChdKqaWlu12ac6U3axg
         T/l3DsRFIXwDsYR3lV5gjMftotrhwX5+tnliZQik9PkL+SNTrQBHSSsOrQLJA69J+aIA
         OtWg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=TWn+UPb5;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::601 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0601.outbound.protection.outlook.com. [2a01:111:f400:fe0d::601])
        by gmr-mx.google.com with ESMTPS id c9-20020a056512324900b00445b1b2cf5dsi103634lfr.2.2022.03.03.03.57.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 03:57:29 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::601 as permitted sender) client-ip=2a01:111:f400:fe0d::601;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiPSlZWIQ4yhZWEdOPraiOKTc/l7Hu9qwSXGl9KRrRj7cAukTinkjxFXPgaUIv2b5FmntU+cBKXzcE9HhWZ6RGbjmZDhRnyu4pZjWgMdUdVWnUJ4oZOjsA36EPnelrACRUqQ2WUZX57VUeiCgd5Fzumkmp6IgM7FRwHhyhBNKQ1xJOhMqLBouKG9gMVG89RD8QY0eEnpqQQPpXPJ3Fio4YK+VKaXUJEbrl79cV7jPOk4rt6n7upA/0J60v0e2xRRJqm09fD7/SohpwxJAwuUq17+jgmCpujwqLUFbw+wR6qTTwTkNmScVdtFNSQ8SJDUlbFB27O7KqF/g6TuCNGJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSFqwYAePF3FbHMV5hyTUDSgH8UiDV+GYLd0EaLRRfk=;
 b=g6pUs2iQTyAmcvJ9puN40yJkHwLH1zjepzZOoV4ahHsssnx7k4ZET/xxEe+dB8odRetMJaHxIrssrfsOwjljjgLWcX9fopLHwgonHGsxoINvlKwBKXDv58IQjpKEhPBuUVo+pT7PChbzz/65xF0eUk3OAHzAyx3eJxBPp9gghzUz21s+1tJwiaw0NutKcl6S0En/1HI2gFYb15nqWSnYw+rW8dS0z1vDMMwlbAbqYviqfYYFGjp7jhSdt0b6q20tFGCRk141kwZrDFk4W5x5f9YYiKh1OrqtoI8xuwSvFI18003dCCWeXBrc0UMVt2nw0IPPuRVFPUG1VtEWz0xAig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=oth-regensburg.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AM6P192CA0035.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::48)
 by AM0PR10MB2177.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:d7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Thu, 3 Mar
 2022 11:57:28 +0000
Received: from VE1EUR01FT013.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::a1) by AM6P192CA0035.outlook.office365.com
 (2603:10a6:209:83::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Thu, 3 Mar 2022 11:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 VE1EUR01FT013.mail.protection.outlook.com (10.152.2.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Thu, 3 Mar 2022 11:57:27 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Thu, 3 Mar 2022 12:57:27 +0100
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 12:57:27 +0100
Message-ID: <33cd5f6b-5735-e8c0-b161-9ced86292b29@siemens.com>
Date: Thu, 3 Mar 2022 12:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] README: arm64: disable ITS in qemu cmdline
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Stefan Huber <stefan.huber@oth-regensburg.de>
References: <20220225142929.385616-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220225142929.385616-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1e7247f-6f86-4768-9a55-08d9fd0cfd45
X-MS-TrafficTypeDiagnostic: AM0PR10MB2177:EE_
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-Microsoft-Antispam-PRVS: <AM0PR10MB21779F38589CDB93887065C395049@AM0PR10MB2177.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQT+k0kCiilMA3HdzDFLrHg7LyQo2CyarPYRcJhypDSkv7tMxw8FqLKm8U52yLlmvWtYkCOdJnE7WhQG4hoFDfCsnObkvsIDqjzSKQ0DgUiG4KgMVBd/PckZBu52fs4TR1h9Qme8LwDa3dI5otjVKjGqXDMorIGV+HfhTMOuhsGRQnCYPrghMC9olqorTtE0dJmvNAhdlV9T3MHcyz8OgPlf0LUnNxi0PJ6MkzthpVPGuRd7J+gq5HVo7xe3s1H9Gpo8WbDr7/XtO3rjJm2T/YNY3Rj1p2U8pcl8LKeiPPgeJJ2x/wROMlLPEB1zh6tsa4o1U3g8KMLS8Jq8WXcudIkKo8nhbsIdBav69i9+L5nWVzYwdxGHraxs6ZQZuWIvLVGF6Job4r7xqiglGkRMQF0MhPOSkKEyJhHEb7Dxf4bus6G2znZdpZWBMfnAp8SUGIe3u5IRcmbqry+DOm983/AWiEcN8pq4Hznc2yQMsDUiTKqQcb5usZSGTFkTAOezVJ5sPHPBnho8tdiG7V8pra/50+8OcudalA20nhyg6VIDrRNokmwMjXo/1oqtwytNdIPNyn3enWiDIKYGDyOU4Mo67qJi9lJW5jnKQZkFznmYybr3v9mfH8HE16Bn+5DzHqRgBENwrFpUEwng5Tegtd1hFAy2s+FiiaIZyAIQuNCv5qjECirEzHrLQ/VtNe0JTK0VdpnFiaW7PA9uG1RAxuJOwdP5xtG0cTIrLxjmYp27JJMdXiqUZGHmLLQVSSaa
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(4326008)(47076005)(5660300002)(40460700003)(70586007)(70206006)(44832011)(26005)(336012)(16526019)(36756003)(8676002)(356005)(956004)(7636003)(2616005)(7596003)(31686004)(83380400001)(82960400001)(508600001)(8936002)(186003)(31696002)(82310400004)(2906002)(6706004)(86362001)(36860700001)(110136005)(16576012)(53546011)(316002)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 11:57:27.9748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e7247f-6f86-4768-9a55-08d9fd0cfd45
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT013.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2177
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=TWn+UPb5;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0d::601 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 25.02.22 15:29, Ralf Ramsauer wrote:
> GICv3s in recent QEMU versions have ITS (Interrupt Translation Service)
> enabled by default, which Linux will make use of. We will crash when
> trying to re-assigning a CPU back to the root cell, as the root
> cell's Linux will try to access ITS regions when powering up a CPU.
> 
> As we don't support ITS in Jailhouse, disable ITS for the moment.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> Reported-by: Stefan Huber <stefan.huber@oth-regensburg.de>
> ---
>  README.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/README.md b/README.md
> index f1b0cbe3..b5937300 100644
> --- a/README.md
> +++ b/README.md
> @@ -365,7 +365,7 @@ Similarly like x86, Jailhouse can be tried out in a completely emulated ARM64
>  Start the QEMU machine like this:
>  
>      qemu-system-aarch64 -cpu cortex-a57 -smp 16 -m 1G \
> -        -machine virt,gic-version=3,virtualization=on -nographic \
> +        -machine virt,gic-version=3,virtualization=on,its=off -nographic \
>          -netdev user,id=net -device virtio-net-device,netdev=net \
>          -drive file=LinuxInstallation.img,format=raw|qcow2|...,id=disk,if=none \
>          -device virtio-blk-device,drive=disk \

Good catch. Is this feature flag understood by the recommended QEMU
version, or do we need to lift that lower limit along this?

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/33cd5f6b-5735-e8c0-b161-9ced86292b29%40siemens.com.
