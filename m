Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3VCW6IQMGQEZZZPWQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 073174D74EE
	for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Mar 2022 12:11:44 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id h4-20020a2ea484000000b002480c04898asf3866928lji.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Mar 2022 04:11:44 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1647169903; cv=pass;
        d=google.com; s=arc-20160816;
        b=RwDnoyPPLg0tBzPuzyze4eBWVDOtD43a8J4xYGonnHrpPc1k97TOiVrAYugZqXkyPn
         Cmufvr9fnxUQJzhI9Xbpw0LR/ksBBcoqgw0LQCJ1TTWtD2m7vdyLVUWfSByztL0Rlm6U
         7GIG/veY6/UJiPt7Gkt7HZTs4dKw2Gc24JaifKd6IQHfVulXfKe8/R6J27/6v3uiVXrB
         tPaCGQzvXAFNY5hYuBSPkWqY2SwIWBXL4Z7eSujqPiLfHHBQd5dgqBWaI6IHD0VJRXAQ
         erN2quIAMLkaBojzNp4XGv3TPFKY5Lg5mSNE80ERhkN88O9BqYM7Q4kqi3JvqfxxwMQX
         P7Ww==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=aunj0N1NHC3RJ0fKGKijrzjm7kLilQs4Vcuh8OvnBoo=;
        b=QX5xrbgeC0w3fQoY2usj9PjTFNTPGp+YEdl4CcpyySr5B4/1RLzPQ5+sV9vQyxd0gj
         8M5ogzSXOunGTDOndFxrLzhFR0NR21EiMTuAuAHsHwKcBWSH9iZa3muzrDqv/pKr36FP
         q1SXSR+yJzbCd9+OV+pCktRQCFOkKNLQ2a12l7JVcjFL/mvhhy+a7AWyS79DxLdpIMSj
         ni0SFq+FZ/qb2F446OGs1QUGBYvy9FAhoz57lnIzINGmfe+6bWsnmDZrZx3ybACl56S5
         TUdWas8qlJHzVXIZCVei1anMN02JSQ6V0lzpqbvwkRo01eDUo/TGDGXLpWcBSfUuGAtp
         jNpQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=o0BUhqqD;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::61b as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aunj0N1NHC3RJ0fKGKijrzjm7kLilQs4Vcuh8OvnBoo=;
        b=gsI4U24W8zQ9x8EcaPMp5vhCHWFssuoKJWc29612c4Q/b75JqJBLaMqF4j1txe+hHn
         ZyihjjaI93OQLHOaPabchUg8Fat8/J8E+32i4li+QCInmRn4+Vg56TOy+EC+2CALUq/S
         bZigqK8YiC3qQZunpdzh83Y6cNd7o7MZUNO6Oca9ap7JTj0pGJquiFVxJ6LRdobkCLld
         048s8IwWxEJ4zpycpgtc0s6EblJ1uaE1b7nX6b4NJYJRHdBvNgqFY0mJxGDILFQkYmRB
         oXqJC11GpgGGWM1lQfKuzAeJtpDw1DTmkbVpHLCY+VtQIlfO6JnRnUW8G8oWv4nW9vz4
         PSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aunj0N1NHC3RJ0fKGKijrzjm7kLilQs4Vcuh8OvnBoo=;
        b=El9GFTX1qAkHbk1fTT4gcZ7Sqv4I/9CPXZts1xlygOYm9yTwnZsIuIWn1cgOT/EiR8
         nXoNbzHMgJVDL8jpB0iSjTZB57DUl7vaNrM74c6joXdeFvxVdqw92yXn+vGjMg6rF0qX
         6f+gjDED6lm8B3Lqt5bAxsGfiEqSPD5YllJvCwdckhdryt/qjT0EtwVWQXNPosNwumDu
         NvWNGgrMpp19ewzVpeqk+NUMj6lVMrM0egH4oTg/HOclV+6TbM3WxwNByCBHvU2UAk5r
         rC1gbFB91VC2d9iCmdcM0QEji8bMxOSVddlffaU/fM3ETncv117L3YEDbWhQCszcdtrb
         LQHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53353O0t+CIRkN5KDGETgVZ3L8TPsbSA/yFkp7yoxYcmIMBNYiA7
	aUehYxUDyP6B7KRAZrdJRs0=
