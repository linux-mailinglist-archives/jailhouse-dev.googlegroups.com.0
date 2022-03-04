Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB35ZRCIQMGQEXD3MGSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA7C4CD5E3
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Mar 2022 15:06:40 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id n11-20020a50cc4b000000b00415e939bf9esf2452874edi.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Mar 2022 06:06:40 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1646402799; cv=pass;
        d=google.com; s=arc-20160816;
        b=kwvCz7gHp2fs8DY/1m2PdqaYuVC/52z8BDYFd20V8LKINpPwIXyS6/Dhms2R1ZlSe8
         8UM2GMPx/3esnO/QdoHM+fp7tMf9N4qi9Otfjt/+L/wiZCOyMz0xv9W3veKBqtyjhBr3
         +3VarTDgOT53kCCozaYpLKcd1+RW7easXxjD3nwvf8QCRBu2Z0868aGKdKIYhFUbtU85
         0xPXwq4ENmaNVTIUw3V/GtmLhw/TCpQK2mV4IauDsGsOZ2Ss1Ip/yCkLBv9M0KAPIGL0
         3WHYBxFn6jcR9ffUYkN0MQTo8WfIBkphOnMeK+Vcn5rXOMYvN8sF4TLIZz6vpsg9GOig
         68/Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=WE03t/4IBQ+px3KGs0QGcYcvww1GHfHRE8GRlMpTvDM=;
        b=z+OKCPpoluNaxvGCLAyZZylG2IileSdXnHjys/OtchgBV9eb/+Kdg1dSqT1TCouJAl
         LGqc8SsbwfbOiFid0CPbTRmcXVn/dTo0GuvA4TB+F44DWunxJ0sPgQHqxTr+BfVJhcHS
         hL85ArJIk6G8PWR6nvZx4eKE6jhspWIHzoasHnfv+IQltmGT/A1uxkgBm1W/KqXH+cD5
         wuF1pIPYIYyS+X3Ty3dp2A2XrXt5s7hDU3oPRjjilKrYQ98BHA5tv7UKRki2uQRPhehF
         Cw8NkUymWR11QisBnYt3tmQwy6MQLPF01FBJjqMuaQjjfreAwQqa0ErEOyfe+ldAiYHP
         xEyQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=jSg+C5fy;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::625 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WE03t/4IBQ+px3KGs0QGcYcvww1GHfHRE8GRlMpTvDM=;
        b=rcnxrSBgdG5ASJK6GUkyT4dq6KCIZI6Aw99qwyv+nXKKRHi08cDaYkU5AfxMlv9I1r
         SQDWiks1qwnJS+nQzfQBzbsZclK66wz6IzUBuPEDLkHr1AhCeIzCicav1XurirndY2HM
         Rq/8OOM+dr/a6/ewbY8zgcJLJ+hSh9aGuIIslNGGC/IKhzuYL9+J7lHKp5qwlaN5xK3x
         ppL8z7WRuDWY9NGhUl9TC2N9zRqMfGII+f4Z4H1dBf37FzzRs1UfnWTr+iFdmCJQhtpr
         P/4hEUdit0yFJjqoLJ/XWmdx6HLRp+mwa+qq6HChZ2tdWBfS28GRfw9jaQgDyizl+LvF
         SwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WE03t/4IBQ+px3KGs0QGcYcvww1GHfHRE8GRlMpTvDM=;
        b=4PhcsE8IcrakOMjOdrBam9iuYT6hcf7pr2j5iVEHKcr+G+AO4GdtCLURMrxbrQKcyF
         0LyogOJQ89xu2A9Crs1Fmdv5Kh2It+rNIMnbaDLMiengTX0fxFGgo+pTPoR3dAlLatyl
         h7MVFwHgzOOkIbJKJlhp+a10pVZz2cJFtWTTxRw5f9OjgqamaYK558ifFUddIq2kTn4F
         NPD5eGR6ecd/gKW+JXHXEDaS2BKfwfddv5vFZOZw/a7VR5dwJR3Ozi9Dwkp8mU1KXriE
         zXyPOEyVILrmLvkltv5qziHTEdD8GQrsySvUoMpatC7MUHJHFsGB1WDnV8uPLIa+8reZ
         ajqA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530jQEn9zkxK/A3KhdnlbBCa4SHCdzaoeWkWSbKSUorv1burO8Oi
	u38Wzx9BmFD9Y4e0hM4Nxsw=
X-Google-Smtp-Source: ABdhPJwAny/MLU9oIJ46yVqVz/O7eX3qQWxSaxoh0fBHJ7WenNjbJjxrCpQrzKR7ChLOOxtrBz0lBg==
X-Received: by 2002:aa7:c244:0:b0:416:46b:6237 with SMTP id y4-20020aa7c244000000b00416046b6237mr2062398edo.139.1646402799762;
        Fri, 04 Mar 2022 06:06:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:629d:b0:6b2:5d23:3c7a with SMTP id
 nd29-20020a170907629d00b006b25d233c7als115799ejc.4.gmail; Fri, 04 Mar 2022
 06:06:38 -0800 (PST)
