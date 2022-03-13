Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNVHW6IQMGQE5N5LE2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD24D74F4
	for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Mar 2022 12:21:27 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id bd5-20020a05651c168500b002467c7cdfb2sf5252222ljb.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Mar 2022 04:21:27 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1647170486; cv=pass;
        d=google.com; s=arc-20160816;
        b=d/BOByXzzdZsJfB5clRAl4jzsVB6uDMKJK8lWj0bYNS73nLZI6FWdWNOv1P3FaH4Qw
         UKQZ8wypNaTl9YixnLFJHrB9DsLLLquiktd4SThCbKHpPMkMiSn5HRdnJwjxzCPc5hzF
         rCvHS71UMFUcfT9FvhDCg0h+nU1OPEmcQFYA232x3kBU6ErmNyFdn2rYP9CF7eUe7L90
         xF+KAiUpQxmC57mL5wN1qhjp/KV6zP1Tj9u0pRDa7yQFiZIpU60liFUZ4+8BuiERLt6i
         FvC/vbD8muZRHyR39z0BXkz1WyEjV6M0m3H6tPkzW7J9/G524iWUygmWSPY6XBgYrQMG
         NLgA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=EXhjPjb+sSK8Rd+IjZ5NKiVid+UmpUqD4IXaEhaAZis=;
        b=obQ+NS5ANiinH58zN03oJjnlTYl7Z9Kw7Vrq17NlVaYtyX+Vsjze7bYkG2hE6LBmAf
         bP/QGIEkP1WFhkb/dcBta4IHw6MTcE3YATL/eNqKbkHt8kFJxpweaK1KpaqU9efU9mmU
         2ip7N9nRNOeKg5TeoRtozAFOO9uolppXasTWJ7jMFjN1Pp+BQAOzfLZ0IA+es69OUYsr
         ypNYvRzrdcqUtAMQ0QW6SAXZcMpUNw6rpJB7KUWYuMTbQtTd6Z70cD44a7Wruh7yRmGT
         PqlK0nLAtE2gAc1rt+SuWPSqhiWH5vyqkH8Ik6UdfVuhBwlBo9F9R71u/adLmCmj+rYz
         ipIg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=iCrg+TeQ;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::60d as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:from:subject
         :content-language:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EXhjPjb+sSK8Rd+IjZ5NKiVid+UmpUqD4IXaEhaAZis=;
        b=SfEJ1t+CGLzinvU0Ebp5XnIvhvVDLWsEshITzFgc2UrpDnNurOCQa2CAfijI/O0vpQ
         sk7+jOY3sKrwuNRg9CgMgff8o52cUqwVWZUyPncSjLaPdmQEctcvqCZYXRZvOa8N8nO0
         mevGlLxlfV9R+o6hbhPWEvYBqAZQUyGzWtbnhbJ9rO9BxXvB2qnlwlo8XLd3ccWu4uo3
         OxoYxCuhz4U2L/XNOOA01szqhi5EEqX5wGuMevmkxwKtjfNb2FEeNFBMTya7nTBMXx/I
         Lh7OYP+7o4o4uLFroFgbrAEZ9NN5ibOBRYPTtnXufoSf6/qeCXpKeBvegHnT1I8uByMG
         Atmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :from:subject:content-language:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EXhjPjb+sSK8Rd+IjZ5NKiVid+UmpUqD4IXaEhaAZis=;
        b=264ftf2R0Hy6pnO91dCp25jY1wPPi5n/UYxtrM61PXcIlq6ehJ8jTGCnbtpk2kERzs
         ixYU+ihOBFgT+fhrBwWawQitqeuLSAHHX8lPtZ9AVX3vPshZXhlNr87Ot+0dD5RCRZ6h
         bndo90UdC4X9JZi4plpOU8ovfXWZzc8N2fbfnAb4+x5WYmKFrf+8XakLMSm4P5le8p56
         eXx2QDhHlZwhHEosVlgzcP9SLUEXdojwhIyWHSWAX5pazK8MttpOQDmmU30D7caKMWji
         kOnvyKhAYIijgzxbzn3mcRb9G8KSuVhwEF2BZ/mSHNOwrsgDUBJ6Cm6/BTxUA7mqSrfk
         xoWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530d6jFSbsnQ6DmaBexEGpELrOK5tUOX9EUv1+NfaFXuxYHTfrmd
	pncL5imGgHQhS0UiqEPGhfo=