X-Google-Smtp-Source: ABdhPJy40CMoN7dMEZa3M+9t6sqHkvo/S7pRTeuTF70RB6h5i3zcn3BK52tueg5mTWcr1xspZXGjLA==
X-Received: by 2002:a05:6512:128a:b0:448:2e09:4439 with SMTP id u10-20020a056512128a00b004482e094439mr11242602lfs.386.1647169903420;
        Sun, 13 Mar 2022 04:11:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6e07:0:b0:248:b92:3d85 with SMTP id j7-20020a2e6e07000000b002480b923d85ls949018ljc.5.gmail;
 Sun, 13 Mar 2022 04:11:41 -0700 (PDT)
X-Received: by 2002:a2e:98ca:0:b0:248:6af:7090 with SMTP id s10-20020a2e98ca000000b0024806af7090mr11204403ljj.334.1647169901654;
        Sun, 13 Mar 2022 04:11:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1647169901; cv=pass;
        d=google.com; s=arc-20160816;
        b=0XXweTo/h8OWoVDmiXtWVbmwfc34GJXeY8eUwV+uKZFsAqrvqZ61Ypx+bgqHuMmsWO
         A5tW1+oqsvXMHFAmQRTClh11uDvrh6+imGsPmYVoq7xDp5CeKQmzVYl4JUTMOwqq66Fc
         gCaRIHUTo2jPn7g+MUbr6f05z4AUxAvJr6QL5GQRyG8ihdGx1/buAut924oy0K0pNQbk
         4awDN6Cfzl9pg/gHD0ZkYyM0v6X1rZX/3MKp2r0c2rzIWwFtWXe7F0PuCjIcKnJOcJ2Q
         oMb0ZUgfn4lLIEPLBfRhmsiZEk2Aj+StHGGojEeNQVhJrOu04UCOp5p0UkFDKSpPp86B
         iqUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gHBVVqxYfk5S2wfjZtwL+GBH2+IqAC0JFlJF2Kb8PcU=;
        b=bU5RwI2cdXQ6ZIjD0WSeQl8b0EgIsQiJ0Wl0dee6tUfFCnifja0MMTzyJaOKtn+RGW
         B9bkX1XAqePUzi3rUQB6eeQ2HM8NVdz545Dfb4fz/y3MOINna4q1AxrGoRLpqjhHY/i4
         bytqJV2VwYShA3Ml7DG869Zji8wOuF4idUnaLLpeSOiciKsHcxizSDoVrwj4iAZvSg5d
         2vgxU7PQI7aaAaub/iSH89G2fIldZHOvCvGJlc0e1+c2+J2w0sA3v6CZwE0PpO1rIhIx
         m3QW30O8hRUjGU7uwxdzZ0uSL7ngJNS0+KfWojJilna6rRyJtQwJR7dLgqG5rRyAJSl4
         pd8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=o0BUhqqD;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::61b as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2061b.outbound.protection.outlook.com. [2a01:111:f400:7e1a::61b])
        by gmr-mx.google.com with ESMTPS id b19-20020a05651c099300b00247e331d3c1si656071ljq.5.2022.03.13.04.11.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Mar 2022 04:11:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::61b as permitted sender) client-ip=2a01:111:f400:7e1a::61b;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l53tN8XN9nMxu3+hWuYNvffzlfpd+9SX1O/m2ZsOv0JEdvz0sf166C9K73m0tRDj7Oey3oQ6gyIVDQfCjX9dc/zxHfPQ8wKqmIyM6gwQb2jaFpWAV0PInulOP2X7KAw5ScgUTxEI3V65Yu9v4R9Qh1/LonLIlyVlQd6iC62i472rmPNj4Q7xt1mS5XZSt2Rp/7w49OtBt8NcRqQ3jd52YlIeIFC+agN+l3HivZBvMbnxHuwVthtnjqRYkJBLsDZ1yzZsZWs1A5lodSxwAL1yNhlXWnbQJex87c27UIkO7cUAyW4mqiFQzJc8YcZNaji1e7vK5tj/sYPAu4WtUHChEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHBVVqxYfk5S2wfjZtwL+GBH2+IqAC0JFlJF2Kb8PcU=;
 b=DKP/Vwkd0rCPerarBQqWlPbl6H6HMNYfWgZnwbheuspnqUG3NS4BtjwABoAsY39UhrAMiuvb+BLmcYRruiXdar6b8aH/f9JK1DhjdGWUeHOVeFg+gyB13bnWIvZbB0hMuDEPjRkEl1X1Nrs15fA5Uyf89N9nZ6RL6jWlKkiisWR53tIe5YmHVCcSXlS3Ybsjta+2IAiEOXEWuse3Dhr6kfGIAe0GXNDYP5+Ixo13tPvkxK8Yggt365knXBhSF7bGdy5ypdvehatyhA2Mk9Oy7nJYqZz5RVcNWaWBJ804RE5itmSzlnGWAtYBVmRwtetVebD5qdxeK0J1/pPceZv1/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=ti.com smtp.mailfrom=siemens.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=siemens.com; dkim=none
 (message not signed); arc=none
