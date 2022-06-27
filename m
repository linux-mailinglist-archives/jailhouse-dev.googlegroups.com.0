Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK7F42KQMGQEB26YC7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0663D55BA19
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:37:48 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id l17-20020a05600c4f1100b0039c860db521sf5618186wmq.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:37:48 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1656337067; cv=pass;
        d=google.com; s=arc-20160816;
        b=csMzMrmPpAixZHZy2CXewmE4T2PNBK+LEjI8xYREK0UTQZq/1jr+305nXBxvHdlDtG
         Zgr5/ewkk10YoCKG0DHDgM9zn0qylj3Cn6hi0A5FRq/AImAr/W4Cm08GmNHe9DSKd7qD
         ups+wBuR6LBMdpys9C+rLyq6FSkGIK5XsZ9C6RgHSBsgXCkah6oyJSNdPAEaJsz9sJos
         fmIga43GfStJwn8+c/nDrDV98czQ3SZMQnXcnwp/xgaKbv2nwtIYiE9nmZPUrYMsQu3+
         1OUHogphQa1QV9lAqJ26w4ByOmfzyFHbvcfp4VYYq9StIf5HjLEIvtzx7Qp29rK79Tim
         tIuA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=wuZ8Q7FDIlZrtaMEV2A7aMPwcesYH+/BQEZ+fbnkFuA=;
        b=HKNyWo8MhM9JDwtyg9TkU2BTVMtvw/q8xk9jFPatHxtGQWJ9EpGAerDa0L28e3WOOO
         fiG0RKCqbiBAICjPZbcjdGCnR6Fmjka4iOOsUr0uQ5zxprLxSsQvx4M+bwOoj9YA1sdS
         sIUn1mgqciQXPQ+3mMarZH371LRG/GouUOoWHQ5Jl+iRoamQBEAcnwDXsRzmJL9c5+/m
         ZtHxGvgk5uNtb0cvn7wjZ9NsSaopPcM3rd57xGvWcioPsa/CXolzPBSaSrTuu8VRS80P
         whxBTY2uoYP1v9FFvnz8/43BOd+h4YTlMlcQKwUNXD7FLz8TttgEYMGU8CMfwNKY0csX
         pOmg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=xNlej5v8;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.83 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wuZ8Q7FDIlZrtaMEV2A7aMPwcesYH+/BQEZ+fbnkFuA=;
        b=KYvqynJ2OLW84ZLPPkegBmf2ApkxXN793WlpJlPKkvXGTJF8Ztyx15+7mMF7CzHKp/
         3oFOA5I8SWbigUxN4ZWK7ZZwLXjaYPjxjihL/vhFOMDMQDwIThbquhpejXVbjAlvR0Px
         wg1/S+eTuMmRdKjK908VNSJxtRiSe1WH744F4j/6saM6G+tSRcoksoU8d2YcMVAdpOIj
         9PpTUgIsY00Cd+Eflj8hWINf+fllxpjHkfaQdD4IQCuOIUBDDIiWvKfAXAb+50xMTHTS
         dyEmZIb2CKhcMrfNa2SUNztfoeHXrj4bpqJuamt2y6bnYVcY3XAVqey3Xvjfnjd6zq4y
         ZSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wuZ8Q7FDIlZrtaMEV2A7aMPwcesYH+/BQEZ+fbnkFuA=;
        b=gK2kYEOJ1HVZrEn4jfuUgfXnHcuX/9hmns4c9aRDtYMf2SOh6yDHpk77rh7GwAZU7/
         AqTHA/e45EoO892k9JIoIIxSQiq99w4Dc2S4RZ5XUeACUkEVY7s1w0PpvE7xAadFJOxr
         L/zdveaNEpadXcbpf2Ktv17oqLnCYdsqdUh96vxor8ykt3IdO6o3P8Vh7n8+ZBRCqd3W
         3nXmJ6eAHwuPuWr4LMqzMWSN7S0OzVamoEM85bmukSEofryoz8Q8o1qyZrj2k8eZ76AI
         J5IGFBbbMEUtabxyDSvTOWBN4CoIfd0TsDECr5wlpSbCRXGwWmLvZnML9h4cJ3IJN9FK
         gL2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+JTMubjsels6XiYKY1iuB08sKQiEuUZw3vvJXpomqpYd+dVL42
	3kEBqq4G1itU9IqTpcNxDto=
X-Google-Smtp-Source: AGRyM1ulnmhsXClqbPcoRxN+KCdakcrDXLxpFMSB2qg+5v8iyJDwyTaMzCFPAYuuRnpCyBeoMIXXfA==
X-Received: by 2002:a5d:5e8d:0:b0:21b:a919:7da with SMTP id ck13-20020a5d5e8d000000b0021ba91907damr12627143wrb.530.1656337067612;
        Mon, 27 Jun 2022 06:37:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c23:b0:3a0:48aa:51f2 with SMTP id
 j35-20020a05600c1c2300b003a048aa51f2ls1887667wms.0.gmail; Mon, 27 Jun 2022
 06:37:46 -0700 (PDT)
