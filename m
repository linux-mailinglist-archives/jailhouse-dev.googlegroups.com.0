Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWODUOJQMGQEIS2LYBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFE651111C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 08:25:30 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id k17-20020a0565123d9100b00471c860aa98sf349610lfv.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Apr 2022 23:25:30 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1651040730; cv=pass;
        d=google.com; s=arc-20160816;
        b=gYzB34FfG4rNL7LBglXQFRztUbNqeXHsfK1H7XRMGZHdqpzh+haBkfW/OKprldUbZx
         c7HR9N4TMHes8eTx+551q27pxKQC8pSrklg/RLDD7eFQeIuRvt67U25pXCCf/v8epYmd
         rlDEnyhXfLn8qr+tFyt4ksRN+uJuNBJqHv5bK5EkEOc3NK/jPIKUxsCr3UhyMZPsj9Xm
         tyFqW4ggjxa/QtXAD4p32CiUEvL9rtH4zHBrxUpMcb1tuQWOxo4/aU2yqnsqjoAuKG/5
         XegGzszZg2iZsT/KFru6HpV+AwoHMncngKP5tDsXztQydOPUEwFrloadgreXoW60cHVe
         5OKA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=n5FnAuXuQ3IU4gWWY9FnxuaGpdI9WaPwxyMYf57i/+o=;
        b=Ld1L0NXQ9oCmipnb4J1/35U8RDjA/83LO5jkhmLcjq+kaWbrcLTBPaCily7jxBbP1W
         HG73ypf11x60BQP7CV//JeS0TEn6YCvcUsKwXFVA+r7A9tdK1O0rqIEwz58LfprJRKSR
         J8yfwyrIYKONMIq1gYjil/sXX9qzKtxp2XuALkt8coYdRZdqExQ2BjQmUW/rD8IBMOW6
         PvJ6Lfo7lA/EZ1uqum4u8wHhIH3zpsx0n5yinjWsid/axYQ01AN/fv7PkeIyX1qmmiJT
         Hn/wfHV8+v5pRYjzbNToa4yQQOePcz/lOFhCu0gjR3qHC8cvMdzRnDkzmJbUWQkbd5ZL
         NiHg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=LM1ukTX4;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::616 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=n5FnAuXuQ3IU4gWWY9FnxuaGpdI9WaPwxyMYf57i/+o=;
        b=VXhNWD7DkI2LAMNjDtv/EfV7NuV/fghM0YKpfVckAZ9HkosZpViwLQRRL7Q3TWgjN8
         nEw0ajnBcsSCOiJ0km7FxYH43kjsiOsJExgrO5vtZTSylZMgPtCZTMx6orJ5TgpTIJjW
         eLkr4RbBFf4C5BgTwBbOMR/Mkj0DHRqfGa6VC4X126+FTNmoVxg+/HMMHaDxmvwLjglX
         OK5hC7X0vj7iI3MpPQG0XihxKArnZXSkJCdxUcVBOsjCgyPWNGFVTZv3YQK/lT+u4vmy
         CW1RYjNDYp6VvxrQUjtFtd7g1yUEaQ1X9rDvuluDB4IjIgv5ArxoF1I+UZ0X0+j0AooG
         vBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=n5FnAuXuQ3IU4gWWY9FnxuaGpdI9WaPwxyMYf57i/+o=;
        b=Nfx+PrCNCRZd3gOaOJXNHnEgtegT45YaNiO/KVYGVr48IS+PKwEz7ds2bECptQub9h
         ZbIi32kw3/6n45yM1/nyiuED7XZWs9aGp3iDrWxytv5IpQZNh40Cfw/3CBBw2p8TrTfQ
         Owm1kX1pKJi1g7GjsET2H5lJgfrwTCpGjEiXN/1eeVn1b2YHyX2e5YbtBiQnbTHs2VMu
         0Z1ihsYNrzOsiwcLohl3Vx5ZFtB0qQNb2aIIMRmFRfOsV+lC7wb7wd8i7Ng5fnYXmB5t
         qV5LPwyF/z9xFHOf8QhXbpDw1KYm3+c1i/wJDtBU1XEIBm6wf2TSP0wSrkYjPvBZvjKY
         UmsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5316EnJ5j+d/CkfdztBWL87t43P+XGUQJ5rpf4VobXelUTeAjcNh
	qjMlkJZnnpzICkGP1UkjrJA=
X-Google-Smtp-Source: ABdhPJxiCd1Z2ao2C9iqePkdOC6OnfLZsKRuzJD6SwaYOVpcr12kEIOPXmqmMNampdDSec2Fj1vBTA==
X-Received: by 2002:a2e:a4b1:0:b0:24f:1476:9189 with SMTP id g17-20020a2ea4b1000000b0024f14769189mr7468914ljm.272.1651040729875;
        Tue, 26 Apr 2022 23:25:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:2815:b0:471:b373:9bb9 with SMTP id
 cf21-20020a056512281500b00471b3739bb9ls1029672lfb.3.gmail; Tue, 26 Apr 2022
 23:25:28 -0700 (PDT)
