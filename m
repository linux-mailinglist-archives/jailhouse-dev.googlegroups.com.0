Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUVA2CQAMGQETCKK6SA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF596BE1B7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Mar 2023 08:01:41 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id c30-20020adfa31e000000b002c59b266371sf614725wrb.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Mar 2023 00:01:41 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1679036501; cv=pass;
        d=google.com; s=arc-20160816;
        b=abJ/QapkfoRD0nwCxOuGaoKO5Urep40fQse2WyEqxi2oU2xJ1Xl5rN57kFWfhxX7A4
         JYOqGQg/jQs4qbDTyleCwgNDc9UVGVGxw9x/g9DcftYceNbAchahasro4DxztPQoeuXA
         YHmDKw8Ygha6oW/ZGawT7gYXVYMeQFWzdVhFsdo8Pt4pa/rB83qX83Uz5Y8ZbWMvqxu4
         19vWYnVOuIlCRoL73OMv3EiVBLd9fmIOSp96IPmyGim8y9HoQOXFrbw/SyzcS4m0j+Jh
         EcFu3upbtj/D8Yn849xBUcLFaK5NwI8AZmkyxIt5tjtBIat4soprgZKLkHgHb5Lz1Imf
         PxeA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id:sender
         :dkim-signature;
        bh=OJ6u8LxlpGv8Fjm153VaCqSd89FKKxyKvEtXB94Bbew=;
        b=GFYfp6TL9E701zt/IP+lg7pMlTp3dFu7AtKeZHsaNySzAN/s4Mcoe/m6xj2lPuYlBa
         O/1HfaPamp3TMv/9WfDeAtUhyijZwlQoR2CODDechgc24Eh+J73YGAZ9WE69VLT/16ak
         fhPjlNKPZMCelFTMPH07IgnHmTp79qwQJt24rrP4hkfZeslDOaJUvtYfZSEPwRa5R1fu
         EWKcFEmhgxo2XernbVZS/pLFJyM3adgtsMtPkTlgJ2s9BO+Jrp60lGZoCmXD14gpjVLK
         5+Og5Bcj2vfPlHArpmjgD9A7Ctapp65e6ZoNegOCyOpNrx6R3y47yiwyz54f0u2CYkD+
         bPkQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Yylh3oAT;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::62e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1679036501;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ6u8LxlpGv8Fjm153VaCqSd89FKKxyKvEtXB94Bbew=;
        b=qwU5iZ//XBY8KEjM81RkToUYVeEUSzKVeAJDl6AZSnWm1FU5qsWG+GcLDnUv9DEDzp
         ypxQBHWhhoZ7WmrfV5htpqo8y5rKqFhIS/G60CoR69m7Mw6va8/3MIEFuzbTKoTktLR0
         O1LvuP89w7NLVqjZuI9N3uJPWzbuMRDKKRegm2q8dk/19SaBSDELdF1RevKAvRGPQMPV
         KdH+t0t1JfkkYxVFhuhYy6VcQqFuCg/fAKwhx1/eFCmRmQFaNtps+QBHyjzMoQbH8i+H
         EmOZobM972FjtqOfKsq/x0GC1ZqgDcja2pI+ZhJ2vbU+3hbJDAxi+GmQbZMfeUAuCvVr
         LiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679036501;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJ6u8LxlpGv8Fjm153VaCqSd89FKKxyKvEtXB94Bbew=;
        b=7L+7Prnx7MGtE9xbmH7e5oTj/RIA2lJnU11a/auGqR75MfUraXDiGmo+06vZHblzeG
         ApMUfQuikaf9dRIWYdTv3QFMT9ILuPN4/cYKPnI5yk6+VVNd0GCeurQEyac/LLzaAFie
         MmwCo2b78QKWkO1V/KZCA7pBRlmdu9kYDF3r4a9APqR+ihoVbkYjRAcySbv3OiY6Rty2
         f83chPm3f/QfiW5E8NO/LiMfBeD5gt81URpaK+f8QINNqrSnGcq2ZPYT54ruQx/Fp23u
         8xN63auLwAaHoqfiOBjXlN0G1/c9fHVzctQwZTUJEZf0pQrNcc+QEtT0tWegvdSKdz1h
         ywRg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKV85QJt4Fg0drFAHapSmDsGTGi4tDcDKh+8DjonS2yQEW0xDpOB
	ntW/RWS1afQ4JwKmFalAAAs=