X-Google-Smtp-Source: ABdhPJwWav015lmW56MN5jU6Cj4M4FuQohNWCDdbUi+jdpZWiNYxHJRNjdup2l9yaTKktlioqYpKyA==
X-Received: by 2002:a2e:9f43:0:b0:247:eb09:f4c2 with SMTP id v3-20020a2e9f43000000b00247eb09f4c2mr11347678ljk.469.1647170486569;
        Sun, 13 Mar 2022 04:21:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:b05:b0:448:696a:ea62 with SMTP id
 w5-20020a0565120b0500b00448696aea62ls232390lfu.0.gmail; Sun, 13 Mar 2022
 04:21:25 -0700 (PDT)
X-Received: by 2002:a05:6512:3c8a:b0:448:5061:d49c with SMTP id h10-20020a0565123c8a00b004485061d49cmr10496918lfv.293.1647170484943;
        Sun, 13 Mar 2022 04:21:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1647170484; cv=pass;
        d=google.com; s=arc-20160816;
        b=awB/UEZkivIwZDt+TMjgOZgRm+vmwhyUhWgHuc6T5PaQQ6SJni+5xFtedtA4ogHvtY
         RN8GLRyk7yAZ9lyrhp2bz+T4a0nerKuCZQrx/6HEfCmaAE3kFYbWPgM7x/iySpVH6rkR
         GdcrLq3Ww9/eO3fK1ZnY9Vwe6WOSxnNTxsn2yYU7bwU3st+tK+6BGkiyCda0L3Fet3iz
         R4J6oEbAoaob1zBlzPU6EC/wXIYQbt/gF43yFhksrhKiu7S3fXKJ5C7vrn1e5YDwsE1d
         XpehWbVXw4fyZQD28lAbSmVA0XK2UzreE+PFfuuKks1rQXU/c8ZF7oVLjWayaXbZi5p3
         DIjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:to:content-language:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CN7GDyp19D2BfAuk/jGslTk1llvz052cY4S63TODFA0=;
        b=0WcAAdxMh1I0Db0sTnWAUXhEZj268m4JtJSHvuOH95WFYN0lYZOruRz4ApnImNpHFQ
         RMqd+vS4TGhNHlt2f6vnnZ71RsGwzFS9JIvpKF3KUdtfZE/if1DAMLsAFuAvaSMJ4iK8
         73SJWuxryMGKS0STK34qVlCuPuZLXz4uB5LK1BXqt3saVyR6yHI66N0n7BqDgliq0ofh
         pvjM6rrUnRCKpBpMQJv1oHqXacynLhHSEFd0AfwRmy1DSXvVjBaBOsNB2bro3KRO3Bnc
         GeipZykxzZMG3wMxnvUxNwgy4STeAgYKxJJnDefrKbHXd9s3TsYAgOuVRuMbJjoFegnQ
         oWcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=iCrg+TeQ;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::60d as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-am5eur02on060d.outbound.protection.outlook.com. [2a01:111:f400:fe07::60d])
        by gmr-mx.google.com with ESMTPS id bu30-20020a056512169e00b0044842a98a98si793301lfb.2.2022.03.13.04.21.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Mar 2022 04:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe07::60d as permitted sender) client-ip=2a01:111:f400:fe07::60d;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gq1cY0cdWobCYz4NsttpOQYhUBxvxphQOl1+xC9hyZLSM7Ew7NbnZHVELuV5z8vYdyJWfNosZpc9PIBp05e0d0TgFskAxMlPmsHh+T9dIzOyV5LxZSZvY8TyvgwixSqQGjAx0lD0VNz0ngfvDCNYvXHTSGHGNkZWseSHldvhigy8CCDMBvAEHtzb2bb3UaCvzWrhDESZx/Pys57kHPLSTL27uNP4OH59Q7g9EUfa18gnhHtcPMfGB1OHtse7+pNYF2pWUgt4lg0goxWoQtTf3jpprT8HZzNWAogmaOYsUvJi2ngtq4yhlYxVkUUQSbn7KORWULngnZVUF/ZMtMlwmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CN7GDyp19D2BfAuk/jGslTk1llvz052cY4S63TODFA0=;
 b=EzBgJTeQr2ojhBL4QDX35R6cfCQ2MMDaDOFlIsC24EdwV3KnjWVgFiDGNTIGMFYwTqBZETU1LkwG4qv5fkSIubGTDQ1sKKGfXTAKeHSRZB0ktXDmb2xa3J87SueAis8lOsxnjBjqKKdlKhOfioEI6E3XQMNVeHfsinWtCmn09aVc1E5W6CxmrzasKscBfMrLJc+mpMmuyrAg2ghmyAbvMWih5t46De5/2tqx9QpXWzmkzKsF/nTfAvNAf7RQgJ6ka0KiY/8t8+9XVeDNmeFG9Bfrs38yFNhgvVIS+kFZrKA98mHFZXex5dC4oBizqzDMHI6zMh/nRFUPypK94B038w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=googlegroups.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0031.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:12::18)
 by AS8PR10MB4600.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:2b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Sun, 13 Mar
 2022 11:21:23 +0000