X-Received: by 2002:a05:6512:3f26:b0:46b:92c0:54da with SMTP id y38-20020a0565123f2600b0046b92c054damr20572767lfa.369.1651040728030;
        Tue, 26 Apr 2022 23:25:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651040728; cv=pass;
        d=google.com; s=arc-20160816;
        b=NNqF0nJLjMuEjzZ1HDnHLfxh0gPbXUIkFC1orezoYt/4MB74nSNoQbaN6P0Zx2LgBt
         zgUTK6LOFmQB7LNjar6c6PhQgIKoCSn2VQCN1Y9qu7LFR/App0BU1UdRDOj0V0T57Frf
         OngIlHj77ScgFAX4NnvMbhy3cO6abJcyqk+hRTjnUlTCbyqgqmuo3ZH82UB5BEzBBbcT
         y6VI4DGDQY6aF6s5GfJTQkuCGWRPejl8WeZjG/AYaQ2KH8Y6+eZyLYdUJ2AWFQ5GJlDF
         GRFnd9C9TC19UF5/HwSHKwfssbEW/+LtX5o+6ka9jzlArrSBViIKYbJSNB3qfghuc/yS
         hEKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HYuM8Iy7RqARghDHyhFW0o5/WGo/sdasdR/k4nNghTE=;
        b=vervI4TZUeTaw2nWFSbHliaKSv/s+7HQ+2jGylrV31tWXRoNlNcfDFtekQEIR4u7UC
         1mY5v+cVVTs9C4KliyjevsLgg/YY4LLcAyGXTQgK7ACCU79rf/9sqpo6kkRZkVxi/XaS
         obgHavpnr0KFvINKmrbcZjkmSY5FX8GNSmQDmQwiO/S4/51+wI91NrntSmE3HWAHmwLH
         KNAFYBHLXkTpw2JN0B2n9Fz4fxbXcVYSQuhcXnk8+80oOtFXr5fofvQGDEhSql5343r6
         lWoKAWLkvhCS1hSIgzPdVUswkv6Sf83CpNLcC6NJlqbuNUdM/NL8W7riz4hNScCnW76T
         +syg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=LM1ukTX4;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::616 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0616.outbound.protection.outlook.com. [2a01:111:f400:fe0d::616])
        by gmr-mx.google.com with ESMTPS id bp23-20020a056512159700b00470f8f82ce4si28643lfb.1.2022.04.26.23.25.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Apr 2022 23:25:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:fe0d::616 as permitted sender) client-ip=2a01:111:f400:fe0d::616;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIECm+CWu9aAPT4PcBOdPb3XPv88vSQOLiq9PxJB6/uZOCcWsOf5JfWMUkG1QjvUZ3lhneCXKTms27EAgRVMZMd6IWIFqgy/2HBBpKIloyjobtdCulNZtRi9/FMrqelRmO6cenepHkTHZEIktZAUgNOl3n8iuqXfrONw3Ued+ftgCPZnDcO4EET5QloYeymZdK2oIpJO4Ryr0lVL6Zu237i1u5C2qTo77VK2+ZDHAC72/FSq4hCevSMAMC/nXkwia4v60ySDwnsl+YvqmIhyGZk1znD4VRkoPWIek4d/jvaz7GpUr1Q0OkD1EEjVzPlMbYE3xXB8DPWOf7WpUqCzZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYuM8Iy7RqARghDHyhFW0o5/WGo/sdasdR/k4nNghTE=;
 b=inFZE9El1I+9oAoELZTR8ZYPd83pixHU+oAVqO9yVsirSLTbC2fZ6iff+7M5C7pbYsTdsiDIvoiX71fqsaiyOZIQiiA44QArGcP1RKKR1VKmtym1UOy560T9bzbChAp8nuAdCyaMYBdDkPn4mv1gZEgX+Tytp2PrGCIbpS9dMWL+jB+SD22MYwVFDf3q+Se51rQ3E0kgSpxhDF4P5s9mTp1QxcSF7Jvbweeoich4vHUZV//avzDAnjNNwN82Ix5zGFffwFH2poCemtCpG9dyekBB8d28J4/gN0d/i0qbWPFvPg6+NBik3vBiX8zhDdX/ff0jtyATwMfg0UZEZ8tVrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=gmail.com smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from SV0P279CA0008.NORP279.PROD.OUTLOOK.COM (2603:10a6:f10:11::13)
 by GV2PR10MB6092.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:7e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 27 Apr
 2022 06:25:26 +0000
