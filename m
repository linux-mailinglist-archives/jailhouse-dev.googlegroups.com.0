Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS63QKIQMGQETXV67MQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB64CBD3C
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Mar 2022 13:00:12 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id 7-20020a1c1907000000b003471d9bbe8dsf1775669wmz.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Mar 2022 04:00:12 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1646308811; cv=pass;
        d=google.com; s=arc-20160816;
        b=ovkq9Aq4BUchecLveqcE+gJdhLN6eP+CMlTsoPNi3sbvC9Av+c7y4mii+6ZSx5rW8A
         rhb2TUevQ0L0BjflrNfE8oH5LCj5HpYHSugmLjFuvDbPIZOdccTCDoh6ko0NZY42crrK
         xftik57sKuu/tVzQ6fAW66khanaPx9NGK9AOZXs0L/DIxexcXKDoVxWNF1OtzyW3Hmxn
         N9U/6QmRzwX/D1yzBX+ImB3GQA0Tj3f3nssEWjzlD0scBbjQ0FGdv/VHtbEcQaFpmvuX
         79FufBbI60q2NgrKaX7Z8Vz7J20q0P4KSQAtTSxC8i4mIWkIqgzVSOyLIkdejsl4cIVz
         WgaQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=j2/wYC1AzEegHbc38VTC/vhV7afM1Ht375yTYxPpWw4=;
        b=N3z6x8MWwNXELb2M6islzHAcQal56Wmu1pRpM89YXkRdUS2yaiYcnvUzvhijrl15LR
         bciuaZQLodpv2wz/6B4kr06/WRN3hs4gQ/3pBP6mrOQSxromT/pi4xzTiGpnAv36XKYU
         Hi/nLBVcwLfrfwoD6tWlbw0mMfNpBoMy4kMX5nMTnrAzBqF9v385nKka5eaXQwQ1gDBH
         WzsPvMRIm6PoeheBGH7qWmxuKJbf51fb4Xq1ecr5wn81/xpCOvPsXY2vbkUU+evrI11q
         2eRn3/ObHckGHW8jQX20XqBqh7TVVRwI9Rki7209G6m41erACCqRWlq5VTVCbqy8hyjH
         i1qw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=RsEpCGj9;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::627 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j2/wYC1AzEegHbc38VTC/vhV7afM1Ht375yTYxPpWw4=;
        b=ZRbRNnHkml5OUjHUHFlPvxvDiWYHsJL4hQ1S6Bh5Zc9TWsfRfwtJEFCVqEohPGGnLi
         b1FdmtNEF+XFSl2GyjlxGoh1LAfb7raIdkh7o++egCZTQzP5tPQf2KQ3UkrXbp0Wuh5L
         7onFVyLXJrBWZc2o2lufIS3hWzARXR52jJbNSYPiVgF2SKDcT+amhF3xWJJfWsGtbIcE
         S1g2r7Jk/lwp1BIfS1efeeuFNawRkk144Nx/ImC6t4a3hzHndxclYMCaxNYO4hgiKkVR
         pFCgvgBRLctE/BDVkYwkBlN0txpej1M0wNCmqAAOdS1aU7fWt7Kv9VCx3K0Eb+REr3xS
         XbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=j2/wYC1AzEegHbc38VTC/vhV7afM1Ht375yTYxPpWw4=;
        b=FtG3le3FwmuwJrXRUpIRqNHnZayk3MZoJ/rLev0ZzUbgBK6F61/XkT3l9hsT6JDcev
         YM05lO5K1USiYP/07P66J0ONqMXcA/c2iQHM+vGMKgRupLVOyrULydOP8Wj5zTloLpWT
         mBLIZ3Y3q8TQnKTi6iPfdyMqXsGOBqtg6qtRZiCkJQsNcX+vxk/BaC2Lqo8E82mRUQ0e
         WUr6+A2MkwNT/lZ+9Q3MqkHMIAf++Ugdzxk3sJlxOwwpndoVI77+S5aNJbLJ8qxbWb9Q
         SuAD2A9bJxlG/AUDIHMTb0+3GP4bcicH5mx6wJSpNzvR59UxkBVWHdQpbHlmYiPxY8Eq
         GlZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Maw7iRniR8Xc10/0HBHyNcgKWLdV2ZXpDa3ySM6/Cu0co4qvA
	W6oqJAqa8JUOVq0T2bnRATA=