Received: from HE1EUR01FT025.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:12:cafe::ed) by SV0P279CA0031.outlook.office365.com
 (2603:10a6:f10:12::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Sun, 13 Mar 2022 11:21:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 HE1EUR01FT025.mail.protection.outlook.com (10.152.0.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Sun, 13 Mar 2022 11:21:23 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Sun, 13 Mar 2022 12:21:22 +0100
Received: from [167.87.72.30] (167.87.72.30) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 13 Mar
 2022 12:21:22 +0100
Message-ID: <5e6cbd45-054b-6ddd-f104-a567cfcfb433@siemens.com>
Date: Sun, 13 Mar 2022 12:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] vmx: Add support for waitpkg instructions
Content-Language: en-US
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.72.30]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4c9a2fc-54ae-4199-6643-08da04e39b30
X-MS-TrafficTypeDiagnostic: AS8PR10MB4600:EE_
X-Microsoft-Antispam-PRVS: <AS8PR10MB4600A7AD9BA04CF04D6CD346950E9@AS8PR10MB4600.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DLtKrQCSqo+osuHKkE60YkapjGx5Ory3DaWtW/CS9nBbnwX4Lyqtgza+RGJ4ig/JtiWNtcpaMvrI3u5fM6c87KibN6HehgNFkA5O01MKzh9WogXRkeyKXxsh35tdujMNMP5RxkwPH2YOcI4vtDhZ5mIM4Q5Unhk1oeqvg39jyImGWU2a7HLyfr0RNiysuZ8eu2Lhmgt2A4PoSt6/1atX58sfcXQPrQtCaG49Ocm8sOkTFPBmtil1etslVvJdpNOysqT5VSzZ9Nqc8kQOtrMKIgnpM0lNX13vgk5c/6zd7xklr04A42h1zNg2DiY9h3bqVe1AxX1vsw96IEDMPcjLuNaRbv0MXQ+pDfsD8KLDSBJP6vD0KlyQFvVNQa8SOtEzUZ7Y10j/EJvXoC/qQ4tvVjjkKJBrLyqPs9mYMn23l45zVeqViq38gO9G8dmj7xInYYAJPbQfiB1ol60WWr1viqEjrxAU1VM0i8WrMT3BYwZLOO6XqdXYNTG7bCctR59FFYOte24Zm/vkr7vxlSJ5/1HSOK8KvsDPzSPooFKcJBc3kUn74dLTUVf8mc8Csv6xjRi7H9+o79yY4KbS4KxR3tZ0cfJQpwE9REyZT55qtoDn78Ghlud9NnmaCKtZ9WTyLxvrXTsywrpM0EKSRoBtmX2MsHbe9E8CW7VNWUn3cxsAwA63HU1Kn3uIXslVy8nkowbZ1MrnrQVVmLa9sZEpYu1HqZA2+RgOPZ6fpvWKeLY/ZYPZKBhk5HY8HEssnWiI+CTwdRkD2Ot4RlodTM52VQ==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(83380400001)(36756003)(16526019)(2616005)(31686004)(8936002)(2906002)(70206006)(8676002)(70586007)(336012)(26005)(186003)(508600001)(44832011)(47076005)(36860700001)(956004)(82960400001)(82310400004)(81166007)(356005)(31696002)(86362001)(316002)(40460700003)(6916009)(5660300002)(16576012)(6706004)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2022 11:21:23.3292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c9a2fc-54ae-4199-6643-08da04e39b30
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT025.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4600
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=iCrg+TeQ;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe07::60d as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Modern Intel CPUs provide a set of new instruction (tpause, umonitor,
umwait) which need to be permitted by the hypervisor. Otherwise, they
cause #UD. The Linux kernel uses tpause for implementing udelay since
kernel 5.8. So we will see crashes when denying this under Jailhouse.

