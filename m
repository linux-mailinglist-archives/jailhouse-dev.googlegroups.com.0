Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFMO56JQMGQEHEBYWRA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id D5951523553
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 16:24:22 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id m6-20020a2eb6c6000000b002509fdb1dbasf795664ljo.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 07:24:22 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1652279062; cv=pass;
        d=google.com; s=arc-20160816;
        b=nABx+NAWDYQc2CN0nxiAALt2CfRGhZ9+j8kANLIgGf6CPNi/p9mvH30NMzgDVF2SG1
         wsXa25MCxP3mKYnLVojbhlhfS+2xSJdIbrYC03eYrS+fQnwr9+6XeUccaFdzR/Am71uU
         gHxNoXYnNzOhS1QbMpEJ8DN8Hrc8N29UCfwwuw3H7mPQz07CRvCGpsnbIKuhy8B3thnH
         1hbi5Ef7DwU5IKiOiXYpMLWlxDCTmVqfVrbeOwptc4tGBpV7xNwk3FZVCCTcmvd6TfcI
         uq1HIC/kb2cMbDtHu2DNCuWmOKa5Ora3xejrL7yACtu/MJKph4ihYfbRmZePVzFE0iaS
         MGug==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=Fmrra2R+arICNrHnBSNonbonWGPDEe+WjEB61m88K7w=;
        b=uoc2WgIPCg79fuRc0g+x9Jo2z84xcfHYVMRPExJYxnE9M7F1zqiEfmrv/2oqzKeOYn
         XjxnVgwmGzoQUokJcf82tUrtE2EzVKRXvf85UkNOpmPGQQFOgYFsIELqYbIClPqT1OWB
         WcFm5caL/r9yAswM2itIgn5awHqlqJRVv1dKvWteFDZr8r7Dcq1wzhxYvaYZwYTXR8Oi
         BbaH4foQ8fvzKxM9j9bddLUlBZMRp2QE1Wv3yE14xXsIBvf7ektWKpHNbnM9S90esDNZ
         HaYWIoWg/KdEf6lvYHdf6Ypd1hfOCRQ23j8I/SrLPjUzvpaj7hdYNuEW4guwVKgBIkdC
         Eqeg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=BjIObCIu;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1f::627 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Fmrra2R+arICNrHnBSNonbonWGPDEe+WjEB61m88K7w=;
        b=QLMPHQpj0cGuQioJ9O1Faa4a/Il/k2JiLjy93cTaNmPkdv+RbUUsbLYmB1JxPe29DM
         5poJs0KUgBw7a0RmKe878hFRSheGEWPqI3MtVywcPnrNKdYtJpcJkgnyA0c8tKTOlYhU
         jZRtYb2tHMDv7S4j3mlkQRgJ2NEcUKRz/EJlO+eRWHmOTDT1DoC5ZZkXVUcpBKWhWPl6
         t6Cn4TxURaAbdCNFLKkV5+9Vzl2NbzSZOatxVzjaPn3OWhTCT8AEZyRfDOhCHbXki05T
         cvrz8zpUScRvR3n4OUkvn/lFkiV5MIT5jbmH0eQV8gAZzHllMIbMBZx3PYVQBqLRIka4
         aLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Fmrra2R+arICNrHnBSNonbonWGPDEe+WjEB61m88K7w=;
        b=XAAnyCX3GOo0e3SoKu+pCxBuzS+sielG1mrVrz+rGEG0cgPfIekC+878kkkepbq5uo
         vmMieK6zzS9Ki+9d2z+7Ii/gm3ETDG1ahaoFkXLyLqbUQ9XqCDj7FoyZCgy+aU2Zywf4
         CO0+qya10YTNeG7dZbj7TdswwiOqlji7+lkbEVejEWKWprYMkktDvf8uW0RZoS5Xpg6A
         p+T5154OgISXsGnFOdPaPUGs7MVRyjiUCkL+JOFCVGLgQq3NqvgY4GbCj2yy1ixXetq5
         Hi2PvUxjIPz5NF8dTMtj8kZ8k2Mz6ajQguro19Jr2G4MBeeYyGU/3EULxX3bEaRXc1II
         1N1A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Lhnij4tUweT2iBahqS6537aO39sjZz3BjnZ+Ha2lq3Xarntbo
	c0ijt+DLz28sOjaOLOgyjxk=
X-Google-Smtp-Source: ABdhPJy98B78zPN2MpKMjm+Aey8WuYELzgqO5HptIoa7zzaJUIgvxGPnj37OTAmjhizZrAcdp5HX4g==
X-Received: by 2002:a2e:84c7:0:b0:24b:6842:1923 with SMTP id q7-20020a2e84c7000000b0024b68421923mr17811364ljh.166.1652279062240;
        Wed, 11 May 2022 07:24:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4c49:0:b0:472:627f:9c3c with SMTP id o9-20020ac24c49000000b00472627f9c3cls203683lfk.3.gmail;
 Wed, 11 May 2022 07:24:20 -0700 (PDT)
