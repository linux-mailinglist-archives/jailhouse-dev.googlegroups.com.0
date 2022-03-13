Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZFKW6IQMGQEWVRDSUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB3A4D74FE
	for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Mar 2022 12:28:37 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id l11-20020a2e99cb000000b00247c058c077sf5241674ljj.18
        for <lists+jailhouse-dev@lfdr.de>; Sun, 13 Mar 2022 04:28:37 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1647170917; cv=pass;
        d=google.com; s=arc-20160816;
        b=lIhboXrGt9hAmjp22tqBiipeKfMYm6Y+9f644oNztCqSJqdq6pmtpjP2MNmoMjsXVY
         S+fKCiUtwzPnTpxSJdX3CLfptwECamHeXI2eQ9u/zb0zixMIwHYsB/tU+Bh2NzyWLj9Y
         cAB72J8x1O/gl6s6rxcUwFHYPUONbkPO3ku3RNySXhqyzFV+c7kXbWg6ZshkpNtVTAE8
         llpwZJlxMdDlowZ76RQZuwM/OP4QobWTKpdhTlwlWupW5zjSKP7Ch1G+mRzf+eJcW5eJ
         +wRBQZJBUAg+LYm+nB0MSFoyBLVBmw9d8lJon/JPLkiGMktO7cD/FR3Tk300wiry77Yl
         y9GQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=a83ajaK8qhWFlEsJ2q72dhT5hVfBl2F6FnCazXHRfGA=;
        b=Avx9pDCn1r2k0DrxHCUcN6ChvmQTwRfAW1ThyRlkkga8ET2fEywXAZKdp6tj1lOM2q
         YTxm/DZtbio3O90OdkdDdV09iA3C5g6SjSm8iZ3KjaMCkdUxBFU4al0KCI9PloncAW9L
         u/rawGiLmtnibj4E1/gVLQs0ML/vxoNbFD2z45PfsuYirVOifumGHsUIQFPNj8irex9F
         I+t9ay/MnmyzyiWHggXCB1Wd5Swfr7NewxCTX+3K45qaDxfy45Pse1wyHN4XxTWbFU46
         fs7SevDMeA5j3vmYKqfE5Dr+18vc76VcJNcqwfZr1yv37xCDWC8KqE36IytQ5b9jlaRx
         tV5w==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="lu/4ZchW";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0a::611 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:to:content-language
         :from:subject:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a83ajaK8qhWFlEsJ2q72dhT5hVfBl2F6FnCazXHRfGA=;
        b=eGQ32bN0hC+cHuD0LOIiF5OHasNQ9c60AT4WdXft0kh2bsmrN7e3+vthljdHdWRkXM
         OQV8MZWeNTP5ctbWD1mx09CfNE/UZE1kGfWVLkLROi0CX9NvTtXN6rN6rhYPUE30KcLM
         7USONX9cWavimCfo4jB4ox2k6HbY86kCVz9AaKSIVPZvjQgudCnJ2eYVJIlJwUSMskft
         QG1MkT4hD9zEClQPwyMkSbfn+B1Jb36+lwA7+ljB83NIYCssLud9J2UvOepirNJs884d
         72JFgA9hhJYWdulAMOlDm9qmFbkUlhyLbwxFzVFjU7kT9Arg8uQpceU+GPIewgmbfX4T
         Pqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :to:content-language:from:subject:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a83ajaK8qhWFlEsJ2q72dhT5hVfBl2F6FnCazXHRfGA=;
        b=fKs7Boatrro6ed7hFZek/+bflNiVL/0/19THqpXB5QEAx+1og8hHy40raDfP7u9Vzo
         59yTK6eIDhds9JPri8xCowpCNXfqNjTYnywq5ksXBBs8W83rAC626F2D5UxC3Mfk/B8l
         hm2o4UDzsVmPgd8Q4PVwfkR+/xcQo7+nZig/TnMTkS+V1xT4vINfzf5Ue6jZJ/0CYSSm
         5tBQPyCam51ad786zLQpmI9tsYmIZMBsmVjXe3EDpnFTHdzko6A/lEjqCCztAeavwuCP
         8JR/cuXIGVdVnwptZ4/Lv2nUjAM33Wdox5vUoXOAsVaQepg3npK4LuAEf4Znk8XiLClV
         nqow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Xu/dfQ/Hmr6RwtGPS5NPcWYb9U2QOdujPR8OI9robj6kOYYRZ
	bQI8aafZ4OaKMHN0tYRWkBc=
X-Google-Smtp-Source: ABdhPJy4VVaa7q3Hesvd0IrWZgPR12KP+rIn/kYZ84UOMfjvBbMlGlT26ZnmM8/llZy/XxoXBBAXsQ==
X-Received: by 2002:a2e:22c5:0:b0:249:278b:7f6d with SMTP id i188-20020a2e22c5000000b00249278b7f6dmr4102409lji.397.1647170917106;
        Sun, 13 Mar 2022 04:28:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6a08:0:b0:247:e311:8788 with SMTP id f8-20020a2e6a08000000b00247e3118788ls951284ljc.6.gmail;
 Sun, 13 Mar 2022 04:28:35 -0700 (PDT)