X-Received: by 2002:a17:906:174f:b0:6d0:5629:e4be with SMTP id d15-20020a170906174f00b006d05629e4bemr30579108eje.525.1646402798193;
        Fri, 04 Mar 2022 06:06:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646402798; cv=pass;
        d=google.com; s=arc-20160816;
        b=JpaE8XXtd8+8A5D5zC5OEqE62x9tEaxxr8cZe3ZPGqmkyumzb4zvxWuHheI4CaHS7E
         4Kz+Y4QR9NRIS7CQYN22FouTldSmUMrIUqIGacV0xtNeMy0OcKxmwH96EtYaNkh31bpD
         Nfmh67Dccac9rylWo5vXFqsP6JiwvkjIO/5X+nrDNAOcwJTsEbO7flIBWLDZ4D69M1Bd
         ghwAr8RAUV9HUmGhYrtXTjgGY4D04CR4om1JkEg++uHeH3Rxqz3HmF9rJhqON6QW18kB
         n8UEyB21IzrxsPbBy9ZTzxeEHx0klmL+JmO48A/3gr49X8UzCKmCihlCQwgkZgEtJ6NZ
         DSpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mRjL2PyZGabnue+mODSK/09NQVtsGN51oI7gbm61CTI=;
        b=FkHV0Dl9nFEr9+jMoJb7vce8nJvgcBWnuUeCnwympdanNrW4gG/lI6o+RtuRSKwPMW
         P3BNgRScX3Jv4gLuImXUyn58wEd7otmmzJxU6qSLUm5Q2M5AkxZIT0Fo7tzeOTqkcqhl
         QdZjitupMmktlrTPmPTrTHMIFfZGQZuChRn/nEiulwiJUVXiZc5Cs7TvPn91h/NBde7F
         oR6YRksDwf7p7ih/vegoontFqnZXeeYBYKZPocMITT4yCZnJxWlaTq1gGeVkWq3mJkNd
         qxa/ke1JXX8O7y0IILxuAP1qU0Ku3nwXklapPgrT7wqly9aH149T4NbqFf6VIJ1eI9qH
         3S6g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=jSg+C5fy;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::625 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0625.outbound.protection.outlook.com. [2a01:111:f400:fe0d::625])
        by gmr-mx.google.com with ESMTPS id w1-20020a17090633c100b006d0a73e6736si167951eja.1.2022.03.04.06.06.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Mar 2022 06:06:38 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::625 as permitted sender) client-ip=2a01:111:f400:fe0d::625;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsFcpOeoBZzNbGIiqft28ejnpx4hyvnAREe9OmDaTmUWlIwhcx/OpwBBOuqNbU5AZEDCZ7Qc4NwgBBxWwhvKROYoS2WwZquVp7WX4u7nMjsRib28OaFMgq07b65yHeeaoECaVevDEizpwoslb9kK0+NxV79jZVX1Tm5V9YFSNd2O9OHA1fDZbJJC3uDSRrtZi6jf+S0VcVXgLk527FKMI5NXKhTGA8JArcqz4BUxQBbiZ/NJ9z5998d82h9XjyZEjL7if99JAxH32+pwmoga8I2Orsw2pNnbe+ttISE9j4nAIb4JQgAMr3l5a0LnJm6vxC8lO1aqbC/grq1AP5jP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRjL2PyZGabnue+mODSK/09NQVtsGN51oI7gbm61CTI=;
 b=FCvnfhOofag4s9A+7okkrY8AVLIxxWFqiSTyJ/di5KZJ+f4tUNnxqA/OWR8yLQIEdI+VcEbczwiLpAbaGwIxKP/2ZEm8+lE503rL6JG2TcCwO5jUcJZ3WXRIS4DhHc764VUWacEtxZyc0Uptcmxd9XFOGsETUcbFoKe2wqm2aLxtbEp8v10FxQcxkFsVeY2d0N1JzgTEzlthRuVXS3diqkojofnoG7dxADxlPUhLcMogx/GMknV9NZyNbyuO5MwibuJbsGu5jEzpSfPRjpX0stOmRwXzzYnNSCwAU6xAAVDYwfrVZokG0EZPcz6GEvIOC7Gykb2pNywhyS1+qi1KbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=ti.com smtp.mailfrom=siemens.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=siemens.com; dkim=none
 (message not signed); arc=none
Received: from OL1P279CA0013.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:12::18)
 by DB7PR10MB2378.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 4 Mar
 2022 14:06:36 +0000
