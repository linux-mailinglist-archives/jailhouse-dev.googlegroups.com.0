Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJWJRCIQMGQEEPMIVSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1344CD68D
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Mar 2022 15:39:35 +0100 (CET)
Received: by mail-ej1-x637.google.com with SMTP id hq34-20020a1709073f2200b006d677c94909sf4520467ejc.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Mar 2022 06:39:35 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1646404775; cv=pass;
        d=google.com; s=arc-20160816;
        b=fENpkHxsla8p13nLt3muBHkxwIXYUUXXCYAbvZek9IeKF+JC8tpp5sld6/2il++mQk
         iJESJ6IuvVazzChRgZy7ryxCy3BbjNsNp88fPe3zgXCzjReiCPTotN+t6Cy81iGe2AFM
         mq1CcdSyxIeQykXV/6wXgxzREep4GM/6j3SqlXOiM4+wStCLpXzCMY7+YD7Daf7ox+5j
         b7j4vbF4/OnxZWa+dPFQDg3prh2At4vJvrhJmF625UbaxVSB8YBQlug2t9dSxz7gtw5S
         G+ukrkjFJ28az5HaVMSZ0Z5IfLBFDG2lHzL8SooRgexIl5A5X1jED9AjUGmtlglpOuZL
         ADXA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=/SUbKJEaIpenJYSjLtGkR/TRYdihMHlY1sr4t0pdaIs=;
        b=JlRRFvEp95enOHAjhzYklp66D/4dXrLBx94ifMWTsR+8S+v9dyVuptJzXDD0wqEzew
         wn78wUF8E+bCm4ukYmv1jMYTmP+H/mhA9dBa6eC50oYE2SLMqMF/Dwj97MZnPvE5xmtw
         tgkvNEB+IwWXVBa5VncFBtKjVtsFH+XJVw6V0c+R0teLhlQNvNTVbigrz40OqJS2yscc
         A8doo5qBIk+35Hj6toYDRlx1mvatlsoZANr+DuN0+bWHacycwY93kWsf823E5ideTPkc
         Hm1egGUworO9ys2dv10qHLcojPBZcJ7dQ2QYsTdyFgiaMX/E+iqPtvFvEV/pOsQRdUJM
         Va5A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=m+JVmreC;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::627 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/SUbKJEaIpenJYSjLtGkR/TRYdihMHlY1sr4t0pdaIs=;
        b=TlPVvM1Iy2Jb3exMy2RRoo3dmUOMUc05d6oJ+QeLkVz7oZbuogWXhHBnn4DFyn+LkY
         yws/Qq0HgblL4YwuW75JAVgb+YqO//TYRSlrm04tPAYhqtjCnEktN124wrD47MY6830G
         DqWL24xqbghBqOsXb9twjngi83MgMposVgPpisgu+E7KKOYfPAdC/pwUJCZ4g6DBi5oW
         Z3XWrCwTYtpuIP1kkNE049n5Efus0XpyW9rtTiVfDiN67liHcq9jo8FM4a5/Vzznh5sc
         gUJOrE9DIdkWY+ch1YRzgXvbsIqVdItlq5PVMhBocrAkBA7svqSI5fiNVnTs+CXwsUbv
         gl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/SUbKJEaIpenJYSjLtGkR/TRYdihMHlY1sr4t0pdaIs=;
        b=OZIUbhUE3KTZetvIRXbPKI08a6+4QCgyjKgMu1v55J7zdnLOzYvoDn6N/z4V9/zkKT
         CPzX2iokh+1kBiUqSZ7oOVuGhZdoIegLi7eUUg479IfA4Ux02maH8ewAAqzsRlInt+9d
         tQdJ+ep4W4PORTQJ3aBQp296htgwlM/aSGd+5Xkv5lW22lFdNN6WC8EO2AHCeMwiHhnn
         evDl6oXBE2dkfJj6rJpxi2ZakxLN/yp3tjBwN6y+AdiX5RFFk8stT1weG1UquNXrW65q
         jR8gT0Qhs8PAZfCEAVXx/2AKisgAoOrgge0pN1Hfc8Nk9XCCWGAXVIere8g9DTwUTCan
         CzlQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Zz7GLZu/rdMGfisTJmd68eNDaxZJ/2DqZbqAyGRlTYyuc5KF5
	yxdAi0hgS10Sz9hdgQ5zpQ0=
X-Google-Smtp-Source: ABdhPJx6auIhQmZdr72mWBEvVZAEkKwNeOQIWMpiMdy5FsWJmebQGwKJrhomPikaHUPjKBVtbF3KvA==
X-Received: by 2002:a17:907:629a:b0:6d7:b33e:43f4 with SMTP id nd26-20020a170907629a00b006d7b33e43f4mr12443556ejc.149.1646404775292;
        Fri, 04 Mar 2022 06:39:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c45a:0:b0:410:98bf:fa0c with SMTP id n26-20020aa7c45a000000b0041098bffa0cls324902edr.2.gmail;
 Fri, 04 Mar 2022 06:39:33 -0800 (PST)
