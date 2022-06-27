Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5PH42KQMGQEXW6OJNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F7755BA1A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:43:18 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id bp15-20020a056512158f00b0047f603e5f92sf4709579lfb.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:43:18 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1656337397; cv=pass;
        d=google.com; s=arc-20160816;
        b=NGkCxhKlwcspKLR1hJJf2NH9v9FOEZNLWmH//hnm79EMtJwSyIm99JzmH058UOVDP2
         ZWyDQYXJcxAgECsoUwVVPDFh7/wt8ZEvIMrsadoc94CIzgzA+DOx1Rqb/etxo+mOC36o
         CHBVFVOPBflKsuMB8vjULx1E4EO+FAI6yn9ha2dgThvQzY19f5kncpEXpoERUlw1U3P3
         AQ4+xW/vFIEBhRQV3Jd1fJNu4AIugyJJFSeyaU1s7SvE1DAwLOZEFXZ7aDwer/J8usXD
         rTFYoNzOCxHI5ItgAJYZE/4WZCwvlhQ1QQf7UECvCCKnbyTgctLC23iJNBRjd5BY9Jpz
         4ZBw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=j9KNbS1PQzJgtnACiobGiQn20/VkAMqvxPEa0z5fesg=;
        b=CBEEd8B70rnnEf4DBl5ubX5o8nojMIIT9GZjj4ZeDqKMDmYlkZ50Pd0+jIya5jZIcZ
         NXzGX57axNKJ/ca5TB0BFBrkAFDmVREooysILtk20aoO4EMPXYkk7CkpzucCQJWk+P44
         EspbiFEOhpH8I4Ry0ENd2hsIHXz/8LEIeVJ/Q0JTXYSOXgMhdirmwBdwKjusy+RPEgJO
         L3MaZcnf1NXcLlC8tM3Cusjb/7GojuquyuIorI7dwFybdGXUn3TxNKigISi3Mrg/ngQv
         CbXrphkeNcGFQ4JmVa6qB4KnM8TSvFU9WSeSSJ6K9PjaotLN6C1+aWsVZ0f0tie8MzwW
         NIsA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=zUVWP6bH;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.3.67 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j9KNbS1PQzJgtnACiobGiQn20/VkAMqvxPEa0z5fesg=;
        b=G3hO3Zsxk0udjbOEVWOqo/oirCQ9+dLJ8WnjR2QaCL3MF7TSFrRqXZ4QhEbBB/i4P/
         /ApiVPtJCk8znrG4uTAMODTL097U7mHH7QaT7aCLJWnSo7iTk/Rh7+koHNFHg5PfMsg5
         5jYBN7f9F05Vft6Nj/cfNF4fIrTq5h0OkMB5YkwFWXyKBH6GCtg3JlIWLNp40aykznis
         SZsfbR5+C8ofLf4FfjB0m8fiM6ULvgVWBWb6fXeB9cw1Gb/8k1Ad9cbQZVpXsojzwog9
         gCUQXj0wP8+EPY3ytts8LG5jtVIL+3ThIG49SNO5Vc9KHV0I7qh8lLlU3VEku9xslpSN
         Jo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=j9KNbS1PQzJgtnACiobGiQn20/VkAMqvxPEa0z5fesg=;
        b=ite1adb7QKbdWgObGYMzlds/DtDnmvUlSF2/3UY/yMxcrISRhuNdRS2TxS22Qf/5Tj
         jYtmsT3c+PJ9z1vObM1C/3wcApdTkVLTRWuraW0ewgqDZhq75qWxZz60WSeBBSdTXdGc
         73VktnYIwHgDofKz6yZslD49umINZ5bE2D+2N3f7h1GoGdwYHvxEsUVQ4czqibHYvFmN
         ZjCvUKmmFgLBJcjBp462XlNDDtKt5ahNmZJDos09xNu1osbgGxrBiwTri11NJNn8dCZL
         6QmAaseuF2WKgrTJEfS9IXDTA7XmCCm1BgpTb7e/VUWccT0pyC50FbH3kLBRbKRC6nAd
         rdNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/K192mlElPpMPDGbUXJW+uwE5d5WB/YeVFeAfEPVpnqNC+jZ3q
	NDWvIGmgi+i/drWlE/5TA4E=
X-Google-Smtp-Source: AGRyM1v82CJCvSo7z4DGQyrPuZLfbOrQBs+eD7CqGZeGRu4ACaLE91Eem8Qb0RjRz3/PKaUb0GlEwQ==
X-Received: by 2002:ac2:4a63:0:b0:47f:9e6d:603b with SMTP id q3-20020ac24a63000000b0047f9e6d603bmr8378528lfp.404.1656337397652;
        Mon, 27 Jun 2022 06:43:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls246595lfb.1.gmail; Mon, 27 Jun 2022
 06:43:16 -0700 (PDT)