Received: from SV0P279CA0055.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:14::6) by
 PAXPR10MB5406.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:286::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Sun, 13 Mar
 2022 11:11:40 +0000
Received: from HE1EUR01FT038.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:14:cafe::1b) by SV0P279CA0055.outlook.office365.com
 (2603:10a6:f10:14::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25 via Frontend
 Transport; Sun, 13 Mar 2022 11:11:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 HE1EUR01FT038.mail.protection.outlook.com (10.152.1.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Sun, 13 Mar 2022 11:11:39 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Sun, 13 Mar 2022 12:11:38 +0100
Received: from [167.87.72.30] (167.87.72.30) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 13 Mar
 2022 12:11:38 +0100
Message-ID: <84b43004-79c9-4288-9314-7a8d3f2b5056@siemens.com>
Date: Sun, 13 Mar 2022 12:11:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 4/4] configs: arm64: add emmc inmate configuration for
 k3-am654-idk
Content-Language: en-US
To: Matt Ranostay <mranostay@ti.com>, <jailhouse-dev@googlegroups.com>
References: <20220305030458.2938-1-mranostay@ti.com>
 <20220305030458.2938-5-mranostay@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220305030458.2938-5-mranostay@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.72.30]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c3e97f9-84b2-49f5-f3c8-08da04e23f16