X-Received: by 2002:a50:fc08:0:b0:415:c6e6:23b with SMTP id i8-20020a50fc08000000b00415c6e6023bmr11301387edr.336.1646404773826;
        Fri, 04 Mar 2022 06:39:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646404773; cv=pass;
        d=google.com; s=arc-20160816;
        b=WCk088VOkt5j5kkhQXiRuymISPXidNd5wuF6XND8L4h0Ib+qh98BvqJit4/DzVk5Nn
         z1BAKm7tBhxoUTHVVPOITqXu3mB/0g1zc+hiGT6NHrGLpy9C97bji3GRo2rKlgl8HfT1
         8v2bX/rTQGJEmO5BWaNQJSV/Jy5+23LlwukYVNFWH6iwewwfxLxAjW6F9g8T4SelGJrE
         9X2hU9F//eKANd5uIHjPTrKqGClezZI3RMNe3Ky+abqUZnJ8X+M/pZsqJ2is6L9lukk6
         W5xiu/8qJJj81r82eqJT8+jUKOhzOWl7pdkR8etbL1N101/x/HzEBEUVg/HxcHSZ9gza
         76OQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EiBP6llbh0wREeoZy5cR4Gcdo77bjdZdjcPXZXfcfko=;
        b=HD14KSOtjuT7vRPN2Zcp20FVNwCRpFoj+n9CmOxQAzhzEouHmyULypxZ3PbBpm+S5N
         sr+VfxNsfpcmoqUTQGrCSKOGMKlyVrAAnb3zle9rffAb7Q3msjntzUxBZT6/EsDAEkBm
         M6LuEvgrrbXLQ2SXe/e/d42iPcH8pKuLUmJ5p0rne5vA826HteAHuEm5DSiL0PATP2bf
         fNaAHcZbrEbHUqwX36mJ34ArJUK2r1Or96B7KeYMXE0t58PtlvghcR3Dr5fZxf658p5m
         2uiI1B4jVIgkmyhQaIgJxrzm0vPvQnMJitkrdTUeQXKp6KnhWJCbAxckA9DM34T+Y2kL
         A7GA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=m+JVmreC;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::627 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0627.outbound.protection.outlook.com. [2a01:111:f400:fe0e::627])
        by gmr-mx.google.com with ESMTPS id b88-20020a509f61000000b00413ed059da9si311102edf.4.2022.03.04.06.39.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Mar 2022 06:39:33 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0e::627 as permitted sender) client-ip=2a01:111:f400:fe0e::627;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGhnwp3UyDvUWLWc1MduyeOGFFVXLnVxN0UPtaUX7xRDyP/h0qHrQLsQcf0z2D9iNw4XLhkoZH4wxdct4VCqKU16+1tXPcw93yjNQqNb/OZbWcVbomWljidSPVQTEP8s07KQKEilJvhIRhPzq2z0rOvEBJezRNevo0bdRW4gGi9B9Mkg8g/zlIBDPwhykpemP2tg6CnkmM3PPSbuH/1RjX03o5cb49xmx+0i8NzWlD/dmeD5VR4NHvkgeqw19v2v+xdeNBif/lIPQL1OOf9Et0W7hv2wVgYB34lStCJImudyV2rAxnxsLXwIrsMDLFCuZkcUAJcZAlL1whr5mHGo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiBP6llbh0wREeoZy5cR4Gcdo77bjdZdjcPXZXfcfko=;
 b=X36UDmwmC41fUCmh7I0vpU/Xd7H4fiHYm1T6IwrX9bofBPKBAIOA87BJH2ev6lA5suLsaWBeaJtvsMxyiKWPZmusFUtCLbNxH7DAnMyvQousy/ydgiAjBRKZV7FZX5d1R1fol2b4R97BxeEEH2pvQhf+eT5nbvk+AprrCpYHRTjtyQFUheQBncAUAiI0Sn9tMEswViy015nqMvGOOfsu7rjvE3blFP+KFv9jVkLifhqOBMcq65pbLACBfePZH4TIbfPeybY6Kfmqv1SOoSDh23stwprRJwb9fs9KgGkuXFYxsHcoSOdxTBubWeNRKjVU6VT8FhtLGFw2M9hOJ6LmSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AM6PR10CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::32)
 by DB9PR10MB4939.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:2c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 14:39:32 +0000