X-Received: by 2002:a05:600c:35d2:b0:39c:8490:abbf with SMTP id r18-20020a05600c35d200b0039c8490abbfmr21057448wmq.86.1656337066104;
        Mon, 27 Jun 2022 06:37:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656337066; cv=pass;
        d=google.com; s=arc-20160816;
        b=WPJO8sfBLv2xqIT/ac7Pk9h0lpT1qZi4FgeSKHwa4gWBLye6qBkySuvYoTZdwUlo/V
         sqSc3d+MdNL2LmZ3uJRnvz2VNgjuauKtx/N5Sza2KH5Qg3I5vrohK2PtVKMz/gM04oKk
         3wTwLQ+1rz0/SG3R2gchdk7u8+hSmIdbWHE8FlaamSwqPoD0jJTPOJtyh0/qB9JnssNw
         7spnyV47yKzk471F5orLEZ/QkiPgtcfsBx1LAI2ngFBP9x1/UMDwRlOEIhA6JvbLgFnY
         UdGbU0JQsPkuU25kmvB1GYSgcXoMRH0+YKfNN1z+fjf8h9djHELS7PyozW1P0CNcenpm
         G1hQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=/Z0JLdesjNHJtfrTxN7OLLg8/5c/orXdYp0OAJo9zvc=;
        b=K+eDgRQM+QIvS3+AYcqTILgwAb668GQM0XJQh+wRSDUkMlngxl/Ehsn4X8hBK7Dcx5
         f4bItnYwnVW1s07wLYT4WEHLDFGriDsM4RHiR4oaZQhHSUk7PtwDBP5uquqytUlTEi2V
         ld8XLBLMMDcau/5q5oko071IyfD5DSet/mXImtzFdreKdozuXZ04X+MrJSiqQshzySdC
         E9K36PkNoOn/PtklenQ5Ks+yD0racwfn5kUg4cFyjTHmqbufG1nc3GsEC+NTdKCoFAUJ
         RE1I67h986gLx5ftKF6Cu6FVsb/nSnKf5VnGGZXOQg3KX6eL8dXTxONSOPa9bW/Ce4vO
         zBAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=xNlej5v8;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.83 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80083.outbound.protection.outlook.com. [40.107.8.83])
        by gmr-mx.google.com with ESMTPS id w15-20020adff9cf000000b0021b95bcfb2asi411567wrr.0.2022.06.27.06.37.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.8.83 as permitted sender) client-ip=40.107.8.83;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eerF67HrMHpCM/E/TnW4Psa616vN7aISCR/LcRZtqd0DoDha3T6sCD2ivNRYAjnWSLYHfHkfixJcCkCwoJbafynp38KPctY/eBoCUmUSo/zveycRQnXK97TngI7ZdEr7DvRvABG1aHLUwpIZdpo8Bcdxxe0igceqakwmxYj+4BWs5PoTdCJXzFRm679nydmZEisgBt7lzXvm8KzsN6FI5A702TlhYV0WhVOqiHWCU86ITI/LmRpXtNl1lCvlEQ43O2ZVGAExQ0S3Et69Q6Q2jglnE9LkB0IauKehGFXg6LOTkchZXP68pD2xlbJAloIlOy8IWs/gBRuz8fATW0zEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Z0JLdesjNHJtfrTxN7OLLg8/5c/orXdYp0OAJo9zvc=;
 b=MCe5MB42HZ+s/Vi6ACxVnp/ldeh0zQF2SmZBMpXafnDSqHk6PvLw5QGlHgKSAJCQDE5bXqV2BOK4Na7uBkPZvk1NCBl9nQ6EsjAPXCfMGyttrqOOU/vgGqnAdfnmg/GCwFjkaS1StE+TOthb8+DUyar2APoAl89SKn7Q50U3mz+ZloMwWRY4UvvtC1rVgeXIHcrYMuXVHtg9stnqlKruA4WEL+lQxh2YL2kqewvRsMWRdqAiYl4h8aDO0sQcOzlNMiMbu30wysW6S9o460PocyJr6YGwodycWjtXJSMEmrqDBVJw7oPWJPcn80nwforem3sMA+z7/8phPItoiN3HxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.73) smtp.rcpttodomain=oth-regensburg.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from OS6P279CA0045.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:32::18)
 by VI1PR10MB3261.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:13a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 13:37:44 +0000
Received: from HE1EUR01FT052.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:32:cafe::39) by OS6P279CA0045.outlook.office365.com
 (2603:10a6:e10:32::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Mon, 27 Jun 2022 13:37:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.73)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.73; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.73) by
 HE1EUR01FT052.mail.protection.outlook.com (10.152.1.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Mon, 27 Jun 2022 13:37:44 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SNA.ad011.siemens.net (194.138.21.73) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Mon, 27 Jun 2022 15:37:43 +0200
Received: from [139.22.133.104] (139.22.133.104) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Mon, 27 Jun 2022 15:37:43 +0200
Message-ID: <fd9596de-2977-1c8c-df64-90382ad10eb6@siemens.com>
Date: Mon, 27 Jun 2022 15:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v1 40/42] core: riscv: plic: introduce vIRQ support
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	<jailhouse-dev@googlegroups.com>
CC: Konrad Schwarz <konrad.schwarz@siemens.com>, Stefan Huber
	<stefan.huber@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
 <20220627132905.4338-41-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <20220627132905.4338-41-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.22.133.104]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--9.228600-8.000000