Received: from HE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:f10:11:cafe::94) by SV0P279CA0008.outlook.office365.com
 (2603:10a6:f10:11::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Wed, 27 Apr 2022 06:25:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.70) by
 HE1EUR01FT037.mail.protection.outlook.com (10.152.1.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 06:25:26 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 27 Apr 2022 08:25:23 +0200
Received: from [167.87.0.81] (167.87.0.81) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 08:25:23 +0200
Message-ID: <06be1523-f4a2-80a1-a304-a76ea4e7bba6@siemens.com>
Date: Wed, 27 Apr 2022 08:25:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Jailhouse isolation test case
Content-Language: en-US
To: Jean de Bonfils <jdebonfils5@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <72df1a2c-b4de-4c3a-b1bf-ab4b5f99c072n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <72df1a2c-b4de-4c3a-b1bf-ab4b5f99c072n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [167.87.0.81]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--15.862200-8.000000
X-TMASE-MatchedRID: RfRf601lRZE5QaOxwNGfvo9bHfxDWoibUv4rCBFxg7+t0sUUpHt26Wva
	omg0i4KNyG//fKR7x54kKmD5FRkD3+QU6POEK4wO9TMMyn+RKSpPR9IXeNhmft5x7RpGJf1aopG
	QY5bbP3IFqrxVoN14OhbjWLZHubLu8N3FVnPJiPzX0QW09KmKFMdd9KabNo/TLTHwnYOikQ2YaF
	4S+PMBO5QBR+Vr4iFospdaYS9obcSXLJHjo+8i07ao0Zou4ee+v1l2Uvx6idpcO65jrNll89mzc
	dRxL+xwKrauXd3MZDUD/dHyT/Xh7Q==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--15.862200-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: AD7428B204DA7370DC01F461C4139CC4F520C270A491A44E88504611236337722000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a369c958-fd87-4d96-dd13-08da2816b7a9
X-MS-TrafficTypeDiagnostic: GV2PR10MB6092:EE_
X-Microsoft-Antispam-PRVS: <GV2PR10MB6092FB32F7577F08A05F406395FA9@GV2PR10MB6092.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XjRLHttyvgtnfDzUfqTX5zn5YkUGlUHOhXMTwjpqte8XDJuK5/85Xrf/0GI1rkn5DXGcAyeWMvTVzp6sivVOULrRMmsvy5ayutqABIDhjHlXrZFrlPCNFLAgmm6lLLzusu8ihMyqsgYs41qhFvob7ZEIjzLJYoUcLaTjZn16t09Xom2DYFp7gpPx/UsRO1YmIBHgbDaJhvPOs5bvAsdNjMAXGyx1Iaj8teMnfqhaCtAg4JHJ+ENCmJm4pyHb4bLiJ0FuD+nmrfyMgFZ+hfud9uEO3RhYaFObwimBBmACg9OXF/imoeyAGesvjgzWHU7ejEhmVyz3uPhNZqTQDjuRIW2vZCUHk0aVLjOpF6g0gSy2NVRQHDSs22QOjl11EVKRyJVjwlgTMCDj/qY7A+ediM4F4sa0e3Z06UZg9MsT1ZJZ62XpGEKLus+qYib7pGrje02P1Tk/qiWi5fdky2aPgFz3c2gUEi6VFMzIXCWcD6uaEHjVZP+uG/Ggb18FyLYpgaNnVWOxTSPhsCT3KhtjifNJbOQvQpoPbBgEkKeEsy7/3951bXXf182wzwQ5yuOi/ZqjbSyQUT9vaNqfQey3YvAoTdTDNziBTF5sb6q5OvGG1Ry3UBWFAPstSDHY7kHpF2DOhO0rNmD2uJKGIBAOVl9Z4KET7TqZfmxcSzmj76dSNIeno5C3nZtHZsYQejp1XKDdvA2M8sHwmtNwdpfOzFtFu2nYG/Rk/mpk7DlcHk8=
X-Forefront-Antispam-Report: CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(7596003)(5660300002)(2616005)(356005)(26005)(4744005)(7636003)(40460700003)(956004)(110136005)(70206006)(316002)(6706004)(16576012)(70586007)(31686004)(83380400001)(36756003)(36860700001)(508600001)(8676002)(3480700007)(82960400001)(82310400005)(16526019)(336012)(186003)(47076005)(31696002)(86362001)(53546011)(8936002)(2906002)(44832011)(3940600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 06:25:26.1317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a369c958-fd87-4d96-dd13-08da2816b7a9
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT037.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6092
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=LM1ukTX4;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 2a01:111:f400:fe0d::616 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
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

On 21.04.22 17:25, Jean de Bonfils wrote:
> Hi everyone,
> I am looking for scenarios/test cases that demonstrate isolation between
> cells.=C2=A0
> For example, test cases that demonstrates that an inmate can't access
> peripheral devices it is not supposed to have access to or that it can't
> read memory of another cell
> Do you know where I can find this?
>=20

There are no specific tests in-tree at least. You can surely build some,
e.g. on top of the QEMU integration available via jailhouse-images.

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
jailhouse-dev/06be1523-f4a2-80a1-a304-a76ea4e7bba6%40siemens.com.