X-Google-Smtp-Source: AK7set82DIWXGE1Azu2h2ijgXssSAQbWKl9OeSo7oE6aFj7YC5+KAKsoggpBhga1BiUOBh6rxdTNIg==
X-Received: by 2002:a05:600c:1da8:b0:3ed:2937:90e8 with SMTP id p40-20020a05600c1da800b003ed293790e8mr4085125wms.0.1679036499007;
        Fri, 17 Mar 2023 00:01:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3d11:b0:3ed:34c9:587e with SMTP id
 bh17-20020a05600c3d1100b003ed34c9587els4022667wmb.0.-pod-canary-gmail; Fri,
 17 Mar 2023 00:01:37 -0700 (PDT)
X-Received: by 2002:a05:600c:4690:b0:3ea:f6c4:305e with SMTP id p16-20020a05600c469000b003eaf6c4305emr23486983wmo.38.1679036496933;
        Fri, 17 Mar 2023 00:01:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1679036496; cv=pass;
        d=google.com; s=arc-20160816;
        b=WyqjZ4p62HWC9bzwh7QpHxDbutTT/ay9y6GelVzKTi3enuAG9Z9o+J0lsY0kRi3rqa
         /R6II6cWIAt/5xMoJ1IhG6yJJVOOvDApnV0s/V4/WV058YE071Rc3tWbaBCYyXQlk/Aa
         L7rfCryxpq2X7WRFQzFggL267PLwfZdhdW+2uATWG+YyqzcxJTnpxLmwt0RdfwX6iXFL
         FNgA+GNapH19IMCzLqTPJqvipnrNZYc0C3U2oqSNGYdV2h5Na/QabLvHlj0254JFynGj
         7HzGjcRBO4x53ASw2EAO7cE2iB7jjZFMGgGNXLewrmurK6Qxs06kd4igy7u0wfuzSIux
         LAQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:in-reply-to:from:references
         :to:content-language:subject:user-agent:date:message-id
         :dkim-signature;
        bh=l/nnlVQEeT70pgW87St2zrjwYOVjGX0yLwP2hQBlOdo=;
        b=SZMPp7QHrL91QPOUwnDQSmZeN1x0umz1ODYmbcod2oNOV8BiCmQ4nM6rhz6AFK8ISj
         /dLSwCD3FvkpfjJTDp5J5ZbfHLTqh8RFh4X4m3BcrLniguLa+O6JmzV6D7KovXFimtvQ
         XbYEggZtQsyiEXUly6951d3L0aJJteFcnl42IKtZg3F/vH9Zq7ts5DBwQgYhfuWpPln+
         71EUuILPwOYuftHacRa0HYMT/8XrEIrOST2ILdKvrwUKw+JLTI+n9i6DsbeS3bjF0GJN
         obmxH/JpvBrkSzTdZ1DZTpC+/rZIsqWWwPTifD23tYcoySx7mTVO3h2mtFNmEsio/IOc
         ERDw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=Yylh3oAT;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::62e as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2062e.outbound.protection.outlook.com. [2a01:111:f400:7e1a::62e])
        by gmr-mx.google.com with ESMTPS id bh12-20020a05600c3d0c00b003ed29f3d6d3si79574wmb.1.2023.03.17.00.01.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Mar 2023 00:01:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::62e as permitted sender) client-ip=2a01:111:f400:7e1a::62e;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCgUVIg8wlcY+mebc1rrvEGG+gW4arV8SzlJU4c0YvuUNKJYLzM1EZePXnFRV8vZPdsrgXdC89L2UxifLnGx0XuhE1swOMMQu0zti0Eb/TEhXLMrMzsR41gdH5Yo4F+9LS3a57Ah0aFqhRmNzqnCftGjiMdFWWmAUhGZhtdc79miRiM4x5z9mLhNe4KWYpqXUgEhqEYjeuDGBir8Y0nriixgpXnIC/8WO6D/tAH1JWX/CKB1MyhVINI4JT76rCjz0b75mDXzdPGHNvfgcFO5tDCekF1ShevYutEOpUih/j3i7Gd1tGlTqJ5S/+jUwztLfkK257j1xGD2tVybf5F0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/nnlVQEeT70pgW87St2zrjwYOVjGX0yLwP2hQBlOdo=;
 b=DLB+WZNeoReEwUNXUB2Q3d6g04ddL+/WgNFhKZzH2azrH5SPpWzi2AZ5IxvMsKJwPvQBE+uLE7FBUPlfxemOfxWlhdoNaDLyc8sdZ4XSeySOPWBBcZ686SUgM2fR2hJIIkfyiSd2S8wlcuLx6hSjsy2VSGhFmb0wqnv+6UIdvW9uIywTA4A78E5yCTMvV/xaGrCIhbTMaWSVxJtTVGyWigskzsrBG+WC88aQMaf/R08KPQroxP64YIdgw8Nw9lZy2XopoRgfDNdDqHIgS6XDezEVOfyEg9Y/jdNcsNoYOIQBrTKOlmTDj6GIAX1hsiw6kzhkKjZ20f4Rb6e4KofyLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by PAVPR10MB7308.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.8; Fri, 17 Mar
 2023 07:01:35 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d4b2:77cc:31cd:a3a2]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d4b2:77cc:31cd:a3a2%9]) with mapi id 15.20.6178.026; Fri, 17 Mar 2023
 07:01:35 +0000