X-Received: by 2002:a05:6512:1050:b0:481:d58:c1c4 with SMTP id c16-20020a056512105000b004810d58c1c4mr6354909lfb.518.1656337396033;
        Mon, 27 Jun 2022 06:43:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656337396; cv=pass;
        d=google.com; s=arc-20160816;
        b=frNVPHBQtwfvg60rmgv1383doClQLVtusndISjlAMJR6KzUoG7JlKe2s/bvsvPXsNY
         tYr3tmFy3hCgykMqxBznoSPOiPuYNHgWRtyJqDNLRBGKZEeilqvluVwCjr70M9DOCRsu
         1r8k8mYZA8P4avTKT4ll56ZNYyFvm0lSvd+Ijq00ViOKUyZfWoGZWgM0PwWJxyuW5hBo
         c4xi/s3j5ez9Gxkvi90H07IrE5C/hPuJcaDsRrNYB5DzUTDt8cCXFZ6RHF3LjFfQTv/K
         6cwnM5Ct4JwXARMsug2eBxfDzKDXo4WJvJBiPp27ZbKOYvf/YvCRJq3J1fM8exSHkxI4
         OTRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OQZeAlk1PZOt6TG0TV4DK1OC7ogDf3wTWqGZAMYxZqs=;
        b=FDNPGKHi25a9tjIGV7c/VvMQOc8+1kSbLVv/4XrHNB1T2xB3Ni4O9amiY55QvblkR/
         dQUgVyxfx+ED6r0oyL80LqPleiFGLnghjUysx1gqP9ogkvmAoRnbwHGJWqLv4F7rGX5j
         vfM19jP0mq/VtsGCV4F8P9z5pcqa+2FupkydKL05ml5/KvfJvvTViappBBQydchhhfLi
         pzavfeiVutu3ABiXH7p7bafZjrjjBrKs1AwsDJo7Oh1+pg4IcNWKgkmuv5/cLQi+SNyh
         HnZYhVaknv7ize7oUJS4V2oX7qLNJfE+E1RCD+2heiBaY1Rtqyi/TbtigT09vvjHMRBb
         vOiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=zUVWP6bH;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.3.67 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-eopbgr30067.outbound.protection.outlook.com. [40.107.3.67])
        by gmr-mx.google.com with ESMTPS id g14-20020a0565123b8e00b004810be25317si194795lfv.4.2022.06.27.06.43.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:43:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.3.67 as permitted sender) client-ip=40.107.3.67;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsgw+FLvG2AGIwJoCSGVvxF36IJtdXeIpJlg0Kw08gDJoi9b1b7Y77JtNwFYzQaal5r7u4PyqLhOYoCuFR1pSlLwO0uiV4+JAkFQHEk0ZnRBkD7eTJkhPwSfUtHf7hh552aeyYTtLY/nI9WSjlm9P3zGsfAtlEUc4Wxo9RmpWWhqzvuEH2p6BAAoRLp02adu0Pb2jcE3iFJ09MIeJUkEKeqDGu4uMcuYyX1sVaDgIkpFBj2mUe0Ih0fzDq9qy4P6TtPoIhWF3CcA/0SiWUNTCHXOV5J8nnbzcE5SCfJWvtq+8S0V0At5OmdOdn9z/OBJE6YFSKwdF/OKVr9HOD/uIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQZeAlk1PZOt6TG0TV4DK1OC7ogDf3wTWqGZAMYxZqs=;
 b=O3ihochCvb727q5O1jaRusaHvoRosReKVbvt3vg6F6bF0OyOBQVO//Wmtig/kx04eE+w4Kno2YVcuihllBK0blS4V+xO/Y1u4n2PXxm3hea2iBBoIE3yXguceETrE1Yj8FjgNianorCeVoTTvhDKgn23845gV/prZlnS5dpda1BWZM9mtRhaQIP0F/sxcdCdb3qGAErMfgI6E9hk2eBaAKYDZigOfPoiHvxwtebdYFK6N+JCn54HeaGmU0nHxSHdu6niTfYOWcUGXAxol9qjM3taqujBi76sUPAGsWUAX8sEfvvNt5XqoAbpbR3BoKV7J1XTNoiENv4ocBZPJDI4fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=oth-regensburg.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from DB6P18901CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::19)
 by PAXPR10MB4915.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:20a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 13:43:15 +0000