X-Google-Smtp-Source: ABdhPJxLLKqiXBsWUtxX7YpsHc0IMe6QRI6o23eYosxN5d6waIEKLr5RpU3vL47xnXIESqzFXPElPA==
X-Received: by 2002:adf:dfc3:0:b0:1ef:597a:61b6 with SMTP id q3-20020adfdfc3000000b001ef597a61b6mr22890280wrn.376.1646308811679;
        Thu, 03 Mar 2022 04:00:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c855:0:b0:384:9952:e84a with SMTP id c21-20020a7bc855000000b003849952e84als1107467wml.0.gmail;
 Thu, 03 Mar 2022 04:00:10 -0800 (PST)
X-Received: by 2002:a1c:f718:0:b0:380:ed20:6557 with SMTP id v24-20020a1cf718000000b00380ed206557mr3581849wmh.53.1646308810233;
        Thu, 03 Mar 2022 04:00:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646308810; cv=pass;
        d=google.com; s=arc-20160816;
        b=c1UVz1HmV/2TgXsBBrPdAVNJpES5pF3SqBbZe+uIXHY6A4iF73y6zZV2QTBUuF+6+8
         WTVRIW5JVaiRk2GrCW9h4GXQ41seVPlSg6HXApPp4WDeGgHh0fvSjb+97v48qkpETeJI
         ReZ5ZJlcvhy/Wojv67qRQCAhxSOhwP8jiCQwLRqPiXJMF9xU0ufjQ2b57LX/vAEaZ6fM
         EAu21zz/cCS9/21PrY3YcPvSNzjz9FnodmyQjnFk0v+rxTo/VsH6qGbJ7xrIZMguUc+/
         yXs2+oDo84MmqEr8JORy162i32yMmPJAmIzZ8VpcQ4aHuUPOhviZdbZhOxqplsGwyK6G
         qaYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vE8PeUrI+G9L3feh2CuWUOAgoUGL/TGbANpFGiyTRIM=;
        b=Yx8etLfyLlwHsp3KSgOFUVbywk7+LSUnX+jwL58F72wI9Cjau+sbIgm7wt4bvZqvyl
         H4QsZNbzO0RIQn6tNtThili1KIV+lyamvr9R5qrEBfvytrp1mGE7o1w/HhpDOAs2v+zg
         dy+eSx/EmsGFeZ+D9dtOsVDclHhezNpD679Y10Grwfo4irQi5Z2z4SYBSRSU4XJe3jYi
         dWB7kvXALLuZ/EASnV9ZxSmV5q+gxx0jd9FLSpdT+qCIId0QbKh9ZuOtlRbVspWbdbdo
         KfI+V+DVRUcBEaqI64UTMA7iLplO7YwQ2pXbAfLmoq8+eS3urbpC4zx3XqUjpWjClhi/
         xqMA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=RsEpCGj9;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::627 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20627.outbound.protection.outlook.com. [2a01:111:f400:7e1a::627])
        by gmr-mx.google.com with ESMTPS id v193-20020a1cacca000000b003816971af44si604343wme.1.2022.03.03.04.00.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Mar 2022 04:00:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::627 as permitted sender) client-ip=2a01:111:f400:7e1a::627;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0jTgI+MEUb8UFct6qfNX6rJ5TSqlZop6kiCm8mf6vX3MPf9kN3Id2WHHRKjkvymf0B47zM2vxP02iQif8x/lVzthG8uQFFTYQ1PCG1+GWb31LZ55AbXFxNRsEUOeckw0JQi1UOGPUoC0n4IqT5tk14rsISKm8RmexvT7g885pbgbWBjzBxc/58TS+4WHJauKIP0bkuaBNnGzo7kUdjHEoRh/KQNFI5WB5KeQdi/+KsUtxSSSmFxgox+EcoRm+F+jlIhhj7nEIIpuEzTM1DuliOCuGaM6/GuucuiwRg+Y1ABuYGYO/6wQUL8DSa6dm5mh7ZKjqHCd3CcdAvxgUV1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vE8PeUrI+G9L3feh2CuWUOAgoUGL/TGbANpFGiyTRIM=;
 b=gWfilfi2KU7WkKAPeEs2h4kK1qHz1QDWAM4Yy9tW6sjLEZlRFY+efLOQ1H9/MTfcqSSFRsHSnfv8ffwXq11jsD3ql+7FNQs+YsJBIZumuQHBMU5ZwWLRo2z+oaXsMWQN9wZxTyTRPrfFKbEKI8IRMKnx3Y5QZiMSnPQb4LeHdKoWI0KEg9M5xd/FK0wRATfvfSxIKEbPzPrAusp9IKJcB9mk8yj8NOb1IGbSLAZ+aQFkilrArze/DPXsLW5EupE01vTG9ko0qeJFmBRif4HFPnFwDe3MZvEqdOfHNFmxnS8afrRz4V8IZ/6KPHCEz5QQEuakGsgOmEwn4q94B36GcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from OL1P279CA0023.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:13::10)
 by PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:102::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 12:00:08 +0000