X-Received: by 2002:a2e:98d6:0:b0:247:ea32:a24d with SMTP id s22-20020a2e98d6000000b00247ea32a24dmr11392918ljj.314.1647170915723;
        Sun, 13 Mar 2022 04:28:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1647170915; cv=pass;
        d=google.com; s=arc-20160816;
        b=s5/iD8Kg1fHLbw8WdubJjfprE3OMKdT1/oEMxYYPFjw+T8QtgAv57dJpZvcNYUU2/M
         hgCBmEEtEFn5yytbK217LEUj+L6f3iUnRxKDA6BrrYXtq88XmSL5GPWZrym9uno+PDnw
         OiCwUxf6+pQGFZK4KMWHf4hDfVVZMu0rZOoiqO1gnNXY0g37WWjtqhbHRY2kGTiDr/dR
         3sXezW6UreA2cbYmzt8IVoZswU/ttYpWMOagpQkOGpZ//jKJYGWkmu/wGVDPGXHX30Ls
         hKQ0v1FmZJXADEJPaTUh/lQ5z818qDslUeaT6MnOqmPG4wp/44ToAGzj9vmcHOBT3P/5
         9NDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JmVX1eMUe5a0EAkidGggP+MAmVALZaULBY00LzboU/I=;
        b=ypGm3+y+U6EaZ9Db80ywF1ePeF1XyJFk4ZdW8ZwyfwONOM2aCvvrVUSxJfQYPzOt9J
         lPDgkVZGXqirLi5tnd1BtJS1Q8uyDOmdl58tLvQfwIm85VqrLifgMKZvUw0s4eWpffYF
         18ZaHXIazsEfQAziTdGNwe720pUN0+8ArqkJzRF0kaHuAk2cXiJrX5KAFIliFM9ElYS/
         MAEqfc94AVs4r3Jom7y9uI0RZyhiBlevz71zTiLi0wP79NJdilNMyEyy6SGrDxY7zbH9
         7XxAOdEeo77gReWVQebjXEovRe3UYlQv9ClJ9gthNOmCKhGkNQImxpMbkE14tkOrW8NR
         i0hw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b="lu/4ZchW";
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0a::611 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-db5eur03on0611.outbound.protection.outlook.com. [2a01:111:f400:fe0a::611])
        by gmr-mx.google.com with ESMTPS id m15-20020a2e910f000000b00246477237ccsi955145ljg.8.2022.03.13.04.28.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Mar 2022 04:28:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0a::611 as permitted sender) client-ip=2a01:111:f400:fe0a::611;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YbQfw8OdX8cnkA7qsMCpxiGzEFkE1IFzAYrulkhnjTRK2ayZXqey5K+WIAebzkSd6YrsP0cVogG0UeP04VL2VBkhBI4QzIG8rwuY8DhC1SYS897IlIOfMpby9oxoLqSn9Q+9s8usPqpNYGpw8Ga7xfcZYfjZxv26TAqZ2KldF79/Cyw+hYB4s8leGlKsbOEdOYNj6jsVE1Wc3ucn3SrY0QJzkp/JQLhhRjL2r9HpFIJfjS9S/iDlxBbBnNT4W9TOt73wc3C3w+7U05SqsWpK2QEam01Vz6oUdJrN6OxFkmIAWLRH6/7GnfFl30JfLSL1zFN4yE2DpJGjCBi4+6E0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmVX1eMUe5a0EAkidGggP+MAmVALZaULBY00LzboU/I=;
 b=YdTYiG7pSv3fsyC92LkK+M3Poe9QpvXKTpsfJsux/HylABRCdsqycj+tbPjUCS9dhj+Px7aJoaGv+bXUBVsgewzpDjkifwKaW6pptId9uxeSRg0nKoOcNXc9EsGOwLNWR759aggxQYJneWI6gPvN8nspI0AlJsl4U8WDfwqB99F9rQhCV+fyPxsbzmU0G46m8bABd2rtIQ0EpQqe38XBolHKsZ8b6uesUrstBDiwV2mgkRwaoCVzYZRV9an12KkpMaKdw71JIElDdoltvhfpDCQnaxJZRc/UZ4DizOUT9XixMa+xdhqGGnUG5oJOxhpca+HBJwgKlgVdBMz8rIm2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.71) smtp.rcpttodomain=ti.com smtp.mailfrom=siemens.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=siemens.com; dkim=none
 (message not signed); arc=none
Received: from AS8PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:20b:311::23)
 by DB7PR10MB2492.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Sun, 13 Mar
 2022 11:28:34 +0000