X-Received: by 2002:ac2:4892:0:b0:471:febe:2e7b with SMTP id x18-20020ac24892000000b00471febe2e7bmr20462938lfc.69.1652279060150;
        Wed, 11 May 2022 07:24:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652279060; cv=pass;
        d=google.com; s=arc-20160816;
        b=BHSoFH8LCTYdKmEbg1psjLgNX002uQwqDUElzVKPHbk4ySjPjuXF1NqhxAu5yXF55T
         f4ZwYHMyyjsThFT46s/qvCucVvv1wf8b9rKPIZzhmvZzfOQFDD2HKfXElGjxhjzcMjss
         X9gpVPCFJysnxmIFV/A48rl3Ef9U84/uUFSrSfJFl4b9oe67eNP6/ITvfzFHJWzj5+mV
         PWPPrhNhL14IPfRhWgP3Oa0HLe6/08DJN+Boxqtjx4MzuP5DxC7gjojKA8wqXD+aLJdz
         Aodg0hjqTRT+bKFjhpWWkHBV7Rq0QZ89eIDwH61w+YimanIB9z69girQGirn+oALy4Ia
         TI1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=p8v9HENkJtrcoYVBkGWcEuz49pYftEwmm5CvyNvq2mk=;
        b=Gx6/yzTwRJ1LXBY6uyynv3/2SAtR28woUa8PQs+oiXopuKX6kdeHkGQAt2lBjUVrzU
         ylDEvSml/TtOYYrKlKr+XR6h9SVzMpgXCdF760eqLbEew6ZKTd6WPFMvTfJYzTesrq1A
         QpuT53WzPH5tuuc0CvxpArz2hT2o8t9XsL/tiK5IWl2ucoOZJw+37wYHzgOpChT4jlWl
         +jz1/UAevguoud4OFlrobubk/R7DuJNoCK9M5cxUpPvjq6e437nfrXu5BUPOUffJ5Jbe
         oq/o32t4KsR6UuvFclEEc7KwWGVU7c0JH0apZ5eukrPk0Q24IcDc9Wcvke6DKubwP8E2
         NKSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=BjIObCIu;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1f::627 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on0627.outbound.protection.outlook.com. [2a01:111:f400:fe1f::627])
        by gmr-mx.google.com with ESMTPS id x8-20020a056512078800b00473a659879csi103221lfr.13.2022.05.11.07.24.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 May 2022 07:24:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe1f::627 as permitted sender) client-ip=2a01:111:f400:fe1f::627;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwLh2T4ZA709+dlULyAxikSKFpS7P+FmKUBKVSME+07p43WPr5AvZlyPS6NTD+FFgfvzS07PPIRpOupdUmpVyNMSb4ItCzG5FA093x4XYXg7NNcK1TSBCn8Xvl9bmDHDdzn8doNk9U9fMCQygQxCN3RNylQCx0lpAky6pNa0keFhcePWy2ZpjzWgl/ZHF5XkXPaWfB206kLGmzOuqMJdI4jYtR3+kOgd6A/p8JCNj5lIg9afq0b6cDplepJntIdC0k1N7tUlucNrrSBkKqSRdm4ajZfnvnUYap04Z/OEu8u7+E6PgDAsmlU094M2GunITCVo7TOtePTTGmMURSeCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8v9HENkJtrcoYVBkGWcEuz49pYftEwmm5CvyNvq2mk=;
 b=DHiiTqzDQD0o90wHnDNq5oW+U4QTGsqZBtG0fMb3PVogOZ6RJMJwMVEWJjRik6vIHBaZgnD7kOYjoI46zl2RNzx5XzTTt2ZegkWQCdOn33KtGDsZQtp0uOQiEF/0wrs3mHrdboQsZpt+CVS62hzRzltQjtxaWIN0IhikObk5bThDoW4fKngfapXABcwDvonLKY1Wx42EtFxcpzZr1DtsH67/nuGosoQpCumYjZGtVqf3BzEH9+bOYrS7knISa2v9gvfrDOlYNercSPFqBcCncGe2aIHEcVvBVo0e9b6HR2lp4/hF7vyLb3D6+qcGwLquLd+JjDyJjOKgkuKtn4e9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from AM6P191CA0051.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::28)
 by AM0PR10MB3027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:166::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 14:24:18 +0000