X-TMASE-MatchedRID: dzgRF5KJYaM5QaOxwNGfvo9bHfxDWoibKxxIu0tClPk/ApMPW/xhXkyQ
	5fRSh265xtiTM7k3OLzy71Hqi5zuoHP83DlpRZ3IKO6Nobe6nGgb35hYG2f1/W5eAiqrqZDK9FT
	709M8dJin7m/OxjmYo/D+6IQMRxU54vM1YF6AJbZFi+KwZZttL2YhUL5GYRbtavP8b9lJtWr6C0
	ePs7A07YExXSSpzaFk0BJM9SCz6K6ygV+lyiKR8r30Jmnfw7vYV6xhbUM5zLlWXGvUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.228600-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 1B2FE342E1726EC533D55C481AD0AD617E31E56BA02FA87CBBBAA2729D2C44EF2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0468362c-ba05-4433-36a2-08da58423754
X-MS-TrafficTypeDiagnostic: VI1PR10MB3261:EE_
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PT8FkQ91QN0t2wMegOmSsjd9hyrydWlat/+WyGYLFwDmUsCCJp9lbthaIAMCsUPLmou/OjlFlquUqkPQ+eJMYcATs7Xl0TfgtKcBvnSCn5bEGKRSKBn6HE/HaZkKwpiF/P/9RfWPUjpR4skcPWOSZmHY7C3So04idFmx6FMz3JACJql/l+MaL3pzx771+CG+vU0KYE4bVG64BLVWFvC8u8A/qDnDz/WtoADuIXCaq3pf/A92rWQuRKbmWWt5sxN6VPzLH1/3hdS625ttXg7FidednwLeNgcCDUFSvLOl/Wg5wZAT1TwKur+WPR83GwSAxwAiWxgMyQna/A0lwSJ0oMdyq7PM2nUa1HxD/3WmOwy6D2gYRH5ZaU+MYJrpUuhtzRByRmg5cAMeIo2JvOodfS4d3ZawZNE1BFaMc3WSuId9/H2gASm0wz+71yZWz6JYr20duoeEgYhRXT3Boy74h5hA/dMQAvbqfI1Bb0ThnARbv1svDzirLQ5zxCC29bVhffiHToEk3TqVCWz1OtMEj9cgb3WpNV5ZxTe70p3HMNuzmLmx9lEJD/oOBL6K4LfAOXEcj1c8N46LqkXBAnTv8BE1UgK8h7VNEnnd1qVBSg++z+HH9I63ey+ZYAEZZDiTDU1U/ZN9jTG56/gpLCcBCe4v+JcV9mrxrLXTpN6+BldQSSBwgbr7KJkHVa9X03DmIMn6kRZhcyzvTb3Kr6SyNTwzY0+R9ah9unnByfUL/4OyBYkZmI7nKJb6UOViNkC77A4MLmH+9e+b5R3alzCxoRGSHHKUOfifQ5Uw9Fj/F5EfY1Zqj1J6Vn2hBPNicBB2yZUjIuARjuG7gwlB9lk1y5XXC8g+RnWIh/+Yg1lvP/ZDZEAg35xRspQ2mN/ky4NkjB0rgCuNJWUrY+Esc8wO8g==
X-Forefront-Antispam-Report: CIP:194.138.21.73;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(36840700001)(40470700004)(46966006)(36860700001)(86362001)(6706004)(31696002)(316002)(36756003)(81166007)(356005)(40480700001)(53546011)(16576012)(4744005)(54906003)(2906002)(82960400001)(82310400005)(110136005)(40460700003)(82740400003)(26005)(31686004)(478600001)(5660300002)(47076005)(70206006)(70586007)(4326008)(8676002)(186003)(2616005)(956004)(336012)(16526019)(44832011)(41300700001)(8936002)(3940600001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:37:44.4917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0468362c-ba05-4433-36a2-08da58423754
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.73];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT052.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3261
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=xNlej5v8;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 40.107.8.83 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 27.06.22 15:29, Ralf Ramsauer wrote:
> diff --git a/hypervisor/arch/riscv/include/asm/percpu.h b/hypervisor/arch/riscv/include/asm/percpu.h
> index 4eda15b6..bcafff51 100644
> --- a/hypervisor/arch/riscv/include/asm/percpu.h
> +++ b/hypervisor/arch/riscv/include/asm/percpu.h
> @@ -43,6 +43,8 @@ enum sbi_hart_state {
>  	} hsm;								\
>  	bool wait_for_power_on; 					\
>  	bool reset;							\
> -	bool park;
> +	bool park;							\
> +        u32 virq_enabled_bitmap[PLIC_MAX_IRQS / (sizeof(u32) * 8)];	\
> +        u32 virq_pending_bitmap[PLIC_MAX_IRQS / (sizeof(u32) * 8)];

Style issue :)

Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/fd9596de-2977-1c8c-df64-90382ad10eb6%40siemens.com.