Message-ID: <83472a1d-e6cf-3336-a4a8-df3c6bcc2cab@siemens.com>
Date: Fri, 17 Mar 2023 08:01:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Question: integrating Jailhouse in the Linux kernel tree
Content-Language: en-US
To: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <VE1PR04MB6607BED3DA85B3BFC335000792BF9@VE1PR04MB6607.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <VE1PR04MB6607BED3DA85B3BFC335000792BF9@VE1PR04MB6607.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::11) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|PAVPR10MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: d8aca2be-a7b6-4526-41ec-08db26b57256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w6vajRKVxYlF2BL3DUpdF9zUtO50GTT4cjr+l+8iEiqbh7f5UPC5EiH+kSCZHCrvR/CXZLKVwUexLuVeUNGy5zyCRkHWErv2uHx9eUjxX56TghYOhrM1/aK6eS9DSBfDy0AWPeGopZSKQYdTSs76hU+KXCMg3sFxKbiDXBTRPTYUQEuroquLSYsqPAR0A7sMZmWyMgLiUomsj7w/g1OfgzMP8pBYVALqWJbp+5JhiMPMCd7byZG21fKpTaxehZviNJ8lNjZzmDVTUaK/GHEhSGrVwaKvHHH8BVI0/mEMkY4RFTwHrihnIlmILtLtAebfc+ZJJNSQSNbEu7UH7AxVonf2YQEpiy/wM9OzOwQG14C5pZjLiznutV4Fd1IpHakvYedBT6lhppm2312aZWKbAcKTLv2c+4rP3i/1qo5fX/BlzXMBXMRfMD4ZDcg5TJNNDad8xzkI1tkQpn1tY/klZaIvp+zfPuOfkmX+uCvlyn6ljEwwfMxXyPXx+Ff1n/r9JtPqxWD0kR0u9ET1fmwxUBFigGETC22um82sGm7jmhx5QPdEgDL2cSA5yj0eMyMhBCX4xsyDwUuv3m4KMSTXrPqtkr/eETHr2hHAfa5XWtISFwr1X7dfGUr1HCdW997chYqBQ8Lx42S270jfpbVPB6E6dEykOp2Ouk4sTULAolOSJ5Xe3ME54i3rWa4ZB3HlEqftL1zg1RTLq2UhQD7tBgFtq2rPlZrJb4d3etNQIiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199018)(31696002)(86362001)(36756003)(82960400001)(38100700002)(44832011)(2906002)(5660300002)(41300700001)(8936002)(4744005)(6506007)(6512007)(186003)(53546011)(2616005)(26005)(110136005)(316002)(8676002)(66556008)(6486002)(478600001)(66946007)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUk2Sm4zYUxVb2pqVnpXdC9CcURZUlVXZEZ6ZUxDSnFrd3pDZmllbkI3a2pH?=
 =?utf-8?B?SEt2Q1ZHMkVuV1dROGVlYWxZbXRrbVhkbFV3TEVXa2tpNm53Rk9qVVFXZTVD?=
 =?utf-8?B?dks0dVJnYjI2NStNeEVZWTNUU2JaUUxoOGpEZEVLRWhrUE5USm5jUjQ3VDM2?=
 =?utf-8?B?YXNpTldEb21nUDNFajZ0QkFSSnJtNVlUZGQ5MlhGUmNPcW9IYmJaWVAzaytW?=
 =?utf-8?B?RnAxeW8rb1JKL1grd0VtZk12M3ZtR2syTnFHc1NWeW1FSXpnOFdEWlV2cHdr?=
 =?utf-8?B?c2s1RVhOMjlZK2lLNVIxTmdycDNmVWpFOVFpb3Fsak5YZzE1RCs4WEZ2cTdB?=
 =?utf-8?B?TTdENE1wZThKSGNKZER2a0Q4T0Y2MTlDT2VndndKcFQxUUVKR3BvZE1vZlVM?=
 =?utf-8?B?VFp2bHNFUmhibjYyc0NDbHRsSWxrcnR0TnlwQWxDZ2NML1RyQUFIOUJTTHNM?=
 =?utf-8?B?REJ1dzBySld2RlF4VzdnM3NXRURaODN6bzNDanJ5NTVsc3RIQ1RVS0UyRjQ1?=
 =?utf-8?B?QmFQbk1TZGV3b0NmNEtiK0pUM3lFeXhraUtTNFIvUGc0NTdmYXM2YW9GMzJH?=
 =?utf-8?B?SnloZVRUUGszcHNsZHBTNldzM3ZIWUZZcXFTNWlHRzdmNGVBWE9XTnNnbjZ4?=
 =?utf-8?B?cktBYks2Vm85WXZmd2pFWDZVRlRwdnAyWjhSK2VSRk9MK2tGcWx2bEFLRDNu?=
 =?utf-8?B?NGdNUllOTWtodGNjbnE4SjZocWJZUnpzQi9zVUE0UmxJMmU2MFVpRkNVQ2Ex?=
 =?utf-8?B?dGNEMnZmc3N1YWZzRUNhSGRLV1I1UFc5OURySGVNMC9UcUFqL08vQ09Md0ZG?=
 =?utf-8?B?ZFR4dythQyt3amVTdE4xSW1ESjAyRjFxemZka1E5YXA2S3E2NytJNjJnejFr?=
 =?utf-8?B?OStCcWphSGlubURKckF3dEV0enJycERmNmtWM04vVXh1TmhzV1J6VHprYXhD?=
 =?utf-8?B?MlR1dkxCcVFjQWthQnVZWDJyYUt2TGZmYVhQNzVWUmhvL3NpNmJaYTluNnFU?=
 =?utf-8?B?VDVCU3VqM2pJMUZBL0hiM0s2RjFPc1M3RzN3cHFzOVdNaHdCTTVLd3V1ZXJP?=
 =?utf-8?B?dGxSUW0xVjhLQkRyNzAxd2F5aGJQNzFtMC9OR2dOZGk2TE5CVXhLdE9jK2tV?=
 =?utf-8?B?RUwwa2wxejhadWJXazkzUmx6TDNTS0xNNlB0Z0ZlM083eWhiTnI2eVdhNk10?=
 =?utf-8?B?WlVkYVJLL2t2MUt2MVg2d1VtaUpGSVR3QXQwUjFhbEowN01oVzc5RTF6T2dX?=
 =?utf-8?B?c3lLYk85alBQQytVYlRMMEUxaENkcXpTUE1zRmlGdTVrTW5tTE5nNm9oSGZj?=
 =?utf-8?B?dG5JaTJJMXBoSElzWDhRRStwVy9oNzlXQ3hTV2c4MGRXYnF5cTZKRy9wMmRh?=
 =?utf-8?B?NWZNOUlzL3VtZTE4ckd2NmF0Y29PM243SGNQSzF2N1NvUU93N3RaVnZzZWIy?=
 =?utf-8?B?UWFwdzFVdUdzNDJkdy9sR0p2M0ErYVVzY3liVStuUGdQY2crMzM5bEozNWhy?=
 =?utf-8?B?NHQrR2lrL0g4NUFYRmUwdDFiZkVPd3UwdS9Xa0lqTHNDUS9RVHA3SExDTGxO?=
 =?utf-8?B?WGlEU05oeEZMMThpRWJxYlA2ZjhzYW1rdWllMEtpQ3RkZStteitGT3pKSldo?=
 =?utf-8?B?Qk5WMlJQV0lzcEZZVUNPSkN0YUhKVHcyT0ErSzRDZkVQOVlSdmszNVdpdVZF?=
 =?utf-8?B?S0M3UnNsQlBUQjF6MlRocnVIMmNmUWtmK3MxdEpCWThYOGl4djZyRU5FRFY0?=
 =?utf-8?B?MDJlS2VJSU9FeisyaTZiWUpxSSttSm1VeERHTWZEZkRpL2UwYXhoU0F3S3FR?=
 =?utf-8?B?ZTdOYlRHM0hsVnJZRlFZdFM5UWVjV0F3N1RqajBVbk1DVStQTXhOVlBGdjUz?=
 =?utf-8?B?enlvNXJUWEhOOG1KaytIemxrS00rdlA3d0MzeUhvTy9lUDNWMGo2ZVRxNDUy?=
 =?utf-8?B?Rm4wVEZRdThVSnFXU28yVWR5TzdKOGtpdW40RmEwNGtxbmtCNHB1Z0xOSzBl?=
 =?utf-8?B?Rnhaa3Jrd3VuQVZCYzRtZUE5SXdYT09wd0RXYWVpY1ZKUW5YUjRlSGgzZTJo?=
 =?utf-8?B?Zy90L2xmSThIRUZxMFF4NlBRR2w1ZGZ5MGFSRjdpRGZESzdDQkZUQ3p5OCs2?=
 =?utf-8?B?b011aXpQeDJJN0x1RU9nSEJCQzFsU21PZFpCaHBYWFBHRU13MmdhYnB3amZy?=
 =?utf-8?B?SHc9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8aca2be-a7b6-4526-41ec-08db26b57256
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 07:01:35.3967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Wfx3sbxVsiYFzrvRFwoHqpxW5a2sqjgVvLu8MGWC5sP47+W6qOCfapGQN3OBYkywxTRpx11KcEfTvBPsJYPyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7308
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=Yylh3oAT;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dkim=pass dkdomain=siemens.com dmarc=pass
 fromdomain=siemens.com);       spf=pass (google.com: domain of
 jan.kiszka@siemens.com designates 2a01:111:f400:7e1a::62e as permitted
 sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=siemens.com
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

On 15.03.23 19:29, Laurentiu Mihalcea wrote:
> Hi,
>=20
> I'm not sure if this topic has been discussed before but would it be
> possible to integrate the Jailhouse driver in the Linux kernel tree?
> This would allow other kernel modules to utilise Jailhouse and would be
> useful in cases where user space is not yet available (e.g: during a
> device's probe()) to do all the setup.
>=20
>=20
> Use case:
> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=821) Linux boots
> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=822) device_x's probe=
() is called
> =E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=823) User space becom=
es available.
>=20
> I would be interested in enabling the hypervisor, creating an inmate and
> loading some image during step 2) of the above flow.
>=20

But you know that Jailhouse startup and non-root cell loading currently
depends on userspace? How would a built-in Jailhouse driver help there?

What you can already do is pushing the setup into an initramfs.

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
jailhouse-dev/83472a1d-e6cf-3336-a4a8-df3c6bcc2cab%40siemens.com.