Received: from HE1EUR01FT021.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::ed) by AM6PR10CA0019.outlook.office365.com
 (2603:10a6:209:89::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Fri, 4 Mar 2022 14:39:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 HE1EUR01FT021.mail.protection.outlook.com (10.152.0.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Fri, 4 Mar 2022 14:39:31 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Fri, 4 Mar 2022 15:39:31 +0100
Received: from [139.22.142.118] (139.22.142.118) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Fri, 4 Mar 2022 15:39:30 +0100
Message-ID: <06f69587-8e20-810b-a142-97378bf1f8da@siemens.com>
Date: Fri, 4 Mar 2022 15:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [Banana Pi] make modules_install give "Makefile:1250: recipe for
 target '_modinst_' failed"
Content-Language: en-US
To: Giovanni Olino <gianni.olino@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <77226583-76dd-4c0b-9a0c-c69332e824b9n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <77226583-76dd-4c0b-9a0c-c69332e824b9n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [139.22.142.118]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcaccd98-9ff6-4f16-075c-08d9fdeccb6e
X-MS-TrafficTypeDiagnostic: DB9PR10MB4939:EE_
X-Microsoft-Antispam-PRVS: <DB9PR10MB49398C2CAF0E48F4F9EA01D195059@DB9PR10MB4939.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1RXcg6j3K8HnPJRACey5nX0fiXvlkVnRI1bW87zw+9+glAyUx9ivIaFGZ+p033csr6yKL3BypCA1qbVF/8rWJ8GQdPqVtcPq6JWzYwz+N7PX6p+Q13K5wuHUOxbjQU75pe6bC6dRg19x59wYhlA81hEraucTwJpLZSJdtTTpmP7pUcLnNx9hF+piV/Zac6ZNvMSa2a1maln/6ax/4wdu3EUWFilJ6WfFaae6x2E3xn4c+TurrtItxCcOp2dT9JTyPR/Wyc4i4ziqukV4o8CKTkYqJBkfoNWjLh8JyZjg0caCxfl+piwcstC6nZ0yhqOwLrQXbjdDFo99YhHsMO2Q65T+sXe6QSgvorjMsSz7fuhS0gvYz+pwGC8BG7M7Wgj/7hNJEgb7Vc39c8rPbMCfTBMXHzQBcY5YxZXEGfIsOuj9v5ApSMFlmWB7t0P4MW+SI499srqOI4JEx/4NvRZxMXxXYiFu+11WF/htqe1yrMNPIb/7CKnHykOX0pNV/DpqV0/BZ2Ykt6cOoIK1EP6AnbqdBGZsLPu+AdfWQsy6BjHY2SlYQUDELFIZ7t1eISmoIW/ReWmZqVbinXlLQh6eJpHqXGVzwi+ZKYvZuayMehjFyVFG1hu3s+/XY07YRAqTNw2gou8aAns6ksKI71tf73SivDaznA8ddtBfDH0/LF3KimzNO2wcd3SE7OJDK2paJM7IJgQa4M6zcod+hgOdpLc6kxWD48SJ4MdRKSYPVM7OUP2j/ZjbHpIP21nz1o5hMz1eGEr3+d0PhK7hRGU6tXeLdHpkMdA8sVkio3KNFUkLvH09rXAGhNYmOQyUaJREZ/fPMXlK3SuaOijAOhSDitvCcRAYj7rW41TlYG1VJi7UQLjZkPDS6UjLhYHkrRK+kIrOFNUt7DQSUHqwTWygRQ==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6706004)(70206006)(70586007)(8676002)(110136005)(36756003)(40460700003)(53546011)(2906002)(16576012)(316002)(36860700001)(31696002)(5660300002)(508600001)(26005)(16526019)(186003)(83380400001)(966005)(336012)(2616005)(82960400001)(31686004)(356005)(956004)(81166007)(44832011)(86362001)(47076005)(8936002)(82310400004)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 14:39:31.5949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcaccd98-9ff6-4f16-075c-08d9fdeccb6e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT021.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4939
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=m+JVmreC;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0e::627 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 04.03.22 09:35, Giovanni Olino wrote:
> Hi,
> I'm trying to get Jailhouse on=C2=A0 a Banana Pi M1.
> Siemens has a docomentation for it
> (https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-=
banana-pi-arm-board.md)
> but I'm using linux_4.19, in particular git clone -b
> jailhouse-enabling/4.19 https://github.com/siemens/linux.git
> linux_siemens_4.19.
> On the compile machine every seems to work properly, I can do Make of
> Linux, Jailhouse and FreeRTOS without problems or errors but one moved
> on the Board errors occours.
>=20
> On the Bananian, trough sshfs, when I try to mount the compiled kernel
> with "make mudules_install" this errors come out:
>=20
> =C2=A0/INSTALL block/bfq.ko/
> /scripts/sign-file: 2: scripts/sign-file: Syntax error: word unexpected
> (expected "(" )/
> /scripts/Makefile.modinst:36: recipe for target 'block/bfq.ko' failed
> /
> /make[1]: *** [block/bfq.ko] Error 2/
> /Makefile:1250: recipe for targer '_modinst_' failed/
> /make ***[_modinst_] Error 2/
>=20
> In the sign-file script I don't see where a parenthesis might be missing
> and=C2=A0 for target block/bfq.ko don't know what to look for.
>=20

Seems you have module signing enabled. Maybe you can already get away
with turning that off.

But that how-to is rather old by now, so is this 4.19 kernel. There
might be more traps remaining. For a more modern integration of a
similar board, look for the OrangePi image that jailhouse-images
generates. Never found the time to port that over to the M1, and now
32-bit ARM is effectively legacy.

Jan

--=20
Siemens AG, Technology
Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/06f69587-8e20-810b-a142-97378bf1f8da%40siemens.com.