Received: from DB5EUR01FT032.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::1e) by DB6P18901CA0009.outlook.office365.com
 (2603:10a6:4:16::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Mon, 27 Jun 2022 13:43:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.70) by
 DB5EUR01FT032.mail.protection.outlook.com (10.152.4.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 13:43:14 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Mon, 27 Jun 2022 15:43:14 +0200
Received: from [139.22.133.104] (139.22.133.104) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Mon, 27 Jun 2022 15:43:13 +0200
Message-ID: <bc6248e0-accf-37e6-6318-805220a390cf@siemens.com>
Date: Mon, 27 Jun 2022 15:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v1 03/42] core: riscv: define MMIO accessors
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	<jailhouse-dev@googlegroups.com>
CC: Konrad Schwarz <konrad.schwarz@siemens.com>, Stefan Huber
	<stefan.huber@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
 <20220627132905.4338-4-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220627132905.4338-4-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.22.133.104]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--12.578000-8.000000
X-TMASE-MatchedRID: dzgRF5KJYaM5QaOxwNGfvo9bHfxDWoibWDJ0p+dF/mmTCCj1265aF3iy
	wgNDw+2o/gMNehoKqTsZGv4AAiyPcFGpmZbgd09fG9hXqmQ3+OCeSiDxtQORDW5eAiqrqZDK9FT
	709M8dJin7m/OxjmYo/D+6IQMRxU54vM1YF6AJbZFi+KwZZttLw0nL7ev9Tv6avP8b9lJtWr6C0
	ePs7A07QsfaqMZktsdwCwV8dvEoOEUT7C3ZwuEx78VH+llN9VoiZPH+0TPT38=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.578000-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: F0921D2393AE2BA731D4E8085065583EB1A36FAD8D188936C85EADF8374A0B112000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbec99f8-8019-475b-35ed-08da5842fc13
X-MS-TrafficTypeDiagnostic: PAXPR10MB4915:EE_
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aegoNvj+JruF/nqs2tYPqmKCpphlJQTVZEAbllQG1iRU3Hc+FLfejU+ZzVAyLxan7iaO1qF03hsE6nfZDs2zN2IyUFY3baHS0ojlQM5OHKHamwhK9ow7ew4sArX8PTa45vpihoCOmQSZwzEKqEfVhabuPBqByRRgBjLxmUP5FbfZjLkeJGwJ0FJPyZ7X14fZgQnw+/4CIjfOI1bZ4SAVg+9ORlzLxpU8hYB+NudlZS1o9GglCpBpjcjaCotTCQmLHQYpKN0Yvy+kH8F5ZEnerINVKWy5AW81ZoUdiAJ68DnxIuZuWfxuOTXT7uREMDyWFzALJuIj0Kg0nX6vRNfJml0oUKkQXNlpsFk8nGk7oLDel0oFw7MoT2YN8+VyporEvyvpidnv02o709DqFt6v6wGA7TQB+R/XJxu8PiK/uAgVom3m0Vo15p7VG9oKfEi1NepRXRH1IvMetGHSdRj6rYwQxAh9Fi+o8l2at7RF02CT3T+p+cdGx5LPh/JtBdS9iIWYziJHevuK2Oi00f0zGRfcCcJfM+lVBYAnu3Atl5eUeS+8zBx5YvnCPaYE+MQbZ6wCVLes3nFrN0o9JSYh77C6UxHFOm6dCTSsbduSk18oJla/r6WBZxZdU9HD2mdClBC6iMBLhrlzVpMWi+sig3UhQ3B1ugKtMVddzwFRRU4In9EEaRtCyI6PMsXUwr1YCn9Z0A/Bao3jqrIKP10RhkNoKxpZw+pEMPtQ7vZhFMt/8rFaPYonhXlH2pjYvy6DsTyMlI0e1SICUdRQ8elcXZp6MuVLtIIkXr1+JTn6FLL8jK6UjukTTJhyra7XgigrEtW+9u7Kei1WZ2OKezU4Z7HDFwO8U7/6Vbc9dopve1M=
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(39860400002)(376002)(346002)(46966006)(40470700004)(36840700001)(44832011)(40480700001)(110136005)(6706004)(36860700001)(8936002)(31686004)(478600001)(5660300002)(4744005)(83380400001)(186003)(47076005)(336012)(16526019)(40460700003)(7636003)(7596003)(2616005)(82960400001)(70206006)(53546011)(956004)(356005)(26005)(31696002)(70586007)(2906002)(86362001)(8676002)(16576012)(4326008)(316002)(41300700001)(54906003)(82310400005)(36756003)(82740400003)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:43:14.5924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbec99f8-8019-475b-35ed-08da5842fc13
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT032.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB4915
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=zUVWP6bH;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 40.107.3.67 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 27.06.22 15:28, Ralf Ramsauer wrote:
> GCC may emit 4x 1 Byte reads in case of our regular mmio_read32
> accessor, when used in combination with -Os. Yes, I've seen it.
> 
> Define safe handlers to overcome this issue.
> 

The kernel does something similar, right? Worth to point that out then.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bc6248e0-accf-37e6-6318-805220a390cf%40siemens.com.