Received: from VE1EUR01FT078.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::31) by AS8PR05CA0018.outlook.office365.com
 (2603:10a6:20b:311::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26 via Frontend
 Transport; Sun, 13 Mar 2022 11:28:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.71)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.71 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.71; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.71) by
 VE1EUR01FT078.mail.protection.outlook.com (10.152.3.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.10 via Frontend Transport; Sun, 13 Mar 2022 11:28:33 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SKA.ad011.siemens.net (194.138.21.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Sun, 13 Mar 2022 12:28:33 +0100
Received: from [167.87.72.30] (167.87.72.30) by DEMCHDC8A0A.ad011.siemens.net
 (139.25.226.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 13 Mar
 2022 12:28:32 +0100
Message-ID: <9dfb3644-f161-3108-0257-441cf47e5f45@siemens.com>
Date: Sun, 13 Mar 2022 12:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
To: Matt Ranostay <mranostay@ti.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
Content-Language: en-US
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: k3-am65-idk: config checker warnings
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [167.87.72.30]
X-ClientProxiedBy: DEMCHDC8A1A.ad011.siemens.net (139.25.226.107) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d7e655d-0e83-4ecd-2d61-08da04e49bb0
X-MS-TrafficTypeDiagnostic: DB7PR10MB2492:EE_
X-Microsoft-Antispam-PRVS: <DB7PR10MB2492B42CB55C46B0C61106E0950E9@DB7PR10MB2492.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9PAgo50OcJCJyd9+XLDmaidXl9Hq9u3mTr8wY0dmQggxMyrljZYx2IecxpL1EfHUFqm7BAucOawIiAS4VSPpJmY5UNGipKQIjsQjDjgWR5+TyWvKiw4F55nJbY0XJoBVAhdt+Y4E756nnqTs0YPhwUCqZqYogFqM0nEEbWZiCC1yEYbJ5dCLMxQ4/gPTLgCtBdDdOZnSmASlzcOAuEPFzb6yOnbl38w6jWNNyTAbS4ahqxTJdxcDEmEDnSoFKE1pubHNk9Fq6pVguzsfAuDFFG1V9g8bCvGTQRTVi5HsqcJ5Sv3ljNRLobQ/T21WddjeEQHkThcRjQzXPM9H1gTo8inMhBELdWFlgf46D/dFiwya2HMOa4aQRCWIcxkm8DbxYH6YqjVFgr6Sa0vaDywXdwPfWnpYdtX/8CAHKtc++tcYe75/9mtDtyBaVkqAN0ajcsOwajwyw/61GVgDt5lCEBZsIOSYxPCIZeG1SRDan4hklj2xwL/OUbyyzKOtDGbSCSMM3V5LwZ968SMFkHAT1+5wiE8T4xUKCTei6+P9NLKo8/Ok4lGrndi4oZtdMhiCyxXRi32v/lcoyhXh5Thama4+vsEZ6Td02gNe3fAZpiSgnfcj3XadAN039OPYIUr1Rz8npGRkhRKcvyvweBQnWGQ1o4ILyBxyNkCv1KMm1r2lKFfN+Hp+whMxvze0KReRkT+GZI1FS5LBJTvRBoko7Lm4OMtTCDIFvSZkEhEg5WMu7jBPBSirIA/puQhP5I9GxtgND1nS1Og3CcPSReuG8Q==
X-Forefront-Antispam-Report: CIP:194.138.21.71;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(16526019)(956004)(47076005)(31686004)(36860700001)(186003)(44832011)(2616005)(8676002)(86362001)(31696002)(70206006)(70586007)(336012)(36756003)(8936002)(2906002)(5660300002)(6706004)(16576012)(110136005)(316002)(82310400004)(82960400001)(26005)(81166007)(508600001)(356005)(40460700003)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2022 11:28:33.6790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7e655d-0e83-4ecd-2d61-08da04e49bb0
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.71];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT078.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2492
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b="lu/4ZchW";       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0a::611 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

Hi Matt,

as you are already working with the configs, please have a look at this 
as well (NOT a regression of your series):

$ jailhouse config check -a arm64 configs/arm64/k3-am654-idk.cell 
Reading configuration set:
  Root cell:     k3-am654-idk (configs/arm64/k3-am654-idk.cell)
Overlapping memory regions inside cell:

In cell 'k3-am654-idk', region 14
  phys_start: 0x0000000042040000
  virt_start: 0x0000000042040000
  size:       0x0000000003ac3000
  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_IO
physically and virtually overlaps with region 15
  phys_start: 0x0000000045100000
  virt_start: 0x0000000045100000
  size:       0x0000000000c24000
  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_IO

Overlapping memory regions with hypervisor: None
Missing PCI MMCONFIG interceptions: None
Missing resource interceptions for architecture arm64:

In cell 'k3-am654-idk', region 10
  phys_start: 0x0000000001000000
  virt_start: 0x0000000001000000
  size:       0x000000000af04000
  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_IO
overlaps with GICD
  phys_start: 0x0000000001800000
  virt_start: 0x0000000001800000
  size:       0x0000000000010000
  flags:      

In cell 'k3-am654-idk', region 10
  phys_start: 0x0000000001000000
  virt_start: 0x0000000001000000
  size:       0x000000000af04000
  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_IO
overlaps with GICR
  phys_start: 0x0000000001880000
  virt_start: 0x0000000001880000
  size:       0x0000000000020000
  flags:      


This last two look particularly dangerous.

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9dfb3644-f161-3108-0257-441cf47e5f45%40siemens.com.