Received: from VE1EUR01FT054.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::ff) by AM6P191CA0051.outlook.office365.com
 (2603:10a6:209:7f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Wed, 11 May 2022 14:24:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 VE1EUR01FT054.mail.protection.outlook.com (10.152.2.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 14:24:17 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 11 May 2022 16:24:15 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 16:24:15 +0200
Message-ID: <9a81cc8e-3064-cad8-b66f-0711c2705111@siemens.com>
Date: Wed, 11 May 2022 16:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Jailhouse over ZCU-104
Content-Language: en-US
To: Daniele Ottaviano <danieleottaviano97@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <9baeea16-0fdd-4be9-a227-ff94d1ae5e82n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <9baeea16-0fdd-4be9-a227-ff94d1ae5e82n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--10.242500-8.000000
X-TMASE-MatchedRID: AQ9SOYvqpDY5QaOxwNGfvo9bHfxDWoib8lboxuXXyrOiVU7u7I4INbqz
	pQvjy9EAUHcBn70iJQfjiiXxeWt0GlvaFBwAVOfdEQOIcCJ9jA3p3D7FGdYHwixYq3WqsPihnKp
	Qna4coUBLpCLN4NR43rUKDHDysN3B5d+E554qIHAA9kG/R4Hl8rRNqc/uU7mBbugX94bbu3vihJ
	3Xxt2bAln4z0T8fHooYsjL2LYyAOIVkC7q8O5HUm91nAF9dkUY2FN29CD80DDKdqr1QlwmQd1hW
	sVVuzNokshAoFcG3yTgJ7BP9+K1CklHAyqTyQKKyDC5+Spq4vqV76rqTtD9zC/MuWzsdN8Zy0Mf
	D1GsI1ubKItl61J/yZkw8KdMzN86KrauXd3MZDWCuB04EGxxxvsHW3p63hohKvEHQNh/AZhRfCK
	wCsiTGNVNF7OJvuTUPpCuffGH9zI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.242500-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: A8E5D50C88446B741350FA44D9FC59970E910803915DE956E65E37F47B12A8412000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c34e725d-32a8-4360-0975-08da3359eeb8
X-MS-TrafficTypeDiagnostic: AM0PR10MB3027:EE_
X-Microsoft-Antispam-PRVS: <AM0PR10MB3027FDDC8E88EDC55B9FD90295C89@AM0PR10MB3027.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UW4yO4cxxTRFpEsyioZpNaltofeeYJFSwBmLHjh7ZQBfxNUzRosr1rGWo1NgPaI0chRjIBTYQzd2n/KFTct7+bIjX4qn++LfsY6IZqZFe0UxR2ak0qgTt87T/poP9XCWRdfD51e7qfii/ln9Kd33L6vxLiqJTigk5nQNsiXKsBOds+0DCmHvI1orUMgF7fdRp67xkeNfYEGs0HFKpUSe3PTBk1shrMht/U9ctqyZovtLbdp6WN77f9jx9k+XBzSbRn1ej47KWS47Bmi6Jt+GaU6M91f9b28VXADVARiTEHoTY+51OMIFd4ezfwA6jTQaS/laK631fMTJ/+ZYx1WO6T+gKE4OCEL23uK6eSM2xjIfAPboQQYX6gxnztZxqxrvFtuUhdSD8XS1c68EHXsPyc2FPitZ0qbdZyBITRCfw9se962bXSYY23SKRwkaecL/tu5/8gvoY9M9wj80xwAYWbkF6V8JEBEfQX3KXcYeeBmjdUDGzWQaLQLCl2Bx5UZc0oAWY3xlFYb7etYl5ZIx+VnheAPxvPwnE6r3vPikAvlY//Vb6VRDnD3c7WGtuTUGEGAoThVGzcCo7kGAWOwCsUlJm+OsteMDlmHncWvisi4vGC1Yc9YheV02EwJW8m1AtVIAgipnMhoAzJ7zDuYYxbagAOu9aiVwd0LtY5iox31G4EfozaU4eO4W7oPtw0R1bTZI1rnRW2uxW3COuZN3Cn57aQd7Lgv9tIB/jBroxGOJdAn9zZtGKvJpwn6/TaQhVczFYbWJLJJTBo9xSX0B3ePnJKQUSQGpnZLA8trgmyxkp31i9Oqr1uA/hfMgFSNw
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(47076005)(336012)(40460700003)(966005)(5660300002)(82310400005)(44832011)(16526019)(83380400001)(2906002)(186003)(36756003)(16799955002)(31686004)(31696002)(8936002)(2616005)(8676002)(86362001)(316002)(16576012)(956004)(110136005)(70206006)(70586007)(6706004)(7596003)(7636003)(26005)(508600001)(82960400001)(356005)(53546011)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 14:24:17.5916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c34e725d-32a8-4360-0975-08da3359eeb8
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT054.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3027
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=BjIObCIu;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe1f::627 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 10.05.22 16:07, Daniele Ottaviano wrote:
> Hi,
> I'm trying to run Jailhouse over Zynq Ultrascale+ ZCU104. I have found a
> guide showing the setup for ZCU102 but it doesn't work for me:
> https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-z=
ynqmp-zcu102.md=C2=A0
>=20
> First I tried to compile jailhouse on a build created with petalinux
> 2022 but it fails.=C2=A0
> So I decided to use the old release of petalinux 2019.1 because it works
> according to this guide:
> https://www.erika-enterprise.com/wiki/index.php/Xilinx_ZCU102#Setup_of_th=
e_GNU_Compiler_for_aarch64.
>=20
> In this case, I'm able to compile Jailhouse but when I start the board
> the process stops at boot time.

Before even enabling Jailhouse? Then it's a Petalinux topic, I assume.

>=20
> Has anyone successfully ported Jailhouse to zcu104 yet?

Conceptually, it should be close to the Ultra96, thus the integration
done in jailhouse-images - unless you really want or have to use
petalinux as baseline. But even then, looking at configs can be helpful.

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
jailhouse-dev/9a81cc8e-3064-cad8-b66f-0711c2705111%40siemens.com.