The pattern to enable it is analogous to rdtscp, xsaves & Co.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/include/asm/processor.h | 3 +++
 hypervisor/arch/x86/include/asm/vmx.h       | 1 +
 hypervisor/arch/x86/vmx.c                   | 5 ++++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/include/asm/processor.h b/hypervisor/arch/x86/include/asm/processor.h
index 3a7d9f93..faba3ecc 100644
--- a/hypervisor/arch/x86/include/asm/processor.h
+++ b/hypervisor/arch/x86/include/asm/processor.h
@@ -32,6 +32,9 @@
 #define X86_FEATURE_INVPCID				(1 << 10)
 #define X86_FEATURE_CAT					(1 << 15)
 
+/* leaf 0x07, subleaf 0, ECX */
+#define X86_FEATURE_WAITPKG				(1 << 5)
+
 /* leaf 0x0d, subleaf 1, EAX */
 #define X86_FEATURE_XSAVES				(1 << 3)
 
diff --git a/hypervisor/arch/x86/include/asm/vmx.h b/hypervisor/arch/x86/include/asm/vmx.h
index c03ffc55..5b0c0653 100644
--- a/hypervisor/arch/x86/include/asm/vmx.h
+++ b/hypervisor/arch/x86/include/asm/vmx.h
@@ -228,6 +228,7 @@ enum vmx_state { VMXOFF = 0, VMXON, VMCS_READY };
 #define SECONDARY_EXEC_UNRESTRICTED_GUEST	(1UL << 7)
 #define SECONDARY_EXEC_INVPCID			(1UL << 12)
 #define SECONDARY_EXEC_XSAVES			(1UL << 20)
+#define SECONDARY_EXEC_USR_WAIT_PAUSE		(1UL << 26)
 
 #define VM_EXIT_HOST_ADDR_SPACE_SIZE		(1UL << 9)
 #define VM_EXIT_SAVE_IA32_PAT			(1UL << 18)
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index bf25d00d..5a69710d 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -237,13 +237,16 @@ static int vmx_check_features(void)
 	    !(vmx_proc_ctrl2 & SECONDARY_EXEC_UNRESTRICTED_GUEST))
 		return trace_error(-EIO);
 
-	/* require RDTSCP, INVPCID, XSAVES if present in CPUID */
+	/* require RDTSCP, INVPCID, XSAVES, TPAUSE/UMONITOR/UMWAIT if present
+	 * in CPUID */
 	if (cpuid_edx(0x80000001, 0) & X86_FEATURE_RDTSCP)
 		secondary_exec_addon |= SECONDARY_EXEC_RDTSCP;
 	if (cpuid_ebx(0x07, 0) & X86_FEATURE_INVPCID)
 		secondary_exec_addon |= SECONDARY_EXEC_INVPCID;
 	if (cpuid_eax(0x0d, 1) & X86_FEATURE_XSAVES)
 		secondary_exec_addon |= SECONDARY_EXEC_XSAVES;
+	if (cpuid_ecx(0x07, 0) & X86_FEATURE_WAITPKG)
+		secondary_exec_addon |= SECONDARY_EXEC_USR_WAIT_PAUSE;
 	if ((vmx_proc_ctrl2 & secondary_exec_addon) != secondary_exec_addon)
 		return trace_error(-EIO);
 
-- 
2.34.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5e6cbd45-054b-6ddd-f104-a567cfcfb433%40siemens.com.