Received: from HE1EUR01FT049.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:13:cafe::4b) by OL1P279CA0023.outlook.office365.com
 (2603:10a6:e10:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 12:00:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 HE1EUR01FT049.mail.protection.outlook.com (10.152.0.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Thu, 3 Mar 2022 12:00:08 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Thu, 3 Mar 2022 12:59:49 +0100
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 12:59:48 +0100
Message-ID: <e100f09e-0bcf-3113-5f78-d1dbacc6aa11@siemens.com>
Date: Thu, 3 Mar 2022 12:59:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] configs: arm64: qemu zephyr inmate
Content-Language: en-US
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, <jailhouse-dev@googlegroups.com>
CC: <peng.fan@nxp.com>
References: <20220301080926.15295-1-peng.fan@oss.nxp.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220301080926.15295-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b28bb8bf-5c5b-4eab-2646-08d9fd0d5cb5
X-MS-TrafficTypeDiagnostic: PA4PR10MB4399:EE_
X-Microsoft-Antispam-PRVS: <PA4PR10MB43992D5097DBD4D038B1D62D95049@PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JPPtdpeFiWSkYbq91I4uIUzZl38c+BzfHogldryBYPLd8a3DguRrl33qcqtspoHtm7mEXDW6RKFoEK41Yz9+HFrtkTsOnio9JRltpYYZxn1lfXa+ZsL0ExY2UKsVKKx6ALNmt8CgK5SInCjciKIlRZJsgpIdCh1lj5/EhxbgQuZcoOdVCuCPNrNgHe3gu2sBkkfv5ZiYv8/4fSW+KFwo8KPz+8eHIqWOjGQDX9GB7X2fXRrgNsmIPoYQwu20aoyneJH/+QO5/ZwA8OSGelkGeXbg0nC0mkf0x92D4btmwahYHFlt0gzgEai1EO984tdVkzVsMIdhsgVwdLqiXvV+BEOUrw8ftiW/DxobCdSKTt0NhPf50BdKhOVlDHNyanf3J5ClR94u7Kow0yDfLGFJz2X1DW4Vuq+Wl8inC/BLblr6WFnAZFkuSFdfrxYcjteE3x0g4FwMaLI7bWqLGUZKvS7rMXx/H//k7BZXMLDMywQHhOluHj/J3xEmPpg031hhL1B7daVsuwMPQnTtk8Iv4mmtaQFGqPrvtNeEP8NtnxXHKjwejQn0hSNhM8NC2ueBb/Z1LWDdWPYU21RLLhJCuU7iBvZ+Bp2K5gYwFYc0hzYlAVsivdTKRj9Sq66Wapoxy4+K/LvO44HYElhgJqojGYZVe2BNAgQIwlYotZHY29/IWctbG8/dtoarApW5LrgM51FxsDSc/MBKx8ULoq6PeNGJS6Syn/hloGKJ6gwuiTJBaUwPRJE0cnjeggw7zytiyINjoOMQ4qgk/bMkzRoJP09+rWtPXYKgdYYsPDqV+/aZQ4q09Z7Jc5N7fulmMIlkNFolrIZDbzW1lsdSatOtl8HSNekDvm3RRt26tlefvok=
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6706004)(336012)(956004)(16576012)(186003)(26005)(316002)(16526019)(8936002)(36860700001)(2616005)(82310400004)(508600001)(44832011)(5660300002)(70206006)(70586007)(4326008)(8676002)(53546011)(40460700003)(86362001)(81166007)(966005)(31696002)(47076005)(83380400001)(356005)(31686004)(2906002)(82960400001)(110136005)(36756003)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 12:00:08.0476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b28bb8bf-5c5b-4eab-2646-08d9fd0d5cb5
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT049.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB4399
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=RsEpCGj9;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:7e1a::627 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 01.03.22 09:09, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> After root cell start up, use following steps to start zephyr inmate:
> jailhouse cell create qemu-arm64-zephyr-demo.cell
> jailhouse cell load zephyr.bin -a 0x70000000
> jailhouse cell start
> 
> Currently ivshmem not supported.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V1:
>  Just a copy of linux inmate cell with minor update for zephyr usage.
>  zephyr ivshmem-v2 is not supported for now, but I not remove that from
>  cell file.
>  Zephyr PR: https://github.com/zephyrproject-rtos/zephyr/pull/43301
> 