Received: from HE1EUR01FT018.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:12:cafe::6e) by OL1P279CA0013.outlook.office365.com
 (2603:10a6:e10:12::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Fri, 4 Mar 2022 14:06:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.73) by
 HE1EUR01FT018.mail.protection.outlook.com (10.152.0.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Fri, 4 Mar 2022 14:06:36 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Fri, 4 Mar 2022 15:06:35 +0100
Received: from [139.22.142.118] (139.22.142.118) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Fri, 4 Mar 2022 15:06:35 +0100
Message-ID: <d8f162c6-3e41-cf88-15ab-4f599821118c@siemens.com>
Date: Fri, 4 Mar 2022 15:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/4] configs: arm64: add eMMC support to k3-am654-idk
 linux demo inmate
Content-Language: en-US
To: "Ranostay, Matthew" <mranostay@ti.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
References: <20220304021615.2862-1-mranostay@ti.com>
 <20220304021615.2862-2-mranostay@ti.com>
 <c8697abb-27a5-6560-513c-067c4d32c389@siemens.com>
 <e3fd76521d2d45828072a6430c232403@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <e3fd76521d2d45828072a6430c232403@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [139.22.142.118]
X-ClientProxiedBy: DEMCHDC89YA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a89147ad-8c25-419d-bffb-08d9fde831ea
X-MS-TrafficTypeDiagnostic: DB7PR10MB2378:EE_
X-Microsoft-Antispam-PRVS: <DB7PR10MB23787D9BA07C522BEDC6B51B95059@DB7PR10MB2378.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WqFo2nZR2tFsS3pXP0Hki/bNMW2QVj4w+NFbw2tDAtrfIamGeMCmqHR0r0vNLmWCeqR0XQlt0XsyJziZF4eKcjL3IRAuhiavd+Y40GHcRMaQyswcFAuI8w30PRT8Esjb3/M4KC+uHtHI0TPkj5Var9UTzQ8ZfbcL0E+XM8nGjzATFEt9AsIGbv2P6FbAYsuW1ukPWgZ047tGDr6VS0qy4GPwg00zKYLkibXfbTro6W+N62/qePOP2bW44m3bCSp1/ceOcTjTKqnyh1mWLfrDpEoWKFQKjwhR5HfpgWyWi8mFaWIdRNNy6FKqC90r74E7FDkvKwTUM6G/Ck/2OoyYXEKVT5sH8GUpwqhoavpm0WNfl+DE5OuNPEMCbgtL7xTCgtYidUDhcQM7nt4Nmgv+Wk00c2BiWr5LsOKGZbbsGejiPMBhH9ViMiMUFOI0l9Ui9eibJY1z3kxWOGK2JHM78zn6f7J/CKGSy0Ks2bEv2nifx3QndrEaHdzkPeO0/FBbYDgvjOfuc+YljE0VLcVl1y4eAE375LSrrbKi94HK3U6v2gBFQE/CaHXBjMuNdz784Cmo0amIJzskm2PIqiYtrnyByJBgcptQpvjPmHBTYy7klWNyuEaNZpJA3UYtb9p7JHqH/60F2QMisssO4VJEXa51xNCgEusO9lRoslm88kbfIcj0fNw/1c/+jI8PLKj5bw+yuVMIIXWz0684qH9yckHagtKN84xkW9HSC3jbMtmOf1YJys1tyWesgx3yp4zG+4Jb+5S4F1VZduVTTFznRQ==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(16526019)(8676002)(26005)(40460700003)(336012)(2906002)(82960400001)(5660300002)(36756003)(356005)(82310400004)(8936002)(47076005)(44832011)(4744005)(70206006)(956004)(2616005)(6706004)(316002)(53546011)(110136005)(16576012)(70586007)(81166007)(31696002)(86362001)(508600001)(31686004)(36860700001)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 14:06:36.0562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a89147ad-8c25-419d-bffb-08d9fde831ea
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT018.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2378
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=jSg+C5fy;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0d::625 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 04.03.22 08:51, Ranostay, Matthew wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> Sent: Thursday, March 3, 2022 10:36 PM
> To: Ranostay, Matthew; jailhouse-dev@googlegroups.com
> Subject: Re: [PATCH 1/4] configs: arm64: add eMMC support to k3-am654-idk=
 linux demo inmate
> =C2=A0  =20
> On 04.03.22 03:16, 'Matt Ranostay' via Jailhouse wrote:
>> Add eMMC support to k3-am654-idk-linux-demo inmate which requires
>> several device tree changes, and addition memory mappings open
>>
>=20
> And what does the root cell use then as mass storage? Normally, that's
> where the eMMC belongs to.
>=20
> Matt: So the SD card is the mass storage for the root cell in this case. =
I'm okay with making an additional inmate configuration with the eMMC chang=
e.
>=20

OK, but this contraint should be documented, e.g. in the root cell
config. Even more when we pass the eMMC through to the root cell so far
(didn't check).

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
jailhouse-dev/d8f162c6-3e41-cf88-15ab-4f599821118c%40siemens.com.