X-MS-TrafficTypeDiagnostic: PAXPR10MB5406:EE_
X-Microsoft-Antispam-PRVS: <PAXPR10MB54069BAC2C3FD2F1CA800AF0950E9@PAXPR10MB5406.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tob+s5cwi5FXY7+/+z16/lnoz56o0gquIgF+QiJDoNYaQDESYgZ39xqh+V8N7NLK4zT57bPvdMar87DdRuUzAJhvWjdXupcmFnvyJnN4ljiJle0wT297w3UMyZKWOXtgCoGzJreNxbkDjpHmX63uk8fcz3lHZE4N1nZai10juQQ5bEL3qyY1n89CQvttNPDpU5WyT5qcUanJ/tIuG9HoH6YzSdbPjLIRe1qX+hXslN1+u32BZvGfewxOh+TSKh0rbnXUB795BLOH6g7JaJrGP1PScb9Yvwf2lQpbtUVeR8Q+6IhajhdqUicLreUcMlwvpkgORy0oH41Dgyyjb0WSQ7tYDJmLPKPeLno91JukURuXg5XYTrvG6seEP9TEDNIcacId1Fj36bj+1fRJk087fEh1op5Zm3YUNt3O204HLwYaOjzThiRsscN35P61j7f8mV7PiBE7Pu4TTc45ukfT6XWW6FFd6uCF0AnhNczcbF93IwfEw0WxNbXUQwCSfE+wyvXDsfNoaqBtCp5ION6ZzI4ClU7LNKdtGLicq5SRiSufbbmxZjwnzqQaut+QmTMd2gzLS0h/vLK287s5P6oDw59icb6j0xtJLFHXpZ7wIPzZXSugXX1ArZ90/GDJLvtnspcWOtw7LM8TiXBmtQGCqSMrPbVYaGSkNrFz/wetL7/zrh1gjXKPxMdU01MYc0lfObSl0rFUWNTAZKcvH8nHq9nCNR3ovVyD3rjZ0Bm94GhgfQwtT/sq5LAINqZp1O9oxLN3j/pW2EbD5OzYpqYqfulR2CAqXsXLwarPcUCmImMSsVb/E++ytxgLcKbcNSitqoPuEMEHXx+0YgLlHqAh75grv74dh9eHfTIGKeMk6RM=
X-Forefront-Antispam-Report: CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82960400001)(40460700003)(70206006)(36860700001)(336012)(8676002)(70586007)(82310400004)(16576012)(110136005)(6706004)(966005)(508600001)(83380400001)(47076005)(316002)(956004)(86362001)(8936002)(44832011)(356005)(2616005)(36756003)(5660300002)(2906002)(53546011)(26005)(31696002)(16526019)(186003)(31686004)(81166007)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2022 11:11:39.3154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3e97f9-84b2-49f5-f3c8-08da04e23f16
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT038.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5406
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=o0BUhqqD;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7e1a::61b as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 05.03.22 04:04, 'Matt Ranostay' via Jailhouse wrote:
> Add eMMC support for k3-am654-idk in a linux inmate cell with both
> k3-am654-idk-linux-demo-emmc.c configuration, and respective device
> tree changes.
> 
> Signed-off-by: Matt Ranostay <mranostay@ti.com>
> ---
>  .../arm64/dts/inmate-k3-am654-idk-emmc.dts    |  45 ++++
>  configs/arm64/k3-am654-idk-linux-demo-emmc.c  | 208 ++++++++++++++++++
>  2 files changed, 253 insertions(+)
>  create mode 100644 configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
>  create mode 100644 configs/arm64/k3-am654-idk-linux-demo-emmc.c
> 
> diff --git a/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> new file mode 100644
> index 00000000..150e31fe
> --- /dev/null
> +++ b/configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
> @@ -0,0 +1,45 @@
> +/dts-v1/;
> +
> +#include "inmate-k3-am654-idk.dts"
> +
> +/ {
> +	sdhci0: mmc@4f80000 {
> +		compatible = "ti,am654-sdhci-5.1";
> +		reg = <0x0 0x4f80000 0x0 0x260>, <0x0 0x4f90000 0x0 0x134>;
> +		power-domains = <&k3_pds 47 1>;
> +		clocks = <&k3_clks 47 0>, <&k3_clks 47 1>;
> +		clock-names = "clk_ahb", "clk_xin";
> +		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +		mmc-ddr-1_8v;
> +		mmc-hs200-1_8v;
> +		ti,otap-del-sel-legacy = <0x0>;
> +		ti,otap-del-sel-mmc-hs = <0x0>;
> +		ti,otap-del-sel-sd-hs = <0x0>;
> +		ti,otap-del-sel-sdr12 = <0x0>;
> +		ti,otap-del-sel-sdr25 = <0x0>;
> +		ti,otap-del-sel-sdr50 = <0x8>;
> +		ti,otap-del-sel-sdr104 = <0x7>;
> +		ti,otap-del-sel-ddr50 = <0x5>;
> +		ti,otap-del-sel-ddr52 = <0x5>;
> +		ti,otap-del-sel-hs200 = <0x5>;
> +		ti,otap-del-sel-hs400 = <0x0>;
> +		ti,trm-icp = <0x8>;
> +		dma-coherent;
> +	};
> +};
> +
> +&mcu_uart0 {
> +	power-domains = <&k3_pds 149 1>;
> +};
> +
> +&k3_pds {
> +	#power-domain-cells = <2>;
> +};
> +
> +&sdhci0 {
> +	/* eMMC */
> +	non-removable;
> +	ti,driver-strength-ohm = <50>;
> +	bus-width = <8>;
> +	disable-wp;
> +};
> diff --git a/configs/arm64/k3-am654-idk-linux-demo-emmc.c b/configs/arm64/k3-am654-idk-linux-demo-emmc.c
> new file mode 100644
> index 00000000..9fbc7a5f
> --- /dev/null
> +++ b/configs/arm64/k3-am654-idk-linux-demo-emmc.c
> @@ -0,0 +1,208 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Configuration for Linux inmate on AM654 based platforms
> + * 2 CPUs, 512MB RAM, 1 serial port(MCU UART), eMMC
> + *
> + * Copyright (c) 2019, 2022 Texas Instruments Incorporated - http://www.ti.com/
> + *
> + * Authors:
> + *  Lokesh Vutla <lokeshvutla@ti.com>
> + *  Matt Ranostay <mranostay@ti.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +#ifndef CONFIG_INMATE_BASE
> +#define CONFIG_INMATE_BASE 0x0000000
> +#endif
> +
> +struct {
> +	struct jailhouse_cell_desc cell;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[19];
> +	struct jailhouse_irqchip irqchips[3];
> +	struct jailhouse_pci_device pci_devices[2];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "k3-am654-idk-linux-demo-emmc",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +		.cpu_reset_address = 0x0,
> +		.vpci_irq_base = 189 - 32,
> +
> +		.console = {
> +			.address = 0x40a00000,
> +			.divider = 0x35,
> +			.type = JAILHOUSE_CON_TYPE_8250,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +	},
> +
> +	.cpus = {
> +		0xc,
> +	},
> +
> +	.mem_regions = {
> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
> +		{
> +			.phys_start = 0x8dfa00000,
> +			.virt_start = 0x8dfa00000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0x8dfa10000,
> +			.virt_start = 0x8dfa10000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* Peer 0 */ {
> +			.phys_start = 0x8dfa20000,
> +			.virt_start = 0x8dfa20000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* Peer 1 */ {
> +			.phys_start = 0x8dfa30000,
> +			.virt_start = 0x8dfa30000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* Peer 2 */ {
> +			.phys_start = 0x8dfa40000,
> +			.virt_start = 0x8dfa40000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* IVSHMEM shared memory region for 00:01.0 */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 1),
> +		/* RAM load */ {
> +			.phys_start = 0x8FFFF0000,
> +			.virt_start = 0x0,
> +			.size = 0x10000,	/* 64KB */
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +				JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM load */ {
> +			.phys_start = 0x8e0000000,
> +			.virt_start = 0x8e0000000,
> +			.size = 0x1fff0000,	/* (512MB - 64KB) */
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +				JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* MCU UART0 */ {
> +			.phys_start = 0x40a00000,
> +			.virt_start = 0x40a00000,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* sdhci0 */ {
> +			.phys_start = 0x4f80000,
> +			.virt_start = 0x4f80000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* sdhci0 */ {
> +			.phys_start = 0x4f90000,
> +			.virt_start = 0x4f90000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* main sproxy target_data host_id=A53_3 */ {
> +			.phys_start = 0x3240f000,
> +			.virt_start = 0x3240f000,
> +			.size = 0x05000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* main sproxy rt host_id=A53_3 */ {
> +			.phys_start = 0x3280f000,
> +			.virt_start = 0x3280f000,
> +			.size = 0x05000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* main sproxy scfg host_id=A53_3 */ {
> +			.phys_start = 0x32c0f000,
> +			.virt_start = 0x32c0f000,
> +			.size = 0x05000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO,
> +		},
> +		/* communication region */ {
> +			.virt_start = 0x80000000,
> +			.size = 0x00001000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_COMM_REGION,
> +		},
> +	},
> +
> +	.irqchips = {
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +			0x0, 0x80, 0x00, 0,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 160,
> +			.pin_bitmap = {
> +			/* sdhc */
> +			1 << (168 - 160) |
> +			/* vpci */
> +			1 << (189 - 160) |
> +			1 << (190 - 160),
> +			0x00, 0x00, 0,
> +			},
> +		},
> +		{
> +			.address = 0x01800000,
> +			.pin_base = 544,
> +			.pin_bitmap = {
> +			0, 0x200000, 0, 0,
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		/* 00:00.0 */ {
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 2,
> +			.shmem_peers = 3,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +		/* 00:01.0 */ {
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.bdf = 1 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K,
> +			.shmem_regions_start = 5,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};

Applied patches 1-3.

This one here still makes we wonder if we can model it by adding a
config switch to the existing k3-am654-idk-linux-demo.c. That would
avoid having to maintain common bits (the majority of both files) twice.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/84b43004-79c9-4288-9314-7a8d3f2b5056%40siemens.com.