What is the delta, and why do we need it (asking while being too lazy to
diff myself - but you should also try to make my life easy here ;) ).
Can we possibly enhance linux-inmate to cater both cases?

Jan

>  configs/arm64/qemu-arm64-zephyr-demo.c | 155 +++++++++++++++++++++++++
>  1 file changed, 155 insertions(+)
>  create mode 100644 configs/arm64/qemu-arm64-zephyr-demo.c
> 
> diff --git a/configs/arm64/qemu-arm64-zephyr-demo.c b/configs/arm64/qemu-arm64-zephyr-demo.c
> new file mode 100644
> index 00000000..e5e36237
> --- /dev/null
> +++ b/configs/arm64/qemu-arm64-zephyr-demo.c
> @@ -0,0 +1,155 @@
> +/*
> + * Jailhouse, a Linux-based partitioning hypervisor
> + *
> + * Configuration for zephyr-demo inmate on QEMU arm64:
> + * 2 CPUs, 128M RAM, serial port
> + *
> + * Copyright (c) Siemens AG, 2014-2017
> + * Copyright 2022 NXP
> + *
> + * Authors:
> + *  Jan Kiszka <jan.kiszka@siemens.com>
> + *  Peng Fan <peng.fan@nxp.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <jailhouse/types.h>
> +#include <jailhouse/cell-config.h>
> +
> +struct {
> +	struct jailhouse_cell_desc cell;
> +	__u64 cpus[1];
> +	struct jailhouse_memory mem_regions[13];
> +	struct jailhouse_irqchip irqchips[1];
> +	struct jailhouse_pci_device pci_devices[2];
> +} __attribute__((packed)) config = {
> +	.cell = {
> +		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> +		.revision = JAILHOUSE_CONFIG_REVISION,
> +		.name = "qemu-arm64-zephyr-demo",
> +		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
> +			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
> +
> +		.cpu_set_size = sizeof(config.cpus),
> +		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
> +		.num_irqchips = ARRAY_SIZE(config.irqchips),
> +		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
> +
> +		.vpci_irq_base = 140-32,
> +		.cpu_reset_address = 0x70000000,
> +
> +		.console = {
> +			.address = 0x09000000,
> +			.type = JAILHOUSE_CON_TYPE_PL011,
> +			.flags = JAILHOUSE_CON_ACCESS_MMIO |
> +				 JAILHOUSE_CON_REGDIST_4,
> +		},
> +	},
> +
> +	.cpus = {
> +		0x3,
> +	},
> +
> +	.mem_regions = {
> +		/* IVSHMEM shared memory regions (demo) */
> +		{
> +			.phys_start = 0x7faf0000,
> +			.virt_start = 0x7faf0000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0x7faf1000,
> +			.virt_start = 0x7faf1000,
> +			.size = 0x9000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0x7fafa000,
> +			.virt_start = 0x7fafa000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0x7fafc000,
> +			.virt_start = 0x7fafc000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		{
> +			.phys_start = 0x7fafe000,
> +			.virt_start = 0x7fafe000,
> +			.size = 0x2000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* IVSHMEM shared memory region */
> +		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 1),
> +		/* UART */ {
> +			.phys_start = 0x09000000,
> +			.virt_start = 0x09000000,
> +			.size = 0x1000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0x7f900000,
> +			.virt_start = 0,
> +			.size = 0x10000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> +		},
> +		/* RAM */ {
> +			.phys_start = 0x70000000,
> +			.virt_start = 0x70000000,
> +			.size = 0x8000000,
> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +				JAILHOUSE_MEM_LOADABLE,
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
> +		/* GIC */ {
> +			.address = 0x08000000,
> +			.pin_base = 32,
> +			.pin_bitmap = {
> +				1 << (33 - 32),
> +				0,
> +				0,
> +				(1 << (140 - 128)) | (1 << (141 - 128))
> +			},
> +		},
> +	},
> +
> +	.pci_devices = {
> +		{ /* IVSHMEM 00:00.0 (demo) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.domain = 1,
> +			.bdf = 0 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 0,
> +			.shmem_dev_id = 2,
> +			.shmem_peers = 3,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> +		},
> +		{ /* IVSHMEM 00:01.0 (networking) */
> +			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
> +			.bdf = 1 << 3,
> +			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
> +			.shmem_regions_start = 5,
> +			.shmem_dev_id = 1,
> +			.shmem_peers = 2,
> +			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
> +		},
> +	},
> +};

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e100f09e-0bcf-3113-5f78-d1dbacc6aa11%40siemens.com.
